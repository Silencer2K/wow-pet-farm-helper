local addonName, addon = ...

LibStub('AceAddon-3.0'):NewAddon(addon, addonName, 'AceEvent-3.0', 'AceTimer-3.0', 'AceConsole-3.0')

local L = LibStub('AceLocale-3.0'):GetLocale(addonName)
local LBB = LibStub('LibBabble-Boss-3.0'):GetUnstrictLookupTable()
local LBZ = LibStub('LibBabble-SubZone-3.0'):GetUnstrictLookupTable()

local qtip = LibStub('LibQTip-1.0')
local S2K = LibStub('S2KTools-1.0')

local TOOLTIP_SEPARATOR     = { 1, 1, 1, 1, 0.5 }

local COLOR_DUNGEON         = { 1, 1, 0, 1 }
local COLOR_CURRENT_ZONE    = { 0, 1, 0, 1 }
local COLOR_COMMENT         = { 0, 1, 0, 1 }

local COLOR_COUNT_NONE      = { 1, 0, 0, 1 }
local COLOR_COUNT_MAX       = { 0, 1, 0, 1 }
local COLOR_COUNT_NORMAL    = { 1, 1, 0, 1 }

local COLOR_MODE_TEXT = 'ff00ff00'

local PET_JOURNAL_FLAGS = { LE_PET_JOURNAL_FLAG_COLLECTED, LE_PET_JOURNAL_FLAG_NOT_COLLECTED }

function addon:OnInitialize()
    self.db = LibStub('AceDB-3.0'):New(addonName .. 'DB', {
        profile = {
            hide_normal = false,
            hide_raid = false,
            hide_world = false,
            hide_quest = false,

            hide_collected = true,

            minimap = {
                hide = false,
            },
        },
    }, true)

    self.ldb = LibStub('LibDataBroker-1.1'):NewDataObject(addonName, {
        type = 'launcher',
        icon = 'Interface\\ICONS\\INV_Misc_Pet_02',
        label = "Pet Farm Helper",
        OnEnter = function(...)
            self:UpdateTooltip(...)
        end,
        OnLeave = function()
        end,
        OnClick = function()
        end,
    })

    self.icon = LibStub('LibDBIcon-1.0')
    self.icon:Register(addonName, self.ldb, self.db.profile.minimap)

    self:RegisterEvent('COMBAT_LOG_EVENT_UNFILTERED', function(...)
        addon:OnCombatEvent(...)
    end)

    self:RegisterChatCommand('mfh', 'OnChatCommand')

    if not PetJournal_OnLoad then
        UIParentLoadAddOn('Blizzard_Collections')
    end

    self.trackNpc = {}

    local petId, petData
    for petId, petData in pairs(PFH_DB_PETS) do
        GetItemInfo(petId)

        local petSource
        for _, petSource in pairs(petData.from) do
            if petSource.npc_id then
                self:GetNpcName(petSource.npc_id)

                if petSource.type == 'raid' or (petSource.type == 'dungeon' and petSource.subtype) and not petSource.dont_autoupdate then
                    self.trackNpc[petSource.npc_id] = 1
                end
            end
        end
    end
end

function addon:OnChatCommand(message)
    local cmd, pos = self:GetArgs(message, 1, 1)
    local param = message:sub(pos)

    if cmd then
        if cmd == 'toggleicon' or cmd == 'switchicon' then
            self.db.profile.minimap.hide = not self.db.profile.minimap.hide
        elseif cmd == 'hideicon' then
            self.db.profile.minimap.hide = true
        elseif cmd == 'showicon' then
            self.db.profile.minimap.hide = false
        end

        if self.db.profile.minimap.hide then
            self.icon:Hide(addonName)
        else
            self.icon:Show(addonName)
        end
    end
end

function addon:GetNpcName(npcId)
    local tooltip = self.scanTooltip

    if not tooltip then
        tooltip = CreateFrame('GameTooltip', 'PFH_SCAN_TOOLTIP', UIParent, 'GameTooltipTemplate')
        self.scanTooltip = tooltip
    end

    tooltip:SetOwner(UIParent, 'ANCHOR_NONE')
    tooltip:SetHyperlink(string.format('unit:Creature-0-0-0-0-%d:0000000000', npcId))

    local npcName = _G[tooltip:GetName() .. 'TextLeft1']:GetText()

    if not npcName then
        if PFH_DB_BOSSES[npcId] and PFH_DB_BOSSES[npcId].name then
            npcName = LBB[PFH_DB_BOSSES[npcId].name] or PFH_DB_BOSSES[npcId].name
        else
            npcName = string.format('npc#%d', npcId)
        end
    end

    return npcName
end

