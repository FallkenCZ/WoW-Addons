
local ldb = LibStub:GetLibrary("LibDataBroker-1.1")
local esm = ESSENCE_SET_MANAGER_ADDON
esm.LDBSetButtons = {}
local equippedSets = {}
local BUTTON_SIZE = 45
local X_SPACING = 8
local Y_SPACING = 8
local COLUMN_MAX = 5
esm.LDBOpen = false

local function onUpdate(f)
	if not f:IsMouseOver() and not f.bg:IsMouseOver() then
		f:SetScript("OnUpdate", nil)
		esm.toggleBGVisible(f, false)
	end
end

esm.toggleBGVisible = function(f, visible)
	esm.LDBOpen = visible
	if visible then
		f.bg:Show()
		f:SetScript("OnUpdate", onUpdate)
	else
		f:SetScript("OnUpdate", nil)
		f.bg:Hide()
	end
	esm.checkEvents()
end

local function onClick(f)
	if (not C_AzeriteEssence.CanOpenUI()) or InCombatLockdown() then return end
	if not esm.azeriteUIOpen then
		if not _G.AzeriteEssenceUI then
			LoadAddOn("Blizzard_AzeriteEssenceUI")
		end
		ShowUIPanel(AzeriteEssenceUI)
		--_G.AzeriteEssenceUI:Show()
	else
		HideUIPanel(AzeriteEssenceUI)
		--_G.AzeriteEssenceUI:Hide()
	end
	f:SetScript("OnUpdate", nil)
	esm.toggleBGVisible(f, false)
end

local function getButtonOffset(i)
	local xoff = math.floor(i/COLUMN_MAX) * (BUTTON_SIZE + X_SPACING) + X_SPACING
	local yoff = (mod(i, COLUMN_MAX) * (BUTTON_SIZE + Y_SPACING)+ X_SPACING) * -1
	return xoff, yoff
end


