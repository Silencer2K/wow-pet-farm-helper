local addonName, addon = ...

local L = LibStub('AceLocale-3.0'):GetLocale(addonName)

local frame = AltCraftPFHTabFrame

function frame:OnInitialize()
    self.Title:SetText("Pet Farm Helper")
end

function frame:OnShow()
    local parent = self:GetParent()

    parent.TopLeft:SetTexture('Interface\\Addons\\AltCraft\\assets\\frame\\tl3')
    parent.Top:SetTexture('Interface\\Addons\\AltCraft\\assets\\frame\\t3')
    parent.TopRight:SetTexture('Interface\\Addons\\AltCraft\\assets\\frame\\tr3')

    parent.BottomLeft:SetTexture('Interface\\Addons\\AltCraft\\assets\\frame\\bl')

    parent.Portrait:SetTexture('Interface\\ICONS\\INV_Misc_Pet_02')

    self:Update()
end

function frame:Update()
end