function addon:OnCombatEvent(event, timeStamp, logEvent, hideCaster,
    sourceGuid, sourceName, sourceFlags, sourceFlags2,
    destGuid, destName, destFlags, destFlags2, ...
)
    if destGuid then
        local type, id = S2K:UnitInfoFromGuid(destGuid)

        if type == 'Creature' or type == 'Vehicle' then
            if (logEvent == 'UNIT_DIED' or logEvent == 'PARTY_KILL') and self.trackNpc[id] then
                RequestRaidInfo()

                self:ScheduleTimer(function()
                    RequestRaidInfo()
                end, 5)
            end
        end
    end
end

function addon:UpdateTooltip(anchor)
    if not InCombatLockdown() then
        if qtip:IsAcquired('PetFarmHelper') and self.tooltip then
            self.tooltip:Clear()
        else
            self.tooltip = qtip:Acquire('PetFarmHelper', 6, 'LEFT', 'LEFT', 'LEFT', 'LEFT', 'RIGHT')
        end

        self:UpdateTooltipData(self.tooltip)

        if anchor then
            self.tooltip:SmartAnchorTo(anchor)
            self.tooltip:SetAutoHideDelay(0.05, anchor)
        end

        self.tooltip:UpdateScrolling()
        self.tooltip:Show()
    end
end

function addon:BuildTooltipData()
    local i, j

    local petJournalInfo, playerPets = {}, {}

    local saved = self:SavePetJournalFilters()

    C_PetJournal.ClearSearchFilter()

    C_PetJournal.SetFlagFilter(LE_PET_JOURNAL_FLAG_COLLECTED, true)
    C_PetJournal.SetFlagFilter(LE_PET_JOURNAL_FLAG_NOT_COLLECTED, true)

    C_PetJournal.AddAllPetSourcesFilter()
    C_PetJournal.AddAllPetTypesFilter()

    for i = 1, C_PetJournal:GetNumPets() do
        local petId, speciesId, isCollected, _, _, _, _, _, _, _, npcId, _, _, _, _, isTradeable, isUnique = C_PetJournal.GetPetInfoByIndex(i)

        petJournalInfo[npcId] = { speciesId = speciesId, maxCount = isUnique and 1 or 3, isTradeable = isTradeable }

        if isCollected then
            if not playerPets[npcId] then
                playerPets[npcId] = { petId = petId, count = 0 }
            end

            playerPets[npcId].count = playerPets[npcId].count + 1
        end
    end

    self:RestorePetJournalFilters(saved)

    local savedRaids = {}
    for i = 1, GetNumSavedInstances() do
        local raidName, _, _, _, locked, extended, _, _, _, _, numBosses = GetSavedInstanceInfo(i)
        if locked and not extended then
            savedRaids[raidName] = {}

            local numRemains = 0

            for j = 1, numBosses do
                local bossName, _, killed = GetSavedInstanceEncounterInfo(i, j)
                if killed then
                    savedRaids[raidName][bossName] = 1
                else
                    numRemains = numRemains + 1
                end
            end

            if numRemains < 1 then
                savedRaids[raidName] = 1
            end
        end
    end

    local playerFaction = string.lower(UnitFactionGroup('player'))
    local playerLevel = UnitLevel('player')
    local playerZoneName = GetRealZoneText()

    local normalPets, raidPets, worldPets, questPets = {}, {}, {}, {}

    local petId, petData
    for petId, petData in pairs(PFH_DB_PETS) do
        if (not playerPets[petData.npc_id] or (not self.db.profile.hide_collected
                and (playerPets[petData.npc_id].count < petJournalInfo[petData.npc_id].maxCount or petJournalInfo[petData.npc_id].isTradeable)))
            and (not petData.faction or petData.faction == playerFaction)
        then
            local petName, petLink = GetItemInfo(petId)

            local petSource
            for _, petSource in pairs(petData.from) do
                if not petSource.faction or petSource.faction == playerFaction then
                    if petSource.level <= playerLevel then
                        local zoneName = GetMapNameByID(petSource.zone_id)

                        local npcName
                        if petSource.type == 'special' then
                            npcName = L['special_' .. petSource.subtype]
                        else
                            npcName = self:GetNpcName(petSource.npc_id)
                        end

                        local raidSaveZone = PFH_DB_ZONES[petSource.zone_id] and PFH_DB_ZONES[petSource.zone_id].raid and LBZ[PFH_DB_ZONES[petSource.zone_id].raid] or zoneName
                        local raidSaveBoss = PFH_DB_BOSSES[petSource.npc_id] and PFH_DB_BOSSES[petSource.npc_id].raid and LBB[PFH_DB_BOSSES[petSource.npc_id].raid] or npcName

                        local comment
                        if petSource.subtype and petSource.type ~= 'special' then
                            comment = L['type_' .. petSource.subtype]
                        end
                        if petSource.cond then
                            comment = (comment and (comment .. ' + ') or '') .. L['cond_' .. petSource.cond]
                        end

                        local add
                        if petSource.type == 'dungeon' and not petSource.subtype then
                            add = 1
                        elseif petSource.type == 'dungeon' or petSource.type == 'raid' then
                            add = not(savedRaids[raidSaveZone] and (type(savedRaids[raidSaveZone]) ~= 'table' or savedRaids[raidSaveZone][raidSaveBoss]))
                        elseif petSource.quest_id then
                            add = not IsQuestFlaggedCompleted(petSource.quest_id)
                        end

                        if add then
                            local zoneData = {
                                items = {}, sort = petSource.for_sort,
                                isCurrent = playerZoneName == (PFH_DB_ZONES[petSource.zone_id] and PFH_DB_ZONES[petSource.zone_id].map and LBZ[PFH_DB_ZONES[petSource.zone_id].map] or zoneName),
                            }

                            if petSource.type == 'dungeon' and not petSource.subtype then
                                if normalPets[zoneName] then
                                    zoneData = normalPets[zoneName]
                                else
                                    normalPets[zoneName] = zoneData
                                end
                            elseif petSource.type == 'dungeon' or petSource.type == 'raid' then
                                if raidPets[zoneName] then
                                    zoneData = raidPets[zoneName]
                                else
                                    raidPets[zoneName] = zoneData
                                end
                            elseif petSource.type == 'world' then
                                if worldPets[zoneName] then
                                    zoneData = worldPets[zoneName]
                                else
                                    worldPets[zoneName] = zoneData
                                end
                            else
                                if questPets[zoneName] then
                                    zoneData = questPets[zoneName]
                                else
                                    questPets[zoneName] = zoneData
                                end
                            end

                            zoneData.sort = min(zoneData.sort, petSource.for_sort)

                            local npcData = zoneData.items[npcName] or { items = {}, sort = petSource.for_sort }
                            zoneData.items[npcName] = npcData

                            npcData.sort = min(zoneData.sort, petSource.for_sort)

                            if playerPets[petData.npc_id] then
                                table.insert(npcData.items, {
                                    link = petLink, petId = playerPets[petData.npc_id].petId, comment = comment,
                                    count = playerPets[petData.npc_id].count, maxCount = petJournalInfo[petData.npc_id].maxCount,
                                })
                            else
                                table.insert(npcData.items, {
                                    link = petLink, speciesId = petJournalInfo[petData.npc_id].speciesId, comment = comment,
                                    count = 0, maxCount = petJournalInfo[petData.npc_id].maxCount,
                                })
                            end
                        end
                    end
                end
            end
        end
    end

    return {
        { items = normalPets, title = 'normal' },
        { items = raidPets  , title = 'raid'   },
        { items = worldPets , title = 'world'  },
        { items = questPets , title = 'quest'  },
    }