local function updateLDBSetButton(text, i)
	local set = esm.specProfiles[esm.currentSpec][text]
	local xoff, yoff = getButtonOffset(i)
	if not esm.LDBSetButtons[i] then
		esm.LDBSetButtons[i] = CreateFrame("Button", "", esm.LDBButton.bg, "UIPanelButtonTemplate")
		esm.LDBSetButtons[i]:SetPoint("TOPLEFT", esm.LDBButton.bg, "TOPLEFT" , xoff, yoff)
		esm.LDBSetButtons[i]:SetWidth(BUTTON_SIZE)
		esm.LDBSetButtons[i]:SetHeight(BUTTON_SIZE)
		esm.LDBSetButtons[i]:SetScript("OnClick", function() esm.setButtonPress(esm.LDBSetButtons[i]) end)
		esm.LDBSetButtons[i]:SetScript("OnEnter", function() esm.showInfoTooltip(esm.LDBSetButtons[i]) end)
		esm.LDBSetButtons[i]:SetScript("OnLeave", function() esm.hideInfoTooltip(esm.LDBSetButtons[i]) end)
		esm.LDBSetButtons[i].tex = esm.LDBSetButtons[i]:CreateTexture()
		esm.LDBSetButtons[i].tex:SetAllPoints()
		esm.LDBSetButtons[i]:SetBackdrop ({bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", tile = true, tileSize = 16, edgeFile = [[Interface\ButtoPLTrader:NS\WHITE8X8]], edgeSize = 46})
		esm.LDBSetButtons[i]:SetBackdropBorderColor (0, 0, 0, 1)
	end
	local useFont = esm.getFont(set)
	if set.major.ID then
		esm.LDBSetButtons[i].tex:SetTexture(esm.ae.GetEssenceInfo(set.major.ID).icon)
		esm.LDBSetButtons[i].tex:SetDesaturated(esm.saturation)
		esm.LDBSetButtons[i].tex:SetTexCoord(.08, .92, .08, .92)
	end
	esm.LDBSetButtons[i]:SetNormalFontObject(useFont)
	esm.LDBSetButtons[i]:SetHighlightFontObject(useFont)
	esm.LDBSetButtons[i]:Show()
	esm.LDBSetButtons[i].setName = text
	esm.LDBSetButtons[i]:SetText(esm.getSplitText(text))
end

esm.updateLDBSetButtons = function()
	if esm.LDBButton and esm.LDBButton.bg then
		esm.saturation = esm.checkIfCanChange()
		esm.createSetFromEquipped()
		esm.getUnlockedCount()
		local i = 0
		for name, line in esm.pairsByKeys(esm.specProfiles[esm.currentSpec]) do
			updateLDBSetButton(name, i)
			i = i + 1
		end
		if (#(esm.LDBSetButtons)+1) > i then --hide unused buttons if you delete some
			for ii=i, #(esm.LDBSetButtons)+1 do
				if esm.LDBSetButtons[ii] then
					esm.LDBSetButtons[ii]:Hide()
				end
			end
		end
		esm.updateLDBButton()
		esm.updateBGSize(i+1) -- +1 to account for tome button
		esm.updateLDBTomeButton()
	end
end

esm.updateLDBTomeButton = function()
	if not esm.LDBButton then return end
	if not esm.LDBTomeButton then
		esm.LDBTomeButton = CreateFrame("Button", nil,  esm.LDBButton.bg, "SecureActionButtonTemplate, UIPanelButtonTemplate");
		esm.LDBTomeButton:SetWidth(BUTTON_SIZE)
		esm.LDBTomeButton:SetHeight(BUTTON_SIZE)
		esm.LDBTomeButton:SetAttribute("type", "item");
		
		esm.LDBTomeButton.tex = esm.LDBTomeButton:CreateTexture()
		esm.LDBTomeButton:SetNormalTexture(GetItemIcon(141446))
		esm.LDBTomeButton:GetNormalTexture():SetTexCoord(.08, .92, .08, .92)
		esm.LDBTomeButton:SetNormalFontObject(esm.fontTome)
		esm.LDBTomeButton:SetHighlightFontObject(esm.fontTome)
	end
	
	local xoff, yoff = getButtonOffset(#(esm.setNames))
	local tomeCount, itemID = esm.getTomeInfo()
	esm.LDBTomeButton:SetPoint("TOPLEFT", esm.LDBButton.bg, "TOPLEFT" , xoff, yoff)
	esm.LDBTomeButton:SetText(tomeCount)
	
	if InCombatLockdown() then return end
	
	esm.LDBTomeButton:SetAttribute("item", "item:"..itemID)
	esm.LDBTomeButton:GetNormalTexture():SetDesaturated(not esm.saturation)
	if esm.saturation == 1 and tomeCount > 0 then
		esm.LDBTomeButton:Enable()
	else
		esm.LDBTomeButton:Disable()
	end
	
end

esm.updateBGSize = function(btnCount)
	esm.LDBButton.bg:SetWidth(180)
	local height, width
	if btnCount < COLUMN_MAX then
		height = btnCount * (BUTTON_SIZE + Y_SPACING) + Y_SPACING
	else
		height = COLUMN_MAX * (BUTTON_SIZE + Y_SPACING) + Y_SPACING
	end
	width = (math.ceil(btnCount/COLUMN_MAX)) * (BUTTON_SIZE + X_SPACING) + X_SPACING
	esm.LDBButton.bg:SetHeight(height)
	esm.LDBButton.bg:SetWidth(width)
end

local function onEnter(f)
	if not C_AzeriteEssence.CanOpenUI() or InCombatLockdown() then return end
	esm.LDBButton = f
	if not f.bg then
		f.bg = CreateFrame("Frame", "EssenceSetManagerLDBFrame", UIParent)
		f.bg:EnableMouse(true)
		f.bg:SetFrameStrata("DIALOG")
		f.bg:SetClampedToScreen(true)
		f.bg:SetBackdrop({bgFile = "Interface\\Buttons\\white8x8"})
		f.bg:SetBackdropColor(0,0,0,.75)
	end
	f.bg:ClearAllPoints()
	local _, y = f:GetCenter()
	if y > GetScreenHeight()/2 then
		f.bg:SetPoint("TOPLEFT", f, "BOTTOMLEFT", -5, 0)
	else
		f.bg:SetPoint("BOTTOMLEFT", f, "TOPLEFT", -5, 0)
	end
	esm.updateLDBSetButtons()
	esm.toggleBGVisible(f, true)
end

local LDBButton = ldb:NewDataObject("Essence Set Manager", {type = "data source", text = "Essence Set Manager", OnClick = onClick, OnEnter = onEnter, icon = "Interface\\Icons\\inv_misc_questionmark"})

esm.updateLDBButton = function()
	equippedSets = {}
	esm.createSetFromEquipped()
	for k, v in pairs(esm.setNames) do
		local set = esm.specProfiles[esm.currentSpec][v]
		if esm.isSetEquipped(set) then
			LDBButton.text = v
			LDBButton.icon = esm.ae.GetEssenceInfo(set.major.ID).icon
			table.insert(equippedSets, v)
			return
		end
	end
	LDBButton.text = "Not Saved"
	LDBButton.icon = "Interface\\Icons\\inv_misc_questionmark"
	--local set = esm.specProfiles[esm.currentSpec][text]
end
