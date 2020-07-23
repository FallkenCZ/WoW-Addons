if not WeakAuras.IsCorrectVersion() then return end

if not(GetLocale() == "zhTW") then
  return
end

local L = WeakAuras.L

-- WeakAuras/Templates
	L["Abilities"] = "技能"
	L["Ability Charges"] = "技能可用次數"
	L["Add Triggers"] = "新增觸發"
	L["Always Active"] = "永遠有作用"
	L["Always Show"] = "永遠顯示"
	L["Always show the aura, highlight it if debuffed."] = "永遠顯示提醒效果，有減益作用時顯著標示。"
	L["Always show the aura, turns grey if on cooldown."] = "永遠顯示提醒效果，冷卻中變成灰色。"
	L["Always show the aura, turns grey if the debuff not active."] = "永遠顯示提醒效果，沒有減益作用時變成灰色。"
	L["Always shows the aura, grey if buff not active."] = "永遠顯示提醒效果，沒有增益作用時變成灰色。"
	L["Always shows the aura, highlight it if buffed."] = "永遠顯示提醒效果，有增益作用時顯著標示。"
	L["Always shows the aura, highlight when active, turns blue on insufficient resources."] = "永遠顯示提醒效果，作用時顯著標示，資源不足時變成藍色。"
	L["Always shows the aura, highlight while proc is active, blue on insufficient resources."] = "永遠顯示提醒效果，機率觸發時顯著標示，資源不足時變成藍色。"
	L["Always shows the aura, highlight while proc is active, blue when not usable."] = "永遠顯示提醒效果，機率觸發時顯著標示，不可使用時變成藍色。"
	L["Always shows the aura, highlight while proc is active, turns red when out of range, blue on insufficient resources."] = "永遠顯示提醒效果，機率觸發時顯著標示，超出範圍時變成紅色，資源不足時變成藍色。"
	L["Always shows the aura, turns blue on insufficient resources."] = "永遠顯示提醒效果，資源不足時變成藍色。"
	L["Always shows the aura, turns blue when not usable."] = "永遠顯示提醒效果，不可使用時變成藍色。"
	L["Always shows the aura, turns grey if on cooldown."] = "永遠顯示提醒效果，冷卻中變成灰色。"
	L["Always shows the aura, turns grey if the ability is not usable and red when out of range."] = "永遠顯示提醒效果，技能不可使用時變成灰色，超出範圍時變成紅色。"
	L["Always shows the aura, turns grey if the ability is not usable."] = "永遠顯示提醒效果，技能不可使用時變成灰色。"
	L["Always shows the aura, turns red when out of range, blue on insufficient resources."] = "永遠顯示提醒效果，超出範圍時變成紅色，資源不足時變成藍色。"
	L["Always shows the aura, turns red when out of range."] = "永遠顯示提醒效果，超出範圍時變成紅色。"
	L["Back"] = "上一步"
	L["Basic Show On Cooldown"] = "基本冷卻中顯示"
	L["Basic Show On Ready"] = "基本可用時顯示"
	L["Bloodlust/Heroism"] = "嗜血/英勇"
	L["buff"] = "種族特長"
	L["Buffs"] = "增益 BUFF"
	L["Cancel"] = "取消"
	L["Cast"] = "施放法術"
	L["Charge and Buff Tracking"] = "次數和增益監控"
	L["Charge and Debuff Tracking"] = "次數和減益監控"
	L["Charge and Duration Tracking"] = "次數和持續時間監控"
	L["Charge Tracking"] = "次數監控"
	L["cooldown"] = "冷卻"
	L["Cooldown"] = "冷卻"
	L["Cooldown Tracking"] = "冷卻監控"
	L["Create Auras"] = "建立提醒效果"
	L["debuff"] = "減益"
	L["Debuffs"] = "減益 DEBUFF/DOT"
	L["Enchants"] = "附魔"
	L["General"] = "一般"
	L["General Azerite Traits"] = "一般艾澤萊特長"
	L["Health"] = "血量"
	L["Highlight while active, red when out of range."] = "作用時顯著標示，超出範圍時變成紅色。"
	L["Highlight while active."] = "作用時顯著標示。"
	L["Highlight while buffed, red when out of range."] = "有增益時顯著標示，超出範圍時變成紅色。"
	L["Highlight while buffed."] = "有增益時顯著標示。"
	L["Highlight while debuffed, red when out of range."] = "有減益時顯著標示，超出範圍時變成紅色。"
	L["Highlight while debuffed."] = "有減益時顯著標示。"
	L["Highlight while spell is active."] = "法術作用時顯著標示。"
	L["Hold CTRL to create multiple auras at once"] = "按住 CTRL 鍵一次建立多個提醒效果"
	L["Keeps existing triggers intact"] = "完整保留已經存在的觸發事件"
	L["Next"] = "下一步"
	L["On Procc Trinkets (Aura)"] = "觸發型飾品 (光環)"
	L["On Use Trinkets (Aura)"] = "使用型飾品 (光環)"
	L["On Use Trinkets (CD)"] = "使用型飾品 (冷卻)"
	L["Only show the aura if the target has the debuff."] = "只在選取目標有減益時才顯示提醒效果。"
	L["Only show the aura when the item is on cooldown."] = "只有物品在冷卻中才顯示提醒效果。"
	L["Only shows the aura if the target has the buff."] = "只在選取目標有增益時才顯示提醒效果。"
	L["Only shows the aura when the ability is on cooldown."] = "只有技能在冷卻中才顯示提醒效果。"
	L["Only shows the aura when the ability is ready to use."] = "只有在技能準備好可以使用時才顯示提醒效果。"
	L["Pet alive"] = "寵物活著"
	L["Pet Behavior"] = "寵物動作"
	L["PvP Azerite Traits"] = "PvP 艾澤萊特長"
	L["PvP Talents"] = "PVP 天賦"
	L["PVP Trinkets (Aura)"] = "PVP 飾品 (光環)"
	L["PVP Trinkets (CD)"] = "PVP 飾品 (冷卻)"
	L["Replace all existing triggers"] = "取代所有已經存在的觸發"
	L["Replace Triggers"] = "取代觸發"
	L["Resources"] = "職業特殊資源"
	L["Resources and Shapeshift Form"] = "職業特殊資源和變身形態"
	L["Runes"] = "符文"
	L["Shapeshift Form"] = "變身形態"
	L["Show Charges and Check Usable"] = "顯示次數和檢查是否可用"
	L["Show Charges with Proc Tracking"] = "顯示包含機率觸發監控的次數"
	L["Show Charges with Range Tracking"] = "顯示包含範圍監控的次數"
	L["Show Charges with Usable Check"] = "顯示包含檢查是否可用的次數"
	L["Show Cooldown and Buff"] = "顯示冷卻和增益"
	L["Show Cooldown and Buff and Check for Target"] = "顯示冷卻和增益並檢查選取目標"
	L["Show Cooldown and Buff and Check Usable"] = "顯示冷卻和增益並檢查是否可用"
	L["Show Cooldown and Check for Target"] = "顯示冷卻和檢查選取目標"
	L["Show Cooldown and Check for Target & Proc Tracking"] = "顯示冷卻並檢查選取目標和機率觸發監控"
	L["Show Cooldown and Check Usable"] = "顯示冷卻和檢查是否可用"
	L["Show Cooldown and Check Usable & Target"] = "顯示冷卻並檢查是否可用和選取目標"
	L["Show Cooldown and Check Usable, Proc Tracking"] = "顯示冷卻並檢查是否可用和機率觸發監控"
	L["Show Cooldown and Check Usable, Target & Proc Tracking"] = "顯示冷卻並檢查是否可用和選取目標以及機率觸發監控"
	L["Show Cooldown and Debuff"] = "顯示冷卻和減益"
	L["Show Cooldown and Debuff and Check for Target"] = "顯示冷卻和減益並檢查選取目標"
	L["Show Cooldown and Duration"] = "顯示冷卻時間和持續時間"
	L["Show Cooldown and Duration and Check for Target"] = "顯示冷卻時間、持續時間和檢查目標"
	L["Show Cooldown and Duration and Check Usable"] = "顯示冷卻時間、持續時間和檢查是否可使用"
	L["Show Cooldown and Proc Tracking"] = "顯示冷卻和機率觸發監控"
	L["Show Cooldown and Totem Information"] = "顯示冷卻和圖騰資訊"
	L["Show on Ready"] = "可用時顯示"
	L["Show Only if Buffed"] = "只在有增益時顯示"
	L["Show Only if Debuffed"] = "只在有減益時顯示"
	L["Show Only if on Cooldown"] = "只有在冷卻中時顯示"
	L["Show Totem and Charge Information"] = "顯示圖騰和次數資訊"
	L["slow debuff"] = "緩速減益"
	L["Specific Azerite Traits"] = "專用艾澤萊特長"
	L["Stance"] = "姿勢/形態"
	L["stun debuff"] = "暈眩減益"
	L["Track the charge and proc, highlight while proc is active, turns red when out of range, blue on insufficient resources."] = "監控次數和機率觸發，觸發時顯著標示，超出範圍時變成紅色，資源不足時變成藍色。"
	L["Tracks the charge and the buff, highlight while the buff is active, blue on insufficient resources."] = "追蹤次數和增益，有增益作用時顯著標示，資源不足時變成藍色。"
	L["Tracks the charge and the debuff, highlight while the debuff is active, blue on insufficient resources."] = "追蹤次數和減益，有減益作用時顯著標示，資源不足時變成藍色。"
	L["Tracks the charge and the duration of spell, highlight while the spell is active, blue on insufficient resources."] = "追蹤法術的可用次數和持續時間，法術作用時顯著標示，資源不足時變成藍色。"
	L["Unknown Item"] = "未知的物品"
	L["Unknown Spell"] = "未知法術"

