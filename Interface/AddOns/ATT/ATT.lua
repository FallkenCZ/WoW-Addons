--[[
Name: Arena Team Tracker
Author(s): by Izy inspired by the old Party Ability Bars (PAB)
Contact/support at twitch.tv/imedia
Description: Track the cooldowns of your party members
--]]

local addon, SPELLDB = ...
local addon, ATTdefault = ...
local lower = string.lower
local match = string.match
local remove = table.remove
local GetSpellInfo = GetSpellInfo
local UnitClass = UnitClass
local UnitGUID = UnitGUID
local UnitName = UnitName
local IsInInstance = IsInInstance
local IsInGroup = IsInGroup
local IsInRaid = IsInRaid
local UnitRace = UnitRace
local UnitLevel = UnitLevel
local GetNumSubgroupMembers = GetNumSubgroupMembers
local CooldownFrame_Set = CooldownFrame_Set
local GetPvpTalentInfoByID = GetPvpTalentInfoByID
local GetSpecialization = GetSpecialization
local GetSpecializationInfo = GetSpecializationInfo
local GetTalentInfo = GetTalentInfo
local GetInventoryItemID = GetInventoryItemID
local GetInspectSelectedPvpTalent = C_SpecializationInfo.GetInspectSelectedPvpTalent
local LGlow = LibStub("LibButtonGlow-1.0")
local ChatPrefix  = "ATT-Check"
local ATTversion = 8.59
local ATTnewversion
local db
local dbModif = dbModif
local dbReduce = dbReduce
local dbRacial = dbRacial
local dbImport = dbImport
local dbConflict = dbConflict
local dbEssVoP = dbEssVoP
local dbReplace = dbReplace
local dbInspect = {}
local ATT = CreateFrame("Frame","ATT",UIParent)
local ATTIcons = CreateFrame("Frame",nil,UIParent)
local ATTAnchor = CreateFrame("Frame",nil,UIParent)
local ATTTooltip = CreateFrame("GameTooltip", "ATTGameTooltip", nil, "GameTooltipTemplate")
local ATTDampframe = CreateFrame("Frame",nil,UIParent)
ATTDampframe:SetPoint("TOP", UIWidgetTopCenterContainerFrame, "BOTTOM", 0, 0)
ATTDampframe:SetSize(150, 15)

local iconlist = {}
local anchors = {}
local activeGUIDS = {}

local function print(...)
	for i=1,select('#',...) do
		ChatFrame1:AddMessage("|cff33ff99ATT|r: " .. select(i,...))
	end
end

local validUnits = {
	["player"] = true,
	["party1"] = true,
	["party2"] = true,
	["party3"] = true,
	["party4"] = true,
	["pet"] = true,
	["partypet1"] = true,
	["partypet2"] = true,
	["partypet3"] = true,
	["partypet4"] = true,
} 

--Info spells
local DampeningName = GetSpellInfo(110310)
local PvPTrinketName = GetSpellInfo(208683)
local AdaptedName = GetSpellInfo(195756)
local Adapted = GetSpellInfo(195901)
local RelentlessName = GetSpellInfo(196029)
local GlimpseName = GetSpellInfo(315573)
local IFName = GetSpellInfo(316801)
local Stoneform = GetSpellInfo(20594)
local EveryMan = GetSpellInfo(59752)
local WillOfTheForsaken = GetSpellInfo(7744)
local Fireblood = GetSpellInfo(265221)
local MaledictName = GetSpellInfo(305252)
local Safeguard = GetSpellInfo(286342)
local Breach = GetSpellInfo(314517)
local Spite = GetSpellInfo(315362)
local Divine = GetSpellInfo(223819)
local Foj = GetSpellInfo(209785)
local Claw = GetSpellInfo(313148)
local Writhing = GetSpellInfo(173946)
local Badge = GetSpellInfo(277185)
local Medallion = GetItemInfo(165055)
local Voodoo = GetSpellInfo(266018)