end

function addon:UpdateTooltipData(tooltip)
    local lineNo, petTable

    lineNo = tooltip:AddLine()
    tooltip:SetCell(lineNo, 1, string.format('%s: |c%s%s|r', L.title_mode,
        COLOR_MODE_TEXT,
        self.db.profile.hide_collected and L.mode_collector or L.mode_trader
    ), nil, nil, 5)

    tooltip:SetLineScript(lineNo, 'OnMouseUp', function()
        self.db.profile.hide_collected = not self.db.profile.hide_collected
        self:UpdateTooltip()
    end)

    for _, petTable in pairs(self:BuildTooltipData()) do
        if not tableIsEmpty(petTable.items) then
            tooltip:AddSeparator(unpack(TOOLTIP_SEPARATOR))

            if self.db.profile['hide_' .. petTable.title] then
                lineNo = tooltip:AddLine()
                tooltip:SetCell(lineNo, 1, '|TInterface\\Buttons\\UI-PlusButton-Up:16|t' .. L['title_' .. petTable.title], nil, nil, 5)

                tooltip:SetLineScript(lineNo, 'OnMouseUp', function()
                    self.db.profile['hide_' .. petTable.title] = false
                    self:UpdateTooltip()
                end)
            else
                lineNo = tooltip:AddLine()
                tooltip:SetCell(lineNo, 1, '|TInterface\\Buttons\\UI-MinusButton-Up:16|t' .. L['title_' .. petTable.title], nil, nil, 5)

                tooltip:SetLineScript(lineNo, 'OnMouseUp', function()
                    self.db.profile['hide_' .. petTable.title] = true
                    self:UpdateTooltip()
                end)

                local firstSorted, firstName = {}

                for firstName in pairs(petTable.items) do
                    table.insert(firstSorted, firstName)
                end

                table.sort(firstSorted, function(a, b)
                    if petTable.items[a].isCurrent then
                        if petTable.items[b].isCurrent then
                            return petTable.items[a].sort < petTable.items[b].sort
                        end
                        return true
                    end
                    if petTable.items[b].isCurrent then
                        return false
                    end
                    return petTable.items[a].sort < petTable.items[b].sort
                end)

                for _, firstName in pairs(firstSorted) do
                    local firstData = petTable.items[firstName]
                    local zoneColor = firstData.isCurrent and COLOR_CURRENT_ZONE or COLOR_DUNGEON

                    local secondSorted, secondName, titlePrinted = {}

                    for secondName in pairs(firstData.items) do
                        table.insert(secondSorted, secondName)
                    end

                    table.sort(secondSorted, function(a, b)
                        return firstData.items[a].sort < firstData.items[b].sort
                    end)

                    for _, secondName in pairs(secondSorted) do
                        local secondData = firstData.items[secondName]

                        if tableLength(firstData.items) == 1 then
                            lineNo = tooltip:AddLine()

                            tooltip:SetCell(lineNo, 1, string.format('%s / %s', firstName, secondName), nil, nil, 5)
                            tooltip:SetCellTextColor(lineNo, 1, unpack(zoneColor))
                        else
                            if not titlePrinted then
                                lineNo = tooltip:AddLine()

                                tooltip:SetCell(lineNo, 1, firstName, nil, nil, 5)
                                tooltip:SetCellTextColor(lineNo, 1, unpack(zoneColor))

                                titlePrinted = 1
                            end

                            lineNo = tooltip:AddLine()

                            tooltip:SetCell(lineNo, 2, secondName, nil, nil, 4)
                            tooltip:SetCellTextColor(lineNo, 2, unpack(zoneColor))
                        end

                        local petData
                        for _, petData in pairs(secondData.items) do
                            lineNo = tooltip:AddLine()

                            tooltip:SetCell(lineNo, 3, string.format('%d/%d', petData.count, petData.maxCount))

                            if petData.count == 0 then
                                tooltip:SetCellTextColor(lineNo, 3, unpack(COLOR_COUNT_NONE))
                            elseif petData.count < petData.maxCount then
                                tooltip:SetCellTextColor(lineNo, 3, unpack(COLOR_COUNT_NORMAL))
                            else
                                tooltip:SetCellTextColor(lineNo, 3, unpack(COLOR_COUNT_MAX))
                            end

                            if petData.comment then
                                tooltip:SetCell(lineNo, 4, petData.link:gsub('%[', ''):gsub('%]', ''))

                                tooltip:SetCell(lineNo, 5, petData.comment)
                                tooltip:SetCellTextColor(lineNo, 4, unpack(COLOR_COMMENT))
                            else
                                tooltip:SetCell(lineNo, 4, petData.link:gsub('%[', ''):gsub('%]', ''), nil, nil, 2)
                            end

                            if petData.petId then
                                tooltip:SetLineScript(lineNo, 'OnMouseUp', function()
                                    self:OpenPetJournal(petData.petId, 1)
                                end)
                            elseif petData.speciesId then
                                tooltip:SetLineScript(lineNo, 'OnMouseUp', function()
                                    self:OpenPetJournal(petData.speciesId)
                                end)
                            end
                        end
                    end
                end
            end
        end
    end

    tooltip:AddLine()