local function convertspellids(t)
	local temp = {}
	for class, table in pairs(t) do
		temp[class] = {}
		for spec, spells in pairs(table) do
			spec = tostring(spec)
			temp[class][spec] = {}
			for k, spell in pairs(spells) do
				local spellInfo = GetSpellInfo(spell[1])
				if spellInfo then temp[class][spec][#temp[class][spec]+1] = { ability = spellInfo, cooldown = spell[2], id = spell[1], maxcharges = spell[3], talent = spell.talent } end
			end
		end
	end
	return temp
end

local ATTdefaultAbilities = convertspellids(ATTdefault.Abilities)
local dbExtra = {
 {	["ability"] = MaledictName, ["id"] = 286348, ["cooldown"] = 120,}, 
 {	["ability"] = Safeguard, ["id"] = 286341, ["cooldown"] = 120,}, 
 {	["ability"] = Breach, ["id"] = 314517, ["cooldown"] = 120,},
 {	["ability"] = Spite, ["id"] = 315362, ["cooldown"] = 60,},
 {	["ability"] = Claw, ["id"] = 313148, ["cooldown"] = 120,},
 {	["ability"] = Writhing, ["id"] = 173946, ["cooldown"] = 120,},
 {	["ability"] = Badge, ["id"] = 277185, ["cooldown"] = 120,},
 {	["ability"] = Medallion, ["id"] = 277179, ["cooldown"] = 120,},
 {	["ability"] = Voodoo, ["id"] = 266018, ["cooldown"] = 90,},
 }

 local dbTrinket = {
 {	["ability"] = PvPTrinketName, ["id"] = 208683, ["cooldown"] = 120,}, 
 {	["ability"] = AdaptedName,  ["id"] = 214027,[ "cooldown"] = 60, ["excluded"] = true},
 {	["ability"] = RelentlessName,  ["id"] = 196029,[ "cooldown"] = 0, ["excluded"] = true}, 
 }
		 
local cooldownResetters = {
	[11958] = { -- Cold Snap
		[120] = 1, 		-- Cone of Cold
		[45438] = 1,  	-- Ice Block
		[122] = 1, 		-- Frost Nova
	},
}

local temp = {}
for k, v in pairs(cooldownResetters) do
	local spellInfo = GetSpellInfo(k)
	if spellInfo then
		temp[spellInfo] = {}
		if type(v) == "table" then
			for id in pairs(v) do
				local spellInfo2 = GetSpellInfo(id)
				if spellInfo2 then temp[spellInfo][spellInfo2] = 1 end
			end
		else
			temp[GetSpellInfo(k)] = v
		end
	end
end

cooldownResetters = temp
temp = nil
convertspellids = nil

-- Player Inspect
local inspected = {}
local inspect_queue = {}
local nextInspectTick = 0

local supportedUnits = { "player", "party1", "party2", "party3", "party4" }
function ATT:FindUnitByGUID(guid)
	if guid then
		for i, unit in pairs(supportedUnits) do
			if UnitGUID(unit) == guid then
				return unit
			end
		end
	end
end

function ATT:GetSpecByGUID(guid)
	return inspected[guid]
end

function ATT:GetSpecByUnit(unit)
	local guid = UnitGUID(unit)
	if guid then return inspected[guid] end
end

function ATT:QueueInspect(unit)
	local guid = UnitGUID(unit)
	if guid then
	    self:DequeueInspectByGUID(guid)
		inspect_queue[#inspect_queue+1] = guid
	end
end

function ATT:DequeueInspectByGUID(guid)
	for i=#inspect_queue, 1, -1 do
		if inspect_queue[i] == guid then
	    table.remove(inspect_queue, i)
 		end
	end
end

function ATT:InspectPlayer()
	self:InspectIsReady(UnitGUID("player"))
end

function ATT:InspectIsReady(guid)
	local inspectedUnit = ATT:FindUnitByGUID(guid)
	if not inspectedUnit then return end 
	local isInspect = inspectedUnit ~= "player"
	self:DequeueInspectByGUID(guid)
	
	if isInspect then
		inspected[guid] = GetInspectSpecialization(inspectedUnit) 
		self:UpdateAnchors(inspectedUnit) 
	else 	 
		local spec = GetSpecialization()
		if spec then 
			inspected[guid] = GetSpecializationInfo(spec) 
		end
	end
end

function ATT:EnqueueInspect()
	table.wipe(inspect_queue)
	for i=1, GetNumSubgroupMembers() do
	     self:QueueInspect("party"..i) 
	end
end

hooksecurefunc("NotifyInspect", function(unit) nextInspectTick = GetTime() + 0.51 end)

function ATT:ProcessInspectQueue()
	    if GetTime() > nextInspectTick then
	    nextInspectTick = GetTime() + 0.51
		self:InspectPlayer()
		for i, guid in pairs(inspect_queue) do
		local unit = self:FindUnitByGUID(guid)
		if unit and CanInspect(unit) and not (InspectFrame and InspectFrame:IsShown()) then
		 NotifyInspect(unit)
            break
			end
		end
	 end
end

function ATT:INSPECT_READY(guid)
	self:InspectIsReady(guid)
	self:ProcessInspectQueue()
end

function ATT:SavePositions()
	for k,anchor in ipairs(anchors) do
		local scale = anchor:GetEffectiveScale()
		local worldscale = UIParent:GetEffectiveScale()
		local x = anchor:GetLeft() * scale
		local y = (anchor:GetTop() * scale) - (UIParent:GetTop() * worldscale)
		if not db.positions[k] then
			db.positions[k] = {}
		end	
		db.positions[k].x = x
		db.positions[k].y = y
	end
end

function ATT:RaidInfo()
    for i=1,41 do 
    local n,_,raidinfo=GetRaidRosterInfo(i) 
     if n == UnitName("player") then return raidinfo end 
   end
end

function ATT:FindCompactRaidFrameByUnit(unit)
	if not unit or not UnitGUID(unit) then return end
	for i=1, 41 do
		local frame = nil
		local raidinfo = self:RaidInfo() or 1; 
		 if db.attach == 1 and _G["ElvUF_PartyGroup"..raidinfo.."UnitButton"..i] then frame = _G["ElvUF_PartyGroup"..raidinfo.."UnitButton"..i]
		 elseif db.attach == 1 and _G["ElvUF_RaidGroup"..raidinfo.."UnitButton"..i] then frame = _G["ElvUF_RaidGroup"..raidinfo.."UnitButton"..i]
		 elseif db.attach == 1 and _G["TukuiPartyUnitButton"..i] then frame = _G["TukuiPartyUnitButton"..i]
		 elseif db.attach == 1 and _G["SUFHeaderpartyUnitButton"..i] then frame = _G["SUFHeaderpartyUnitButton"..i] 
		 elseif db.attach == 1 and _G["Grid2LayoutHeader"..raidinfo.."UnitButton"..i] then  frame = _G["Grid2LayoutHeader"..raidinfo.."UnitButton"..i] 
	     elseif db.attach == 1 and _G["XPerl_party"..i] then if unit == "player" then frame = _G["XPerl_Player"] ; frame.unit = unit else frame = _G["XPerl_party"..i] ; frame.unit = frame.partyid; end
	     elseif CompactRaidFrameManager_GetSetting and CompactRaidFrameManager_GetSetting("KeepGroupsTogether") then 
			if IsInRaid() then frame = _G["CompactRaidGroup"..raidinfo.."Member"..i] 
			else frame = _G["CompactPartyFrameMember"..i]  end	
		 else 
		  frame = _G["CompactRaidFrame"..i]
		 end
		if frame and frame.unit and UnitGUID(frame.unit) == UnitGUID(unit) then 
			return frame
		end	
	end
end

function ATT:LoadPositions()
	db.positions = db.positions or {}
	for k,anchor in ipairs(anchors) do
		anchors[k]:ClearAllPoints()
		local raidFrame
		 if db.attach and db.attach ~= 0 then raidFrame = self:FindCompactRaidFrameByUnit(k==5 and "player" or "party"..k) end 
		if raidFrame then
		   if db.horizontal then 
   			 anchors[k]:SetPoint(db.growLeft and "BOTTOMLEFT" or "BOTTOMRIGHT", raidFrame, db.growLeft and "BOTTOMRIGHT" or "BOTTOMLEFT", db.offsetX, db.offsetY)
             else
			 anchors[k]:SetPoint(db.growLeft and "BOTTOMLEFT" or "BOTTOMRIGHT", raidFrame, db.growLeft and "TOPLEFT" or "TOPRIGHT", db.offsetX, db.offsetY) 
		    end
		else
			if db.positions[k] then
				local x = db.positions[k].x
				local y = db.positions[k].y
				local scale = anchors[k]:GetEffectiveScale()
				anchors[k]:SetPoint("TOPLEFT", UIParent,"TOPLEFT", x/scale, y/scale)
			else
				anchors[k]:SetPoint("CENTER", UIParent, "CENTER")
			end
		end
	end 
end

function ATT:CreateAnchors()
    local backdrop = {bgFile="Interface\\Tooltips\\UI-Tooltip-Background", edgeFile="", tile=false,}
	for i=1,41 do --here
		local anchor = CreateFrame("Frame","ATTAnchor"..i ,ATTAnchor)
		anchor:SetBackdrop(backdrop)
		anchor:SetHeight(15)
		anchor:SetWidth(15)
		anchor:SetBackdropColor(1,0,0,1)
		anchor:EnableMouse(true)
		anchor:SetMovable(true)
		anchor:Show()
		anchor.icons = {}
		anchor.HideIcons = function() for k,icon in ipairs(anchor.icons) do icon:Hide(); icon.inUse = nil end end
		anchor:SetScript("OnMouseDown",function(self,button) if button == "LeftButton" and db.attach == 0 then self:StartMoving() end end)
		anchor:SetScript("OnMouseUp",function(self,button) if button == "LeftButton" and db.attach == 0 then self:StopMovingOrSizing(); ATT:SavePositions() end end)
		anchor:Hide() 
		anchors[i] = anchor
		local index = anchor:CreateFontString(nil,"ARTWORK","GameFontNormal")
		index:SetPoint("CENTER")
		index:SetText(i)
	end 
end

-- creates a new raw frame icon that can be used/reused to show cooldowns
local function CreateIcon(anchor)
	local icon = CreateFrame("Frame",anchor:GetName().."Icon".. (#anchor.icons+1),ATTIcons,"ATTButtonTemplate")
	icon:SetSize(40,40) 
	local cd = CreateFrame("Cooldown",icon:GetName().."Cooldown",icon,"CooldownFrameTemplate")
	cd:SetHideCountdownNumbers(false)
	icon.cd = cd
	icon.Start = function(sentCD , nextcharge, rate)
		icon.cooldown = tonumber(sentCD)
		if icon.maxcharges then
			local charges = tonumber(icon.chargesText:GetText():match("^[0-9]+$"))
			if charges == 2 or nextcharge == icon.maxcharges then
				CooldownFrame_Set(cd,GetTime(),icon.cooldown, 1, 1, 1)
				icon.cd:SetDrawEdge(true)
				icon.cd:SetDrawSwipe(false)
				icon.cd:SetHideCountdownNumbers(true)
				icon.starttime = GetTime()
				charges = charges - 1
				icon.chargesText:SetText(charges)

            elseif charges == 1 and nextcharge == 5 then
			    CooldownFrame_Set(cd,GetTime(),icon.cooldown, 1)
				icon.cd:SetDrawEdge(true)
				icon.cd:SetDrawSwipe(false)   
				icon.cd:SetHideCountdownNumbers(true)
				icon.starttime = GetTime()
				icon.chargesText:SetText(charges)

			elseif charges == 1 and nextcharge == 1 and icon.starttime < GetTime() then
			    if icon.itprocent then rate = 100 / (100 + icon.itprocent)
			    icon.cooldown = icon.cooldown * rate end
				CooldownFrame_Set(cd, icon.starttime, icon.cooldown, 1,1,rate)
				icon.cd:SetDrawEdge(false)
				icon.cd:SetDrawSwipe(true)
				icon.cd:SetHideCountdownNumbers(false)
				--icon.starttime = GetTime()
				charges = charges - 1
				icon.chargesText:SetText(charges)
			end

		else
			CooldownFrame_Set(cd,GetTime(),icon.cooldown, 1,1, rate)
			icon.starttime = GetTime()
	end
	
		icon:Show()
		icon.active = true; 
        activeGUIDS[icon.GUID] = activeGUIDS[icon.GUID] or {}
		activeGUIDS[icon.GUID][icon.ability] = activeGUIDS[icon.GUID][icon.ability] or {}
		activeGUIDS[icon.GUID][icon.ability].starttime = icon.starttime
		activeGUIDS[icon.GUID][icon.ability].cooldown =  icon.cooldown
	end

	icon.Stop = function()
		CooldownFrame_Set(cd,0,0,0);
		icon.starttime = 0
	end
	
	icon.SetTimer = function(starttime,cooldown)
		CooldownFrame_Set(cd,starttime,cooldown,1, rate)
		icon.active = true
		icon.starttime = starttime
		icon.cooldown = cooldown
	end

	local texture = icon:CreateTexture(nil,"ARTWORK")
	texture:SetAllPoints(true)
	icon.texture = texture
	
	ATT:ApplyIconTextureBorder(icon)
		
	icon.chargesText = icon:CreateFontString(nil, nil, "DialogButtonHighlightText")
    icon.chargesText:SetTextColor(1, 1, 1)
	icon.chargesText:SetText("")
	icon.chargesText:SetPoint("BOTTOMRIGHT", icon, "BOTTOMRIGHT")

	-- tooltip:
	icon:EnableMouse()
	icon:SetScript('OnEnter', function()
		if db.showTooltip and icon.abilityID then
			ATTTooltip:ClearLines()
			ATTTooltip:SetOwner(WorldFrame, "ANCHOR_CURSOR")
			ATTTooltip:SetSpellByID(icon.abilityID)
		end
	end)
	icon:SetScript('OnLeave', function()
		if db.showTooltip and icon.abilityID then
			ATTTooltip:ClearLines()
			ATTTooltip:Hide()
		end
	end)
	return icon
end

-- adds a new icon to icon list of anchor
function ATT:AddIcon(icons,anchor)
	local newicon = CreateIcon(anchor)
	iconlist[#iconlist+1] = newicon
	icons[#icons+1] = newicon
	return newicon
end

-- applies texture border to an icon
function ATT:ApplyIconTextureBorder(icon)
    if db.showIconBorders then
		icon.texture:SetTexCoord(0,1,0,1)
	else
		icon.texture:SetTexCoord(0.07,0.9,0.07,0.90)
	end
end

-- hides anchors currently not in use due to too few party members
function ATT:ToggleAnchorDisplay()
	-- Player (Test):
	if db.showSelf and anchors[5] then anchors[5]:Show() end
	-- Party members:
	for i=1,GetNumSubgroupMembers() do 
	anchors[i]:Show() end
	for k=GetNumSubgroupMembers()+1,4 do
	    local anchor = anchors[k]
        local icons = anchor.icons
	    for j=1,#icons do
	    icons[j].ability = nil
	    icons[j].seen = nil
        icons[j].active = nil
        icons[j].inUse = nil
        icons[j].showing = nil
        end 
		anchors[k]:Hide()
		anchors[k].HideIcons()
		end
	if not db.showSelf and anchors[5] then
		anchors[5]:Hide()
		anchors[5]:HideIcons()
	end
end

function ATT:UpdateAnchor(unit, i)
    if not self:IsShown() then return end
    local _,class = UnitClass(unit)
    local guid = UnitGUID(unit)
    if not class or not guid then return end
    local anchor = anchors[i]
    anchor.GUID = guid
    anchor.class = class
    local icons = anchor.icons
    local numIcons = 1
    local _, instanceType = IsInInstance()
    local isInspect = unit ~= "player"
    local ATTTooltips = CreateFrame("GameTooltip", "ATTGameTooltips", nil, "GameTooltipTemplate")
    ATTTooltips:SetOwner(UIParent, "ANCHOR_NONE")
    local warmode = UnitIsWarModeDesired(unit)
    local pvpactive = (warmode and instanceType == "none") or instanceType == "arena" or instanceType == "pvp"
    local dbCharge = dbCharge
    local dbModifCharge = dbModifCharge

    -- Talent Check
    dbInspect[unit] = {}
    local dbInspect = dbInspect[unit]
    y = 1
    for k = 1, 4 do
        if unit == "player" then
            _, _, _, _, _,abilityTid =  GetPvpTalentInfoByID(C_SpecializationInfo.GetAllSelectedPvpTalentIDs()[k] or 0)
        elseif unit ~= "player" then
            _, _, _, _, _, abilityTid = GetPvpTalentInfoByID(GetInspectSelectedPvpTalent(unit,k) or 0) end
        dbInspect[y] = {["ability"] = abilityTid, ["isPVP"] = true }
        y = y + 1 end
    for j = 1 ,7 do
        for k = 1,3 do
            _,Nname, _, selected, _,abilityTid = GetTalentInfo(j, k, 1, isInspect, unit)
            if selected then
                dbInspect[y] = {["ability"] = abilityTid}
                y = y + 1 end
            if not selected then
                dbInspect[y] =  {["ability"] = Nname}
                y = y + 1 end 
        end
    end
    -- Azerite check
    for k=1,5,2 do
        ATTTooltips:SetInventoryItem(unit, k)
        local _, itemLink = ATTTooltips:GetItem()
        local AzItem = itemLink and C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID(itemLink)
        if AzItem then
            lscan = ATTTooltips:NumLines()
            for i=4 ,lscan do
                local aztext = _G["ATTGameTooltipsTextLeft" ..i]:GetText():match("^- (.*)")
                for z ,v in pairs(dbModif) do
                    azmod = GetSpellInfo(dbModif[z].azTid)
                    if aztext and aztext == azmod then
                        dbInspect[40] = {["azzmod"] = dbModif[z].azTid}
                    end
                end
            end
        end
    end
       -- Conflict Check
    ATTTooltips:SetInventoryItem(unit, 2)
    local ConflictCheck = _G["ATTGameTooltipsTextLeft"..14]
    local Conflict = C_AzeriteEssence.GetEssenceInfo(32)
    if ConflictCheck and Conflict and ConflictCheck:GetText() == Conflict.name then useClonflict = true else useClonflict = false end
    -- Essence check (VoP)
   dbInspect[41] = {["VoP"] = false}
   local VoP = C_AzeriteEssence.GetEssenceInfo(22)
   for i =14 ,17 do 
    local essCheck = _G["ATTGameTooltipsTextLeft"..i]
    if VoP and essCheck and VoP.name == essCheck:GetText() then dbInspect[41] = {["VoP"] = true} break end 
   end
   --Extra
    dbInspect[42] = {["warmode"] = warmode}
    dbInspect[43] = {["cpower"] = 0}


    -- PvP Medalion:
    if db.showTrinket then
        for abilityIndex, abilityTable in pairs(dbTrinket) do
            local ability, id, cooldown, maxcharges, excluded = abilityTable.ability, abilityTable.id, abilityTable.cooldown, abilityTable.maxcharges, abilityTable.excluded
            local icon = icons[numIcons] or self:AddIcon(icons,anchor)          
            if dbInspect[1] and dbInspect[1].ability ~= id then ability = nil end
            if not pvpactive then ability = nil end

            icon.texture:SetTexture(self:FindAbilityIcon(ability, id))
            icon.GUID = anchor.GUID
            icon.ability = ability
            icon.abilityID = id
            icon.cooldown = cooldown
            icon.maxcharges = nil
            icon.chargesText:SetText()
            icon.inUse = true
            icon.excluded = excluded
            icon.spellStatus = spellStatus

            ATT:ApplyIconTextureBorder(icon)

            activeGUIDS[icon.GUID] = activeGUIDS[icon.GUID] or {}

            if activeGUIDS[icon.GUID][icon.ability] and icon.active then
                icon.SetTimer(activeGUIDS[icon.GUID][ability].starttime,activeGUIDS[icon.GUID][ability].cooldown)
            else
                icon.Stop()
            end
            numIcons = numIcons + 1
        end
    end

    -- Racials
    if db.showRacial then
        local _, _, raceID = UnitRace(unit);
        for abilityIndex, abilityTable in pairs(dbRacial) do
            local ability, id, cooldown, maxcharges, race = abilityTable.ability, abilityTable.id, abilityTable.cooldown, abilityTable.maxcharges, abilityTable.race
            local icon = icons[numIcons] or self:AddIcon(icons,anchor)
            local id = ability
            local ability = GetSpellInfo(ability)
            if raceID ~= race then ability = nil end

            icon.texture:SetTexture(self:FindAbilityIcon(ability, id))
            icon.GUID = anchor.GUID
            icon.ability = ability
            icon.abilityID = id
            icon.cooldown = cooldown
            icon.maxcharges = nil
            icon.chargesText:SetText()
            icon.inUse = true
            icon.race = raceID
            icon.excluded = true
            icon.spellStatus = spellStatus

            ATT:ApplyIconTextureBorder(icon)

            activeGUIDS[icon.GUID] = activeGUIDS[icon.GUID] or {}

            if activeGUIDS[icon.GUID][icon.ability]  and icon.active then
                icon.SetTimer(activeGUIDS[icon.GUID][ability].starttime,activeGUIDS[icon.GUID][ability].cooldown)
            else
                icon.Stop()
            end
            numIcons = numIcons + 1
        end
    end

    --Extra Trinket / options
    for abilityIndex, abilityTable in pairs(dbExtra) do
        local ability, id, cooldown, maxcharges = abilityTable.ability, abilityTable.id, abilityTable.cooldown, abilityTable.maxcharges
        local icon = icons[numIcons] or self:AddIcon(icons,anchor)
        local item1 = select(1,GetItemInfoInstant( GetInventoryItemLink(unit, 13) or 0 ))
        local item2 = select(1,GetItemInfoInstant( GetInventoryItemLink(unit, 14) or 0 ))
        if ability ~= GetItemSpell(item1) and ability ~= GetItemSpell(item2) then
            ability = nil
        end
        if ability == nil and id == 286341 and (item1 == 172673 or item2 == 172673) then ability = Safeguard end --safeguard fix
       
        if  not (( db.safeguard and ability == Safeguard ) or ( db.maledict and ability == MaledictName)
            or ( db.spite and ability == Spite) or ( db.breach and ability == Breach)
            or ( db.claw and ability == Claw) or ( db.writhing and ability == Writhing)
            or ( db.badge and ability == Badge) or ( db.medallion and ability == Medallion)
            or ( db.voodoo and ability == Voodoo ))
        then ability = nil end
       
        icon.texture:SetTexture(self:FindAbilityIcon(ability, id))
        icon.GUID = anchor.GUID
        icon.ability = ability
        icon.abilityID = id
        icon.cooldown = cooldown
        icon.maxcharges = nil
        icon.chargesText:SetText()
        icon.inUse = true
        icon.excluded = true
        icon.spellStatus = spellStatus

        ATT:ApplyIconTextureBorder(icon)

        activeGUIDS[icon.GUID] = activeGUIDS[icon.GUID] or {}

        if activeGUIDS[icon.GUID][icon.ability] and icon.active then
            icon.SetTimer(activeGUIDS[icon.GUID][ability].starttime,activeGUIDS[icon.GUID][ability].cooldown)
        else
            icon.Stop()
        end
            numIcons = numIcons + 1
    end

    -- Abilities [All Specs]:
    for abilityIndex, abilityTable in pairs(db.abilities[class]["ALL"]) do
        local ability, id, cooldown, maxcharges, spellStatus = abilityTable.ability, abilityTable.id, abilityTable.cooldown, abilityTable.maxcharges, abilityTable.spellStatus
        local icon = icons[numIcons] or self:AddIcon(icons,anchor)
        local SpellText = GetSpellSubtext(id)
        local tcheck = self:FindAbilityByName(dbInspect, id)
        local modif = self:FindAbilityByName(dbModif, id)
        local mcharge = self:FindAbilityByName(dbModifCharge, id)
        local replace = self:FindAbilityByName(dbReplace, id) 
        
        if useClonflict and SpellText == ("PvP Talent") then if self:FindAbilityByName(dbConflict, id) then SpellText = nil end end
        if replace and (self:FindAbilityByName(dbInspect, replace.mod) or self:FindAbilityByName(dbInspect, replace.mod2)) then ability = nil end
        if spellStatus == "DISABLED" or self:FindAbilityByName(dbInspect, ability) or (tcheck and tcheck.isPVP and not pvpactive) or (SpellText == ("PvP Talent") and not tcheck) then ability = nil;  end
        if ability and self:FindAbilityByName(dbEssVoP, id) and dbInspect[41] and dbInspect[41].VoP then cooldown = cooldown - (cooldown/4) end
        if modif and dbInspect[40] and dbInspect[40].azzmod and modif.azTid == dbInspect[40].azzmod then cooldown = cooldown - modif.azCD end
        if ability and modif and modif.cooldown and self:FindAbilityByName(dbInspect, modif.mod) then cooldown = modif.cooldown end 
        
        icon.texture:SetTexture(self:FindAbilityIcon(ability, id))
        icon.GUID = anchor.GUID
        icon.ability = ability
        icon.abilityID = id
        icon.cooldown = cooldown
        icon.excluded = nil
        icon.maxcharges = nil
        icon.chargesText:SetText()
        if self:FindAbilityByName(dbCharge, id) then 
        icon.maxcharges = 2 ; icon.chargesText:SetText(2) end
        if mcharge and self:FindAbilityByName(dbInspect, mcharge.mod) then
        icon.maxcharges = 2 ; icon.chargesText:SetText(2) end 
        icon.inUse = true
        icon.spellStatus = spellStatus 

        ATT:ApplyIconTextureBorder(icon)
         activeGUIDS[icon.GUID] = activeGUIDS[icon.GUID] or {}
         if activeGUIDS[icon.GUID][icon.ability] and icon.active then
          icon.SetTimer(activeGUIDS[icon.GUID][ability].starttime,activeGUIDS[icon.GUID][ability].cooldown)
         if cooldown then icon.cooldown = cooldown end
             else
                icon.Stop()
            end
            numIcons = numIcons + 1
        end
    
    -- Abilities [Current Spec]:
    local unitSpec = tostring(self:GetSpecByGUID(anchor.GUID))
    if unitSpec and unitSpec ~= "0" and unitSpec ~= "ALL" and unitSpec ~= "nil" then
        for abilityIndex, abilityTable in pairs(db.abilities[class][unitSpec])  do
            local ability, id, cooldown, maxcharges, spellStatus = abilityTable.ability, abilityTable.id, abilityTable.cooldown, abilityTable.maxcharges, abilityTable.spellStatus
            local icon = icons[numIcons] or self:AddIcon(icons,anchor)
        local SpellText = GetSpellSubtext(id)
        local tcheck = self:FindAbilityByName(dbInspect, id)
        local modif = self:FindAbilityByName(dbModif, id)
        local mcharge = self:FindAbilityByName(dbModifCharge, id)
        local replace = self:FindAbilityByName(dbReplace, id) 

        if useClonflict and SpellText == ("PvP Talent") then if self:FindAbilityByName(dbConflict, id) then SpellText = nil end end
        if replace and (self:FindAbilityByName(dbInspect, replace.mod) or self:FindAbilityByName(dbInspect, replace.mod2)) then ability = nil end
        if spellStatus == "DISABLED" or self:FindAbilityByName(dbInspect, ability) or (tcheck and tcheck.isPVP and not pvpactive) or (SpellText == ("PvP Talent") and not tcheck) then ability = nil end
        if ability and self:FindAbilityByName(dbEssVoP, id) and dbInspect[41] and dbInspect[41].VoP then cooldown = cooldown - (cooldown/4) end
        if modif and dbInspect[40] and dbInspect[40].azzmod and modif.azTid == dbInspect[40].azzmod then cooldown = cooldown - modif.azCD end
        if ability and modif and modif.cooldown and self:FindAbilityByName(dbInspect, modif.mod) then cooldown = modif.cooldown end

        icon.texture:SetTexture(self:FindAbilityIcon(ability, id))
        icon.GUID = anchor.GUID
        icon.ability = ability
        icon.abilityID = id
        icon.cooldown = cooldown
        icon.excluded = nil
        icon.maxcharges = nil
        icon.chargesText:SetText()
        if self:FindAbilityByName(dbCharge, id) then 
        icon.maxcharges = 2 ; icon.chargesText:SetText(2) end
        if mcharge and self:FindAbilityByName(dbInspect, mcharge.mod) then
        icon.maxcharges = 2 ; icon.chargesText:SetText(2) end 
        icon.inUse = true
        icon.spellStatus = spellStatus 

        ATT:ApplyIconTextureBorder(icon)
         activeGUIDS[icon.GUID] = activeGUIDS[icon.GUID] or {}
         if activeGUIDS[icon.GUID][icon.ability] and icon.active then
          icon.SetTimer(activeGUIDS[icon.GUID][ability].starttime,activeGUIDS[icon.GUID][ability].cooldown)
         if cooldown then icon.cooldown = cooldown end
             else
                icon.Stop()
            end
            numIcons = numIcons + 1
            end
        end

    -- clean leftover icons
    for j=numIcons,#icons do
        icons[j].spec = nil
        icons[j].seen = nil
        icons[j].active = nil
        icons[j].inUse = nil
        icons[j].showing = nil
    end
    self:ToggleIconDisplay(i)
end


-- responsible for actual anchoring of icons
function ATT:ToggleIconDisplay(i)
	local anchor = anchors[i]
	local icons = anchor.icons
	local count = 1
	local lastActiveIndex = 0
	-- hiding all icons before anchoring and deciding whether to show them
	for k, icon in pairs(icons) do
		if icon and icon.ability and icon.inUse then
				icon.showing = (activeGUIDS[icon.GUID] and activeGUIDS[icon.GUID][icon.ability] and icon.active) or (not db.hidden)
		end
		icon:ClearAllPoints()
		icon:Hide()
	end
	for k, icon in pairs(icons) do
		if icon and icon.ability and icon.showing then
         if db.tworows then
            if count == 1 then 
				icon:SetPoint(db.growLeft and "TOPRIGHT" or "TOPLEFT", anchor, db.growLeft and "BOTTOMLEFT" or "BOTTOMRIGHT", db.growLeft and -1 * db.iconOffsetX or db.iconOffsetX, 0)
			elseif (count % 2 == 0 )  then			
				icon:SetPoint(db.growLeft and "TOP" or "TOP", icons[lastActiveIndex], db.growLeft and "BOTTOM" or "BOTTOM", db.growLeft and 0 or 0, -1 * db.iconOffsetY )			 
			else	
                icon:SetPoint(db.growLeft and "BOTTOMRIGHT" or "BOTTOMLEFT", icons[lastActiveIndex], db.growLeft and "TOPLEFT" or "TOPRIGHT", db.growLeft and -1 * db.iconOffsetX or db.iconOffsetX, db.iconOffsetY)
			 end 
		 else
			if count == 1  then
				icon:SetPoint(db.growLeft and "TOPRIGHT" or "TOPLEFT", anchor, db.growLeft and "BOTTOMLEFT" or "BOTTOMRIGHT", db.growLeft and -1 * db.iconOffsetX or db.iconOffsetX, 0)
			else
				icon:SetPoint(db.growLeft and "RIGHT" or "LEFT", icons[lastActiveIndex], db.growLeft and "LEFT" or "RIGHT", db.growLeft and -1 * db.iconOffsetX or db.iconOffsetX, 0)
			end
	     end
			lastActiveIndex = k
			count = count + 1
			icon:Show()
		end
	end
	  self:ToggleAnchorDisplay() 
end

function ATT:UpdateAnchors() 
    -- Player (Test):
	if db.showSelf and anchors[5] and UnitIsConnected("player") then self:UpdateAnchor("player",5)  end
	-- Party members:
	for i=1, GetNumSubgroupMembers() do
	 local unit = "party"..i 
	 local _,class = UnitClass(unit)
	  if not class then break end
	  if not anchors[i] then break end
	  if UnitIsConnected(unit) and (GetInspectSelectedPvpTalent(unit,1) or (UnitLevel(unit) and UnitLevel(unit) < 20)) then
	-- self:LoadPositions()
	   self:UpdateAnchor(unit, i)
    -- self:ToggleAnchorDisplay()
    -- self:ApplyAnchorSettings()
      end 
	end
    self:LoadPositions()
	self:ToggleAnchorDisplay()
	self:ApplyAnchorSettings()
end

function ATT:UpdateIcons()
	-- Player (Test):
	if db.showSelf and anchors[5] then self:ToggleIconDisplay(5) end
	-- Party members:
	for i=1, GetNumSubgroupMembers() do
		self:ToggleIconDisplay(i)
	end
end

function ATT:ApplyAnchorSettings()
    local _, instanceType = IsInInstance()
	ATTIcons:SetScale(db.scale or 1)	
	raidnr = GetNumGroupMembers();
 
	if (db.arena and instanceType == "arena") or 
	   (db.dungeons and instanceType == "party") or 
	   (db.scenarios and instanceType == "scenario") or 
	   (db.inraid and (instanceType == "raid" or instanceType == "pvp") ) or
	   (db.outside and instanceType == "none")   
    then 
      if db.biggroup and raidnr and raidnr > 5 then ATTIcons:Hide() ; self:Hide() 
      else ATTIcons:Show() ; self:Show() end
	else ATTIcons:Hide() ; self:Hide() 	end 

    if db.biggroup and raidnr and raidnr > 5 then ATTIcons:Hide() ; self:Hide() end
	if db.lock then ATTAnchor:Hide() else ATTAnchor:Show() end
    self:UpdateIcons()

	if db.dampening and instanceType == "arena" then 
	   self:RegisterUnitEvent("UNIT_AURA", "player")
	 --  ATTDampframe:Show()
    else 
      self:UnregisterEvent("UNIT_AURA")
      ATTDampframe.dampening = nil
      ATTDampframe:Hide()
    end
end

function ATT:UNIT_AURA(unit)
	percentage = select(16, AuraUtil.FindAuraByName(DampeningName, "player", "HARMFUL")) 
  	if percentage then 
  	    if not ATTDampframe.text then
  	    ATTDampframe.text = ATTDampframe:CreateFontString(nil, "BACKGROUND")
        ATTDampframe.text:SetFontObject(GameFontNormal)
        ATTDampframe.text:SetAllPoints() end  
  	    if not ATTDampframe:IsShown() then ATTDampframe:Show()end
		if ATTDampframe.dampening ~= percentage then
		   ATTDampframe.dampening = percentage
		   ATTDampframe.text:SetText(DampeningName..": |cffFF4500"..percentage.."%|r")
		end
	elseif ATTDampframe:IsShown() and not percentage then
        ATTDampframe:Hide()
	end   
end

function ATT:GROUP_ROSTER_UPDATE()
	self:InspectPlayer()
	self:EnqueueInspect()
    self:ProcessInspectQueue()
	self:SendUpdate()
	self:LoadPositions()
	self:UpdateAnchors()
end

function ATT:UPDATEGROUP()
	self:InspectPlayer()
	self:EnqueueInspect()
    self:ProcessInspectQueue()
	self:LoadPositions()
	self:UpdateAnchors()
end

function ATT:AZERITE_ESSENCE_ACTIVATED(slot)
     if slot == 0 then ATT:UPDATEGROUP() end
end

function ATT:AZERITE_ESSENCE_UPDATE()
      ATT:UPDATEGROUP()
end      

function ATT:PLAYER_ENTERING_WORLD()
    local inInstance, instanceType = IsInInstance()
	self:InspectPlayer()
	self:EnqueueInspect()
    if instanceType == "arena" then self:StopAllIcons() end 
	self:LoadPositions()
	self:UpdateAnchors() 
end

function ATT:FindAbilityByName(abilities, name)
	if abilities then
		for i, v in pairs(abilities) do
			if v and v.ability and v.ability == name then return v, i end
		end
	end
end

function ATT:GetUnitByGUID(guid)
	for k,v in pairs(validUnits) do
		if UnitGUID(k) == guid then
			return k
		end
	end
end

function ATT:ValidUnit(unit)
	for k,v in pairs(validUnits) do
		if k == unit then
			return k
		end 			
	end
end
   
function ATT:StartCooldown(spellName, unit, SentID)
    if not unit then return end
    local petunit = unit
    local index = match(unit, "party[pet]*([1-4])")
    if unit == "player" or unit == "pet" then
        if(not db.showSelf ) then return end
        unit = "player"
        index = 5
    elseif index then
        unit = "party"..index end
    local anchor = anchors[tonumber(index)]
    if not anchor or not index then return end
    local _,class = UnitClass(unit)
    local spec = self:GetSpecByUnit(unit)
    local racecheck = self:FindAbilityByName(dbRacial, SentID)
    if spellName == Adapted then spellName = AdaptedName end
    self:TrackCooldown(anchor, spellName, SentID, unit, spec, petunit)

    -- trinket racial fix
    if db.showRacial and (spellName == PvPTrinketName or spellName == AdaptedName) then
        local _, _, race = UnitRace(unit)
        local cooldown
        for k,icon in ipairs(anchor.icons) do
            if icon.ability and icon.race == race and icon.excluded then
                if (icon.ability == EveryMan) then cooldown = 90 
                else duration = icon.starttime + icon.cooldown - GetTime()
                    if duration and duration < 30  then cooldown = 30   end
                end
           if cooldown then CooldownFrame_Set(icon.cd,GetTime(), cooldown ,1) end
            end
        end
    end
    
    if racecheck and racecheck.cdshare then
        local cooldown
        for k,icon in ipairs(anchor.icons) do
            if icon.ability == PvPTrinketName then
                if (spellName == EveryMan) then cooldown = 90
                else duration = icon.starttime + icon.cooldown - GetTime()
                    if duration and duration < 30  then cooldown = 30 end
                end
       if cooldown then CooldownFrame_Set(icon.cd,GetTime(), cooldown ,1) ; icon.itprocent = nil end
            elseif icon.ability == RelentlessName then
                if (spellName == EveryMan) then cooldown = 90
                else cooldown = 120  end
                if cooldown then CooldownFrame_Set(icon.cd,GetTime(), cooldown ,1)  end
            end
        end
    end
end

function ATT:TrackCooldown(anchor, ability, SentID, unit, spec, petunit)
    local dbInspect = dbInspect[unit]
    local rate = nil
    local Glimpse = nil

    for k,icon in ipairs(anchor.icons) do
        if icon.cooldown then
            local cooldown = icon.cooldown
            -- Direct cooldown
            if icon.ability == ability and icon.spellStatus ~= "DISABLED" then
                if not icon.excluded then
                    local Glimpse = select(16, AuraUtil.FindAuraByName(GlimpseName, unit))
                    local ITprocent = select(16, AuraUtil.FindAuraByName(IFName, unit))
                    if Glimpse then cooldown = cooldown - 3 end
                    if ITprocent and ITprocent > 0 and not icon.itprocent then rate = 100 / (100 + ITprocent) ; cooldown = cooldown * rate ; icon.itprocent = ITprocent end end
                    if ability == AdaptedName then cooldown = select(5, AuraUtil.FindAuraByName(Adapted, unit, "HARMFUL")) - 1; end --adapt fix
                icon.seen = true
                icon.Start(cooldown, 1, rate)
                icon.flashAnim:Play()
                icon.newitemglowAnim:Play()
            end
        end
        local creduce = self:FindAbilityByName(dbReduce, SentID)
        if creduce and (self:FindAbilityByName(dbInspect, creduce.tid) or creduce.tid2 == 1) then
            for i = 1,3 do
                local reducecd = nil 
                if (type(creduce.mod) == "table" and icon.abilityID == creduce.mod[i]) then
                    local reducecd = creduce.rcooldown
                    if not self:FindAbilityByName(dbInspect, creduce.tid) then reducecd = creduce.rcooldown2 end
                    if creduce.mod[i] == 42650 then reducecd = 5 end
                    if icon.active and icon.cooldown > 0 and icon.starttime > 0 and reducecd then
                        if icon.itprocent then rate = 100 / (100 + icon.itprocent) end
                        icon.starttime = icon.starttime - reducecd * (rate or 1)
                        CooldownFrame_Set(icon.cd,icon.starttime,icon.cooldown ,1,1, rate)
                    end
                end
            end 
         end

        local power = GetSpellPowerCost(SentID)
        if SentID == 209785 then power[1] = { ["name"] = "HOLY_POWER", ["cost"] = -1 } end
        if SentID == 2098 then power[1] = { ["name"] = "COMBO_POINTS" } end
        if power and power[1] and petunit ~= "pet" then
            local pcheck = self:FindAbilityByName(dbReduce, spec)  
            if pcheck and (self:FindAbilityByName(dbInspect, pcheck.tid) or pcheck.tid2 == 1) then 
               for i = 1,8 do 
               local reducecd = nil
                if (type(pcheck.mod) == "table" and icon.abilityID == pcheck.mod[i]) then
                if not self:FindAbilityByName(dbInspect, pcheck.tid) then pcheck.crd = pcheck.crd2 end
                    if power[1].name == "HOLY_POWER" then reducecd = power[1].cost*pcheck.crd end
                    if power[1].name == "FOCUS" then reducecd = power[1].cost/pcheck.crd  end
                    if power[1].name == "CHI" and tonumber(icon.chargesText:GetText():match("^[0-9]+$")) <= 1 then reducecd = power[1].cost/pcheck.crd end
                    if power[1].name == "COMBO_POINTS" then reducecd = dbInspect[43].cpower/pcheck.crd end
                    if power[1].name == "RAGE" then reducecd = power[1].cost/pcheck.crd end
                    if power[1].name == "RUNES" then reducecd = power[1].cost/pcheck.crd end
                    if icon.active and icon.cooldown > 0 and icon.starttime > 0 and reducecd then
                        if icon.itprocent then rate = 100 / (100 + icon.itprocent) end
                        icon.starttime = icon.starttime - reducecd * (rate or 1)
                        CooldownFrame_Set(icon.cd,icon.starttime,icon.cooldown ,1,1, rate) end
                end
            end
        end  
      end
    if  (spec == 260 or spec == 261) then
	C_Timer.After(0.05, function() local powerunit = UnitPower(unit,4) dbInspect[43].cpower = powerunit end)
	 end 
        -- Cooldown resetters
        if cooldownResetters[ability] then
            if type(cooldownResetters[ability]) == "table" then
                if cooldownResetters[ability][icon.ability] then icon.Stop() end
            else
                icon.Stop()
            end
        end
    end
end


function ATT:TrackIT(spellName, unit, SentID, event)
    if not unit then return end
    local index = match(unit, "party[pet]*([1-4])")
    if unit == "player" or unit == "pet" then
        if(not db.showSelf ) then return end
        unit = "player"
        index = 5
    elseif index then
        unit = "party"..index end
    local anchor = anchors[tonumber(index)]
    if not anchor or not index then return end
    local ITprocent = select(16, AuraUtil.FindAuraByName(IFName, unit))
    for k,icon in ipairs(anchor.icons) do
      if not icon.excluded and icon.spellStatus ~= "DISABLED" then
      if icon.cd and icon.active and (event == "SPELL_AURA_APPLIED") and not icon.itprocent and ITprocent and ITprocent > 0 then
            local rate = 100 / (100 + ITprocent)
            local start = GetTime() * (1 - rate) + icon.starttime * rate
            local cd = icon.cooldown * rate
            CooldownFrame_Set(icon.cd,start,cd ,1,1,rate < 1 and rate)
            icon.starttime = start
            icon.cooldown = cd
            icon.itprocent = ITprocent
        elseif (event == "SPELL_AURA_REMOVED") and icon.itprocent then
            local rate = 1 / (100 / (100 + icon.itprocent))
            local start = GetTime() * (1 - rate) + icon.starttime * rate
            local cd = icon.cooldown * rate
            CooldownFrame_Set(icon.cd,start,cd ,1,1,rate < 1 and rate)
            icon.starttime = start
            icon.cooldown = cd
            icon.itprocent = nil
        end    
        end
    end
end

function ATT:IconGlow(unit, destUnit, spellName, event)
	if not unit then return end 
	local auraunit = unit
	if unit ~= destUnit then auraunit = destUnit end
	local index = match(unit, "party[pet]*([1-4])")
	if unit == "player" or unit == "pet" then
	if(not db.showSelf ) then return end
		unit = "player"
		index = 5
	elseif index then
		unit = "party"..index end
	local anchor = anchors[tonumber(index)]
	if not anchor or not index then return end
--if spellName == PvPTrinketName then return end -- blizz bugged spell
    local duration = select(5,AuraUtil.FindAuraByName(spellName, auraunit))
    for k,icon in ipairs(anchor.icons) do
     if spellName == icon.ability then
       local chargetxt = tonumber(icon.chargesText:GetText())
	   if icon.cooldown and duration and duration > 1 and (event == "SPELL_AURA_APPLIED") then
	    icon.cd:SetHideCountdownNumbers(true)
      C_Timer.After(0.05, function()  icon.cd:SetHideCountdownNumbers(true); LGlow.ShowOverlayGlow(icon.cd)  end)
      C_Timer.After(duration , function() LGlow.HideOverlayGlow(icon.cd); if (not icon.maxcharges) or chargetxt == 0 then icon.cd:SetHideCountdownNumbers(false) end end)
      elseif (event == "SPELL_AURA_REMOVED") and icon.cooldown and not duration then 
        LGlow.HideOverlayGlow(icon.cd) 
      if (not icon.maxcharges) or chargetxt == 0 then icon.cd:SetHideCountdownNumbers(false) end
	   end 
    end
  end
end


function ATT:COMBAT_LOG_EVENT_UNFILTERED()
    if not self:IsShown() then return end
    local _, event, _, sourceGUID, sourceName, _, _, destGUID, destName, _, _, SentID, spellName, _, auraType,amount = CombatLogGetCurrentEventInfo() 
    if SentID == 277179 then spellName = GetItemInfo(165055) end -- blizz bugged spellname overlap
    if self:GetUnitByGUID(sourceGUID) and ((event == "SPELL_CAST_SUCCESS") or ((event == "SPELL_AURA_APPLIED") and (spellName == Stoneform or spellName == Fireblood or spellName == Safeguard))) then
	   self:StartCooldown(spellName, self:GetUnitByGUID(sourceGUID), SentID)
    end
     if self:GetUnitByGUID(sourceGUID) and (spellName == Adapted) and ((event == "SPELL_AURA_APPLIED") or (event == "SPELL_AURA_REFRESH"))  then
	   C_Timer.After(0.1, function() self:StartCooldown(spellName, self:GetUnitByGUID(sourceGUID), SentID) end)
    end	
    if self:GetUnitByGUID(sourceGUID) and SentID == 316801 and ((event == "SPELL_AURA_REMOVED") or (event == "SPELL_AURA_APPLIED")) then
    self:TrackIT(spellName, self:GetUnitByGUID(sourceGUID), SentID, event, spellName) 
    end
    if self:GetUnitByGUID(sourceGUID) and ((event == "SPELL_AURA_REMOVED") and (auraType == "BUFF")) then
        if SentID == 209785 then self:StartCooldown(spellName, self:GetUnitByGUID(sourceGUID), SentID) end
    end      
	if db.glow and self:GetUnitByGUID(destGUID) and self:GetUnitByGUID(sourceGUID) and ((event == "SPELL_AURA_REMOVED") or (event == "SPELL_AURA_APPLIED")) and (auraType == "BUFF")  then 
     self:IconGlow(self:GetUnitByGUID(sourceGUID), self:GetUnitByGUID(destGUID),spellName, event); 
	end 
end

local timers, timerfuncs, timerargs = {}, {}, {}
function ATT:Schedule(duration,func,...)
	timers[#timers+1] = duration
	timerfuncs[#timerfuncs+1] = func
	timerargs[#timerargs+1] = {...}
end

local time = 0

local function ATT_OnUpdate(self,elapsed)
    if not self:IsShown() then return end
	time = time + elapsed
	if time > 0.05 then
		-- Inspection stuff:
		ATT:ProcessInspectQueue()
		--  Update icon activity
		for k,icon in ipairs(iconlist) do	   
			if icon.active and icon.cooldown then
				icon.timeleft = icon.starttime + icon.cooldown - GetTime()
				if icon.timeleft <= 0 then
					if not icon.showing then icon:Hide() end
					icon.active = nil
					if icon.maxcharges then
						local charges = tonumber(icon.chargesText:GetText():match("^[0-9]+$"))
						charges = math.min(icon.maxcharges, charges+1)
						icon.chargesText:SetText(charges)
						if charges < icon.maxcharges then
							icon.Start(icon.cooldown, 5)
						end
					end
				end
			end 
		end		
		if db.hidden then ATT:UpdateIcons() end
		 -- Update Timers
		if #timers > 0 then
			for i=#timers,1,-1 do 
				timers[i] = timers[i] - 0.05
				if timers[i] <= 0 then
					remove(timers,i)
					remove(timerfuncs,i)(ATT,unpack(remove(timerargs,i)))
				end
			end
		end	
		time = 0
	end 
end

-- resets all icons on zone change
function ATT:StopAllIcons()
	for k,v in ipairs(iconlist) do
		v.Stop()
		v.seen = nil
	end
	wipe(activeGUIDS)
end

function ATT:SendUpdate()
    if self.useCrossAddonCommunication and IsInGroup() and GetNumGroupMembers() > 2 then 
	  C_ChatInfo.SendAddonMessage(ChatPrefix, "Version|"..ATTversion, "INSTANCE_CHAT" or "RAID" or "PARTY") 
	end
end

function ATT:CHAT_MSG_ADDON(prefix, message, dist, sender)
    if prefix == ChatPrefix then
        local vfound, vversion = match(message,"(.+)|(%A+)")
        if vversion then vversion = tonumber(string.sub(vversion,1,4)) end
        --[[ debug update note
        selfname = "Ize-Sylvanas"
        if vversion and vversion > 5 and selfname ~= sender then print("Sender: |cffFF4500"..sender.."|r Version: |cffFF4500"..vversion.."|r") end --]]
        if vversion and vversion > ATTversion and ATTnewversion == nil then ATTnewversion = message
            print("There is a new version of |cff33ff99Arena Team Tracker|r: |cffFF4500v"..vversion.."|r You are currently using: |cffFF4500v"..ATTversion.."|r")
        end
    end
end

function ATT:PLAYER_TALENT_UPDATE()
       ATT:UPDATEGROUP()
end

function ATT:PLAYER_EQUIPMENT_CHANGED(item)
      if InCombatLockdown() then return end 
      if not item then return end
      if (item ~= 13) and (item ~= 14) then return end 
      ATT:UPDATEGROUP()
end

function ATT:PLAYER_FLAGS_CHANGED(unit)
   if not self:IsShown() then return end
   if UnitIsDeadOrGhost(unit) then return end
   if InCombatLockdown() then return end
   local unit = ATT:ValidUnit(unit)  
   if not unit then return end
   local dbInspect = dbInspect[unit]
   if dbInspect and dbInspect[42].warmode == UnitIsWarModeDesired(unit) then return end
    ATT:UPDATEGROUP()
end

function ATT:PLAYER_SPECIALIZATION_CHANGED(unit)
  local unit = ATT:ValidUnit(unit)  
  if not unit then return end
  ATT:UPDATEGROUP() 
end

local function ATT_OnLoad(self) 
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("GROUP_ROSTER_UPDATE")
    self:RegisterEvent("INSPECT_READY") 
    self:RegisterEvent("PLAYER_TALENT_UPDATE")
    self:RegisterEvent("PLAYER_FLAGS_CHANGED")
    self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
    self:RegisterEvent("AZERITE_ESSENCE_ACTIVATED")
    self:RegisterEvent("AZERITE_ESSENCE_UPDATE")
    self:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
    self:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
    
    if C_ChatInfo.RegisterAddonMessagePrefix(ChatPrefix) then self.useCrossAddonCommunication = true end
	if self.useCrossAddonCommunication then self:RegisterEvent("CHAT_MSG_ADDON") end
	self:SetScript("OnEvent",function(self,event, ...) if self[event] then self[event](self, ...) end end);	
	ATTDB = ATTDB or { abilities = ATTdefaultAbilities, scale = 1, iconOffsetX = 5 , iconOffsetY = 2 , offsetX = 0, offsetY = 0, attach = 0, showSelf = true, outside = true, glow = true }
	db = ATTDB
    db.classSelected = "WARRIOR"
    
    if not tonumber(db.iconOffsetX or db.iconOffsetY or db.offsetX or db.offsetY) then 
    db.iconOffsetX = 5 ; db.iconOffsetY = 2 ; db.offsetX = 0; db.offsetY = 0  end --upd 8.3+ fix
    if db.attach == true then db.attach = 1 elseif db.attach == false then db.attach = 0 end
    
	self:CreateAnchors()
	self:UpdateAnchors()
	self:LoadPositions()
	self:CreateOptions()
	self:UpdateScrollBar()
   	self:SetScript("OnUpdate",ATT_OnUpdate)
   	if _G["ElvUF_Party"] then _G["ElvUF_Party"]:Show() end 
   	C_Timer.After(0.2, function() self:UpdateAnchors(); self:LoadPositions() end)

	print("|cff33ff99A|rrena |cff33ff99T|ream |cff33ff99T|rracker by |cff33ff99Izy|r. Type |cffFF4500/att|r to open options.")
end

function ATT:FindAbilityIcon(ability, id)
	local icon;
	if id then
		icon = GetSpellTexture(id)
	else
		icon = GetSpellTexture(self:FindAbilityID(ability))
	end
	return icon
end

function ATT:FindAbilityID(ability)
	for _,S in pairs(SPELLDB) do
		for _,v in pairs(S) do
			for _,sp in pairs(v) do
				for _,SPELLID in pairs(sp) do
					local spellName, spellRank, spellIcon = GetSpellInfo(SPELLID)
					if(spellName == ability) then
						return SPELLID
					end
				end
			end
		end
	end
end

function ATT:FormatAbility(s)
--[[locale = GetLocale();
    if (GetLocale() == "enGB") or (GetLocale() == "enUS") then
	s = s:gsub("(%a)(%a*)('*)(%a*)", function (a,b,c,d) return a:upper()..b:lower()..c..d:lower() end)
--]]
 return s
end

-------------------------------------------------------------
-- Panel
-------------------------------------------------------------

local SO = LibStub("LibSimpleOptions-1.01")

local function CreateListButton(parent,index)
	local button = CreateFrame("Button",parent:GetName()..index,parent)
	--button:SetWidth(196)
	button:SetWidth(217)
	button:SetHeight(25)
	local font = CreateFont("ATTListFont")
	font:SetFont(GameFontNormal:GetFont(),12)
	font:SetJustifyH("LEFT")
	button:SetNormalFontObject(font)
	button:SetHighlightTexture("Interface\\ContainerFrame\\UI-Icon-QuestBorder")
	button:GetHighlightTexture():SetTexCoord(0.11,0.88,0.02,0.97)
	button:SetScript("OnClick",function(self) parent.currentButton = self:GetText(); ATT:UpdateScrollBar() end)
	return button
end

local function ListImport(parent,child,index,ability,id,cooldown)
	local button = CreateFrame("Button",parent:GetName()..index,parent)
	button:SetWidth(215)
	button:SetHeight(25)
	local font = CreateFont("ATTListFont")
	font:SetFont(GameFontNormal:GetFont(),12)
	font:SetJustifyH("LEFT")
	button:SetNormalFontObject(font)
	button:SetHighlightTexture("Interface\\ContainerFrame\\UI-Icon-QuestBorder")
	button:GetHighlightTexture():SetTexCoord(0.11,0.88,0.02,0.97)
	button:SetScript("OnClick",function(self) parent.currentButton = self:GetText();
	child.addeditbox:SetText(ability); 
	child.ideditbox:SetText(id or "")
	child.cdeditbox:SetText(cooldown or "")
	iFrame:Hide(); return end)
	return button
end

local function CreateEditBox(name,parent,width,height)
	local editbox = CreateFrame("EditBox",parent:GetName()..name,parent,"InputBoxTemplate")
	editbox:SetHeight(height)
	editbox:SetWidth(width)
	editbox:SetAutoFocus(false)	
	local label = editbox:CreateFontString(nil, "BACKGROUND", "GameFontNormal")
	label:SetText(name)
	label:SetPoint("BOTTOMLEFT", editbox, "TOPLEFT",-3,0)
	return editbox
end

function ATT:CreateOptions()
	local panel = SO.AddOptionsPanel("Arena Team Tracker", function() end)
	self.panel = panel
	SO.AddSlashCommand("Arena Team Tracker","/att")
	local title, subText = panel:MakeTitleTextAndSubText("Arena Team Tracker","General settings")

	local attach = panel:MakeDropDown(
       'name', ' Attach to raid frames',
	     'description', 'Select the UI you want\nto attach the frames',
	     'values', {
		     		0, "Do Not Attach",
					1, "Auto Select (UI)",
					2, "Blizzard Only",
	      },
	     'default', 0,
	     'current', tonumber(db.attach) or 0,
	     'setFunc', function(value) db.attach = tonumber(string.format("%.1d",value)); ATT:LoadPositions(); ATT:ApplyAnchorSettings() end)
	attach:SetPoint("TOPLEFT",panel,"TOPLEFT",5,-80)

	local scale = panel:MakeSlider(
	     'name', 'Scale',
	     'description', 'Adjust the scale of icons',
	     'minText', 'Min',
	     'maxText', 'Max',
	     'minValue', 0.1,
	     'maxValue', 5,
	     'step', 0.1,
	     'default', 1,
	     'current', tonumber(db.scale) or 1,
	     'setFunc', function(value) db.scale = tonumber(string.format("%.1f",value)); ATT:ApplyAnchorSettings() end,
	     'currentTextFunc', function(value) return tonumber(string.format("%.1f",value)) end)
	scale:SetPoint("TOPLEFT",attach,"TOPLEFT", 20, -50)
	
	local growLeft = panel:MakeToggle(
	     'name', 'Grow Left',
	     'description', 'Grow icons to the left',
	     'default', false,
	     'getFunc', function() return db.growLeft end,
	     'setFunc', function(value) db.growLeft = value; ATT:LoadPositions(); ATT:ApplyAnchorSettings() end)
	growLeft:SetPoint("TOP",panel,"TOP",-110,-45) 

	local tworows = panel:MakeToggle(
	     'name', 'Two rows',
	     'description', 'Show icons on two rows',
	     'default', false,
	     'getFunc', function() return db.tworows end,
	     'setFunc', function(value) db.tworows = value; ATT:LoadPositions(); ATT:ApplyAnchorSettings() end)
	tworows:SetPoint("TOP",growLeft,"BOTTOM",0,-5)
	
	local horizontal = panel:MakeToggle(
	     'name', 'Horizontal',
	     'description', 'Show icons under raid frames\n(when using horizontal groups)',
	     'default', false,
	     'getFunc', function() return db.horizontal end,
	     'setFunc', function(value) db.horizontal = value; ATT:LoadPositions(); ATT:ApplyAnchorSettings() end)
	horizontal:SetPoint("TOP",tworows,"BOTTOM",0,-5)
	
	local biggroup = panel:MakeToggle(
	     'name', 'Max 5 Man',
	     'description', 'Hide ATT frames if group\nhas more than 5 members',
	     'default', false,
	     'getFunc', function() return db.biggroup end,
	     'setFunc', function(value) db.biggroup = value; ATT:LoadPositions(); ATT:ApplyAnchorSettings() end)
    biggroup:SetPoint("TOP",horizontal,"BOTTOM",0,-5)
	
	local offsetX = panel:MakeSlider(
	     'name', 'Offset X',
	     'description', 'Adjust the anchor position X',
	     'minText', 'Left',
	     'maxText', 'Right',
	     'minValue', -100,
	     'maxValue', 100,
	     'step', 1,
	     'default', 0,
	     'current', tonumber(db.offsetX) or 0,
	     'setFunc', function(value) db.offsetX = tonumber(string.format("%.1d",value)); ATT:LoadPositions(); ATT:ApplyAnchorSettings() end,
	     'currentTextFunc', function(value) return tonumber(string.format("%.1d",value)); end)
	offsetX:SetPoint("TOPLEFT",scale,"TOPLEFT", 0, -45)
	
		local offsetY = panel:MakeSlider(
	     'name', 'Offset Y',
	     'description', 'Adjust the anchor position Y',
	     'minText', 'Down',
	     'maxText', 'Up',
	     'minValue', -100,
	     'maxValue', 100,
	     'step', 1,
	     'default', 0,
	     'current', tonumber(db.offsetY) or 0,
	     'setFunc', function(value) db.offsetY = tonumber(string.format("%.1d",value)); ATT:LoadPositions(); ATT:ApplyAnchorSettings() end,
	     'currentTextFunc', function(value) return tonumber(string.format("%.1d",value)); end)
	offsetY:SetPoint("LEFT", offsetX, "RIGHT", 15, 0)
		
	 local iconOffsetX = panel:MakeSlider(
	     'name', 'Icon X',
	     'description', 'Adjust the space between icons',
	     'minText', '0',
	     'maxText', '100',
	     'minValue', 0,
	     'maxValue', 100,
	     'step', 1,
	     'default', 5,
	     'current', tonumber(db.iconOffsetX) or 5,
	     'setFunc', function(value) db.iconOffsetX = tonumber(string.format("%.1d",value));  ATT:LoadPositions(); ATT:ApplyAnchorSettings() end,
	     'currentTextFunc', function(value) return tonumber(string.format("%.1d",value)); end)
	iconOffsetX:SetPoint("LEFT", offsetY, "RIGHT", 15, 0)
	
	 local iconOffsetY = panel:MakeSlider(
	     'name', 'Icon Y',
	     'description', 'Adjust the space between rows',
	     'minText', '0',
	     'maxText', '100',
	     'minValue', 0,
	     'maxValue', 100,
	     'step', 1,
	     'default', 2,
	     'current', tonumber(db.iconOffsetY) or 2,
	     'setFunc', function(value) db.iconOffsetY = tonumber(string.format("%.1d",value)); ATT:LoadPositions(); ATT:ApplyAnchorSettings() end,
	     'currentTextFunc', function(value) return tonumber(string.format("%.1d",value)); end)
	iconOffsetY:SetPoint("LEFT", iconOffsetX, "RIGHT", 15, 0)
	
	local lock = panel:MakeToggle(
	     'name', 'Lock',
	     'description', 'Hide/Show anchors',
	     'default', false,
	     'getFunc', function() return db.lock end,
	     'setFunc', function(value) db.lock = value; ATT:ApplyAnchorSettings() end)
	lock:SetPoint("TOP",panel,"TOP",10,-45)
	
	local hidden = panel:MakeToggle(
	     'name', 'Hidden',
	     'description', 'Show icons only when\nthey are on cooldown',
	     'default', false,
	     'getFunc', function() return db.hidden end,
	     'setFunc', function(value) db.hidden = value;ATT:LoadPositions(); ATT:ApplyAnchorSettings(); ATT:UpdateAnchors() end)
	hidden:SetPoint("TOP",lock,"BOTTOM",0,-5)

	local glow = panel:MakeToggle(
	     'name', 'Glow Icons',
	     'description', 'Glow icons blizzard style\nwhen ability is active',
	     'default', true,
	     'getFunc', function() return db.glow end,
	     'setFunc', function(value) db.glow = value; ATT:LoadPositions(); ATT:ApplyAnchorSettings(); ATT:UpdateAnchors()end)
	glow:SetPoint("TOP",hidden,"BOTTOM",0,-5)
	
	local showIconBorders = panel:MakeToggle(
	     'name', 'Draw borders',
	     'description', 'Draw borders around icons',
	     'default', true,
	     'getFunc', function() return db.showIconBorders end,
	     'setFunc', function(value) db.showIconBorders = value; ATT:LoadPositions(); ATT:ApplyAnchorSettings()  end)
	showIconBorders:SetPoint("TOP",glow,"BOTTOM",0,-5)
	
	local arena = panel:MakeToggle(
	     'name', 'Arena',
	     'description', 'Enable icons in Arena',
	     'default', false,
	     'getFunc', function() return db.arena end,
	     'setFunc', function(value) db.arena = value;ATT:LoadPositions(); ATT:ApplyAnchorSettings(); ATT:UpdateAnchors() end)
	arena:SetPoint("TOPLEFT",panel,"TOPLEFT",85,-207)
	
	local dungeons = panel:MakeToggle(
	     'name', 'Dungeons',
	     'description', 'Enable icons in Dungeons',
	     'default', false,
	     'getFunc', function() return db.dungeons end,
	     'setFunc', function(value) db.dungeons = value;ATT:LoadPositions(); ATT:ApplyAnchorSettings(); ATT:UpdateAnchors() end)
	dungeons:SetPoint("LEFT",arena,"RIGHT",60,0)
	
	local scenarios = panel:MakeToggle(
	     'name', 'Scenarios',
	     'description', 'Enable icons in Scenarios',
	     'default', false,
	     'getFunc', function() return db.scenarios end,
	     'setFunc', function(value) db.scenarios = value;ATT:LoadPositions(); ATT:ApplyAnchorSettings(); ATT:UpdateAnchors() end)
	scenarios:SetPoint("LEFT",dungeons,"RIGHT",85,0)
	
	local inraid = panel:MakeToggle(
	     'name', 'Raid/Bg',
	     'description', 'Enable icons in Raid / BGs\n(only works for your group)',
	     'default', false,
	     'getFunc', function() return db.inraid end,
	     'setFunc', function(value) db.inraid = value;ATT:LoadPositions(); ATT:ApplyAnchorSettings(); ATT:UpdateAnchors() end)
	inraid:SetPoint("LEFT",scenarios,"RIGHT",80,0)
	
	local outside = panel:MakeToggle(
	     'name', 'Outside World',
	     'description', 'Enable icons in Outside World',
	     'default', false,
	     'getFunc', function() return db.outside end,
	     'setFunc', function(value) db.outside = value;ATT:LoadPositions(); ATT:ApplyAnchorSettings(); ATT:UpdateAnchors() end)
	outside:SetPoint("LEFT",inraid,"RIGHT",70,0)		

	local showTrinket = panel:MakeToggle(
	     'name', 'Show PvP Trinket',
	     'description', 'Show PvP Trinket',
	     'default', false,
	     'getFunc', function() return db.showTrinket end,
	     'setFunc', function(value) db.showTrinket = value; ATT:LoadPositions();ATT:ApplyAnchorSettings(); ATT:UPDATEGROUP() end)
	showTrinket:SetPoint("LEFT",lock,"RIGHT",90,0)
	
   local showRacial = panel:MakeToggle(
	     'name', 'Show Racial',
	     'description', 'Show Racial icons',
	     'default', false,
	     'getFunc', function() return db.showRacial end,
	     'setFunc', function(value) db.showRacial = value; ATT:LoadPositions(); ATT:ApplyAnchorSettings(); ATT:UPDATEGROUP() end)
	showRacial:SetPoint("TOP",showTrinket,"BOTTOM",0,-5)

	local showSelf = panel:MakeToggle(
	     'name', 'Show Self',
	     'description', 'Show your own icons',
	     'default', false,
	     'getFunc', function() return db.showSelf end,
	     'setFunc', function(value) db.showSelf = value; ATT:LoadPositions(); ATT:ApplyAnchorSettings(); ATT:UpdateAnchors() end)
	showSelf:SetPoint("TOP",showRacial,"BOTTOM",0,-5)

	local showTooltip = panel:MakeToggle(
	     'name', 'Show Tooltip',
	     'description', 'Show tooltips over icons',
	     'default', false,
	     'getFunc', function() return db.showTooltip end,
	     'setFunc', function(value) db.showTooltip = value; end)
	showTooltip:SetPoint("TOP",showSelf,"BOTTOM",0,-5)
	
	self:CreateAbilityEditor()
	
    local title2, subText2 = panel:MakeTitleTextAndSubText("","Enable in:")
	title2:ClearAllPoints()
	title2:SetPoint("TOPLEFT",panel,"TOPLEFT",20,-205)
	
	local title2, subText2 = panel:MakeTitleTextAndSubText("","Show (if equpied):")
	title2:ClearAllPoints()
	title2:SetPoint("TOPLEFT",panel,"TOPLEFT",20,-450)

 	--[[   local malealert = panel:MakeToggle(
	  'name', '|T 237377:18|t MaleAlert',
	  'description', 'Alert when enemy used Maledict Trinket in arena',
	  'default', true,
	  'getFunc', function() return db.malealert end,
	  'setFunc', function(value) db.malealert = value; ATT:LoadPositions() ;ATT:ApplyAnchorSettings(); ATT:UpdateAnchors(); end)
	malealert:SetPoint("TOPLEFT",panel,"TOPLEFT",65,-470) --]]
	
	 local spite = panel:MakeToggle(
	  'name', '|T 1362661:18|t Spite',
	  'description', 'Corrupted Gladiators Spite',
	  'default', false,
	  'getFunc', function() return db.spite end,
	  'setFunc', function(value) db.spite = value; ATT:LoadPositions() ;ATT:ApplyAnchorSettings(); ATT:UPDATEGROUP() end)
	spite:SetPoint("TOPLEFT",panel,"TOPLEFT",10,-478)
	
	local breach = panel:MakeToggle(
	  'name', '|T 2000856:18|t Breach',
	  'description', 'Corrupted Gladiators Breach',
	  'default', false,
	  'getFunc', function() return db.breach end,
	  'setFunc', function(value) db.breach = value; ATT:LoadPositions() ;ATT:ApplyAnchorSettings(); ATT:UPDATEGROUP() end)
	breach:SetPoint("LEFT",spite,"RIGHT",80,0)
	
	 local maledict = panel:MakeToggle(
	  'name', '|T 1028995:18|t Maledict',
	  'description', 'Corrupted Gladiators Maledict',
	  'default', false,
	  'getFunc', function() return db.maledict end,
	  'setFunc', function(value) db.maledict = value; ATT:LoadPositions() ;ATT:ApplyAnchorSettings(); ATT:UPDATEGROUP() end)
	maledict:SetPoint("LEFT",breach,"RIGHT",80,0)
	
	local safeguard = panel:MakeToggle(
	  'name', '|T 1028988:18|t Safeguard',
	  'description', 'Corrupted Gladiators Safeguard',
	  'default', false,
	  'getFunc', function() return db.safeguard end,
	  'setFunc', function(value) db.safeguard = value; ATT:LoadPositions() ;ATT:ApplyAnchorSettings(); ATT:UPDATEGROUP() end)
	safeguard:SetPoint("LEFT",maledict,"RIGHT",100,0)
	
	local dampening = panel:MakeToggle(
	     'name', '|T 236395:18|t Dampening',
	     'description', 'Show dampening procent ( % )\nunder remaining time in arena',
	     'default', false,
	     'getFunc', function() return db.dampening end,
	     'setFunc', function(value) db.dampening = value; ATT:ApplyAnchorSettings(); ATT:UPDATEGROUP() end)
	dampening:SetPoint("LEFT",safeguard,"RIGHT",110,0)
	
	local claw = panel:MakeToggle(
	     'name', '|T 1508487:18|t Claw',
	     'description', 'Forbidden Obsidian Claw',
	     'default', false,
	     'getFunc', function() return db.claw end,
	     'setFunc', function(value) db.claw = value; ATT:ApplyAnchorSettings(); ATT:UPDATEGROUP() end)
	claw:SetPoint("TOPLEFT",panel,"TOPLEFT",10,-498)
	
	local badge = panel:MakeToggle(
	     'name', '|T 135884:18|t Badge',
	     'description', 'Corrupted Gladiators Badge',
	     'default', false,
	     'getFunc', function() return db.badge end,
	     'setFunc', function(value) db.badge = value; ATT:ApplyAnchorSettings(); ATT:UPDATEGROUP() end)
   badge:SetPoint("LEFT",claw,"RIGHT",80,0)
	
   local medallion = panel:MakeToggle(
	     'name', '|T 252267:18|t Medallion',
	     'description', 'Corrupted Gladiators Medallion',
	     'default', false,
	     'getFunc', function() return db.medallion end,
	     'setFunc', function(value) db.medallion = value; ATT:ApplyAnchorSettings(); ATT:UPDATEGROUP() end)
   medallion:SetPoint("LEFT",badge,"RIGHT",80,0)
   
   	local writhing = panel:MakeToggle(
	     'name', '|T 298654:18|t Writhing',
	     'description', 'Writhing Segment of Drestagath',
	     'default', false,
	     'getFunc', function() return db.writhing end,
	     'setFunc', function(value) db.writhing = value; ATT:ApplyAnchorSettings(); ATT:UPDATEGROUP() end)
   writhing:SetPoint("LEFT",medallion,"RIGHT",100,0)
   
   local voodoo = panel:MakeToggle(
	     'name', '|T 538571:18|t Voodoo',
	     'description', 'Revitalizing Voodoo Totem',
	     'default', false,
	     'getFunc', function() return db.voodoo end,
	     'setFunc', function(value) db.voodoo = value; ATT:ApplyAnchorSettings(); ATT:UPDATEGROUP() end)
   voodoo:SetPoint("LEFT",writhing,"RIGHT",110,0)
	
	local cpanel = CreateFrame("Frame" ,"ATTFrame" , panel )
    cpanel:SetBackdrop( { edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 15});
	cpanel:SetSize(610,220)
	cpanel:SetPoint("TOP",panel,"TOP",0,-235)
	
	local cpanel2 = CreateFrame("Frame" ,"ATTFrame" , panel )
    cpanel2:SetBackdrop( { edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 15});
	cpanel2:SetSize(610,50)
	cpanel2:SetPoint("TOP",panel,"TOP",0,-475)
	
    local legend = CreateFrame("Frame" ,"ATTFrame" , panel )
    legend:SetBackdrop( { edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 15});
	legend:SetSize(610,28)
	legend:SetPoint("TOP",panel,"TOP",0,-206)
	
    local authordesc =  panel:CreateFontString(nil,"ARTWORK","GameFontDisable")
    authordesc:SetText("|cffffff00Version:|r |cff33ff99v"..ATTversion.."|r by |cffffff00izy|r  ( Contact: ize @ Sylvanas EU - |cff33ff99twitch.tv/imedia|r )")
   	authordesc:SetJustifyH("LEFT")
   authordesc:SetSize(600,40)
   authordesc:SetPoint("TOP",panel,"TOP",0,-525)
end

local function count(t) local i = 0 for k,v in pairs(t) do i = i + 1  end return i end

function ATT:UpdateScrollBar()
	local btns = self.btns
	local scrollframe = self.scrollframe
	local classSelectedSpecs = db.abilities[db.classSelected] 
	local line = 1
	
	for specID, abilities in pairs(classSelectedSpecs) do
		for abilityIndex, abilityTable in pairs(abilities) do
			local ability, id, cooldown, maxcharges, talent, spellStatus = abilityTable.ability, abilityTable.id, abilityTable.cooldown, abilityTable.maxcharges, abilityTable.talent, abilityTable.spellStatus
			local order = abilityTable.order or 1
			if specID ~= "ALL" then
			_, _, _, spectexture = GetSpecializationInfoByID(specID)
            else
            spectexture  =  "Interface\\Icons\\ClassIcon_"..db.classSelected             end
		    abilitytexture = self:FindAbilityIcon(ability, id)
			if spellStatus ~= "DISABLED" then
			    btns[line]:SetText("   |T"..spectexture..":18|t - |T"..abilitytexture..":17|t " ..ability)
			else
			    btns[line]:SetText("   |T"..spectexture..":18|t - |cff808080|T"..abilitytexture..":17|t " ..ability.."|r")
			end     
			if btns[line]:GetText() ~= scrollframe.currentButton then
				btns[line]:SetNormalTexture("")
			else 
				btns[line]:SetNormalTexture("Interface\\ContainerFrame\\UI-Icon-QuestBorder")
				btns[line]:GetNormalTexture():SetTexCoord(0.11,0.88,0.02,0.97)
				btns[line]:GetNormalTexture():SetBlendMode("ADD") 
				scrollframe.addeditbox:SetText(ability)
				scrollframe.ideditbox:SetText(id or "")
				scrollframe.cdeditbox:SetText(cooldown or "")
				scrollframe.order:SetValue(tostring(order or 1))
				scrollframe.spellStatusbox.initialize()
				scrollframe.spellStatusbox:SetValue(tostring(spellStatus or "ENABLED"))
	     		scrollframe.dropdown2.initialize()
	     		scrollframe.dropdown2:SetValue(tostring(specID))
			end 
			
			btns[line]:Show()
			line = line + 1
		end 
	end 			
	 for i=line,25 do btns[i]:Hide() end
end

function ATT:CreateAbilityEditor()
	local panel = self.panel
	local btns = {}
	self.btns = btns
	local scrollframe = CreateFrame("ScrollFrame", "ATTScrollFrame",panel,"UIPanelScrollFrameTemplate")
	local backdrop = {
	bgFile = [=[Interface\Buttons\WHITE8X8]=],
	insets = { left = 0, right = 0, top = -5, bottom = -5 }}
	scrollframe:SetBackdrop(backdrop)
	scrollframe:SetBackdropColor(0,0,0,0.50)
	local child = CreateFrame("ScrollFrame" ,"ATTScrollFrameChild" , scrollframe )
	child:SetSize(1, 1)
	scrollframe:SetScrollChild(child)
	local button1 = CreateListButton(child,"25")
	button1:SetPoint("TOPLEFT",child,"TOPLEFT",2,0)
	btns[#btns+1] = button1
	for i=2,25 do
		local button = CreateListButton(child,tostring(i))
		button:SetPoint("TOPLEFT",btns[#btns],"BOTTOMLEFT")
		btns[#btns+1] = button
	end
	
	scrollframe:SetScript("OnShow",function(self) if not db.classSelected then db.classSelected = "WARRIOR" end; ATT:UpdateScrollBar();  end)
	self.scrollframe = child
	scrollframe:SetSize(220,176)
	scrollframe:SetPoint('LEFT',16,-60)
	child.dropdown2 = nil  
   
	local dropdown = panel:MakeDropDown(
       'name', ' Class',
	     'description', 'Pick a class to edit abilities',
	     'values', {
		     		"WARRIOR", "Warrior",
					"DEATHKNIGHT", "Deathknight",
					"PALADIN", "Paladin",
					"PRIEST", "Priest",
					"SHAMAN", "Shaman",
					"DRUID", "Druid",
					"ROGUE", "Rogue",
					"MAGE", "Mage",
					"WARLOCK", "Warlock",
					"HUNTER", "Hunter",
					"MONK", "Monk",
					"DEMONHUNTER", "Demon Hunter",
	      },
	     'default', 'WARRIOR',
	     'getFunc', function() return db.classSelected end ,
	     'setFunc', function(value)
	     	db.classSelected = value; ATT:UpdateScrollBar();
	     	child.dropdown2.values = { "ALL", "All Specs" }
	     	for i=1, GetNumClasses() do
	     		local className, classTag, classID = GetClassInfo(i)
	     		if classTag == db.classSelected then
	     			for j=1, GetNumSpecializationsForClassID(classID) do
	     				local specID, specName = GetSpecializationInfoForClassID(classID, j)
	     				child.dropdown2.values[#child.dropdown2.values+1] = tostring(specID)
	     				child.dropdown2.values[#child.dropdown2.values+1] = specName
	     			end
	     			break
	     		end
	     	end
	     	child.dropdown2.initialize()
	     	child.dropdown2:SetValue("ALL")
	     end)
	dropdown:SetPoint("TOPLEFT",scrollframe,"TOPRIGHT",30,-8)
	child.dropdown = dropdown  
    
	local dropdown2 = panel:MakeDropDown(
       'name', ' Specialization',
	     'description', 'Pick a spec',
	     'values', {
		     		"ALL", "All Specs",
					"71", "Arms",
					"72", "Fury",
					"73", "Protection",
	      },
	     'default', 'ALL',
	     'current', 'ALL',
	     'setFunc', function(value) end)
	dropdown2:SetPoint("TOPLEFT",dropdown,"BOTTOMLEFT",0,-15)
	child.dropdown2 = dropdown2
	
	local spellStatusbox = panel:MakeDropDown(
       'name', ' Status',
	     'description', 'Enable or disable ability',
	     'values', {
		     		"ENABLED", "Enabled",
					"DISABLED", "Disabled",
	      },
	     'default', 'ENABLED',
	     'current', 'ENABLED',
	     'setFunc', function(value) end)
	spellStatusbox:SetPoint("TOPLEFT",dropdown,"BOTTOMLEFT",160,30)
    child.spellStatusbox = spellStatusbox

    local showIconBorders = panel:MakeToggle(
	     'name', 'Draw borders for icons',
	     'description', 'Draw borders around icons',
	     'default', true,
	     'getFunc', function() return db.showIconBorders end,
	     'setFunc', function(value) db.showIconBorders = value; ATT:UpdateAnchors() end)
	showIconBorders:SetPoint("TOP",showTooltip,"BOTTOM",0,-5)
	
	local addeditbox = CreateEditBox("Ability Name",scrollframe,142,25)
	child.addeditbox = addeditbox
	addeditbox:SetPoint("TOPLEFT",dropdown2,"BOTTOMLEFT",25,-25)

	local ideditbox = CreateEditBox("Ability ID",scrollframe,70,25)
	ideditbox:SetPoint("LEFT",addeditbox,"RIGHT",20,0)
	child.ideditbox = ideditbox

	local cdeditbox = CreateEditBox("CD (s)",scrollframe,40,25)
	cdeditbox:SetPoint("LEFT",ideditbox,"RIGHT",15,0)
	child.cdeditbox = cdeditbox

	    local order = panel:MakeSlider(
	     'name', 'Icon Order',
	     'description', 'Adjust icon order priority',
	     'minText', '1',
	     'maxText', '6',
	     'minValue', 1,
	     'maxValue', 6,
	     'step', 1,
	     'default', 1,
	     'current',  1,
	     'setFunc', function() end,
	     'currentTextFunc', function(value) return tonumber(string.format("%.1d",value)) end)
          order:SetPoint("TOPLEFT",dropdown2,"BOTTOMLEFT",180,30)
          child.order = order

	local addbutton = panel:MakeButton(
	     'name', 'Add/Update',
	     'description', "Add / Update ability",
	     'func', function() 
	     		local id = ideditbox:GetText():match("^[0-9]+$")
	     		local spec = dropdown2.value
	     		local ability = ATT:FormatAbility(addeditbox:GetText())
	     		local iconfound = ATT:FindAbilityIcon(ability, id)
	     		local cdtext = cdeditbox:GetText():match("^[0-9]+$")
	     		local spellStatus = spellStatusbox.value
	     		local order = string.format("%.0f",order.value)
	     		if iconfound and cdtext and id and (not spec or db.abilities[db.classSelected] and db.abilities[db.classSelected][spec]) then
	     			print("Added/Updated: |cffFF4500"..ability.."|r")
	     			local abilities = db.abilities[db.classSelected][spec or "ALL"]
	     			local _ability, _index = self:FindAbilityByName(abilities, ability)
	     			if _ability and _index then
	     				-- editing:
	     				abilities[_index] = {ability = ability, cooldown = tonumber(cdtext), id = tonumber(id), spellStatus = spellStatus and tostring(spellStatus), order = tonumber(string.format("%.0f",order)) }
 			        else
	     				-- adding new:
	     				table.insert(abilities, {ability = ability, cooldown = tonumber(cdtext), id = tonumber(id), spellStatus = spellStatus and tostring(spellStatus), order = tonumber(string.format("%.0f",order)) })
	     			end
	     		table.sort(abilities, function(a, b) 
	     		if (a.order or 1) == (b.order or 1) then
	     		return (a.id) < (b.id) end
                return (a.order or 1) < (b.order or 1) end)	
	     			child.currentButton = ability
	     			ATT:UpdateScrollBar()
	     			ATT:UpdateAnchors()
	     		else
	     			print("Invalid/blank:|cffFF4500 Ability Name, ID or Cooldown|r")
	     		end
	      end)
	addbutton:SetPoint("TOPLEFT",addeditbox,"BOTTOMLEFT",-5,-20)


     local importspell = panel:MakeButton(
    'name', 'Import spell',
    'description', 'Import spell for selected Class',
    'func', function()
        if iFrame and iFrame:IsShown() then iFrame:Hide() return end
        iFrame = CreateFrame("Frame", "ATI", panel, "TooltipBorderedFrameTemplate");
        iFrame:SetSize(255, 245);
        iFrame:SetPoint('LEFT',270,-75);
        iFrame:SetFrameLevel(iFrame:GetFrameLevel() + 3)
        iFrame:EnableMouse(true);

        local titleclass =  iFrame:CreateFontString(nil,"ARTWORK","GameFontDisable")
        local spectexture  =  "Interface\\Icons\\ClassIcon_"..db.classSelected
        titleclass:SetText("|T"..spectexture..":20|t |cffffff00 "..db.classSelected.."|r")
        titleclass:SetJustifyH("CENTER")
        titleclass:SetPoint("TOP", iFrame, "TOP", 0, -10)

        local closebtn = CreateFrame("button","closebtn", iFrame, "UIPanelButtonTemplate")
        closebtn:SetHeight(24)
        closebtn:SetWidth(60)
        closebtn:SetPoint("BOTTOM", iFrame, "BOTTOM", 0, 5)
        closebtn:SetText("Close")
        closebtn:SetScript("OnClick", function(self) self:GetParent():Hide() end)

        local isFrame = CreateFrame("ScrollFrame", "ATC", iFrame, "UIPanelScrollFrameTemplate");
        isFrame:SetSize(210, 175);
        isFrame:SetPoint("TOPLEFT", iFrame, "TOPLEFT", 10, -35)
        
        local childiF = CreateFrame("Frame","ATC", isFrame )
        childiF:SetSize(1,1);
        isFrame:SetScrollChild(childiF)
        local btn = {}
        self.btn = btn
        self.isFrame = childiF

        local dbImports = dbImport[db.classSelected]
        for abilityIndex, abilityTable in pairs(dbImports) do
            local ability, id, cooldown, maxcharges = abilityTable.spellID, abilityTable.spellID, abilityTable.duration, abilityTable.maxcharges
            local ability = GetSpellInfo(ability)
            local button = ListImport(childiF,child,tostring(abilityIndex),ability,id,cooldown)
            if abilityIndex == 1 then  btn[#btn+1] = 1 button:SetPoint("LEFT") end
            local spectexture  =  "Interface\\Icons\\ClassIcon_"..db.classSelected
            local abilitytexture = self:FindAbilityIcon(ability, id)
            button:SetText("   |T"..spectexture..":18|t - |T"..abilitytexture..":17|t " ..ability)
            button:SetPoint("TOPLEFT",btn[#btn],"BOTTOMLEFT")
            button:EnableMouse()
            button:SetScript('OnEnter', function() ATTTooltip:ClearLines(); ATTTooltip:SetOwner(iFrame, "ANCHOR_BOTTOM")
                ATTTooltip:SetSpellByID(id)
            end)
            button:SetScript('OnLeave', function()
                ATTTooltip:ClearLines()
                ATTTooltip:Hide()
            end)
            btn[#btn+1] = button
        end
    end)
    importspell:SetPoint("LEFT", addbutton, "RIGHT", 10, 0)

		local removebutton = panel:MakeButton(
	     'name', 'Remove',
	     'description', 'Remove ability',
	     'func', function()
	     		 print("Removed ability |cffFF4500" .. addeditbox:GetText().."|r")
	     		 local spec = dropdown2.value
                 local spellStatus = spellStatusbox.value
	     		 local _ability, _index = self:FindAbilityByName(db.abilities[db.classSelected][spec or "ALL"], addeditbox:GetText())
	     		 if _ability and _index then table.remove(db.abilities[db.classSelected][spec], _index) end
	     		 addeditbox:SetText(""); 
	     		 ideditbox:SetText("");
	     		 cdeditbox:SetText("");
	     		 order:SetValue(1) 
	     		 child.currentButton = nil; 
	     		 ATT:UpdateScrollBar(); 
	     		 ATT:UpdateAnchors() 
	     end)
		removebutton:SetPoint("LEFT", importspell, "RIGHT", 10, 0)
end

ATT:RegisterEvent("VARIABLES_LOADED")
ATT:SetScript("OnEvent",ATT_OnLoad)