end

function addon:OpenPetJournal(id, isPetId)
    if not CollectionsJournal:IsShown() then
        ToggleCollectionsJournal()
    end

    CollectionsJournal_SetTab(CollectionsJournal, 2)

    if id then
        if isPetId then
            PetJournal_SelectPet(PetJournal, id)
        else
            PetJournal_SelectSpecies(PetJournal, id)
        end
    end
end

function addon:SavePetJournalFilters()
    local saved = { flag = {}, source = {}, type = {} }

    saved.text = C_PetJournal.GetSearchFilter()

    local i
    for i in valuesIterator(PET_JOURNAL_FLAGS) do
        saved.flag[i] = not C_PetJournal.IsFlagFiltered(i)
    end

    for i = 1, C_PetJournal.GetNumPetSources() do
        saved.source[i] = not C_PetJournal.IsPetSourceFiltered(i)
    end

    for i = 1, C_PetJournal.GetNumPetTypes() do
        saved.type[i] = not C_PetJournal.IsPetTypeFiltered(i)
    end

    return saved
end

function addon:RestorePetJournalFilters(saved)
    C_PetJournal.SetSearchFilter(saved.text)

    local i
    for i in valuesIterator(PET_JOURNAL_FLAGS) do
        C_PetJournal.SetFlagFilter(i, saved.flag[i])
    end

    for i = 1, C_PetJournal.GetNumPetSources() do
        C_PetJournal.SetPetSourceFilter(i, saved.source[i])
    end

    for i = 1, C_PetJournal.GetNumPetTypes() do
        C_PetJournal.SetPetTypeFilter(i, saved.type[i])
    end
end
