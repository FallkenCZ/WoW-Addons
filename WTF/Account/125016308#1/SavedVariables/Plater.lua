
PlaterDB = {
	["profileKeys"] = {
		["Fállkén - Drak'thul"] = "Default",
		["Fållkèn - Drak'thul"] = "Default",
		["Fâllken - Drak'thul"] = "Default",
		["Fállkèn - Burning Blade"] = "Default",
		["Fàllkên - Drak'thul"] = "Default",
		["Faallken - Drak'thul"] = "Default",
		["Fàllkèn - Burning Blade"] = "Default",
		["Gfgdhfdghfgh - Burning Blade"] = "Default",
		["Fållken - Burning Blade"] = "Default",
		["Fallkenji - Burning Blade"] = "Default",
		["Fállken - Burning Blade"] = "Default",
		["Fållkên - Drak'thul"] = "Default",
		["Fàllkén - Drak'thul"] = "Default",
		["Fallkenmekac - Burning Blade"] = "Default",
		["Fällkèn - Drak'thul"] = "Default",
		["Fallken - Burning Blade"] = "Default",
		["Fàllkèn - Drak'thul"] = "Default",
		["Fällkên - Drak'thul"] = "Default",
		["Fallkenez - Drak'thul"] = "Default",
		["Fallkenthicc - Burning Blade"] = "Default",
	},
	["profiles"] = {
		["Default"] = {
			["script_data"] = {
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)    \n    --change the nameplate color to this if allowed\n    envTable.CanChangeNameplateColor = false --change to true to change the color\n    envTable.NameplateColor = \"pink\"\n    envTable.NameplateSizeOffset = 6 --increase the nameplate height by this value\n    envTable.GlowAlpha = 0.5 --amount of alpha in the outside glow effect\n    \n    --create a glow effect around the nameplate\n    envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (unitFrame.healthBar, envTable.NameplateColor)\n    envTable.glowEffect:SetOffset (-27, 25, 9, -11)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() --\n    \n    --set the glow effect alpha\n    envTable.glowEffect:SetAlpha (envTable.GlowAlpha)\n    \nend\n\n--[=[\nUsing spellIDs for multi-language support\n\n135029 - A Knot of Snakes (Temple of Sethraliss)\n135388 - A Knot of Snakes (Temple of Sethraliss)\n134612 - Grasping Tentacles (Shrine of the Storm)\n133361 - Wasting Servant (Waycrest Manor)\n136330 - Soul Thorns (Waycrest Manor)\n130896 - Blackout Barrel (Freehold)\n129758 - Irontide Grenadier (Freehold)\n131009 - Spirit of Gold (Atal`Dazar)\n--]=]",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Hide()\n    \n    --restore the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)    \n    \nend\n\n\n",
					["ScriptType"] = 3,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can change the nameplate color\n    if (envTable.CanChangeNameplateColor) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n",
					["Time"] = 1537884697,
					["url"] = "",
					["Icon"] = 135996,
					["Enabled"] = true,
					["Revision"] = 156,
					["semver"] = "",
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Highlight a nameplate of an important Add. Add the unit name or NpcID into the trigger box to add more.",
					["SpellIds"] = {
					},
					["PlaterCore"] = 1,
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Show()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \nend\n\n\n",
					["version"] = -1,
					["Name"] = "Unit - Important [Plater]",
					["NpcNames"] = {
						"135029", -- [1]
						"134388", -- [2]
						"134612", -- [3]
						"133361", -- [4]
						"136330", -- [5]
						"130896", -- [6]
						"129758", -- [7]
						"Healing Tide Totem", -- [8]
						"131009", -- [9]
					},
				}, -- [1]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --creates a glow around the icon\n    envTable.buffIconGlow = envTable.buffIconGlow or Plater.CreateIconGlow (self)\n    \nend",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.buffIconGlow:Hide()\n    \nend",
					["ScriptType"] = 1,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \n    \nend",
					["Time"] = 1539013601,
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura",
					["Enabled"] = true,
					["Revision"] = 399,
					["semver"] = "",
					["Author"] = "Tercioo-Sylvanas",
					["Desc"] = "Add the buff name in the trigger box.",
					["SpellIds"] = {
						275826, -- [1]
						272888, -- [2]
						272659, -- [3]
						267901, -- [4]
						267830, -- [5]
						265393, -- [6]
					},
					["PlaterCore"] = 1,
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.buffIconGlow:Show()\n    \nend",
					["version"] = -1,
					["Name"] = "Aura - Buff Alert [Plater]",
					["NpcNames"] = {
					},
				}, -- [2]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    local CONFIG_BACKGROUND_FLASH_DURATION = 0.8 --0.8\n    local CONFIG_BORDER_GLOW_ALPHA = 0.3 --0.3\n    local CONFIG_SHAKE_DURATION = 0.2 --0.2\n    local CONFIG_SHAKE_AMPLITUDE = 5 --5\n    \n    --create a glow effect in the border of the cast bar\n    envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (self)\n    envTable.glowEffect:SetOffset (-32, 30, 7, -9)\n    envTable.glowEffect:SetAlpha (CONFIG_BORDER_GLOW_ALPHA)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() \n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+40, self:GetHeight()+20, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    local fadeIn = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, 1)\n    local fadeOut = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, CONFIG_SHAKE_DURATION, CONFIG_SHAKE_AMPLITUDE, 35, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))    \n    \n    \n    --update the config for the flash here so it wont need a /reload\n    fadeIn:SetDuration (CONFIG_BACKGROUND_FLASH_DURATION/2)\n    fadeOut:SetDuration (CONFIG_BACKGROUND_FLASH_DURATION/2)    \n    \n    --update the config for the skake here so it wont need a /reload\n    envTable.FrameShake.OriginalAmplitude = CONFIG_SHAKE_AMPLITUDE\n    envTable.FrameShake.OriginalDuration = CONFIG_SHAKE_DURATION  \n    \nend",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Hide()\n    \n    envTable.BackgroundFlash:Stop()\n    \n    unitFrame:StopFrameShake (envTable.FrameShake)    \n    \nend\n\n\n",
					["ScriptType"] = 2,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["Time"] = 1561923707,
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
					["Enabled"] = true,
					["Revision"] = 391,
					["semver"] = "",
					["Author"] = "Bombad�o-Azralon",
					["Desc"] = "Highlight a very important cast applying several effects into the Cast Bar. Add spell in the Add Trigger field.",
					["SpellIds"] = {
						257785, -- [1]
						267237, -- [2]
						266951, -- [3]
						267273, -- [4]
						267433, -- [5]
						263066, -- [6]
						255577, -- [7]
						255371, -- [8]
					},
					["PlaterCore"] = 1,
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Show()\n    \n    envTable.BackgroundFlash:Play()\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \nend\n\n\n",
					["version"] = -1,
					["Name"] = "Cast - Very Important [Plater]",
					["NpcNames"] = {
					},
				}, -- [3]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = 3\n    envTable.GlowAlpha = .45\n    envTable.ShowArrow = true\n    envTable.ArrowAlpha = .45    \n    envTable.HealthBarColor = \"orange\"\n    \n    --custom frames\n    envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (unitFrame.healthBar)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() \n    envTable.glowEffect:SetOffset (-27, 25, 6, -8)\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 32\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\CastingBar\\UI-CastingBar-Spark]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = 8\n    envTable.topArrow.height = 8\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \nend\n\n\n\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.glowEffect:Hide()\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
					["ScriptType"] = 2,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-16, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0.016\n    \n    --update the health bar color coloring from yellow to red\n    --Plater.SetNameplateColor (unitFrame, max (envTable._CastPercent/100, .66), abs (envTable._CastPercent/100 - 1), 0, 1)\n    \n    Plater.SetNameplateColor (unitFrame, envTable.HealthBarColor)\n    envTable.glowEffect.Texture:SetAlpha (envTable.GlowAlpha)\n    \nend\n\n\n",
					["Time"] = 1540663131,
					["url"] = "",
					["Icon"] = 2175503,
					["Enabled"] = true,
					["Revision"] = 324,
					["semver"] = "",
					["Author"] = "Bombad�o-Azralon",
					["Desc"] = "Apply several animations when the explosion orb cast starts on a Mythic Dungeon with Explosion Affix",
					["SpellIds"] = {
						240446, -- [1]
						273577, -- [2]
					},
					["PlaterCore"] = 1,
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Show()\n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 32\n    \n    envTable.glowEffect.Texture:SetAlpha (envTable.GlowAlpha)\n    \n    \nend\n\n\n\n\n\n\n",
					["version"] = -1,
					["Name"] = "Explosion Affix M+ [Plater]",
					["NpcNames"] = {
					},
				}, -- [4]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --creates a glow around the icon\n    envTable.debuffIconGlow = envTable.debuffIconGlow or Plater.CreateIconGlow (self)\n    \nend\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.debuffIconGlow:Hide()\n    \nend\n\n\n",
					["ScriptType"] = 1,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["Time"] = 1538429739,
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura",
					["Enabled"] = true,
					["Revision"] = 232,
					["semver"] = "",
					["Author"] = "Tercioo-Sylvanas",
					["Desc"] = "Add the debuff name in the trigger box.",
					["SpellIds"] = {
					},
					["PlaterCore"] = 1,
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.debuffIconGlow:Show()\n    \nend\n\n\n",
					["version"] = -1,
					["Name"] = "Aura - Debuff Alert [Plater]",
					["NpcNames"] = {
					},
				}, -- [5]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --https://www.wowhead.com/spell=253583/fiery-enchant\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    \n    --castbar color (when can be interrupted)\n    envTable.CastbarColor = \"darkorange\"\n    --flash duration\n    local CONFIG_BACKGROUND_FLASH_DURATION = 0.4\n    --add this value to the cast bar height\n    envTable.CastBarHeightAdd = 5\n    \n    \n    \n    --create a fast flash above the cast bar\n    envTable.FullBarFlash = envTable.FullBarFlash or Plater.CreateFlash (self, 0.05, 1, \"white\")\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, 0.2, 5, 35, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+60, self:GetHeight()+50, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    local fadeIn = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, .75)\n    local fadeOut = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()        \n    \nend\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end    \n    \n    --restore the cast bar to its original height\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n        envTable.OriginalHeight = nil\n    end\n    \n    --stop the camera shake\n    unitFrame:StopFrameShake (envTable.FrameShake)\n    \n    envTable.FullBarFlash:Stop()\n    envTable.BackgroundFlash:Stop()\n    \nend\n\n\n\n\n\n",
					["ScriptType"] = 2,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["Time"] = 1561924439,
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
					["Enabled"] = true,
					["Revision"] = 574,
					["semver"] = "",
					["Author"] = "Tercioo-Sylvanas",
					["Desc"] = "Flash, Bounce and Red Color the CastBar border when when an important cast is happening. Add spell in the Add Trigger field.",
					["SpellIds"] = {
						258153, -- [1]
						258313, -- [2]
						257069, -- [3]
						274569, -- [4]
						278020, -- [5]
						261635, -- [6]
						272700, -- [7]
						280404, -- [8]
						268030, -- [9]
						265368, -- [10]
						263891, -- [11]
						264520, -- [12]
						265407, -- [13]
						278567, -- [14]
						278602, -- [15]
						258128, -- [16]
						257791, -- [17]
						258938, -- [18]
						265089, -- [19]
						272183, -- [20]
						256060, -- [21]
						257397, -- [22]
						257899, -- [23]
						269972, -- [24]
						270901, -- [25]
						270492, -- [26]
						268129, -- [27]
						268709, -- [28]
						263215, -- [29]
						268797, -- [30]
						262540, -- [31]
						262554, -- [32]
						253517, -- [33]
						255041, -- [34]
						252781, -- [35]
						250368, -- [36]
						258777, -- [37]
					},
					["PlaterCore"] = 1,
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end\n    \n    --play flash animations\n    envTable.FullBarFlash:Play()\n    \n    --restoring the default size (not required since it already restore in the hide script)\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n    end\n    \n    --increase the cast bar size\n    local height = self:GetHeight()\n    envTable.OriginalHeight = height\n    \n    self:SetHeight (height + envTable.CastBarHeightAdd)\n    \n    Plater.SetCastBarBorderColor (self, 1, .2, .2, 0.4)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    --set the color of the cast bar to dark orange (only if can be interrupted)\n    --Plater auto set this color to default when a new cast starts, no need to reset this value at OnHide.    \n    if (envTable._CanInterrupt) then\n        self:SetStatusBarColor (Plater:ParseColors (envTable.CastbarColor))\n    end\n    \n    envTable.BackgroundFlash:Play()\n    \nend\n\n\n\n\n\n\n\n\n",
					["version"] = -1,
					["Name"] = "Cast - Big Alert [Plater]",
					["NpcNames"] = {
					},
				}, -- [6]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    \n    --flash duration\n    local CONFIG_FLASH_DURATION = 0.6\n    \n    --manually create a new texture for the flash animation\n    if (not envTable.SmallFlashTexture) then\n        envTable.SmallFlashTexture = envTable.SmallFlashTexture or Plater:CreateImage (unitFrame.castBar)\n        envTable.SmallFlashTexture:SetColorTexture (1, 1, 1)\n        envTable.SmallFlashTexture:SetAllPoints()\n    end\n    \n    --manually create a flash animation using the framework\n    if (not envTable.SmallFlashAnimationHub) then \n        \n        local onPlay = function()\n            envTable.SmallFlashTexture:Show()\n        end\n        \n        local onFinished = function()\n            envTable.SmallFlashTexture:Hide()\n        end\n        \n        local animationHub = Plater:CreateAnimationHub (envTable.SmallFlashTexture, onPlay, onFinished)\n        Plater:CreateAnimation (animationHub, \"Alpha\", 1, CONFIG_FLASH_DURATION/2, 0, .6)\n        Plater:CreateAnimation (animationHub, \"Alpha\", 2, CONFIG_FLASH_DURATION/2, 1, 0)\n        \n        envTable.SmallFlashAnimationHub = animationHub\n    end\n    \n    \n    \nend\n\n\n\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.SmallFlashAnimationHub:Stop()\n    \nend\n\n\n",
					["ScriptType"] = 2,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \nend\n\n\n",
					["Time"] = 1539201768,
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
					["Enabled"] = true,
					["Revision"] = 376,
					["semver"] = "",
					["Author"] = "Tercioo-Sylvanas",
					["Desc"] = "Flashes the Cast Bar when a spell in the trigger list is Cast. Add spell in the Add Trigger field.",
					["SpellIds"] = {
						275192, -- [1]
						265912, -- [2]
						274438, -- [3]
						268317, -- [4]
						268375, -- [5]
						276767, -- [6]
						264105, -- [7]
						265876, -- [8]
						270464, -- [9]
						266106, -- [10]
						272180, -- [11]
						278961, -- [12]
						278755, -- [13]
						265468, -- [14]
						256405, -- [15]
						256897, -- [16]
						264101, -- [17]
						280604, -- [18]
						268702, -- [19]
						281621, -- [20]
						262515, -- [21]
						255824, -- [22]
						253583, -- [23]
						250096, -- [24]
					},
					["PlaterCore"] = 1,
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.SmallFlashAnimationHub:Play()\n    \nend\n\n\n",
					["version"] = -1,
					["Name"] = "Cast - Small Alert [Plater]",
					["NpcNames"] = {
					},
				}, -- [7]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --color to set the nameplate\n    envTable.NameplateColor = \"gray\"\n    \nend\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["ScriptType"] = 1,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --only change the nameplate color in combat\n    if (InCombatLockdown()) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n\n\n",
					["Time"] = 1538256464,
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_invalid",
					["Enabled"] = true,
					["Revision"] = 106,
					["semver"] = "",
					["Author"] = "Izimode-Azralon",
					["Desc"] = "When an aura makes the unit invulnarable and you don't want to attack it. Add spell in the Add Trigger field.",
					["SpellIds"] = {
						261265, -- [1]
						261266, -- [2]
						271590, -- [3]
					},
					["PlaterCore"] = 1,
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["version"] = -1,
					["Name"] = "Aura - Invalidate Unit [Plater]",
					["NpcNames"] = {
					},
				}, -- [8]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings:\n    do\n        \n        --change the nameplate color to this color\n        --can use color names: \"red\", \"yellow\"\n        --can use color hex: \"#FF0000\", \"#FFFF00\"\n        --con use color table: {1, 0, 0}, {1, 1, 0}\n        \n        envTable.Color = \"green\"\n        \n        --if true, it'll replace the health info with the unit name\n        envTable.ReplaceHealthWithName = false\n        \n        --use flash when the unit is shown in the screen\n        envTable.FlashNameplate = true\n        \n    end\n    \n    --private:\n    do\n        --create a flash for when the unit if shown\n        envTable.smallFlash = envTable.smallFlash or Plater.CreateFlash (unitFrame.healthBar, 0.15, 1, envTable.Color)\n        \n    end\n    \nend\n\n--[=[\n\nNpc IDS:\n\n141851: Spawn of G'Huun on Mythic Dungeons\n\n\n--]=]\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --make plater refresh the nameplate color\n    Plater.RefreshNameplateColor (unitFrame)\n    \n        envTable.smallFlash:Stop()\n    \nend\n\n\n",
					["ScriptType"] = 3,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --adjust the nameplate color\n    Plater.SetNameplateColor (unitFrame, envTable.Color)\n    \n    --check if can replace the health amount with the unit name\n    if (envTable.ReplaceHealthWithName) then\n        \n        local healthPercent = format (\"%.1f\", unitFrame.healthBar.CurrentHealth / unitFrame.healthBar.CurrentHealthMax *100)\n        \n        unitFrame.healthBar.lifePercent:SetText (unitFrame.namePlateUnitName .. \"  (\" .. healthPercent  .. \"%)\")\n        \n    end\n    \nend\n\n\n",
					["Time"] = 1543253273,
					["url"] = "",
					["Icon"] = 135024,
					["Enabled"] = true,
					["Revision"] = 59,
					["semver"] = "",
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Add a unitID or unit name in 'Add Trigger' entry. See the constructor script for options.",
					["SpellIds"] = {
					},
					["PlaterCore"] = 1,
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can flash the nameplate\n    if (envTable.FlashNameplate) then\n        envTable.smallFlash:Play()\n    end\n    \nend\n\n\n\n\n\n\n\n\n",
					["version"] = -1,
					["Name"] = "Color Change [Plater]",
					["NpcNames"] = {
						"141851", -- [1]
					},
				}, -- [9]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (require a /reload after editing any setting)\n    do\n        --blink and glow\n        envTable.BlinkEnabled = true --set to 'false' to disable blinks\n        envTable.GlowEnabled = true --set to 'false' to disable glows\n        envTable.ChangeNameplateColor = true; --set to 'true' to enable nameplate color change\n        envTable.TimeLeftToBlink = 4.5; --in seconds, affects the blink effect only\n        envTable.BlinkSpeed = 1.0; --time to complete a blink loop\n        envTable.BlinkColor = \"white\"; --color of the blink\n        envTable.BlinkMaxAlpha = 0.50; --max transparency in the animation loop (1.0 is full opaque)\n        envTable.NameplateColor = \"darkred\"; --nameplate color if ChangeNameplateColor is true\n        \n        --text color\n        envTable.TimerColorEnabled = true --set to 'false' to disable changes in the color of the time left text\n        envTable.TimeLeftWarning = 8.0; --in seconds, affects the color of the text\n        envTable.TimeLeftCritical = 3.0; --in seconds, affects the color of the text    \n        envTable.TextColor_Warning = \"yellow\"; --color when the time left entered in a warning zone\n        envTable.TextColor_Critical = \"red\"; --color when the time left is critical\n        \n        --list of spellIDs to ignore\n        envTable.IgnoredSpellID = {\n            [12] = true, --use a simple comma here\n            [13] = true,\n        }\n    end\n    \n    \n    --private\n    do\n        envTable.blinkTexture = Plater:CreateImage (self, \"\", 1, 1, \"overlay\")\n        envTable.blinkTexture:SetPoint ('center', 0, 0)\n        envTable.blinkTexture:Hide()\n        \n        local onPlay = function()\n            envTable.blinkTexture:Show() \n            envTable.blinkTexture.color = envTable.BlinkColor\n        end\n        local onStop = function()\n            envTable.blinkTexture:Hide()  \n        end\n        envTable.blinkAnimation = Plater:CreateAnimationHub (envTable.blinkTexture, onPlay, onStop)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 1, envTable.BlinkSpeed / 2, 0, envTable.BlinkMaxAlpha)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 2, envTable.BlinkSpeed / 2, envTable.BlinkMaxAlpha, 0)\n        \n        envTable.glowEffect = envTable.glowEffect or Plater.CreateIconGlow (self)\n        --envTable.glowEffect:Show() --envTable.glowEffect:Hide()\n        \n    end\n    \nend\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.blinkAnimation:Stop()\n    envTable.blinkTexture:Hide()\n    envTable.blinkAnimation:Stop()\n    envTable.glowEffect:Stop()\n    Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\nend\n\n\n",
					["ScriptType"] = 1,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    local timeLeft = envTable._RemainingTime\n    \n    --check if the spellID isn't being ignored\n    if (envTable.IgnoredSpellID [envTable._SpellID]) then\n        return\n    end\n    \n    --check the time left and start or stop the blink animation and also check if the time left is > zero\n    if ((envTable.BlinkEnabled or envTable.GlowEnabled) and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftToBlink) then\n            --blink effect\n            if (envTable.BlinkEnabled) then\n                if (not envTable.blinkAnimation:IsPlaying()) then\n                    envTable.blinkAnimation:Play()\n                end\n            end\n            --glow effect\n            if (envTable.GlowEnabled) then\n                envTable.glowEffect:Show()\n            end\n            --nameplate color\n            if (envTable.ChangeNameplateColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n            end\n        else\n            --blink effect\n            if (envTable.blinkAnimation:IsPlaying()) then\n                envTable.blinkAnimation:Stop()\n            end\n            --glow effect\n            if (envTable.GlowEnabled and envTable.glowEffect:IsShown()) then\n                envTable.glowEffect:Hide()\n            end\n        end\n    end\n    \n    --timer color\n    if (envTable.TimerColorEnabled and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftCritical) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Critical)\n        elseif (timeLeft < envTable.TimeLeftWarning) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Warning)        \n        else\n            Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\n        end\n    end\n    \nend",
					["Time"] = 1547991413,
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura_blink",
					["Enabled"] = true,
					["Revision"] = 157,
					["semver"] = "",
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Blink, change the number and nameplate color. Add the debuffs int he trigger box. Set settings on constructor script.",
					["SpellIds"] = {
					},
					["PlaterCore"] = 1,
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.blinkTexture:SetSize (self:GetSize())\n    \nend\n\n\n",
					["version"] = -1,
					["Name"] = "Aura - Blink by Time Left [Plater]",
					["NpcNames"] = {
					},
				}, -- [10]
				{
					["ConstructorCode"] = "--gray lines are comments and doesn't affect the code\n\n--1) add the aura you want by typing its name or spellID into the \"Add Trigger\" and click the \"Add\" button.\n--2) the border will use the default color set below, to a custom color type aura name and the color you want in the BorderColorByAura table.\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --default color if the aura name isn't found in the Color By Aura table below\n    envTable.DefaultBorderColor = \"orange\"\n    \n    --transparency, affect all borders\n    envTable.BorderAlpha = 1.0\n    \n    --add the aura name and the color, \n    envTable.BorderColorByAura = {\n        \n        --examples:\n        --[\"Aura Name\"] = \"yellow\", --using regular aura name | using the name of the color\n        --[\"aura name\"] = \"#FFFF00\", --using lower case in the aura name |using html #hex for the color\n        --[54214] = {1, 1, 0}, --using the spellID instead of the name | using rgb table (0 to 1) for the color\n        --color table uses zero to one values: 255 = 1.0, 127 = 0.5, orange color = {1, 0.7, 0}\n        \n        --add your custom border colors below:\n        \n        [\"Aura Name\"] = {1, .5, 0}, --example to copy/paste\n        \n    }\n    \n    \nend\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --reset the border color\n    self:SetBackdropBorderColor (0, 0, 0, 0)\n    \nend\n\n\n",
					["ScriptType"] = 1,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the custom color added by the user or the default color\n    local color = envTable.CustomBorderColor or envTable.DefaultBorderColor\n    --parse the color since it can be a color name, hex or color table\n    local r, g, b = DetailsFramework:ParseColors (color)\n    \n    --set the border color\n    self:SetBackdropBorderColor (r, g, b, envTable.BorderAlpha)\n    \nend\n\n\n\n\n",
					["Time"] = 1543680853,
					["url"] = "",
					["Icon"] = 133006,
					["Enabled"] = false,
					["Revision"] = 45,
					["semver"] = "",
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Add a border to an aura icon. Add the aura into the Add Trigger entry. You can customize the icon color at the constructor script.",
					["SpellIds"] = {
					},
					["PlaterCore"] = 1,
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the aura name in lower case\n    local auraLowerName = string.lower (envTable._SpellName)\n    \n    --attempt to get a custom color added by the user in the constructor script\n    local hasCustomBorderColor = envTable.BorderColorByAura [auraLowerName] or envTable.BorderColorByAura [envTable._SpellName] or envTable.BorderColorByAura [envTable._SpellID]\n    \n    --save the custom color\n    envTable.CustomBorderColor = hasCustomBorderColor\n    \nend\n\n\n",
					["version"] = -1,
					["Name"] = "Aura - Border Color [Plater]",
					["NpcNames"] = {
					},
				}, -- [11]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount = Plater:CreateLabel (unitFrame, \"\", 16, \"silver\");\n    envTable.EnergyAmount:SetPoint (\"bottom\", unitFrame, \"top\", 0, 18);\nend\n\n--[=[\n\n\n--]=]",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount:Hide()\nend\n\n\n",
					["ScriptType"] = 3,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount.text = \"\" .. UnitPower (unitId);\nend\n\n\n",
					["Time"] = 1539015649,
					["url"] = "",
					["Icon"] = 136048,
					["Enabled"] = true,
					["Revision"] = 131,
					["semver"] = "",
					["Author"] = "Celian-Sylvanas",
					["Desc"] = "Show the energy amount above the nameplate",
					["SpellIds"] = {
					},
					["PlaterCore"] = 1,
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount:Show()\nend\n\n\n",
					["version"] = -1,
					["Name"] = "UnitPower [Plater]",
					["NpcNames"] = {
						"Guardian of Yogg-Saron", -- [1]
					},
				}, -- [12]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.movingArrow = envTable.movingArrow or Plater:CreateImage (self, [[Interface\\PETBATTLES\\PetBattle-StatIcons]], 16, self:GetHeight(), \"background\", {0, 15/32, 18/32, 30/32})\n    \n    envTable.movingArrow:SetAlpha (0.275)\n    --envTable.movingArrow:SetDesaturated (true)\n    \n    envTable.movingAnimation = envTable.movingAnimation or Plater:CreateAnimationHub (envTable.movingArrow, \n        function() \n            envTable.movingArrow:Show() \n            envTable.movingArrow:SetPoint(\"left\", 0, 0)\n        end, \n        function() envTable.movingArrow:Hide() end)\n    \n    envTable.movingAnimation:SetLooping (\"REPEAT\")\n    \n    local animation = Plater:CreateAnimation (envTable.movingAnimation, \"translation\", 1, 0.2, self:GetWidth()-16, 0)\n    \n    \n    \nend\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.movingAnimation:Stop()\nend\n\n\n",
					["ScriptType"] = 2,
					["UpdateCode"] = "		function (self, unitId, unitFrame, envTable)\n			\n		end\n	",
					["Time"] = 1539201849,
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
					["Enabled"] = true,
					["Revision"] = 171,
					["semver"] = "",
					["Author"] = "Izimode-Azralon",
					["Desc"] = "Does an animation for casts that affect the frontal area of the enemy. Add spell in the Add Trigger field.",
					["SpellIds"] = {
						255952, -- [1]
						257426, -- [2]
						274400, -- [3]
						272609, -- [4]
						269843, -- [5]
						269029, -- [6]
						272827, -- [7]
						269266, -- [8]
						263912, -- [9]
						264923, -- [10]
						258864, -- [11]
						256955, -- [12]
						265540, -- [13]
						260793, -- [14]
						270003, -- [15]
						270507, -- [16]
						257337, -- [17]
						268415, -- [18]
						275907, -- [19]
						268865, -- [20]
						260669, -- [21]
						260280, -- [22]
						253239, -- [23]
						265541, -- [24]
						250258, -- [25]
					},
					["PlaterCore"] = 1,
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.movingAnimation:Play()\nend\n\n\n",
					["version"] = -1,
					["Name"] = "Cast - Frontal Cone [Plater]",
					["NpcNames"] = {
					},
				}, -- [13]
				{
					["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.BuffFrame, \"top\", 0, 10);    \n    \n    envTable.FixateIcon = Plater:CreateImage (unitFrame, 236188, 16, 16, \"overlay\");\n    envTable.FixateIcon:SetPoint (\"bottom\", envTable.FixateTarget, \"top\", 0, 4);    \n    \nend\n\n\n\n\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Hide()\n    envTable.FixateIcon:Hide()\nend\n\n\n",
					["ScriptType"] = 1,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    local targetName = UnitName (unitId .. \"target\");\n    if (targetName) then\n        local _, class = UnitClass (unitId .. \"target\");\n        targetName = Plater.SetTextColorByClass (unitId .. \"target\", targetName);\n        envTable.FixateTarget.text = targetName;\n    end    \nend\n\n\n",
					["Time"] = 1539187387,
					["url"] = "",
					["Icon"] = 1029718,
					["Enabled"] = true,
					["Revision"] = 190,
					["semver"] = "",
					["Author"] = "Celian-Sylvanas",
					["Desc"] = "Show above the nameplate who is the player fixated",
					["SpellIds"] = {
						272584, -- [1]
						244653, -- [2]
					},
					["PlaterCore"] = 1,
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Show();\n    envTable.FixateIcon:Show();\n    \nend\n\n\n",
					["version"] = -1,
					["Name"] = "Fixate [Plater]",
					["NpcNames"] = {
					},
				}, -- [14]
				{
					["ConstructorCode"] = "--todo: add npc ids for multilanguage support\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.TextAboveNameplate = \"** On You **\"\n    envTable.NameplateColor = \"green\"\n    \n    --label to show the text above the nameplate\n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.healthBar, \"top\", 0, 30);\n    \n    --the spell casted by the npc in the trigger list needs to be in the list below as well\n    local spellList = {\n        [268074] = \"Dark Purpose\", --G'huun Mythic Add\n        [260954] = \"Iron Gaze\", --Sergeant Bainbridge - Siege of Boralus\n        [257739] = \"Blind Rage\", --Blacktooth Scrapper - Freehold\n        [257314] = \"Black Powder Bomb\", --Irontide Grenadier - Freehold\n        [266107] = \"Thirst For Blood\", --Feral Bloodswarmer - The Underrot\n        [257582] = \"Raging Gaze\", --Earthrager - The MOTHERLODE!!\n        [262377] = \"Seek and Destroy\", --Crawler Mine - The MOTHERLODE!!\n        [257407] = \"Pursuit\", --Rezan - Atal'Dazar\n        --[] = \"\" --       \n        \n    }\n    \n    --build the list with localized spell names\n    envTable.FixateDebuffs = {}\n    for spellID, enUSSpellName in pairs (spellList) do\n        local localizedSpellName = GetSpellInfo (spellID)\n        envTable.FixateDebuffs [localizedSpellName or enUSSpellName] = true\n    end\n    \n    --debug - smuggled crawg\n    envTable.FixateDebuffs [\"Jagged Maw\"] = true\n    \nend\n\n--[=[\nNpcIDs:\n136461: Spawn of G'huun (mythic uldir G'huun)\n\n--]=]\n\n\n\n\n",
					["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:SetText (\"\")\n    envTable.FixateTarget:Hide()\n    \n    envTable.IsFixated = false\n    \n    Plater.RefreshNameplateColor (unitFrame)\nend\n\n\n",
					["ScriptType"] = 3,
					["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --swap this to true when it is fixated\n    local isFixated = false\n    \n    --check the debuffs the player has and see if any of these debuffs has been placed by this unit\n    for debuffId = 1, 40 do\n        local name, texture, count, debuffType, duration, expirationTime, caster = UnitDebuff (\"player\", debuffId)\n        \n        --cancel the loop if there's no more debuffs on the player\n        if (not name) then \n            break \n        end\n        \n        --check if the owner of the debuff is this unit\n        if (envTable.FixateDebuffs [name] and caster and UnitIsUnit (caster, unitId)) then\n            --the debuff the player has, has been placed by this unit, set the name above the unit name\n            envTable.FixateTarget:SetText (envTable.TextAboveNameplate)\n            envTable.FixateTarget:Show()\n            Plater.SetNameplateColor (unitFrame,  envTable.NameplateColor)\n            isFixated = true\n            \n            if (not envTable.IsFixated) then\n                envTable.IsFixated = true\n                Plater.FlashNameplateBody (unitFrame, \"fixate\", .2)\n            end\n        end\n        \n    end\n    \n    --check if the nameplate color is changed but isn't fixated any more\n    if (not isFixated and envTable.IsFixated) then\n        --refresh the nameplate color\n        Plater.RefreshNameplateColor (unitFrame)\n        --reset the text\n        envTable.FixateTarget:SetText (\"\")\n        \n        envTable.IsFixated = false\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
					["Time"] = 1543250950,
					["url"] = "",
					["Icon"] = 841383,
					["Enabled"] = true,
					["Revision"] = 194,
					["semver"] = "",
					["Author"] = "Tecno-Azralon",
					["Desc"] = "When an enemy places a debuff and starts to chase you. This script changes the nameplate color and place your name above the nameplate as well.",
					["SpellIds"] = {
						"spawn of g'huun", -- [1]
						"smuggled crawg", -- [2]
						"sergeant bainbridge", -- [3]
						"blacktooth scrapper", -- [4]
						"irontide grenadier", -- [5]
						"feral bloodswarmer", -- [6]
						"earthrager", -- [7]
						"crawler mine", -- [8]
						"rezan", -- [9]
					},
					["PlaterCore"] = 1,
					["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					["version"] = -1,
					["Name"] = "Fixate On You [Plater]",
					["NpcNames"] = {
						"smuggled crawg", -- [1]
						"sergeant bainbridge", -- [2]
						"blacktooth scrapper", -- [3]
						"irontide grenadier", -- [4]
						"feral bloodswarmer", -- [5]
						"earthrager", -- [6]
						"crawler mine", -- [7]
						"rezan", -- [8]
						"136461", -- [9]
					},
				}, -- [15]
			},
			["use_ui_parent"] = true,
			["npc_cache"] = {
				[156146] = {
					"Voidbound Shieldbearer", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[37133] = {
					"Ymirjar Warlord", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[24777] = {
					"Sunblade Sentinel", -- [1]
					"Magister's Terrace", -- [2]
				},
				[135160] = {
					"Ironforge Footman", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[131577] = {
					"Spirit of Fire", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[34190] = {
					"Hardened Iron Golem", -- [1]
					"Ulduar", -- [2]
				},
				[97285] = {
					"Wind Rush Totem", -- [1]
					"Isle of Conquest", -- [2]
				},
				[134137] = {
					"Temple Attendant", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[34702] = {
					"Ambrose Boltspark", -- [1]
					"Trial of the Champion", -- [2]
				},
				[135161] = {
					"Ironforge Mountaineer", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[139768] = {
					"Freebooter Dan", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[29832] = {
					"Drakkari Golem", -- [1]
					"Gundrak", -- [2]
				},
				[55689] = {
					"Hagara the Stormbinder", -- [1]
					"Dragon Soul", -- [2]
				},
				[25865] = {
					"Frozen Core", -- [1]
					"Coilfang: The Slave Pens", -- [2]
				},
				[124159] = {
					"Lumbering Leo", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[52362] = {
					"Tiki Lord Zim'wae", -- [1]
					"Zul'Gurub", -- [2]
				},
				[136186] = {
					"Tidesage Spiritualist", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[133627] = {
					"Tally Zapnabber", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[18315] = {
					"Ethereal Theurgist", -- [1]
					"Auchindoun: Mana-Tombs", -- [2]
				},
				[61448] = {
					"Sik'thik Soldier", -- [1]
					"Siege of Niuzao Temple", -- [2]
				},
				[37134] = {
					"Ymirjar Huntress", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[15462] = {
					"Spitting Scarab", -- [1]
					"Ruins of Ahn'Qiraj", -- [2]
				},
				[15622] = {
					"Vekniss Borer", -- [1]
					"Ahn'Qiraj Temple", -- [2]
				},
				[34191] = {
					"Trash", -- [1]
					"Ulduar", -- [2]
				},
				[145402] = {
					"Frenzied Wildheart", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[34703] = {
					"Lana Stouthammer", -- [1]
					"Trial of the Champion", -- [2]
				},
				[135165] = {
					"Ironforge Shadowcaster", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[159224] = {
					"Gryth'ax the Executioner", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[136190] = {
					"Shadowy Rift", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[135167] = {
					"Spectral Berserker", -- [1]
					"Kings' Rest", -- [2]
				},
				[37007] = {
					"Deathbound Ward", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[140798] = {
					"Cragcaw", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[20875] = {
					"Negaton Screamer", -- [1]
					"Tempest Keep: The Arcatraz", -- [2]
				},
				[147965] = {
					"Volatile Azerite", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[34192] = {
					"Boomer XP-500", -- [1]
					"Ulduar", -- [2]
				},
				[17356] = {
					"Creeping Ooze", -- [1]
					"Hellfire Citadel: The Shattered Halls", -- [2]
				},
				[17420] = {
					"Shattered Hand Heathen", -- [1]
					"Hellfire Citadel: The Shattered Halls", -- [2]
				},
				[140800] = {
					"Cloudwing the Killthief", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[142336] = {
					"Pygmy Octopus", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[56587] = {
					"Twilight Assault Drake", -- [1]
					"Dragon Soul", -- [2]
				},
				[36880] = {
					"Decaying Colossus", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[147968] = {
					"Agitated Azerite", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[140290] = {
					"S.H.E.E.P.", -- [1]
					"Eye of the Storm", -- [2]
				},
				[13447] = {
					"Corporal Noreg Stormpike", -- [1]
					"Alterac Valley", -- [2]
				},
				[34193] = {
					"Clockwork Sapper", -- [1]
					"Ulduar", -- [2]
				},
				[130307] = {
					"Unstable Typhoon", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[34705] = {
					"Marshal Jacob Alerius", -- [1]
					"Trial of the Champion", -- [2]
				},
				[55308] = {
					"Warlord Zon'ozz", -- [1]
					"Dragon Soul", -- [2]
				},
				[140292] = {
					"Snowfur Alpha", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[59915] = {
					"Jasper Guardian", -- [1]
					"Mogu'shan Vaults", -- [2]
				},
				[60043] = {
					"Jade Guardian", -- [1]
					"Mogu'shan Vaults", -- [2]
				},
				[14023] = {
					"Corrupted Green Whelp", -- [1]
					"Blackwing Lair", -- [2]
				},
				[156161] = {
					"Inquisitor Gnshal", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[140293] = {
					"Snowfur Snarler", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[44687] = {
					"Proto-Behemoth", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[10184] = {
					"Onyxia", -- [1]
					"Onyxia's Lair", -- [2]
				},
				[32914] = {
					"Elder Stonebark", -- [1]
					"Ulduar", -- [2]
				},
				[16525] = {
					"Spell Shade", -- [1]
					"Karazhan", -- [2]
				},
				[53901] = {
					"Unstable Magma", -- [1]
					"Firelands", -- [2]
				},
				[138247] = {
					"Irontide Marauder", -- [1]
					"Siege of Boralus", -- [2]
				},
				[163841] = {
					"Amalgamation of Flesh", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[140295] = {
					"Snowfur Pup", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[162306] = {
					"Aqir Drone", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[17357] = {
					"Creeping Oozeling", -- [1]
					"Hellfire Citadel: The Shattered Halls", -- [2]
				},
				[29834] = {
					"Drakkari Frenzy", -- [1]
					"Gundrak", -- [2]
				},
				[136713] = {
					"Highlands Laborer", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[157700] = {
					"Agustus Moulaine", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[67093] = {
					"Sik'thik Battle-Mender", -- [1]
					"Siege of Niuzao Temple", -- [2]
				},
				[136714] = {
					"Hulking Laborer", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[145928] = {
					"Skavis Nightstalker", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[36626] = {
					"Festergut", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[15335] = {
					"Flesh Hunter", -- [1]
					"Ruins of Ahn'Qiraj", -- [2]
				},
				[32915] = {
					"Elder Brightleaf", -- [1]
					"Ulduar", -- [2]
				},
				[26763] = {
					"Anomalus", -- [1]
					"The Nexus", -- [2]
				},
				[11464] = {
					"Warpwood Tangler", -- [1]
					"Dire Maul", -- [2]
				},
				[11496] = {
					"Immol'thar", -- [1]
					"Dire Maul", -- [2]
				},
				[15687] = {
					"Moroes", -- [1]
					"Karazhan", -- [2]
				},
				[161286] = {
					"Dark Ritualist", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[126216] = {
					"Zian-Ti Destroyer", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[134157] = {
					"Shadow-Borne Warrior", -- [1]
					"Kings' Rest", -- [2]
				},
				[155656] = {
					"Misha", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[5925] = {
					"Grounding Totem", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[153097] = {
					"Voidbound Shaman", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[134158] = {
					"Shadow-Borne Champion", -- [1]
					"Kings' Rest", -- [2]
				},
				[155657] = {
					"Huffer", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[56846] = {
					"Arm Tentacle", -- [1]
					"Dragon Soul", -- [2]
				},
				[145932] = {
					"Celestra Brightmoon", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[36627] = {
					"Rotface", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[12264] = {
					"Shazzrah", -- [1]
					"Molten Core", -- [2]
				},
				[123146] = {
					"Torn Spirit", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[16526] = {
					"Sorcerous Shade", -- [1]
					"Karazhan", -- [2]
				},
				[74518] = {
					"Executioner Gore", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[149516] = {
					"Blackpaw", -- [1]
					"Warfronts Darkshore - Horde", -- [2]
				},
				[75286] = {
					"Twilight Disciple", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[136208] = {
					"Stromgarde Arbalest", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[34196] = {
					"Rune Etched Sentry", -- [1]
					"Ulduar", -- [2]
				},
				[145934] = {
					"Ivan the Mad", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[119052] = {
					"War Banner", -- [1]
					"Eye of the Storm", -- [2]
				},
				[25740] = {
					"Ahune", -- [1]
					"Coilfang: The Slave Pens", -- [2]
				},
				[136721] = {
					"Circle Spellweaver", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[8905] = {
					"Warbringer Construct", -- [1]
					"Blackrock Depths", -- [2]
				},
				[30283] = {
					"Plague Walker", -- [1]
					"Ahn'kahet: The Old Kingdom", -- [2]
				},
				[9033] = {
					"General Angerforge", -- [1]
					"Blackrock Depths", -- [2]
				},
				[13160] = {
					"Carrion Swarmer", -- [1]
					"Dire Maul", -- [2]
				},
				[162828] = {
					"Corrosive Digester", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[57231] = {
					"Twilight Portal", -- [1]
					"Dragon Soul", -- [2]
				},
				[13320] = {
					"Commander Karl Philips", -- [1]
					"Alterac Valley", -- [2]
				},
				[37012] = {
					"Ancient Skeletal Soldier", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[161293] = {
					"Neglected Guild Bank", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[18894] = {
					"Felguard Brute", -- [1]
					"Hellfire Citadel: The Blood Furnace", -- [2]
				},
				[9545] = {
					"Grim Patron", -- [1]
					"Blackrock Depths", -- [2]
				},
				[34197] = {
					"Chamber Overseer", -- [1]
					"Ulduar", -- [2]
				},
				[55312] = {
					"Yor'sahj the Unsleeping", -- [1]
					"Dragon Soul", -- [2]
				},
				[66587] = {
					"Pengsong", -- [1]
					"Eye of the Storm", -- [2]
				},
				[60047] = {
					"Amethyst Guardian", -- [1]
					"Mogu'shan Vaults", -- [2]
				},
				[14024] = {
					"Corrupted Blue Whelp", -- [1]
					"Blackwing Lair", -- [2]
				},
				[883] = {
					"Deer", -- [1]
					"Dire Maul", -- [2]
				},
				[136214] = {
					"Windspeaker Heldis", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[56848] = {
					"Twilight Elite Slayer", -- [1]
					"Dragon Soul", -- [2]
				},
				[44819] = {
					"Siamat", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[127757] = {
					"Reanimated Honor Guard", -- [1]
					"Atal'Dazar", -- [2]
				},
				[33430] = {
					"Guardian Lasher", -- [1]
					"Ulduar", -- [2]
				},
				[54161] = {
					"Flame Archon", -- [1]
					"Firelands", -- [2]
				},
				[135192] = {
					"Honored Raptor", -- [1]
					"Kings' Rest", -- [2]
				},
				[139799] = {
					"Ironhull Apprentice", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[58768] = {
					"Tahi", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[139800] = {
					"Galecaller Apprentice", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[29836] = {
					"Drakkari Battle Rider", -- [1]
					"Gundrak", -- [2]
				},
				[26125] = {
					"Masticacresas", -- [1]
					"Warsong Gulch", -- [2]
				},
				[30284] = {
					"Bonegrinder", -- [1]
					"Ahn'kahet: The Old Kingdom", -- [2]
				},
				[52498] = {
					"Beth'tilac", -- [1]
					"Firelands", -- [2]
				},
				[15240] = {
					"Vekniss Hive Crawler", -- [1]
					"Ahn'Qiraj Temple", -- [2]
				},
				[130318] = {
					"Slitherblade Prophet", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[142361] = {
					"Plaguefeather", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[15336] = {
					"Hive'Zara Tail Lasher", -- [1]
					"Ruins of Ahn'Qiraj", -- [2]
				},
				[33431] = {
					"Forest Swarmer", -- [1]
					"Ulduar", -- [2]
				},
				[18831] = {
					"High King Maulgar", -- [1]
					"Gruul's Lair", -- [2]
				},
				[79643] = {
					"Frostwing Screecher", -- [1]
					"FW Horde Garrison Level 3", -- [2]
				},
				[34199] = {
					"Lightning Charged Iron Dwarf", -- [1]
					"Ulduar", -- [2]
				},
				[101398] = {
					"Psyfiend", -- [1]
					"Eye of the Storm", -- [2]
				},
				[130319] = {
					"Slitherblade Phalanx", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[134173] = {
					"Animated Droplet", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[152089] = {
					"Thrall", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[132126] = {
					"Gilded Priestess", -- [1]
					"Atal'Dazar", -- [2]
				},
				[134174] = {
					"Shadow-Borne Witch Doctor", -- [1]
					"Kings' Rest", -- [2]
				},
				[159768] = {
					"Deresh of the Nothingness", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[139805] = {
					"Mechanical Guardhound", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[129552] = {
					"Monzumi", -- [1]
					"Atal'Dazar", -- [2]
				},
				[137246] = {
					"Alliance Siege Engine", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[133663] = {
					"Fanatical Headhunter", -- [1]
					"The Underrot", -- [2]
				},
				[151579] = {
					"Shield Generator", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[139806] = {
					"Venture Demolitions Expert", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[57746] = {
					"Faceless Destroyer", -- [1]
					"Dragon Soul", -- [2]
				},
				[12457] = {
					"Blackwing Spellbinder", -- [1]
					"Blackwing Lair", -- [2]
				},
				[20879] = {
					"Eredar Soul-Eater", -- [1]
					"Tempest Keep: The Arcatraz", -- [2]
				},
				[139807] = {
					"Venture Surveyor", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[129553] = {
					"Dinomancer Kish'o", -- [1]
					"Atal'Dazar", -- [2]
				},
				[139808] = {
					"Venture Oaf", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[133666] = {
					"Dizzy's Decoy", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[8906] = {
					"Ragereaver Golem", -- [1]
					"Blackrock Depths", -- [2]
				},
				[30285] = {
					"Eye of Taldaram", -- [1]
					"Ahn'kahet: The Old Kingdom", -- [2]
				},
				[68129] = {
					"Ashtongue Shaman", -- [1]
					"Pursuing the Black Harvest", -- [2]
				},
				[13257] = {
					"Murgot Deepforge", -- [1]
					"Alterac Valley", -- [2]
				},
				[53140] = {
					"Son of Flame", -- [1]
					"Firelands", -- [2]
				},
				[139810] = {
					"Venture Middle Manager", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[37144] = {
					"Skybreaker Marksman", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[153119] = {
					"Lesser Void Elemental", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[49813] = {
					"Evolved Drakonaar", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[18832] = {
					"Krosh Firehand", -- [1]
					"Gruul's Lair", -- [2]
				},
				[135204] = {
					"Spectral Hex Priest", -- [1]
					"Kings' Rest", -- [2]
				},
				[135716] = {
					"Nightsaber Hunter", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[140835] = {
					"Scheming Flame", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[138276] = {
					"Ironforge Siegebreaker", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[135717] = {
					"Wild Nightsaber", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[60051] = {
					"Cobalt Guardian", -- [1]
					"Mogu'shan Vaults", -- [2]
				},
				[14025] = {
					"Corrupted Bronze Whelp", -- [1]
					"Blackwing Lair", -- [2]
				},
				[43927] = {
					"Harbinger of Darkness", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[52373] = {
					"Florawing Needler", -- [1]
					"Zul'Gurub", -- [2]
				},
				[24207] = {
					"Army of the Dead", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[161312] = {
					"Crushing Tendril", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[53141] = {
					"Molten Surger", -- [1]
					"Firelands", -- [2]
				},
				[37017] = {
					"Skybreaker Assassin", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[16529] = {
					"Magical Horror", -- [1]
					"Karazhan", -- [2]
				},
				[16593] = {
					"Shattered Hand Brawler", -- [1]
					"Hellfire Citadel: The Shattered Halls", -- [2]
				},
				[20880] = {
					"Eredar Deathbringer", -- [1]
					"Tempest Keep: The Arcatraz", -- [2]
				},
				[159266] = {
					"Portal Master", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[14601] = {
					"Ebonroc", -- [1]
					"Blackwing Lair", -- [2]
				},
				[21136] = {
					"Infinite Chronomancer", -- [1]
					"Opening of the Dark Portal", -- [2]
				},
				[140839] = {
					"Water Spirit", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[130325] = {
					"Deepsea Viseclaw", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[130581] = {
					"Sand-Eye", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[160291] = {
					"Ashwalker Assassin", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[29838] = {
					"Drakkari Rhino", -- [1]
					"Gundrak", -- [2]
				},
				[138281] = {
					"Faceless Corruptor", -- [1]
					"The Underrot", -- [2]
				},
				[30286] = {
					"Frostbringer", -- [1]
					"Ahn'kahet: The Old Kingdom", -- [2]
				},
				[30414] = {
					"Forgotten One", -- [1]
					"Ahn'kahet: The Old Kingdom", -- [2]
				},
				[57109] = {
					"Minion of Doubt", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[15369] = {
					"Ayamiss the Hunter", -- [1]
					"Ruins of Ahn'Qiraj", -- [2]
				},
				[139818] = {
					"Security Officer Durk", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[57749] = {
					"Faceless Corruptor", -- [1]
					"Dragon Soul", -- [2]
				},
				[57877] = {
					"Flail of Go'rath", -- [1]
					"Dragon Soul", -- [2]
				},
				[11466] = {
					"Highborne Summoner", -- [1]
					"Dire Maul", -- [2]
				},
				[33819] = {
					"Twilight Frost Mage", -- [1]
					"Ulduar", -- [2]
				},
				[140843] = {
					"Air Spirit", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[11658] = {
					"Molten Giant", -- [1]
					"Molten Core", -- [2]
				},
				[134701] = {
					"Blood Effigy", -- [1]
					"The Underrot", -- [2]
				},
				[114715] = {
					"Ghostly Chef", -- [1]
					"Return to Karazhan", -- [2]
				},
				[78116] = {
					"Water Elemental", -- [1]
					"Tempest Keep: The Mechanar", -- [2]
				},
				[52375] = {
					"Florawing Needler", -- [1]
					"Zul'Gurub", -- [2]
				},
				[153130] = {
					"Greater Void Elemental", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[125977] = {
					"Reanimation Totem", -- [1]
					"Atal'Dazar", -- [2]
				},
				[130584] = {
					"Gorespike", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[114716] = {
					"Ghostly Baker", -- [1]
					"Return to Karazhan", -- [2]
				},
				[24656] = {
					"Fizzle", -- [1]
					"Magister's Terrace", -- [2]
				},
				[16530] = {
					"Mana Warp", -- [1]
					"Karazhan", -- [2]
				},
				[16594] = {
					"Shadowmoon Acolyte", -- [1]
					"Hellfire Citadel: The Shattered Halls", -- [2]
				},
				[12458] = {
					"Blackwing Taskmaster", -- [1]
					"Blackwing Lair", -- [2]
				},
				[20881] = {
					"Unbound Devastator", -- [1]
					"Tempest Keep: The Arcatraz", -- [2]
				},
				[33820] = {
					"Twilight Pyromancer", -- [1]
					"Ulduar", -- [2]
				},
				[21137] = {
					"Infinite Assassin", -- [1]
					"Opening of the Dark Portal", -- [2]
				},
				[159275] = {
					"Portal Keeper", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[140336] = {
					"Nightscale Wind Serpent", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[8907] = {
					"Wrath Hammer Construct", -- [1]
					"Blackrock Depths", -- [2]
				},
				[17938] = {
					"Coilfang Observer", -- [1]
					"Coilfang: The Slave Pens", -- [2]
				},
				[52376] = {
					"Florawing Needler", -- [1]
					"Zul'Gurub", -- [2]
				},
				[140337] = {
					"Nightscale Hatchling", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[144944] = {
					"Thirsting Bloodsucker", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[56855] = {
					"Twilight Assault Drake", -- [1]
					"Dragon Soul", -- [2]
				},
				[69161] = {
					"Devilsaur", -- [1]
					"Warsong Gulch", -- [2]
				},
				[61334] = {
					"Cursed Mogu Sculpture", -- [1]
					"Mogu'shan Vaults", -- [2]
				},
				[37148] = {
					"Skybreaker Summoner", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[57751] = {
					"Ruin Tentacle", -- [1]
					"Dragon Soul", -- [2]
				},
				[49817] = {
					"Bound Inferno", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[18834] = {
					"Olm the Summoner", -- [1]
					"Gruul's Lair", -- [2]
				},
				[62358] = {
					"Corrupt Droplet", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[112671] = {
					"Duskwatch Battle-Magus", -- [1]
					"The Nighthold", -- [2]
				},
				[9547] = {
					"Guzzling Patron", -- [1]
					"Blackrock Depths", -- [2]
				},
				[157231] = {
					"Shad'har the Insatiable", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[19218] = {
					"Gatewatcher Gyro-Kill", -- [1]
					"Tempest Keep: The Mechanar", -- [2]
				},
				[52377] = {
					"Florawing Needler", -- [1]
					"Zul'Gurub", -- [2]
				},
				[68139] = {
					"Suffering Soul Fragment", -- [1]
					"Pursuing the Black Harvest", -- [2]
				},
				[144948] = {
					"Leatherwing Hunter", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[149555] = {
					"Abomination", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[37021] = {
					"Skybreaker Vicar", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[144949] = {
					"Canopy Stalker", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[37533] = {
					"Rimefang", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[146485] = {
					"Nevara Nightshade", -- [1]
					"Warfronts Darkshore - Horde", -- [2]
				},
				[33822] = {
					"Twilight Guardian", -- [1]
					"Ulduar", -- [2]
				},
				[135736] = {
					"Gore", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[21138] = {
					"Infinite Executioner", -- [1]
					"Opening of the Dark Portal", -- [2]
				},
				[130333] = {
					"Gritplate Basilisk", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[17427] = {
					"Shattered Hand Archer", -- [1]
					"Hellfire Citadel: The Shattered Halls", -- [2]
				},
				[17491] = {
					"Laughing Skull Rogue", -- [1]
					"Hellfire Citadel: The Blood Furnace", -- [2]
				},
				[140344] = {
					"Sky Viper", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[153141] = {
					"Endless Hunger Totem", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[145975] = {
					"Stonehide Buck", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[140345] = {
					"Stormscreech", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[145976] = {
					"Stonehide Bull", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[15338] = {
					"Obsidian Destroyer", -- [1]
					"Ruins of Ahn'Qiraj", -- [2]
				},
				[15370] = {
					"Buru the Gorger", -- [1]
					"Ruins of Ahn'Qiraj", -- [2]
				},
				[32927] = {
					"Runemaster Molgeim", -- [1]
					"Ulduar", -- [2]
				},
				[157238] = {
					"Prophet Skitra", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[53786] = {
					"Blazing Monstrosity", -- [1]
					"Firelands", -- [2]
				},
				[145977] = {
					"Mammoth Stonehide", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[33567] = {
					"Deathsworn Zealot", -- [1]
					"Ulduar", -- [2]
				},
				[62360] = {
					"Corrupt Droplet", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[33823] = {
					"Twilight Slayer", -- [1]
					"Ulduar", -- [2]
				},
				[161334] = {
					"Gnashing Terror", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[11659] = {
					"Molten Destroyer", -- [1]
					"Molten Core", -- [2]
				},
				[130335] = {
					"Gritplate Crystaleye", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[59545] = {
					"The Golden Beetle", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[161335] = {
					"Void Horror", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[112676] = {
					"Nobleborn Warpcaster", -- [1]
					"The Nighthold", -- [2]
				},
				[52379] = {
					"Venomtip Needler", -- [1]
					"Zul'Gurub", -- [2]
				},
				[135231] = {
					"Spectral Brute", -- [1]
					"Kings' Rest", -- [2]
				},
				[16468] = {
					"Spectral Patron", -- [1]
					"Karazhan", -- [2]
				},
				[24722] = {
					"Fel Crystal", -- [1]
					"Magister's Terrace", -- [2]
				},
				[12459] = {
					"Blackwing Warlock", -- [1]
					"Blackwing Lair", -- [2]
				},
				[37663] = {
					"Darkfallen Noble", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[33824] = {
					"Twilight Shadowblade", -- [1]
					"Ulduar", -- [2]
				},
				[140863] = {
					"Rubywind Prankster", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[21395] = {
					"Protean Spawn", -- [1]
					"Tempest Keep: The Arcatraz", -- [2]
				},
				[151613] = {
					"Anti-Personnel Squirrel", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[59546] = {
					"The Talking Fish", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[8908] = {
					"Molten War Golem", -- [1]
					"Blackrock Depths", -- [2]
				},
				[43934] = {
					"Soul Fragment", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[17940] = {
					"Coilfang Technician", -- [1]
					"Coilfang: The Slave Pens", -- [2]
				},
				[52380] = {
					"Venomancer Mauri", -- [1]
					"Zul'Gurub", -- [2]
				},
				[140353] = {
					"Brightscale Coilfang", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[129826] = {
					"Brineshell Snapclaw", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[158781] = {
					"Shredded Psyche", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[135235] = {
					"Spectral Beastmaster", -- [1]
					"Kings' Rest", -- [2]
				},
				[140354] = {
					"Brightscale Wind Serpent", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[49821] = {
					"Bound Zephyr", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[37664] = {
					"Darkfallen Archmage", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[140355] = {
					"Brightscale Screecher", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[129827] = {
					"Brineshell Crusher", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[19220] = {
					"Pathaleon the Calculator", -- [1]
					"Tempest Keep: The Mechanar", -- [2]
				},
				[59547] = {
					"Jiang", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[140356] = {
					"Brightscale Hatchling", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[19668] = {
					"Shadowfiend", -- [1]
					"Eye of the Storm", -- [2]
				},
				[134214] = {
					"Riftblade Kelain", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[52381] = {
					"Venomancer T'Kulu", -- [1]
					"Zul'Gurub", -- [2]
				},
				[140357] = {
					"Venomreaver", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[129828] = {
					"Brineshell Clacker", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[135239] = {
					"Spectral Witch Doctor", -- [1]
					"Kings' Rest", -- [2]
				},
				[37025] = {
					"Stinky", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[24723] = {
					"Selin Fireheart", -- [1]
					"Magister's Terrace", -- [2]
				},
				[75058] = {
					"Twilight Aquamancer", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[37665] = {
					"Darkfallen Lieutenant", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[138823] = {
					"Bloodwake Wayfinder", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[21140] = {
					"Rift Lord", -- [1]
					"Opening of the Dark Portal", -- [2]
				},
				[137288] = {
					"Champion of Ironforge", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[138824] = {
					"Halfid Ironeye", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[17429] = {
					"Fel Orc Neophyte", -- [1]
					"Hellfire Citadel: The Blood Furnace", -- [2]
				},
				[17621] = {
					"Heathen Guard", -- [1]
					"Hellfire Citadel: The Shattered Halls", -- [2]
				},
				[17941] = {
					"Mennu the Betrayer", -- [1]
					"Coilfang: The Slave Pens", -- [2]
				},
				[157253] = {
					"Ka'zir", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[15275] = {
					"Emperor Vek'nilash", -- [1]
					"Ahn'Qiraj Temple", -- [2]
				},
				[15339] = {
					"Ossirian the Unscarred", -- [1]
					"Ruins of Ahn'Qiraj", -- [2]
				},
				[139338] = {
					"Icetusk Prophet", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[37026] = {
					"Skybreaker Sorcerer", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[157254] = {
					"Tek'ris", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[37666] = {
					"Darkfallen Tactician", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[33699] = {
					"Storm Tempered Keeper", -- [1]
					"Ulduar", -- [2]
				},
				[139339] = {
					"Icetusk Defender", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[15691] = {
					"The Curator", -- [1]
					"Karazhan", -- [2]
				},
				[157255] = {
					"Aqir Drone", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[19221] = {
					"Nethermancer Sepethrea", -- [1]
					"Tempest Keep: The Mechanar", -- [2]
				},
				[158279] = {
					"Haywire Clockwork Rocket Bot", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[159303] = {
					"Monstrous Behemoth", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[139340] = {
					"Icetusk Necromancer", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[157256] = {
					"Aqir Darter", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[11948] = {
					"Vanndar Stormpike", -- [1]
					"Alterac Valley", -- [2]
				},
				[135246] = {
					"\"Stabby\" Lottie", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[12076] = {
					"Lava Elemental", -- [1]
					"Molten Core", -- [2]
				},
				[68151] = {
					"Essence of Order", -- [1]
					"Pursuing the Black Harvest", -- [2]
				},
				[144972] = {
					"Kaldorei Huntress", -- [1]
					"Warfronts Darkshore - Horde", -- [2]
				},
				[44577] = {
					"General Husam", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[12236] = {
					"Lord Vyletongue", -- [1]
					"Maraudon", -- [2]
				},
				[159305] = {
					"Maddened Conscript", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[139342] = {
					"Icetusk Warrior", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[135759] = {
					"Earthwall Totem", -- [1]
					"Kings' Rest", -- [2]
				},
				[144973] = {
					"Kaldorei Sentinel", -- [1]
					"Warfronts Darkshore - Horde", -- [2]
				},
				[53791] = {
					"Blazing Monstrosity", -- [1]
					"Firelands", -- [2]
				},
				[12460] = {
					"Death Talon Wyrmguard", -- [1]
					"Blackwing Lair", -- [2]
				},
				[33572] = {
					"Steelforged Defender", -- [1]
					"Ulduar", -- [2]
				},
				[139343] = {
					"Icetusk Drudge", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[135760] = {
					"7th Legion Marine", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[46753] = {
					"Al'Akir", -- [1]
					"Throne of the Four Winds", -- [2]
				},
				[135761] = {
					"Thundering Totem", -- [1]
					"Kings' Rest", -- [2]
				},
				[158284] = {
					"Craggle Wobbletop", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[8909] = {
					"Fireguard", -- [1]
					"Blackrock Depths", -- [2]
				},
				[159308] = {
					"Zealous Adherent", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[17942] = {
					"Quagmirran", -- [1]
					"Coilfang: The Slave Pens", -- [2]
				},
				[9037] = {
					"Gloom'rel", -- [1]
					"Blackrock Depths", -- [2]
				},
				[13196] = {
					"Phase Lasher", -- [1]
					"Dire Maul", -- [2]
				},
				[158285] = {
					"Tinkered Shieldbot", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[159309] = {
					"Leeching Parasite", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[139346] = {
					"Soul-Speaker Galani", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[135763] = {
					"Voidling", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[111151] = {
					"Midnight Siphoner", -- [1]
					"The Nighthold", -- [2]
				},
				[158286] = {
					"Reprogrammed Warbot", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[139347] = {
					"Berserker Gola", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[135764] = {
					"Explosive Totem", -- [1]
					"Kings' Rest", -- [2]
				},
				[106545] = {
					"Empowered Eye of Gul'dan", -- [1]
					"The Nighthold", -- [2]
				},
				[135765] = {
					"Torrent Totem", -- [1]
					"Kings' Rest", -- [2]
				},
				[13996] = {
					"Blackwing Technician", -- [1]
					"Blackwing Lair", -- [2]
				},
				[120366] = {
					"Hellblaze Temptress", -- [1]
					"Cathedral of Eternal Night", -- [2]
				},
				[159312] = {
					"Living Blood", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[14188] = {
					"Dirk Swindle", -- [1]
					"Alterac Valley", -- [2]
				},
				[65310] = {
					"Turnip Punching Bag", -- [1]
					"Isle of Conquest", -- [2]
				},
				[138838] = {
					"Zara'thik Mantid", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[16407] = {
					"Spectral Servant", -- [1]
					"Karazhan", -- [2]
				},
				[69947] = {
					"Rammus", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[53793] = {
					"Harbinger of Flame", -- [1]
					"Firelands", -- [2]
				},
				[49826] = {
					"Bound Rumbler", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[20886] = {
					"Wrath-Scryer Soccothrates", -- [1]
					"Tempest Keep: The Arcatraz", -- [2]
				},
				[138840] = {
					"Zara'thik Impaler", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[59552] = {
					"The Crybaby Hozen", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[157268] = {
					"Crawling Corruption", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[137817] = {
					"Cresting Exile", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[138841] = {
					"Zara'thik Battlesinger", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[139353] = {
					"Unliving Champion", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[135770] = {
					"Veteran Sergeant Slayde", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[15276] = {
					"Emperor Vek'lor", -- [1]
					"Ahn'Qiraj Temple", -- [2]
				},
				[15340] = {
					"Moam", -- [1]
					"Ruins of Ahn'Qiraj", -- [2]
				},
				[136283] = {
					"Dark Iron Doom-Singer", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[53794] = {
					"Smouldering Hatchling", -- [1]
					"Firelands", -- [2]
				},
				[137819] = {
					"Thundering Exile", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[11469] = {
					"Eldreth Seether", -- [1]
					"Dire Maul", -- [2]
				},
				[11501] = {
					"King Gordok", -- [1]
					"Dire Maul", -- [2]
				},
				[11661] = {
					"Flamewaker", -- [1]
					"Molten Core", -- [2]
				},
				[137820] = {
					"Rumbling Exile", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[138844] = {
					"Ya'vik the Imperial Blade", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[59553] = {
					"The Songbird Queen", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[19735] = {
					"Tempest-Forge Destroyer", -- [1]
					"Tempest Keep: The Mechanar", -- [2]
				},
				[11981] = {
					"Flamegor", -- [1]
					"Blackwing Lair", -- [2]
				},
				[138845] = {
					"Commander Jo'vak", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[139357] = {
					"Icetusk Shambler", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[61345] = {
					"Mogu Archer", -- [1]
					"Mogu'shan Vaults", -- [2]
				},
				[16408] = {
					"Phantom Valet", -- [1]
					"Karazhan", -- [2]
				},
				[16472] = {
					"Phantom Stagehand", -- [1]
					"Karazhan", -- [2]
				},
				[53795] = {
					"Egg Pile", -- [1]
					"Firelands", -- [2]
				},
				[12461] = {
					"Death Talon Overseer", -- [1]
					"Blackwing Lair", -- [2]
				},
				[12557] = {
					"Grethok the Controller", -- [1]
					"Blackwing Lair", -- [2]
				},
				[138848] = {
					"Blade-Dancer Zorlak", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[139360] = {
					"Risen Icetusk Brute", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[152669] = {
					"Void Globule", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[17624] = {
					"Laughing Skull Warden", -- [1]
					"Hellfire Citadel: The Blood Furnace", -- [2]
				},
				[43686] = {
					"Ignacious", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[17816] = {
					"Bogstrok", -- [1]
					"Coilfang: The Slave Pens", -- [2]
				},
				[138849] = {
					"Hivelord Vix'ick", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[9038] = {
					"Seeth'rel", -- [1]
					"Blackrock Depths", -- [2]
				},
				[13197] = {
					"Fel Lash", -- [1]
					"Dire Maul", -- [2]
				},
				[138338] = {
					"Reanimated Guardian", -- [1]
					"The Underrot", -- [2]
				},
				[144993] = {
					"Crazed Thistlebear", -- [1]
					"Warfronts Darkshore - Horde", -- [2]
				},
				[151649] = {
					"Defense Bot Mk I", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[59555] = {
					"Haunting Sha", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[43687] = {
					"Feludius", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[120374] = {
					"Felguard Destroyer", -- [1]
					"Cathedral of Eternal Night", -- [2]
				},
				[61347] = {
					"Kingsguard", -- [1]
					"Mogu'shan Vaults", -- [2]
				},
				[16409] = {
					"Phantom Guest", -- [1]
					"Karazhan", -- [2]
				},
				[32938] = {
					"Flash Freeze", -- [1]
					"Ulduar", -- [2]
				},
				[136295] = {
					"Sunken Denizen", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[46375] = {
					"Rowdy Troublemaker", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[132713] = {
					"Mogul Razdunk", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[136297] = {
					"Forgotten Denizen", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[43688] = {
					"Arion", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[17817] = {
					"Greater Bogstrok", -- [1]
					"Coilfang: The Slave Pens", -- [2]
				},
				[17881] = {
					"Aeonus", -- [1]
					"Opening of the Dark Portal", -- [2]
				},
				[60708] = {
					"Meng the Demented", -- [1]
					"Mogu'shan Vaults", -- [2]
				},
				[15277] = {
					"Anubisath Defender", -- [1]
					"Ahn'Qiraj Temple", -- [2]
				},
				[134251] = {
					"Seneschal M'bara", -- [1]
					"Kings' Rest", -- [2]
				},
				[61348] = {
					"Lorewalker Cho", -- [1]
					"Mogu'shan Vaults", -- [2]
				},
				[145001] = {
					"Lanara Moonshade", -- [1]
					"Warfronts Darkshore - Horde", -- [2]
				},
				[137835] = {
					"Vicious Black Bear", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[11470] = {
					"Eldreth Sorcerer", -- [1]
					"Dire Maul", -- [2]
				},
				[11502] = {
					"Ragnaros", -- [1]
					"Molten Core", -- [2]
				},
				[46248] = {
					"Riverpaw Basher", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[11662] = {
					"Flamewaker Priest", -- [1]
					"Molten Core", -- [2]
				},
				[137836] = {
					"Wild Horse", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[47016] = {
					"Shadow Lord", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[151657] = {
					"Bomb Tonk", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[111164] = {
					"Twilight Stardancer", -- [1]
					"The Nighthold", -- [2]
				},
				[149098] = {
					"Maiev Shadowsong", -- [1]
					"Warfronts Darkshore - Horde", -- [2]
				},
				[161895] = {
					"Thing From Beyond", -- [1]
					"Kings' Rest", -- [2]
				},
				[43689] = {
					"Terrastra", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[11982] = {
					"Magmadar", -- [1]
					"Molten Core", -- [2]
				},
				[151658] = {
					"Strider Tonk", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[60709] = {
					"Qiang the Merciless", -- [1]
					"Mogu'shan Vaults", -- [2]
				},
				[137838] = {
					"Rampaging Owlbeast", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[151659] = {
					"Rocket Tonk", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[24664] = {
					"Kael'thas Sunstrider", -- [1]
					"Magister's Terrace", -- [2]
				},
				[61989] = {
					"Cursed Mogu Sculpture", -- [1]
					"Mogu'shan Vaults", -- [2]
				},
				[134768] = {
					"Sandskitter the Relentless", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[46249] = {
					"Riverpaw Slayer", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[158315] = {
					"Eye of Chaos", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[134769] = {
					"Jagged Claw", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[111166] = {
					"Resolute Courtesan", -- [1]
					"The Nighthold", -- [2]
				},
				[17626] = {
					"Laughing Skull Legionnaire", -- [1]
					"Hellfire Citadel: The Blood Furnace", -- [2]
				},
				[8911] = {
					"Fireguard Destroyer", -- [1]
					"Blackrock Depths", -- [2]
				},
				[163947] = {
					"Psychophage", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[52392] = {
					"Gurubashi Master Chef", -- [1]
					"Zul'Gurub", -- [2]
				},
				[60710] = {
					"Subetai the Swift", -- [1]
					"Mogu'shan Vaults", -- [2]
				},
				[65317] = {
					"Xiang", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[13358] = {
					"Stormpike Bowman", -- [1]
					"Alterac Valley", -- [2]
				},
				[46250] = {
					"Riverpaw Poacher", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[74569] = {
					"Restorative Waters", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[130620] = {
					"Frostfencer Seraphi", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[57384] = {
					"Cobalt Globule", -- [1]
					"Dragon Soul", -- [2]
				},
				[53545] = {
					"Molten Spewer", -- [1]
					"Firelands", -- [2]
				},
				[162417] = {
					"Anubisath Sentinel", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[33838] = {
					"Enslaved Fire Elemental", -- [1]
					"Ulduar", -- [2]
				},
				[33966] = {
					"Crusher Tentacle", -- [1]
					"Ulduar", -- [2]
				},
				[46379] = {
					"Vicious Thug", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[157811] = {
					"Lilliam Sparkspindle", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[130621] = {
					"Squallshaper Bryson", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[21466] = {
					"Harbinger Skyriss", -- [1]
					"Tempest Keep: The Arcatraz", -- [2]
				},
				[69964] = {
					"Kanrethad Ebonlocke", -- [1]
					"Pursuing the Black Harvest", -- [2]
				},
				[111170] = {
					"Astral Farseer", -- [1]
					"The Nighthold", -- [2]
				},
				[157812] = {
					"Billibub Cogspinner", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[68173] = {
					"Freed Imp", -- [1]
					"Pursuing the Black Harvest", -- [2]
				},
				[157813] = {
					"Sprite Jumpsprocket", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[130622] = {
					"Squallshaper Auran", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[37038] = {
					"Vengeful Fleshreaper", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[162933] = {
					"Thought Harvester", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[75852] = {
					"Corrupted Healing Totem", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[46252] = {
					"Riverpaw Shaman", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[68174] = {
					"Unbound Nightlord", -- [1]
					"Pursuing the Black Harvest", -- [2]
				},
				[136828] = {
					"Witherbranch Warrior", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[11663] = {
					"Flamewaker Healer", -- [1]
					"Molten Core", -- [2]
				},
				[158327] = {
					"Crackling Shard", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[11791] = {
					"Putridus Trickster", -- [1]
					"Maraudon", -- [2]
				},
				[35119] = {
					"Eadric the Pure", -- [1]
					"Trial of the Champion", -- [2]
				},
				[136829] = {
					"Witherbranch Axe Thrower", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[158328] = {
					"Il'gynoth", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[11983] = {
					"Firemaw", -- [1]
					"Blackwing Lair", -- [2]
				},
				[139389] = {
					"Steelscale Volshasis", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[20059] = {
					"Sunseeker Netherbinder", -- [1]
					"Tempest Keep: The Mechanar", -- [2]
				},
				[68175] = {
					"Unbound Bonemender", -- [1]
					"Pursuing the Black Harvest", -- [2]
				},
				[136830] = {
					"Witherbranch Headhunter", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[57386] = {
					"Crimson Globule", -- [1]
					"Dragon Soul", -- [2]
				},
				[156794] = {
					"SI:7 Light-Hunter", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[136831] = {
					"Witherbranch Witch Doctor", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[12463] = {
					"Death Talon Flamescale", -- [1]
					"Blackwing Lair", -- [2]
				},
				[139391] = {
					"Darkwave Assassin", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[62633] = {
					"Sik'thik Builder", -- [1]
					"Siege of Niuzao Temple", -- [2]
				},
				[156795] = {
					"SI:7 Informant", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[136832] = {
					"Witherbranch Berserker", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[21467] = {
					"Harbinger Skyriss", -- [1]
					"Tempest Keep: The Arcatraz", -- [2]
				},
				[136833] = {
					"Witherbranch Venom Priest", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[8912] = {
					"Twilight's Hammer Torturer", -- [1]
					"Blackrock Depths", -- [2]
				},
				[116549] = {
					"Backup Singer", -- [1]
					"Return to Karazhan", -- [2]
				},
				[9040] = {
					"Dope'rel", -- [1]
					"Blackrock Depths", -- [2]
				},
				[136834] = {
					"Scalper Bazuulu", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[134787] = {
					"Spineclaw Crab", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[57387] = {
					"Glowing Globule", -- [1]
					"Dragon Soul", -- [2]
				},
				[132740] = {
					"Venomscale Hydra", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[45870] = {
					"Anshal", -- [1]
					"Throne of the Four Winds", -- [2]
				},
				[134788] = {
					"Spineclaw Rockshell", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[139395] = {
					"Mirelurk Bogtender", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[46254] = {
					"Hogger", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[152704] = {
					"Crawling Corruption", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[132741] = {
					"Flamescale Hydra", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[134789] = {
					"Monstrous Spineclaw", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[47150] = {
					"Earth Ravager", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[148610] = {
					"Druid of the Branch", -- [1]
					"Warfronts Darkshore - Horde", -- [2]
				},
				[132742] = {
					"Flamescale Strider", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[108361] = {
					"Crystalline Scorpid", -- [1]
					"The Nighthold", -- [2]
				},
				[139397] = {
					"Mirelurk Lurker", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[161408] = {
					"Malicious Growth", -- [1]
					"Atal'Dazar", -- [2]
				},
				[157825] = {
					"Crazed Tormenter", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[162432] = {
					"Awakened Terror", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[134791] = {
					"Luminous Crawler", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[57388] = {
					"Shadowed Globule", -- [1]
					"Dragon Soul", -- [2]
				},
				[28826] = {
					"Stormfury Revenant", -- [1]
					"Halls of Lightning", -- [2]
				},
				[132744] = {
					"Frostscale Hydra", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[75090] = {
					"Deep Terror", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[45871] = {
					"Nezir", -- [1]
					"Throne of the Four Winds", -- [2]
				},
				[138887] = {
					"Bloodwake Mystic", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[46383] = {
					"Randolph Moloch", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[132745] = {
					"Frostscale Wanderer", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[47151] = {
					"Wind Breaker", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[135817] = {
					"Zephyr", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[25755] = {
					"Ahunite Hailstone", -- [1]
					"Coilfang: The Slave Pens", -- [2]
				},
				[132746] = {
					"Frostscale Broodmother", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[134794] = {
					"Darklurker", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[135818] = {
					"Gust Soldier", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[140425] = {
					"Surefoot", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[15247] = {
					"Qiraji Brainwasher", -- [1]
					"Ahn'Qiraj Temple", -- [2]
				},
				[15311] = {
					"Anubisath Warder", -- [1]
					"Ahn'Qiraj Temple", -- [2]
				},
				[134795] = {
					"Veiled Hermit", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[135819] = {
					"Living Tornado", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[57773] = {
					"Kohcrom", -- [1]
					"Dragon Soul", -- [2]
				},
				[134284] = {
					"Fallen Deathspeaker", -- [1]
					"The Underrot", -- [2]
				},
				[140427] = {
					"Craghoof Herdfather", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[15727] = {
					"C'Thun", -- [1]
					"Ahn'Qiraj Temple", -- [2]
				},
				[11664] = {
					"Flamewaker Elite", -- [1]
					"Molten Core", -- [2]
				},
				[158343] = {
					"Organ of Corruption", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[114251] = {
					"Galindre", -- [1]
					"Return to Karazhan", -- [2]
				},
				[106317] = {
					"Storm Totem", -- [1]
					"Eye of the Storm", -- [2]
				},
				[47152] = {
					"Twilight Elementalist", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[131726] = {
					"Gunnolf the Ferocious", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[148618] = {
					"Archdruid Andrenius", -- [1]
					"Warfronts Darkshore - Horde", -- [2]
				},
				[145035] = {
					"Swifttail Courser", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[134286] = {
					"Archmage Tamuura", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[131727] = {
					"Fenrae the Cunning", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[160904] = {
					"Image of Absolution", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[161416] = {
					"Aqir Shadowcrafter", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[53167] = {
					"Unbound Pyrelord", -- [1]
					"Firelands", -- [2]
				},
				[16414] = {
					"Ghostly Steward", -- [1]
					"Karazhan", -- [2]
				},
				[131728] = {
					"Raul the Tenacious", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[140430] = {
					"Craghoof Bounder", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[136847] = {
					"Sandscalp Shadow Hunter", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[12464] = {
					"Death Talon Seether", -- [1]
					"Blackwing Lair", -- [2]
				},
				[131729] = {
					"Lyco", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[140431] = {
					"Craghoof Goat", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[136848] = {
					"Sandscalp Soothsayer", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[106319] = {
					"Ember Totem", -- [1]
					"Eye of the Storm", -- [2]
				},
				[140432] = {
					"Craghoof Leaper", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[136849] = {
					"Sandscalp Berserker", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[17694] = {
					"Shadowmoon Darkcaster", -- [1]
					"Hellfire Citadel: The Shattered Halls", -- [2]
				},
				[8913] = {
					"Twilight Emissary", -- [1]
					"Blackrock Depths", -- [2]
				},
				[134802] = {
					"Razorback", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[152718] = {
					"Alleria Windrunner", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[132755] = {
					"Breakbeak Scavenger", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[139410] = {
					"Visz the Silent Blade", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[26716] = {
					"Azure Warder", -- [1]
					"The Nexus", -- [2]
				},
				[140434] = {
					"Craghoof Rockhorn", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[13456] = {
					"Noxxion's Spawn", -- [1]
					"Maraudon", -- [2]
				},
				[19166] = {
					"Tempest-Forge Patroller", -- [1]
					"Tempest Keep: The Mechanar", -- [2]
				},
				[130635] = {
					"Stonefury", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[106321] = {
					"Tailwind Totem", -- [1]
					"The Battle for Gilneas", -- [2]
				},
				[135830] = {
					"Galefury", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[152722] = {
					"Fallen Voidspeaker", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[16415] = {
					"Skeletal Waiter", -- [1]
					"Karazhan", -- [2]
				},
				[156818] = {
					"Wrathion", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[132760] = {
					"Plains Creeper", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[37813] = {
					"Deathbringer Saurfang", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[105299] = {
					"Recursive Elemental", -- [1]
					"The Nighthold", -- [2]
				},
				[137880] = {
					"Northfold Defender", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[156820] = {
					"Dod", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[17695] = {
					"Shattered Hand Assassin", -- [1]
					"Hellfire Citadel: The Shattered Halls", -- [2]
				},
				[137881] = {
					"Northfold Knight", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[135322] = {
					"The Golden Serpent", -- [1]
					"Kings' Rest", -- [2]
				},
				[160404] = {
					"Angry Bear Rug Spirit", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[52530] = {
					"Alysrazor", -- [1]
					"Firelands", -- [2]
				},
				[137882] = {
					"Northfold Arbalest", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[130638] = {
					"Vicejaw Crocolisk", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[15344] = {
					"Swarmguard Needler", -- [1]
					"Ruins of Ahn'Qiraj", -- [2]
				},
				[160405] = {
					"Angry Treant Chair Spirit", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[140442] = {
					"Muskflank Yak", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[11441] = {
					"Gordok Brute", -- [1]
					"Dire Maul", -- [2]
				},
				[11473] = {
					"Eldreth Spectre", -- [1]
					"Dire Maul", -- [2]
				},
				[46260] = {
					"Searing Destroyer", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[140443] = {
					"Muskflank Charger", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[105301] = {
					"Expedient Elemental", -- [1]
					"The Nighthold", -- [2]
				},
				[19231] = {
					"Mechanar Crusher", -- [1]
					"Tempest Keep: The Mechanar", -- [2]
				},
				[130639] = {
					"Vicejaw Chomper", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[135837] = {
					"Cyclonic Lieutenant", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[140444] = {
					"Muskflank Bull", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[15984] = {
					"Sartura's Royal Guard", -- [1]
					"Ahn'Qiraj Temple", -- [2]
				},
				[116563] = {
					"Ancient Core Hound", -- [1]
					"Return to Karazhan", -- [2]
				},
				[104534] = {
					"D'zorykx the Trapper", -- [1]
					"The Nighthold", -- [2]
				},
				[136862] = {
					"Orgo", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[130640] = {
					"Vicejaw Sawtooth", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[44981] = {
					"Oathsworn Skinner", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[135327] = {
					"Dwarven Mortar", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[16544] = {
					"Ethereal Thief", -- [1]
					"Karazhan", -- [2]
				},
				[12465] = {
					"Death Talon Wyrmkin", -- [1]
					"Blackwing Lair", -- [2]
				},
				[46261] = {
					"Enraged Fire Elemental", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[153244] = {
					"Oblivion Elemental", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[114261] = {
					"Toe Knee", -- [1]
					"Return to Karazhan", -- [2]
				},
				[122963] = {
					"Rezan", -- [1]
					"Atal'Dazar", -- [2]
				},
				[136353] = {
					"Colossal Tentacle", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[8914] = {
					"Twilight Bodyguard", -- [1]
					"Blackrock Depths", -- [2]
				},
				[52148] = {
					"Jin'do the Godbreaker", -- [1]
					"Zul'Gurub", -- [2]
				},
				[17952] = {
					"Darkwater Crocolisk", -- [1]
					"Opening of the Dark Portal", -- [2]
				},
				[9042] = {
					"Verek", -- [1]
					"Blackrock Depths", -- [2]
				},
				[126291] = {
					"Alliance Footman", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[114262] = {
					"Attumen the Huntsman", -- [1]
					"Return to Karazhan", -- [2]
				},
				[44982] = {
					"Neferset Darkcaster", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[127315] = {
					"Reanimation Totem", -- [1]
					"Atal'Dazar", -- [2]
				},
				[123476] = {
					"Hulking Demolisher", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[161437] = {
					"Explosive Scarab", -- [1]
					"Atal'Dazar", -- [2]
				},
				[46262] = {
					"Rumbling Earth", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[9554] = {
					"Hammered Patron", -- [1]
					"Blackrock Depths", -- [2]
				},
				[145058] = {
					"Shadefeather Raven", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[153760] = {
					"Enthralled Footman", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[158367] = {
					"Basher Tentacle", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[143011] = {
					"Sandy Perch", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[122965] = {
					"Vol'kaal", -- [1]
					"Atal'Dazar", -- [2]
				},
				[145059] = {
					"Cunning Nightwing", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[134822] = {
					"Gritplate Matriarch", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[139429] = {
					"Stonebound Warrior", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[160416] = {
					"Angry Ale Barrel Spirit", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[140453] = {
					"Bramblefur Herdleader", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[145060] = {
					"Monstrous Shadefeather", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[146596] = {
					"Darkscale Myrmidon", -- [1]
					"Warfronts Darkshore - Horde", -- [2]
				},
				[14321] = {
					"Guard Fengus", -- [1]
					"Dire Maul", -- [2]
				},
				[139430] = {
					"Zaliz' Eternal Hound", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[16481] = {
					"Ghastly Haunt", -- [1]
					"Karazhan", -- [2]
				},
				[123478] = {
					"Antoran Felguard", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[145061] = {
					"Screeching Nightwing", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[20896] = {
					"Ethereum Slayer", -- [1]
					"Tempest Keep: The Arcatraz", -- [2]
				},
				[33722] = {
					"Storm Tempered Keeper", -- [1]
					"Ulduar", -- [2]
				},
				[139431] = {
					"Guardian of Tombs", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[46263] = {
					"Slag Fury", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[140455] = {
					"Bramblefur Calf", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[34234] = {
					"Runeforged Sentry", -- [1]
					"Ulduar", -- [2]
				},
				[158371] = {
					"Zardeth of the Black Claw", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[114265] = {
					"Gang Ruffian", -- [1]
					"Return to Karazhan", -- [2]
				},
				[17377] = {
					"Keli'dan the Breaker", -- [1]
					"Hellfire Citadel: The Blood Furnace", -- [2]
				},
				[122967] = {
					"Priestess Alun'za", -- [1]
					"Atal'Dazar", -- [2]
				},
				[140456] = {
					"Bramblefur Musken", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[140968] = {
					"Garnetback Striker", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[29982] = {
					"Drakkari Raider", -- [1]
					"Gundrak", -- [2]
				},
				[139433] = {
					"Sister of Anguish", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[160420] = {
					"Angry Book Spirit", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[140457] = {
					"Bramblefur Grazer", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[157349] = {
					"Void Boar", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[44600] = {
					"Halfus Wyrmbreaker", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[114266] = {
					"Shoreline Tidespeaker", -- [1]
					"Return to Karazhan", -- [2]
				},
				[122968] = {
					"Yazma", -- [1]
					"Atal'Dazar", -- [2]
				},
				[140458] = {
					"Bramblefur Bull", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[140970] = {
					"Cragburster", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[15505] = {
					"Canal Frenzy", -- [1]
					"Ruins of Ahn'Qiraj", -- [2]
				},
				[15537] = {
					"Anubisath Warrior", -- [1]
					"Ahn'Qiraj Temple", -- [2]
				},
				[134828] = {
					"Aqualing", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[46264] = {
					"Lord Overheat", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[11666] = {
					"Firewalker", -- [1]
					"Molten Core", -- [2]
				},
				[158375] = {
					"Corruptor Tentacle", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[122969] = {
					"Zanchuli Witch-Doctor", -- [1]
					"Atal'Dazar", -- [2]
				},
				[145067] = {
					"Shadefeather Hatchling", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[158376] = {
					"Psychus", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[19873] = {
					"Lord Crispin Ference", -- [1]
					"Karazhan", -- [2]
				},
				[52151] = {
					"Bloodlord Mandokir", -- [1]
					"Zul'Gurub", -- [2]
				},
				[12050] = {
					"Stormpike Defender", -- [1]
					"Alterac Valley", -- [2]
				},
				[140973] = {
					"Bore Tunneler", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[122970] = {
					"Shadowblade Stalker", -- [1]
					"Atal'Dazar", -- [2]
				},
				[16482] = {
					"Trapped Soul", -- [1]
					"Karazhan", -- [2]
				},
				[160937] = {
					"Night Terror", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[157354] = {
					"Vexiona", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[20897] = {
					"Ethereum Wave-Caster", -- [1]
					"Tempest Keep: The Arcatraz", -- [2]
				},
				[129369] = {
					"Irontide Raider", -- [1]
					"Siege of Boralus", -- [2]
				},
				[140975] = {
					"Youngercraw", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[122971] = {
					"Dazar'ai Juggernaut", -- [1]
					"Atal'Dazar", -- [2]
				},
				[140976] = {
					"Bore Worm", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[142000] = {
					"Haunting Tendril", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[30111] = {
					"Twilight Worshipper", -- [1]
					"Ahn'kahet: The Old Kingdom", -- [2]
				},
				[129370] = {
					"Irontide Waveshaper", -- [1]
					"Siege of Boralus", -- [2]
				},
				[159405] = {
					"Aqir Scarab", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[122972] = {
					"Dazar'ai Augur", -- [1]
					"Atal'Dazar", -- [2]
				},
				[139443] = {
					"Spinebender Kuntai", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[129371] = {
					"Riptide Shredder", -- [1]
					"Siege of Boralus", -- [2]
				},
				[139444] = {
					"Necrolord Zian", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[19874] = {
					"Baron Rafe Dreuger", -- [1]
					"Karazhan", -- [2]
				},
				[139445] = {
					"Tumat", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[52409] = {
					"Ragnaros", -- [1]
					"Firelands", -- [2]
				},
				[14354] = {
					"Pusillin", -- [1]
					"Dire Maul", -- [2]
				},
				[14386] = {
					"Wandering Eye of Kilrogg", -- [1]
					"Dire Maul", -- [2]
				},
				[140982] = {
					"Icecracker", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[54073] = {
					"Flamewaker Hound Master", -- [1]
					"Firelands", -- [2]
				},
				[129373] = {
					"Dockhound Packmaster", -- [1]
					"Siege of Boralus", -- [2]
				},
				[68204] = {
					"Unbound Rogue", -- [1]
					"Pursuing the Black Harvest", -- [2]
				},
				[140983] = {
					"Frostbore Burster", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[141495] = {
					"Kul Tiran Footman", -- [1]
					"Siege of Boralus", -- [2]
				},
				[21346] = {
					"Sightless Eye", -- [1]
					"Tempest Keep: The Arcatraz", -- [2]
				},
				[130653] = {
					"Wanton Sapper", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[130909] = {
					"Fetid Maggot", -- [1]
					"The Underrot", -- [2]
				},
				[1863] = {
					"Драйви", -- [1]
					"Warsong Gulch", -- [2]
				},
				[43324] = {
					"Cho'gall", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[140984] = {
					"Frostbore Worm", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[64183] = {
					"Enormous Stone Quilen", -- [1]
					"Mogu'shan Vaults", -- [2]
				},
				[56249] = {
					"Twilight Assaulter", -- [1]
					"Dragon Soul", -- [2]
				},
				[68205] = {
					"Unbound Succubus", -- [1]
					"Pursuing the Black Harvest", -- [2]
				},
				[157365] = {
					"Crackling Stalker", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[15250] = {
					"Qiraji Slayer", -- [1]
					"Ahn'Qiraj Temple", -- [2]
				},
				[134331] = {
					"King Rahu'ai", -- [1]
					"Kings' Rest", -- [2]
				},
				[157366] = {
					"Void Hunter", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[11475] = {
					"Eldreth Phantasm", -- [1]
					"Dire Maul", -- [2]
				},
				[68206] = {
					"Unbound Shivarra", -- [1]
					"Pursuing the Black Harvest", -- [2]
				},
				[132797] = {
					"Pinegraze Calf", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[11667] = {
					"Flameguard", -- [1]
					"Molten Core", -- [2]
				},
				[138428] = {
					"Spitefin Myrmidon", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[140988] = {
					"Steelshred", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[138429] = {
					"Spitefin Tidebinder", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[159416] = {
					"Spiked Tentacle", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[140989] = {
					"Bonescale Worm", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[159417] = {
					"Demented Knife-Twister", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[24674] = {
					"Phoenix", -- [1]
					"Magister's Terrace", -- [2]
				},
				[53691] = {
					"Shannox", -- [1]
					"Firelands", -- [2]
				},
				[28961] = {
					"Titanium Siegebreaker", -- [1]
					"Halls of Lightning", -- [2]
				},
				[146109] = {
					"Midnight Charger", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[140991] = {
					"Marrowbore", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[17380] = {
					"Broggok", -- [1]
					"Hellfire Citadel: The Blood Furnace", -- [2]
				},
				[74351] = {
					"Twilight Disciple", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[132802] = {
					"Craghorn Yeti", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[124259] = {
					"Jungle Tiger", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[8916] = {
					"Arena Spectator", -- [1]
					"Blackrock Depths", -- [2]
				},
				[56251] = {
					"Twilight Assaulter", -- [1]
					"Dragon Soul", -- [2]
				},
				[132803] = {
					"Rockmane Wendigo", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[138434] = {
					"Spitefin Tempest Witch", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[26722] = {
					"Azure Magus", -- [1]
					"The Nexus", -- [2]
				},
				[139459] = {
					"Stonebound Soldier", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[19044] = {
					"Gruul the Dragonkiller", -- [1]
					"Gruul's Lair", -- [2]
				},
				[139460] = {
					"Stonebound Earthweaver", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[74353] = {
					"Twilight Aquamancer", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[19876] = {
					"Lord Robin Daris", -- [1]
					"Karazhan", -- [2]
				},
				[56252] = {
					"Twilight Assaulter", -- [1]
					"Dragon Soul", -- [2]
				},
				[139461] = {
					"Stonebound Rockmaw", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[52413] = {
					"Zulian Gnasher", -- [1]
					"Zul'Gurub", -- [2]
				},
				[132807] = {
					"Zian-Ti Quilen", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[146116] = {
					"Needleback Forager", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[28578] = {
					"Hardened Steel Reaver", -- [1]
					"Halls of Lightning", -- [2]
				},
				[159425] = {
					"Occult Shadowmender", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[24675] = {
					"Phoenix Egg", -- [1]
					"Magister's Terrace", -- [2]
				},
				[156866] = {
					"Ra-den", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[20900] = {
					"Unchained Doombringer", -- [1]
					"Tempest Keep: The Arcatraz", -- [2]
				},
				[2630] = {
					"Earthbind Totem", -- [1]
					"Magister's Terrace", -- [2]
				},
				[146118] = {
					"Territorial Needleback", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[130661] = {
					"Venture Co. Earthshaper", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[17381] = {
					"The Maker", -- [1]
					"Hellfire Citadel: The Blood Furnace", -- [2]
				},
				[139464] = {
					"Zian-Ti Howler", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[144071] = {
					"Irontide Waveshaper", -- [1]
					"Siege of Boralus", -- [2]
				},
				[136905] = {
					"Forward Lookout", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[146119] = {
					"Needleback Brute", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[30178] = {
					"Ahn'kahar Swarmer", -- [1]
					"Ahn'kahet: The Old Kingdom", -- [2]
				},
				[17957] = {
					"Coilfang Champion", -- [1]
					"Coilfang: The Slave Pens", -- [2]
				},
				[52414] = {
					"Tor-Tun", -- [1]
					"Zul'Gurub", -- [2]
				},
				[133835] = {
					"Feral Bloodswarmer", -- [1]
					"The Underrot", -- [2]
				},
				[18341] = {
					"Pandemonius", -- [1]
					"Auchindoun: Mana-Tombs", -- [2]
				},
				[114794] = {
					"Skeletal Hound", -- [1]
					"Return to Karazhan", -- [2]
				},
				[26723] = {
					"Keristrasza", -- [1]
					"The Nexus", -- [2]
				},
				[53694] = {
					"Riplimb", -- [1]
					"Firelands", -- [2]
				},
				[11444] = {
					"Gordok Mage-Lord", -- [1]
					"Dire Maul", -- [2]
				},
				[11476] = {
					"Skeletal Highborne", -- [1]
					"Dire Maul", -- [2]
				},
				[11668] = {
					"Firelord", -- [1]
					"Molten Core", -- [2]
				},
				[11988] = {
					"Golemagg the Incinerator", -- [1]
					"Molten Core", -- [2]
				},
				[129640] = {
					"Snarling Dockhound", -- [1]
					"Siege of Boralus", -- [2]
				},
				[61245] = {
					"Capacitor Totem", -- [1]
					"Eye of the Storm", -- [2]
				},
				[28835] = {
					"Stormforged Construct", -- [1]
					"Halls of Lightning", -- [2]
				},
				[53695] = {
					"Rageface", -- [1]
					"Firelands", -- [2]
				},
				[37571] = {
					"Darkfallen Advisor", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[20901] = {
					"Sargeron Archer", -- [1]
					"Tempest Keep: The Arcatraz", -- [2]
				},
				[37955] = {
					"Blood-Queen Lana'thel", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[33988] = {
					"Immortal Guardian", -- [1]
					"Ulduar", -- [2]
				},
				[158411] = {
					"Unstable Servant", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[114541] = {
					"Spectral Patron", -- [1]
					"Return to Karazhan", -- [2]
				},
				[64061] = {
					"Mogu'shan Warden", -- [1]
					"Mogu'shan Vaults", -- [2]
				},
				[30179] = {
					"Twilight Apostle", -- [1]
					"Ahn'kahet: The Old Kingdom", -- [2]
				},
				[17958] = {
					"Coilfang Defender", -- [1]
					"Coilfang: The Slave Pens", -- [2]
				},
				[56511] = {
					"Corrupt Living Water", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[132819] = {
					"Rustpelt Pup", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[162508] = {
					"Anubisath Sentinel", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[77431] = {
					"Речное чудище", -- [1]
					"Warsong Gulch", -- [2]
				},
				[114542] = {
					"Ghostly Philanthropist", -- [1]
					"Return to Karazhan", -- [2]
				},
				[45122] = {
					"Oathsworn Captain", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[45378] = {
					"Augh", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[132820] = {
					"Mudsnout Piglet", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[75640] = {
					"Blindlight Murloc", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[139475] = {
					"Jade-Formed Bonesnapper", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[135892] = {
					"Unleashed Inferno", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[135893] = {
					"Burning Emberguard", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[157904] = {
					"Aqir Scarab", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[75641] = {
					"Blindlight Bilefin", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[135894] = {
					"Fire Elemental", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[28580] = {
					"Hardened Steel Skycaller", -- [1]
					"Halls of Lightning", -- [2]
				},
				[57280] = {
					"Twilight Siege Captain", -- [1]
					"Dragon Soul", -- [2]
				},
				[135895] = {
					"Blazing Spark", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[28836] = {
					"Stormforged Runeshaper", -- [1]
					"Halls of Lightning", -- [2]
				},
				[33350] = {
					"Mimiron", -- [1]
					"Ulduar", -- [2]
				},
				[20902] = {
					"Sargeron Hellcaller", -- [1]
					"Tempest Keep: The Arcatraz", -- [2]
				},
				[75642] = {
					"Blindlight Bilefin", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[121711] = {
					"Bilespray Lasher", -- [1]
					"Cathedral of Eternal Night", -- [2]
				},
				[21350] = {
					"Gronn-Priest", -- [1]
					"Gruul's Lair", -- [2]
				},
				[138968] = {
					"Zian-Ti Ironmaw", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[139480] = {
					"Stonebound Protector", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[74363] = {
					"Twilight Shadow", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[64063] = {
					"Mogu'shan Arcanist", -- [1]
					"Mogu'shan Vaults", -- [2]
				},
				[138969] = {
					"Zian-Ti Spirit", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[60480] = {
					"Titan Spark", -- [1]
					"Mogu'shan Vaults", -- [2]
				},
				[52418] = {
					"Lost Offspring of Gahz'ranka", -- [1]
					"Zul'Gurub", -- [2]
				},
				[15252] = {
					"Qiraji Champion", -- [1]
					"Ahn'Qiraj Temple", -- [2]
				},
				[18343] = {
					"Tavarok", -- [1]
					"Auchindoun: Mana-Tombs", -- [2]
				},
				[15348] = {
					"Kurinnaxx", -- [1]
					"Ruins of Ahn'Qiraj", -- [2]
				},
				[114802] = {
					"Spectral Journeyman", -- [1]
					"Return to Karazhan", -- [2]
				},
				[133852] = {
					"Living Rot", -- [1]
					"The Underrot", -- [2]
				},
				[11477] = {
					"Rotting Highborne", -- [1]
					"Dire Maul", -- [2]
				},
				[138971] = {
					"Zian-Ti Serpent", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[18983] = {
					"Blackfang Tarantula", -- [1]
					"Opening of the Dark Portal", -- [2]
				},
				[11669] = {
					"Flame Imp", -- [1]
					"Molten Core", -- [2]
				},
				[114803] = {
					"Spectral Stable Hand", -- [1]
					"Return to Karazhan", -- [2]
				},
				[146139] = {
					"Goldspine", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[146140] = {
					"Quilldozer", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[28581] = {
					"Stormforged Tactician", -- [1]
					"Halls of Lightning", -- [2]
				},
				[53187] = {
					"Flamewaker Animator", -- [1]
					"Firelands", -- [2]
				},
				[114804] = {
					"Spectral Charger", -- [1]
					"Return to Karazhan", -- [2]
				},
				[16488] = {
					"Arcane Anomaly", -- [1]
					"Karazhan", -- [2]
				},
				[28837] = {
					"Stormforged Sentinel", -- [1]
					"Halls of Lightning", -- [2]
				},
				[119923] = {
					"Helblaze Soulmender", -- [1]
					"Cathedral of Eternal Night", -- [2]
				},
				[16808] = {
					"Warchief Kargath Bladefist", -- [1]
					"Hellfire Citadel: The Shattered Halls", -- [2]
				},
				[133345] = {
					"Feckless Assistant", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[138464] = {
					"Ashvane Deckhand", -- [1]
					"Siege of Boralus", -- [2]
				},
				[151773] = {
					"Junkyard D.0.G.", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[138465] = {
					"Ashvane Cannoneer", -- [1]
					"Siege of Boralus", -- [2]
				},
				[17960] = {
					"Coilfang Soothsayer", -- [1]
					"Coilfang: The Slave Pens", -- [2]
				},
				[13141] = {
					"Deeprot Stomper", -- [1]
					"Maraudon", -- [2]
				},
				[132835] = {
					"Dreadfang Snake", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[137442] = {
					"High Sorceress Marala", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[61250] = {
					"Sorcerer Mogu", -- [1]
					"Mogu'shan Vaults", -- [2]
				},
				[36808] = {
					"Deathspeaker Zealot", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[61634] = {
					"Commander Vo'jak", -- [1]
					"Siege of Niuzao Temple", -- [2]
				},
				[26918] = {
					"Chaotic Rift", -- [1]
					"The Nexus", -- [2]
				},
				[138467] = {
					"Obsidian Dragonkin", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[160990] = {
					"Image of Absolution", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[161502] = {
					"Ravenous Fleshfiend", -- [1]
					"Atal'Dazar", -- [2]
				},
				[138468] = {
					"Obsidian Flamecaller", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[145123] = {
					"Myara Nightsong", -- [1]
					"Warfronts Darkshore - Horde", -- [2]
				},
				[138469] = {
					"Obsidian Scalebane", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[14101] = {
					"Enraged Felguard", -- [1]
					"Blackwing Lair", -- [2]
				},
				[136934] = {
					"Weapons Tester", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[28582] = {
					"Stormforged Mender", -- [1]
					"Halls of Lightning", -- [2]
				},
				[44999] = {
					"Shen'dralar Watcher", -- [1]
					"Dire Maul", -- [2]
				},
				[16425] = {
					"Phantom Guardsman", -- [1]
					"Karazhan", -- [2]
				},
				[16489] = {
					"Chaotic Sentience", -- [1]
					"Karazhan", -- [2]
				},
				[28838] = {
					"Titanium Vanguard", -- [1]
					"Halls of Lightning", -- [2]
				},
				[33354] = {
					"Corrupted Servitor", -- [1]
					"Ulduar", -- [2]
				},
				[20904] = {
					"Warden Mellichar", -- [1]
					"Tempest Keep: The Arcatraz", -- [2]
				},
				[131817] = {
					"Cragmaw the Infested", -- [1]
					"The Underrot", -- [2]
				},
				[138472] = {
					"Obsidian Captain", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[17961] = {
					"Coilfang Enchantress", -- [1]
					"Coilfang: The Slave Pens", -- [2]
				},
				[158437] = {
					"Fallen Taskmaster", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[15317] = {
					"Qiraji Scorpion", -- [1]
					"Ahn'Qiraj Temple", -- [2]
				},
				[26727] = {
					"Mage Hunter Ascendant", -- [1]
					"The Nexus", -- [2]
				},
				[33355] = {
					"Misguided Nymph", -- [1]
					"Ulduar", -- [2]
				},
				[11446] = {
					"Gordok Spirit", -- [1]
					"Dire Maul", -- [2]
				},
				[75396] = {
					"Deep Terror", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[161510] = {
					"Mindrend Tentacle", -- [1]
					"Atal'Dazar", -- [2]
				},
				[162534] = {
					"Anubisath Sentinel", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[134893] = {
					"Ironweb Spider", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[152809] = {
					"Alx'kov the Infested", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[64068] = {
					"Mogu'shan Engine Keeper", -- [1]
					"Mogu'shan Vaults", -- [2]
				},
				[150250] = {
					"Pistonhead Blaster", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[52167] = {
					"Gurubashi Spirit Warrior", -- [1]
					"Zul'Gurub", -- [2]
				},
				[135406] = {
					"Animated Gold", -- [1]
					"Kings' Rest", -- [2]
				},
				[12118] = {
					"Lucifron", -- [1]
					"Molten Core", -- [2]
				},
				[57158] = {
					"Earthen Destroyer", -- [1]
					"Dragon Soul", -- [2]
				},
				[24552] = {
					"Sliver", -- [1]
					"Magister's Terrace", -- [2]
				},
				[53575] = {
					"Lava Wielder", -- [1]
					"Firelands", -- [2]
				},
				[20905] = {
					"Blazing Trickster", -- [1]
					"Tempest Keep: The Arcatraz", -- [2]
				},
				[132849] = {
					"Grizzlefur Cub", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[150254] = {
					"Scraphound", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[17962] = {
					"Coilfang Collaborator", -- [1]
					"Coilfang: The Slave Pens", -- [2]
				},
				[44234] = {
					"Vicious Leech", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[13142] = {
					"Deeprot Tangler", -- [1]
					"Maraudon", -- [2]
				},
				[137458] = {
					"Rotting Spore", -- [1]
					"The Underrot", -- [2]
				},
				[57159] = {
					"Earthen Soldier", -- [1]
					"Dragon Soul", -- [2]
				},
				[416] = {
					"Quzgup", -- [1]
					"Isle of Conquest", -- [2]
				},
				[32845] = {
					"Hodir", -- [1]
					"Ulduar", -- [2]
				},
				[26728] = {
					"Mage Hunter Initiate", -- [1]
					"The Nexus", -- [2]
				},
				[26792] = {
					"Crystalline Protector", -- [1]
					"The Nexus", -- [2]
				},
				[19306] = {
					"Mana Leech", -- [1]
					"Auchindoun: Mana-Tombs", -- [2]
				},
				[131318] = {
					"Elder Leaxa", -- [1]
					"The Underrot", -- [2]
				},
				[79752] = {
					"Kukura", -- [1]
					"Eye of the Storm", -- [2]
				},
				[135926] = {
					"Smolderheart", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[57160] = {
					"Ancient Water Lord", -- [1]
					"Dragon Soul", -- [2]
				},
				[24553] = {
					"Apoko", -- [1]
					"Magister's Terrace", -- [2]
				},
				[16491] = {
					"Mana Feeder", -- [1]
					"Karazhan", -- [2]
				},
				[24745] = {
					"Pure Energy", -- [1]
					"Magister's Terrace", -- [2]
				},
				[75658] = {
					"Blindlight Murloc", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[17067] = {
					"Phantom Hound", -- [1]
					"Karazhan", -- [2]
				},
				[88967] = {
					"Training Dummy", -- [1]
					"FW Horde Garrison Level 3", -- [2]
				},
				[146678] = {
					"Ancient Protector", -- [1]
					"Warfronts Darkshore - Horde", -- [2]
				},
				[135929] = {
					"Baron Blazehollow", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[158452] = {
					"Mindtwist Tendril", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[17835] = {
					"Infinite Assassin", -- [1]
					"Opening of the Dark Portal", -- [2]
				},
				[17963] = {
					"Wastewalker Slave", -- [1]
					"Coilfang: The Slave Pens", -- [2]
				},
				[15318] = {
					"Hive'Zara Drone", -- [1]
					"Ruins of Ahn'Qiraj", -- [2]
				},
				[156406] = {
					"Voidbound Honor Guard", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[74380] = {
					"Twilight Storm Mender", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[15510] = {
					"Fankriss the Unyielding", -- [1]
					"Ahn'Qiraj Temple", -- [2]
				},
				[11671] = {
					"Core Hound", -- [1]
					"Molten Core", -- [2]
				},
				[19307] = {
					"Nexus Terror", -- [1]
					"Auchindoun: Mana-Tombs", -- [2]
				},
				[140540] = {
					"Kindleweb Clutchkeeper", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[138493] = {
					"Minion of Zul", -- [1]
					"Kings' Rest", -- [2]
				},
				[79756] = {
					"Coldsnout Sow", -- [1]
					"FW Horde Garrison Level 3", -- [2]
				},
				[12119] = {
					"Flamewaker Protector", -- [1]
					"Molten Core", -- [2]
				},
				[141565] = {
					"Kul Tiran Footman", -- [1]
					"Siege of Boralus", -- [2]
				},
				[28585] = {
					"Slag", -- [1]
					"Halls of Lightning", -- [2]
				},
				[24554] = {
					"Eramas Brightblaze", -- [1]
					"Magister's Terrace", -- [2]
				},
				[16492] = {
					"Syphoner", -- [1]
					"Karazhan", -- [2]
				},
				[74382] = {
					"Twilight Shadowmage", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[132864] = {
					"Juvenile Knucklebump", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[141566] = {
					"Scrimshaw Gutter", -- [1]
					"Siege of Boralus", -- [2]
				},
				[139007] = {
					"Feral Stalker", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[58826] = {
					"Zao Sunseeker", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[138496] = {
					"Twilight Drakonaar", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[139008] = {
					"Primal Mauler", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[137473] = {
					"Guard Captain Atu", -- [1]
					"Kings' Rest", -- [2]
				},
				[8920] = {
					"Weapon Technician", -- [1]
					"Blackrock Depths", -- [2]
				},
				[134914] = {
					"Trapdoor Spider", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[17964] = {
					"Wastewalker Worker", -- [1]
					"Coilfang: The Slave Pens", -- [2]
				},
				[9016] = {
					"Bael'Gar", -- [1]
					"Blackrock Depths", -- [2]
				},
				[137474] = {
					"King Timalji", -- [1]
					"Kings' Rest", -- [2]
				},
				[134915] = {
					"Trapdoor Ambusher", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[26730] = {
					"Mage Slayer", -- [1]
					"The Nexus", -- [2]
				},
				[26794] = {
					"Ormorok the Tree-Shaper", -- [1]
					"The Nexus", -- [2]
				},
				[132868] = {
					"Congealed Azerite", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[138499] = {
					"Twilight Dragonkin", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[134916] = {
					"Trapdoor Hunter", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[157439] = {
					"Fury of N'Zoth", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[130435] = {
					"Addled Thug", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[138500] = {
					"Twilight Scalesister", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[147202] = {
					"Animated Azershard", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[137989] = {
					"Embalming Fluid", -- [1]
					"Kings' Rest", -- [2]
				},
				[138501] = {
					"Twilight Whelp", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[139013] = {
					"Frenzied Moonkin", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[137478] = {
					"Queen Wasi", -- [1]
					"Kings' Rest", -- [2]
				},
				[61131] = {
					"Mogu'shan Secret-Keeper", -- [1]
					"Mogu'shan Vaults", -- [2]
				},
				[28586] = {
					"General Bjarngrim", -- [1]
					"Halls of Lightning", -- [2]
				},
				[24555] = {
					"Garaxxas", -- [1]
					"Magister's Terrace", -- [2]
				},
				[24683] = {
					"Sunblade Mage Guard", -- [1]
					"Magister's Terrace", -- [2]
				},
				[157442] = {
					"Gaze of Madness", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[75410] = {
					"Guardian of the Deep", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[139015] = {
					"Feral Moonkin", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[151812] = {
					"Detect-o-Bot", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[62795] = {
					"Sik'thik Warden", -- [1]
					"Siege of Niuzao Temple", -- [2]
				},
				[130437] = {
					"Mine Rat", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[139016] = {
					"Thorncoat", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[75155] = {
					"Aku'mai the Devourer", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[52430] = {
					"Hakkar's Chains", -- [1]
					"Zul'Gurub", -- [2]
				},
				[52558] = {
					"Lord Rhyolith", -- [1]
					"Firelands", -- [2]
				},
				[56781] = {
					"Goriona", -- [1]
					"Dragon Soul", -- [2]
				},
				[15319] = {
					"Hive'Zara Collector", -- [1]
					"Ruins of Ahn'Qiraj", -- [2]
				},
				[26731] = {
					"Grand Magus Telestra", -- [1]
					"The Nexus", -- [2]
				},
				[127879] = {
					"Shieldbearer of Zul", -- [1]
					"Atal'Dazar", -- [2]
				},
				[15511] = {
					"Lord Kri", -- [1]
					"Ahn'Qiraj Temple", -- [2]
				},
				[11448] = {
					"Gordok Warlock", -- [1]
					"Dire Maul", -- [2]
				},
				[11480] = {
					"Arcane Aberration", -- [1]
					"Dire Maul", -- [2]
				},
				[37970] = {
					"Prince Valanar", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[157447] = {
					"Fanatical Cultist", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[11672] = {
					"Core Rager", -- [1]
					"Molten Core", -- [2]
				},
				[146186] = {
					"Firesting Warrior", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[137485] = {
					"Bloodsworn Agent", -- [1]
					"Kings' Rest", -- [2]
				},
				[75157] = {
					"Aku'mai the Venomous", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[16151] = {
					"Midnight", -- [1]
					"Karazhan", -- [2]
				},
				[157449] = {
					"Sinister Soulcarver", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[137486] = {
					"Queen Patlaa", -- [1]
					"Kings' Rest", -- [2]
				},
				[12216] = {
					"Poison Sprite", -- [1]
					"Maraudon", -- [2]
				},
				[28587] = {
					"Volkhan", -- [1]
					"Halls of Lightning", -- [2]
				},
				[45265] = {
					"Twilight Soul Blade", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[33236] = {
					"Steelforged Defender", -- [1]
					"Ulduar", -- [2]
				},
				[137487] = {
					"Skeletal Hunting Raptor", -- [1]
					"Kings' Rest", -- [2]
				},
				[20909] = {
					"Sulfuron Magma-Thrower", -- [1]
					"Tempest Keep: The Arcatraz", -- [2]
				},
				[139023] = {
					"Bloodmaw the Savage", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[157451] = {
					"Iron-Willed Enforcer", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[114317] = {
					"Lady Catriona Von'Indi", -- [1]
					"Return to Karazhan", -- [2]
				},
				[139024] = {
					"Nightfeather", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[139536] = {
					"Zara'thik Drone", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[59598] = {
					"Lesser Sha", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[140560] = {
					"Blazeseeker", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[29931] = {
					"Drakkari Rhino", -- [1]
					"Gundrak", -- [2]
				},
				[8889] = {
					"Anvilrage Overseer", -- [1]
					"Blackrock Depths", -- [2]
				},
				[8921] = {
					"Bloodhound", -- [1]
					"Blackrock Depths", -- [2]
				},
				[9017] = {
					"Lord Incendius", -- [1]
					"Blackrock Depths", -- [2]
				},
				[140561] = {
					"Brimstone Pup", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[114318] = {
					"Baron Rafe Dreuger", -- [1]
					"Return to Karazhan", -- [2]
				},
				[139026] = {
					"Eclipse-Caller", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[36948] = {
					"Muradin Bronzebeard", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[45266] = {
					"Twilight Dark Mender", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[26796] = {
					"Commander Stoutbeard", -- [1]
					"The Nexus", -- [2]
				},
				[33237] = {
					"Ulduar Colossus", -- [1]
					"Ulduar", -- [2]
				},
				[158478] = {
					"Corruption Tumor", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[75416] = {
					"Coldsnout Boar", -- [1]
					"FW Horde Garrison Level 3", -- [2]
				},
				[58319] = {
					"Lesser Sha", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[37972] = {
					"Prince Keleseth", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[34133] = {
					"Champion of Hodir", -- [1]
					"Ulduar", -- [2]
				},
				[132885] = {
					"Air Elemental", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[126092] = {
					"Slitherblade Gladiator", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[114319] = {
					"Lady Keira Berrybuck", -- [1]
					"Return to Karazhan", -- [2]
				},
				[35029] = {
					"Memory of Mutanus", -- [1]
					"Trial of the Champion", -- [2]
				},
				[140564] = {
					"Brimstone Lavamaw", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[75417] = {
					"Coldsnout Piglet", -- [1]
					"FW Horde Garrison Level 3", -- [2]
				},
				[52305] = {
					"Toxic Husk", -- [1]
					"Zul'Gurub", -- [2]
				},
				[136470] = {
					"Refreshment Vendor", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[126093] = {
					"Slitherblade Saurok", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[14264] = {
					"Red Drakonid", -- [1]
					"Blackwing Lair", -- [2]
				},
				[114320] = {
					"Lord Robin Daris", -- [1]
					"Return to Karazhan", -- [2]
				},
				[24557] = {
					"Kagani Nightstrike", -- [1]
					"Magister's Terrace", -- [2]
				},
				[24685] = {
					"Sunblade Magister", -- [1]
					"Magister's Terrace", -- [2]
				},
				[33110] = {
					"Dark Rune Acolyte", -- [1]
					"Ulduar", -- [2]
				},
				[14456] = {
					"Blackwing Guardsman", -- [1]
					"Blackwing Lair", -- [2]
				},
				[133912] = {
					"Bloodsworn Defiler", -- [1]
					"The Underrot", -- [2]
				},
				[37973] = {
					"Prince Taldaram", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[17007] = {
					"Lady Keira Berrybuck", -- [1]
					"Karazhan", -- [2]
				},
				[34134] = {
					"Winter Revenant", -- [1]
					"Ulduar", -- [2]
				},
				[136984] = {
					"Reban", -- [1]
					"Kings' Rest", -- [2]
				},
				[76954] = {
					"Pahboo-Ra", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[114321] = {
					"Lord Crispin Ference", -- [1]
					"Return to Karazhan", -- [2]
				},
				[106643] = {
					"Elisande", -- [1]
					"The Nighthold", -- [2]
				},
				[135961] = {
					"Deepstone Crusher", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[119952] = {
					"Felguard Destroyer", -- [1]
					"Cathedral of Eternal Night", -- [2]
				},
				[17839] = {
					"Rift Lord", -- [1]
					"Opening of the Dark Portal", -- [2]
				},
				[52306] = {
					"Tangled Vine", -- [1]
					"Zul'Gurub", -- [2]
				},
				[52434] = {
					"Gurubashi Villager", -- [1]
					"Zul'Gurub", -- [2]
				},
				[156949] = {
					"Armsmaster Terenson", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[157461] = {
					"Mycelial Cyst", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[126095] = {
					"Vyliss", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[15320] = {
					"Hive'Zara Soldier", -- [1]
					"Ruins of Ahn'Qiraj", -- [2]
				},
				[131356] = {
					"Jungle Stalker", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[140058] = {
					"Grizzlefur Patriarch", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[132892] = {
					"Giddyleaf", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[15544] = {
					"Vem", -- [1]
					"Ahn'Qiraj Temple", -- [2]
				},
				[159510] = {
					"Eye of the Depths", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[135964] = {
					"Rumbling Earth", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[34135] = {
					"Winter Rumbler", -- [1]
					"Ulduar", -- [2]
				},
				[11673] = {
					"Ancient Core Hound", -- [1]
					"Molten Core", -- [2]
				},
				[34775] = {
					"Demolisher", -- [1]
					"Isle of Conquest", -- [2]
				},
				[140060] = {
					"Grizzlefur Bear", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[136989] = {
					"Newstead Militia", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[16152] = {
					"Attumen the Huntsman", -- [1]
					"Karazhan", -- [2]
				},
				[52435] = {
					"Gurubashi Villager", -- [1]
					"Zul'Gurub", -- [2]
				},
				[56658] = {
					"Corrupt Droplet", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[12217] = {
					"Corruptor", -- [1]
					"Maraudon", -- [2]
				},
				[24558] = {
					"Ellrys Duskhallow", -- [1]
					"Magister's Terrace", -- [2]
				},
				[69791] = {
					"ßðnyßßus", -- [1]
					"Eye of the Storm", -- [2]
				},
				[24686] = {
					"Sunblade Warlock", -- [1]
					"Magister's Terrace", -- [2]
				},
				[20911] = {
					"Blackwing Drakonaar", -- [1]
					"Tempest Keep: The Arcatraz", -- [2]
				},
				[159514] = {
					"Blood of Ny'alotha", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[157467] = {
					"Void Ascendant", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[151325] = {
					"Alarm-o-Bot", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[69792] = {
					"ßðnyßßus", -- [1]
					"Eye of the Storm", -- [2]
				},
				[8890] = {
					"Anvilrage Warden", -- [1]
					"Blackrock Depths", -- [2]
				},
				[8922] = {
					"Bloodhound Mastiff", -- [1]
					"Blackrock Depths", -- [2]
				},
				[52436] = {
					"Gurubashi Refugee", -- [1]
					"Zul'Gurub", -- [2]
				},
				[126099] = {
					"Duskcoat Den-Mother", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[163612] = {
					"Voidspawn Annihilator", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[32857] = {
					"Stormcaller Brundir", -- [1]
					"Ulduar", -- [2]
				},
				[26734] = {
					"Azure Enforcer", -- [1]
					"The Nexus", -- [2]
				},
				[33113] = {
					"Flame Leviathan", -- [1]
					"Ulduar", -- [2]
				},
				[145185] = {
					"Gnomercy 4.U.", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[138019] = {
					"Kul Tiran Vanguard", -- [1]
					"Siege of Boralus", -- [2]
				},
				[140067] = {
					"Rustpelt Alpha", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[34137] = {
					"Winter Jormungar", -- [1]
					"Ulduar", -- [2]
				},
				[126100] = {
					"Duskcoat Prowler", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[134437] = {
					"Medic Bot", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[34777] = {
					"Siege Turret", -- [1]
					"Isle of Conquest", -- [2]
				},
				[140068] = {
					"Rustpelt Snarler", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[35545] = {
					"Risen Jaeren Sunsworn", -- [1]
					"Trial of the Champion", -- [2]
				},
				[52437] = {
					"Gurubashi Refugee", -- [1]
					"Zul'Gurub", -- [2]
				},
				[20208] = {
					"Mennu's Healing Ward", -- [1]
					"Coilfang: The Slave Pens", -- [2]
				},
				[14265] = {
					"Black Drakonid", -- [1]
					"Blackwing Lair", -- [2]
				},
				[65362] = {
					"Minion of Doubt", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[24559] = {
					"Warlord Salaris", -- [1]
					"Magister's Terrace", -- [2]
				},
				[5134] = {
					"Jonivera Farmountain", -- [1]
					"Alterac Valley", -- [2]
				},
				[24687] = {
					"Sunblade Physician", -- [1]
					"Magister's Terrace", -- [2]
				},
				[24815] = {
					"Sunblade Imp", -- [1]
					"Magister's Terrace", -- [2]
				},
				[20912] = {
					"Harbinger Skyriss", -- [1]
					"Tempest Keep: The Arcatraz", -- [2]
				},
				[33754] = {
					"Dark Rune Thunderer", -- [1]
					"Ulduar", -- [2]
				},
				[21104] = {
					"Rift Keeper", -- [1]
					"Opening of the Dark Portal", -- [2]
				},
				[157475] = {
					"Synthesis Growth", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[58964] = {
					"Hrograk", -- [1]
					"Warsong Gulch", -- [2]
				},
				[122263] = {
					"Spineshell Snapjaw", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[34778] = {
					"Flame Turret", -- [1]
					"Isle of Conquest", -- [2]
				},
				[17521] = {
					"The Big Bad Wolf", -- [1]
					"Karazhan", -- [2]
				},
				[161571] = {
					"Anubisath Sentinel", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[122264] = {
					"Elder Spineshell", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[53206] = {
					"Hell Hound", -- [1]
					"Firelands", -- [2]
				},
				[15385] = {
					"Colonel Zerran", -- [1]
					"Ruins of Ahn'Qiraj", -- [2]
				},
				[26735] = {
					"Azure Scale-Binder", -- [1]
					"The Nexus", -- [2]
				},
				[11450] = {
					"Gordok Reaver", -- [1]
					"Dire Maul", -- [2]
				},
				[33755] = {
					"Dark Rune Ravager", -- [1]
					"Ulduar", -- [2]
				},
				[140075] = {
					"Canus", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[58965] = {
					"Lazgorod", -- [1]
					"Isle of Conquest", -- [2]
				},
				[123289] = {
					"Sparkleshell Deathclaw", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[52311] = {
					"Venomguard Destroyer", -- [1]
					"Zul'Gurub", -- [2]
				},
				[140077] = {
					"Knucklebump Stomper", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[152874] = {
					"Vez'okk the Lightless", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[105630] = {
					"Eye of Gul'dan", -- [1]
					"The Nighthold", -- [2]
				},
				[12218] = {
					"Vile Larva", -- [1]
					"Maraudon", -- [2]
				},
				[24560] = {
					"Priestess Delrissa", -- [1]
					"Magister's Terrace", -- [2]
				},
				[123290] = {
					"Sparkleshell Clacker", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[137007] = {
					"High Perch Defender", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[37595] = {
					"Darkfallen Blood Knight", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[128921] = {
					"Duskcoat Tiger", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[135472] = {
					"Zanazal the Wise", -- [1]
					"Kings' Rest", -- [2]
				},
				[132913] = {
					"Island Ettin", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[123291] = {
					"Sparkleshell Crab", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[137521] = {
					"Irontide Powdershot", -- [1]
					"Siege of Boralus", -- [2]
				},
				[8891] = {
					"Anvilrage Guardsman", -- [1]
					"Blackrock Depths", -- [2]
				},
				[52440] = {
					"Gub", -- [1]
					"Zul'Gurub", -- [2]
				},
				[135475] = {
					"Kula the Butcher", -- [1]
					"Kings' Rest", -- [2]
				},
				[123292] = {
					"Sparkleshell Pincher", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[26800] = {
					"Alliance Berserker", -- [1]
					"The Nexus", -- [2]
				},
				[157486] = {
					"Horrific Hemorrhage", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[124316] = {
					"Pig", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[18994] = {
					"Infinite Executioner", -- [1]
					"Opening of the Dark Portal", -- [2]
				},
				[137012] = {
					"Newstead Huntsman", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[155952] = {
					"Suffer", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[123293] = {
					"Royal Sand Crab", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[132918] = {
					"Spitefin Raider", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[133430] = {
					"Venture Co. Mastermind", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[60375] = {
					"Zandalari Skullcharger", -- [1]
					"Mogu'shan Vaults", -- [2]
				},
				[155953] = {
					"C'Thuffer", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[52441] = {
					"Curious Jungle Monkey", -- [1]
					"Zul'Gurub", -- [2]
				},
				[56792] = {
					"Figment of Doubt", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[133943] = {
					"Minion of Zul", -- [1]
					"Kings' Rest", -- [2]
				},
				[24561] = {
					"Yazzai", -- [1]
					"Magister's Terrace", -- [2]
				},
				[140086] = {
					"Pinegraze Courser", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[133432] = {
					"Venture Co. Alchemist", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[58456] = {
					"Thunder", -- [1]
					"Isle of Conquest", -- [2]
				},
				[140087] = {
					"Pinegraze Doe", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[17395] = {
					"Shadowmoon Summoner", -- [1]
					"Hellfire Citadel: The Blood Furnace", -- [2]
				},
				[1860] = {
					"Makrath", -- [1]
					"Alterac Valley", -- [2]
				},
				[156980] = {
					"Essence of Void", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[132922] = {
					"Enslaved Murloc", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[43612] = {
					"High Prophet Barim", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[15386] = {
					"Major Yeggeth", -- [1]
					"Ruins of Ahn'Qiraj", -- [2]
				},
				[26737] = {
					"Crazed Mana-Surge", -- [1]
					"The Nexus", -- [2]
				},
				[57817] = {
					"Stormborn Myrmidon", -- [1]
					"Dragon Soul", -- [2]
				},
				[15514] = {
					"Buru Egg", -- [1]
					"Ruins of Ahn'Qiraj", -- [2]
				},
				[11451] = {
					"Wildspawn Satyr", -- [1]
					"Dire Maul", -- [2]
				},
				[11483] = {
					"Mana Remnant", -- [1]
					"Dire Maul", -- [2]
				},
				[31216] = {
					"Spellchecker", -- [1]
					"Isle of Conquest", -- [2]
				},
				[135996] = {
					"Lord Korslate", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[42717] = {
					"Lobo", -- [1]
					"Warsong Gulch", -- [2]
				},
				[118690] = {
					"Wrathguard Invader", -- [1]
					"Cathedral of Eternal Night", -- [2]
				},
				[153401] = {
					"K'thir Dominator", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[52059] = {
					"High Priestess Kilnara", -- [1]
					"Zul'Gurub", -- [2]
				},
				[52571] = {
					"Majordomo Staghelm", -- [1]
					"Firelands", -- [2]
				},
				[56922] = {
					"Twilight Infiltrator", -- [1]
					"Dragon Soul", -- [2]
				},
				[12219] = {
					"Barbed Lasher", -- [1]
					"Maraudon", -- [2]
				},
				[138558] = {
					"Faceless One", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[24690] = {
					"Wretched Husk", -- [1]
					"Magister's Terrace", -- [2]
				},
				[140095] = {
					"Mudsnout Gorer", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[148797] = {
					"Magus of the Dead", -- [1]
					"Warsong Gulch", -- [2]
				},
				[146238] = {
					"Blacksting", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[140096] = {
					"Mudsnout Boar", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[43614] = {
					"Lockmaw", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[8892] = {
					"Anvilrage Footman", -- [1]
					"Blackrock Depths", -- [2]
				},
				[140609] = {
					"Ravenous Mako", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[137026] = {
					"Newstead Hound", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[56923] = {
					"Twilight Sapper", -- [1]
					"Dragon Soul", -- [2]
				},
				[52956] = {
					"Zandalari Juggernaut", -- [1]
					"Zul'Gurub", -- [2]
				},
				[138562] = {
					"Void Maggot", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[160061] = {
					"Crawling Corruption", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[26802] = {
					"Alliance Ranger", -- [1]
					"The Nexus", -- [2]
				},
				[57819] = {
					"Corrupted Fragment", -- [1]
					"Dragon Soul", -- [2]
				},
				[77232] = {
					"Twilight Disciple", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[34657] = {
					"Jaelyne Evensong", -- [1]
					"Trial of the Champion", -- [2]
				},
				[140100] = {
					"Warsnort", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[137029] = {
					"Ordnance Specialist", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[124581] = {
					"Spineshell Snapper", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[136006] = {
					"Rowdy Reveler", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[161088] = {
					"Bearymini", -- [1]
					"Isle of Conquest", -- [2]
				},
				[44895] = {
					"Augh", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[36961] = {
					"Skybreaker Sergeant", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[140102] = {
					"Razorhog", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[37217] = {
					"Precious", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[138567] = {
					"Shathhoth the Punisher", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[33890] = {
					"Brain of Yogg-Saron", -- [1]
					"Ulduar", -- [2]
				},
				[113321] = {
					"Shambling Hungerer", -- [1]
					"The Nighthold", -- [2]
				},
				[146246] = {
					"Ovix the Toxic", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[17397] = {
					"Shadowmoon Adept", -- [1]
					"Hellfire Citadel: The Blood Furnace", -- [2]
				},
				[131402] = {
					"Underrot Tick", -- [1]
					"The Underrot", -- [2]
				},
				[29874] = {
					"Drakkari Inciter", -- [1]
					"Gundrak", -- [2]
				},
				[17653] = {
					"Shadowmoon Channeler", -- [1]
					"Hellfire Citadel: The Blood Furnace", -- [2]
				},
				[124583] = {
					"Garnetback Worm", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[52958] = {
					"Zandalari Hierophant", -- [1]
					"Zul'Gurub", -- [2]
				},
				[15323] = {
					"Hive'Zara Sandstalker", -- [1]
					"Ruins of Ahn'Qiraj", -- [2]
				},
				[15355] = {
					"Anubisath Guardian", -- [1]
					"Ruins of Ahn'Qiraj", -- [2]
				},
				[32867] = {
					"Steelbreaker", -- [1]
					"Ulduar", -- [2]
				},
				[136011] = {
					"Bloodstone", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[119977] = {
					"Stranglevine Lasher", -- [1]
					"Cathedral of Eternal Night", -- [2]
				},
				[11452] = {
					"Wildspawn Rogue", -- [1]
					"Dire Maul", -- [2]
				},
				[11484] = {
					"Residual Monstrosity", -- [1]
					"Dire Maul", -- [2]
				},
				[140107] = {
					"Deathsting Lasher", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[119978] = {
					"Fulminating Lasher", -- [1]
					"Cathedral of Eternal Night", -- [2]
				},
				[138061] = {
					"Venture Co. Longshoreman", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[60381] = {
					"Zandalari Infiltrator", -- [1]
					"Mogu'shan Vaults", -- [2]
				},
				[131407] = {
					"Venture Goon", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[53087] = {
					"Right Foot", -- [1]
					"Firelands", -- [2]
				},
				[131408] = {
					"Venture Muscle", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[152396] = {
					"Guardian of Azeroth", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[118700] = {
					"Felblight Stalker", -- [1]
					"Cathedral of Eternal Night", -- [2]
				},
				[131410] = {
					"Gargantuan Venomscale", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[111022] = {
					"The Demon Within", -- [1]
					"The Nighthold", -- [2]
				},
				[119724] = {
					"Tidal Surger", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[8893] = {
					"Anvilrage Soldier", -- [1]
					"Blackrock Depths", -- [2]
				},
				[13020] = {
					"Vaelastrasz the Corrupt", -- [1]
					"Blackwing Lair", -- [2]
				},
				[134994] = {
					"Spectral Headhunter", -- [1]
					"Kings' Rest", -- [2]
				},
				[131411] = {
					"Venomscale Monitor", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[122284] = {
					"Greater Jungle Stalker", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[13276] = {
					"Wildspawn Imp", -- [1]
					"Dire Maul", -- [2]
				},
				[140114] = {
					"Clatterclaw", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[57823] = {
					"Stormbinder Adept", -- [1]
					"Dragon Soul", -- [2]
				},
				[146770] = {
					"Druid of the Claw", -- [1]
					"Warfronts Darkshore - Horde", -- [2]
				},
				[19510] = {
					"Bloodwarder Centurion", -- [1]
					"Tempest Keep: The Mechanar", -- [2]
				},
				[52577] = {
					"Left Foot", -- [1]
					"Firelands", -- [2]
				},
				[149331] = {
					"Luminous Azerite", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[133463] = {
					"Venture Co. War Machine", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[118703] = {
					"Felborne Botanist", -- [1]
					"Cathedral of Eternal Night", -- [2]
				},
				[140631] = {
					"South Sea Ray", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[158035] = {
					"Magister Umbric", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[118704] = {
					"Dul'zak", -- [1]
					"Cathedral of Eternal Night", -- [2]
				},
				[56161] = {
					"Corruption", -- [1]
					"Dragon Soul", -- [2]
				},
				[60384] = {
					"Zandalari Pterror Wing", -- [1]
					"Mogu'shan Vaults", -- [2]
				},
				[52322] = {
					"Witch Doctor Qu'in", -- [1]
					"Zul'Gurub", -- [2]
				},
				[44260] = {
					"Venomfang Crocolisk", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[153942] = {
					"Annihilator Lak'hal", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[52962] = {
					"Zandalari Archon", -- [1]
					"Zul'Gurub", -- [2]
				},
				[15324] = {
					"Qiraji Gladiator", -- [1]
					"Ruins of Ahn'Qiraj", -- [2]
				},
				[32871] = {
					"Algalon the Observer", -- [1]
					"Ulduar", -- [2]
				},
				[26805] = {
					"Alliance Cleric", -- [1]
					"The Nexus", -- [2]
				},
				[153943] = {
					"Decimator Shiq'voth", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[11453] = {
					"Wildspawn Trickster", -- [1]
					"Dire Maul", -- [2]
				},
				[59873] = {
					"Corrupt Living Water", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[162647] = {
					"Willing Sacrifice", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[56162] = {
					"Corruption", -- [1]
					"Dragon Soul", -- [2]
				},
				[52323] = {
					"Chosen of Hethiss", -- [1]
					"Zul'Gurub", -- [2]
				},
				[44261] = {
					"Sharptalon Eagle", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[158041] = {
					"N'Zoth the Corruptor", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[32872] = {
					"Runic Colossus", -- [1]
					"Ulduar", -- [2]
				},
				[16504] = {
					"Arcane Protector", -- [1]
					"Karazhan", -- [2]
				},
				[33768] = {
					"Rubble", -- [1]
					"Ulduar", -- [2]
				},
				[17400] = {
					"Felguard Annihilator", -- [1]
					"Hellfire Citadel: The Blood Furnace", -- [2]
				},
				[17464] = {
					"Shattered Hand Gladiator", -- [1]
					"Hellfire Citadel: The Shattered Halls", -- [2]
				},
				[137057] = {
					"Gurthani the Elder", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[128434] = {
					"Feasting Skyscreamer", -- [1]
					"Atal'Dazar", -- [2]
				},
				[13021] = {
					"Warpwood Crusher", -- [1]
					"Dire Maul", -- [2]
				},
				[60386] = {
					"Zandalari Terror Rider", -- [1]
					"Mogu'shan Vaults", -- [2]
				},
				[18168] = {
					"The Crone", -- [1]
					"Karazhan", -- [2]
				},
				[164188] = {
					"Horrific Figment", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[53732] = {
					"Unbound Smoldering Elemental", -- [1]
					"Firelands", -- [2]
				},
				[128435] = {
					"Toxic Saurid", -- [1]
					"Atal'Dazar", -- [2]
				},
				[13533] = {
					"Spewed Larva", -- [1]
					"Maraudon", -- [2]
				},
				[164189] = {
					"Horrific Figment", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[140643] = {
					"Ferocious Craghorn", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[163678] = {
					"Clotted Corruption", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[35305] = {
					"Argent Monk", -- [1]
					"Trial of the Champion", -- [2]
				},
				[119990] = {
					"Fenryr", -- [1]
					"Coilfang: The Slave Pens", -- [2]
				},
				[138085] = {
					"Ironforge Priestess", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[131431] = {
					"Safety Inspection Bot", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[143622] = {
					"Wild Imp", -- [1]
					"Isle of Conquest", -- [2]
				},
				[95061] = {
					"Greater Fire Elemental", -- [1]
					"Eye of the Storm", -- [2]
				},
				[35030] = {
					"Memory of Herod", -- [1]
					"Trial of the Champion", -- [2]
				},
				[151145] = {
					"Hati", -- [1]
					"Isle of Conquest", -- [2]
				},
				[32874] = {
					"Iron Ring Guard", -- [1]
					"Ulduar", -- [2]
				},
				[14397] = {
					"Mana Burst", -- [1]
					"Dire Maul", -- [2]
				},
				[69946] = {
					"Flitzpiepe", -- [1]
					"Isle of Conquest", -- [2]
				},
				[34776] = {
					"Siege Engine", -- [1]
					"Isle of Conquest", -- [2]
				},
				[135263] = {
					"Ashvane Spotter", -- [1]
					"Siege of Boralus", -- [2]
				},
				[58963] = {
					"Shahrylin", -- [1]
					"Isle of Conquest", -- [2]
				},
				[78001] = {
					"Cloudburst Totem", -- [1]
					"Isle of Conquest", -- [2]
				},
				[142324] = {
					"Bluefin Dolphin", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[88708] = {
					"Gara", -- [1]
					"Isle of Conquest", -- [2]
				},
				[143985] = {
					"Absorb-o-Tron", -- [1]
					"Isle of Conquest", -- [2]
				},
				[61485] = {
					"General Pa'valak", -- [1]
					"Siege of Niuzao Temple", -- [2]
				},
				[137064] = {
					"Valorcall Marksman", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[3527] = {
					"Healing Stream Totem", -- [1]
					"Eye of the Storm", -- [2]
				},
				[130485] = {
					"Mechanized Peacekeeper", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[46951] = {
					"Chosen Warrior", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[127907] = {
					"Nibbles", -- [1]
					"Warsong Gulch", -- [2]
				},
				[17465] = {
					"Shattered Hand Centurion", -- [1]
					"Hellfire Citadel: The Shattered Halls", -- [2]
				},
				[140842] = {
					"Ebb", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[62348] = {
					"Sik'thik Soldier", -- [1]
					"Siege of Niuzao Temple", -- [2]
				},
				[103822] = {
					"Treant", -- [1]
					"Alterac Valley", -- [2]
				},
				[130299] = {
					"Droplet", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[138349] = {
					"Vengeful Ghost", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[13437] = {
					"Wing Commander Ichman", -- [1]
					"Alterac Valley", -- [2]
				},
				[136840] = {
					"Zoga", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[13577] = {
					"Stormpike Ram Rider Commander", -- [1]
					"Alterac Valley", -- [2]
				},
				[13617] = {
					"Stormpike Stable Master", -- [1]
					"Alterac Valley", -- [2]
				},
				[161124] = {
					"Urg'roth, Breaker of Heroes", -- [1]
					"Atal'Dazar", -- [2]
				},
				[15229] = {
					"Vekniss Soldier", -- [1]
					"Ahn'Qiraj Temple", -- [2]
				},
				[139626] = {
					"Dredged Sailor", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[158565] = {
					"Naros", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[15325] = {
					"Hive'Zara Wasp", -- [1]
					"Ruins of Ahn'Qiraj", -- [2]
				},
				[53222] = {
					"Flamewaker Centurion", -- [1]
					"Firelands", -- [2]
				},
				[131436] = {
					"Chosen Blood Matron", -- [1]
					"The Underrot", -- [2]
				},
				[37098] = {
					"Val'kyr Herald", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[5135] = {
					"Svalbrad Farmountain", -- [1]
					"Alterac Valley", -- [2]
				},
				[137067] = {
					"Valorcall Defender", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[4255] = {
					"Brogus Thunderbrew", -- [1]
					"Alterac Valley", -- [2]
				},
				[11454] = {
					"Wildspawn Betrayer", -- [1]
					"Dire Maul", -- [2]
				},
				[11486] = {
					"Prince Tortheldrin", -- [1]
					"Dire Maul", -- [2]
				},
				[10990] = {
					"Alterac Ram", -- [1]
					"Alterac Valley", -- [2]
				},
				[53640] = {
					"Flamewaker Sentinel", -- [1]
					"Firelands", -- [2]
				},
				[133436] = {
					"Venture Co. Skyscorcher", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[11445] = {
					"Gordok Captain", -- [1]
					"Dire Maul", -- [2]
				},
				[137068] = {
					"Valorcall Cavalry", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[133963] = {
					"Test Subject", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[158567] = {
					"Tormented Kor'kron Annihilator", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[46952] = {
					"Chosen Seer", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[118714] = {
					"Hellblaze Temptress", -- [1]
					"Cathedral of Eternal Night", -- [2]
				},
				[138369] = {
					"Footbomb Hooligan", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[135903] = {
					"Manifestation of the Deep", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[140424] = {
					"Scythehorn", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[35307] = {
					"Argent Priestess", -- [1]
					"Trial of the Champion", -- [2]
				},
				[158056] = {
					"Rat", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[129802] = {
					"Earthrager", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[132644] = {
					"Wolf Pup", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[156653] = {
					"Coagulated Horror", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[52327] = {
					"Gurubashi Shadow Hunter", -- [1]
					"Zul'Gurub", -- [2]
				},
				[76039] = {
					"Twilight Aquamancer", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[15387] = {
					"Qiraji Warrior", -- [1]
					"Ruins of Ahn'Qiraj", -- [2]
				},
				[60561] = {
					"Earthgrab Totem", -- [1]
					"Isle of Conquest", -- [2]
				},
				[61029] = {
					"Primal Fire Elemental", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[162664] = {
					"Aqir Swarmer", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[53095] = {
					"Matriarch Fire Turtle", -- [1]
					"Firelands", -- [2]
				},
				[53223] = {
					"Flamewaker Beast Handler", -- [1]
					"Firelands", -- [2]
				},
				[32876] = {
					"Dark Rune Champion", -- [1]
					"Ulduar", -- [2]
				},
				[24696] = {
					"Coilskar Witch", -- [1]
					"Magister's Terrace", -- [2]
				},
				[152939] = {
					"Boundless Corruption", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[138254] = {
					"Irontide Powdershot", -- [1]
					"Siege of Boralus", -- [2]
				},
				[43658] = {
					"Frenzied Crocolisk", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[20857] = {
					"Arcatraz Defender", -- [1]
					"Tempest Keep: The Arcatraz", -- [2]
				},
				[139011] = {
					"Feral Protector", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[33772] = {
					"Faceless Horror", -- [1]
					"Ulduar", -- [2]
				},
				[128649] = {
					"Sergeant Bainbridge", -- [1]
					"Siege of Boralus", -- [2]
				},
				[156523] = {
					"Maut", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[17546] = {
					"Roar", -- [1]
					"Karazhan", -- [2]
				},
				[134232] = {
					"Hired Assassin", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[136845] = {
					"Sandscalp Axe Thrower", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[14762] = {
					"Dun Baldar North Marshal", -- [1]
					"Alterac Valley", -- [2]
				},
				[159578] = {
					"Exposed Synapse", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[163690] = {
					"Shath'Yar Scribe", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[34924] = {
					"High Commander Halford Wyrmbane", -- [1]
					"Isle of Conquest", -- [2]
				},
				[136049] = {
					"Algenon", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[12057] = {
					"Garr", -- [1]
					"Molten Core", -- [2]
				},
				[61623] = {
					"Sap Globule", -- [1]
					"Siege of Niuzao Temple", -- [2]
				},
				[56167] = {
					"Arm Tentacle", -- [1]
					"Dragon Soul", -- [2]
				},
				[8895] = {
					"Anvilrage Officer", -- [1]
					"Blackrock Depths", -- [2]
				},
				[134514] = {
					"Abyssal Cultist", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[11262] = {
					"Onyxian Whelp", -- [1]
					"Onyxia's Lair", -- [2]
				},
				[28067] = {
					"Dark Iron Brewer", -- [1]
					"Blackrock Depths", -- [2]
				},
				[136050] = {
					"Gorestream", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[140657] = {
					"Craghorn Behemoth", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[134144] = {
					"Living Current", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[136246] = {
					"Stromgarde Faithful", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[138098] = {
					"Veteran of Ironforge", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[134801] = {
					"Cracked-Shell", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[53224] = {
					"Flamewaker Taskmaster", -- [1]
					"Firelands", -- [2]
				},
				[32877] = {
					"Dark Rune Warbringer", -- [1]
					"Ulduar", -- [2]
				},
				[61670] = {
					"Sik'thik Demolisher", -- [1]
					"Siege of Niuzao Temple", -- [2]
				},
				[37228] = {
					"Frostwarden Warrior", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[13438] = {
					"Wing Commander Slidore", -- [1]
					"Alterac Valley", -- [2]
				},
				[134139] = {
					"Shrine Templar", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[100943] = {
					"Earthen Wall Totem", -- [1]
					"Eye of the Storm", -- [2]
				},
				[135164] = {
					"Wildhammer Raider", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[37868] = {
					"Risen Archmage", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[61701] = {
					"Sik'thik Warrior", -- [1]
					"Siege of Niuzao Temple", -- [2]
				},
				[32908] = {
					"Captured Mercenary Captain", -- [1]
					"Ulduar", -- [2]
				},
				[140659] = {
					"Ragestomp", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[140094] = {
					"Mudsnout Thornback", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[140658] = {
					"Bristlefur", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[136249] = {
					"Guardian Elemental", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[139432] = {
					"Lu'si", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[129208] = {
					"Dread Captain Lockwood", -- [1]
					"Siege of Boralus", -- [2]
				},
				[136207] = {
					"Stromgarde Defender", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[132799] = {
					"Mesa Buzzard", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[28231] = {
					"Crystalline Tender", -- [1]
					"The Nexus", -- [2]
				},
				[35309] = {
					"Argent Lightwielder", -- [1]
					"Trial of the Champion", -- [2]
				},
				[8983] = {
					"Golem Lord Argelmach", -- [1]
					"Blackrock Depths", -- [2]
				},
				[135258] = {
					"Irontide Marauder", -- [1]
					"Siege of Boralus", -- [2]
				},
				[56168] = {
					"Wing Tentacle", -- [1]
					"Dragon Soul", -- [2]
				},
				[9034] = {
					"Hate'rel", -- [1]
					"Blackrock Depths", -- [2]
				},
				[44977] = {
					"Neferset Torturer", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[144244] = {
					"The Platinum Pummeler", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[140661] = {
					"Valethunder", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[145399] = {
					"Wild Starcaller", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[53185] = {
					"Flamewaker Overseer", -- [1]
					"Firelands", -- [2]
				},
				[144757] = {
					"Edgard Shadeclaw", -- [1]
					"Warfronts Darkshore - Horde", -- [2]
				},
				[14302] = {
					"Chromatic Drakonid", -- [1]
					"Blackwing Lair", -- [2]
				},
				[114624] = {
					"Arcane Warden", -- [1]
					"Return to Karazhan", -- [2]
				},
				[32878] = {
					"Dark Rune Evoker", -- [1]
					"Ulduar", -- [2]
				},
				[24697] = {
					"Sister of Torment", -- [1]
					"Magister's Terrace", -- [2]
				},
				[33134] = {
					"Sara", -- [1]
					"Ulduar", -- [2]
				},
				[28920] = {
					"Stormforged Giant", -- [1]
					"Halls of Lightning", -- [2]
				},
				[137591] = {
					"Healing Tide Totem", -- [1]
					"Kings' Rest", -- [2]
				},
				[136793] = {
					"Circle Apprentice", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[45377] = {
					"Augh", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[132773] = {
					"Boulderfist Enforcer", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[29240] = {
					"Stormforged Lieutenant", -- [1]
					"Halls of Lightning", -- [2]
				},
				[144246] = {
					"K.U.-J.0.", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[17083] = {
					"Fel Orc Convert", -- [1]
					"Hellfire Citadel: The Shattered Halls", -- [2]
				},
				[58856] = {
					"Haunting Sha", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[45007] = {
					"Enslaved Bandit", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[134418] = {
					"Drowned Depthbringer", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[139813] = {
					"Senior Producer Gixi", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[114625] = {
					"Phantom Guest", -- [1]
					"Return to Karazhan", -- [2]
				},
				[132754] = {
					"Highland Strider", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[38154] = {
					"Warhawk", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[144759] = {
					"Keeper Dagda", -- [1]
					"Warfronts Darkshore - Horde", -- [2]
				},
				[44898] = {
					"Pygmy Firebreather", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[21818] = {
					"Infinite Whelp", -- [1]
					"Opening of the Dark Portal", -- [2]
				},
				[132767] = {
					"Boulderfist Ogre", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[44896] = {
					"Pygmy Brute", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[129470] = {
					"Deepsea Crab", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[129214] = {
					"Coin-Operated Crowd Pummeler", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[144248] = {
					"Head Machinist Sparkflux", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[161140] = {
					"Bwemba", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[15230] = {
					"Vekniss Warrior", -- [1]
					"Ahn'Qiraj Temple", -- [2]
				},
				[15262] = {
					"Obsidian Eradicator", -- [1]
					"Ahn'Qiraj Temple", -- [2]
				},
				[140454] = {
					"Many-Braids the Elder", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[131578] = {
					"Burning Exile", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[114626] = {
					"Forlorn Spirit", -- [1]
					"Return to Karazhan", -- [2]
				},
				[15390] = {
					"Captain Xurrem", -- [1]
					"Ruins of Ahn'Qiraj", -- [2]
				},
				[144249] = {
					"Omega Buster", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[15461] = {
					"Shrieker Scarab", -- [1]
					"Ruins of Ahn'Qiraj", -- [2]
				},
				[61928] = {
					"Sik'thik Guardian", -- [1]
					"Siege of Niuzao Temple", -- [2]
				},
				[45676] = {
					"Faceless Guardian", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[15550] = {
					"Attumen the Huntsman", -- [1]
					"Karazhan", -- [2]
				},
				[45268] = {
					"Servant of Siamat", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[136964] = {
					"High Perch Arbalest", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[75980] = {
					"Blindlight Razorjaw", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[129471] = {
					"Deepsea Sandcrawler", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[17879] = {
					"Chrono Lord Deja", -- [1]
					"Opening of the Dark Portal", -- [2]
				},
				[8910] = {
					"Blazing Fireguard", -- [1]
					"Blackrock Depths", -- [2]
				},
				[44897] = {
					"Pygmy Scout", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[8894] = {
					"Anvilrage Medic", -- [1]
					"Blackrock Depths", -- [2]
				},
				[9499] = {
					"Plugger Spazzring", -- [1]
					"Blackrock Depths", -- [2]
				},
				[47017] = {
					"Fire Elemental", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[134423] = {
					"Abyss Dweller", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[30278] = {
					"Ahn'kahar Spell Flinger", -- [1]
					"Ahn'kahet: The Old Kingdom", -- [2]
				},
				[18317] = {
					"Ethereal Priest", -- [1]
					"Auchindoun: Mana-Tombs", -- [2]
				},
				[9035] = {
					"Anger'rel", -- [1]
					"Blackrock Depths", -- [2]
				},
				[60009] = {
					"Feng the Accursed", -- [1]
					"Mogu'shan Vaults", -- [2]
				},
				[75643] = {
					"Blindlight Murloc", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[135715] = {
					"Ferocious Nightsaber", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[120770] = {
					"Felguard Destroyer", -- [1]
					"Cathedral of Eternal Night", -- [2]
				},
				[28584] = {
					"Unbound Firestorm", -- [1]
					"Halls of Lightning", -- [2]
				},
				[140669] = {
					"Rockmane Howler", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[12127] = {
					"Stormpike Guardsman", -- [1]
					"Alterac Valley", -- [2]
				},
				[29830] = {
					"Living Mojo", -- [1]
					"Gundrak", -- [2]
				},
				[32913] = {
					"Elder Ironbranch", -- [1]
					"Ulduar", -- [2]
				},
				[134764] = {
					"Clattershell", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[137443] = {
					"Friar Farshire", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[114628] = {
					"Skeletal Waiter", -- [1]
					"Return to Karazhan", -- [2]
				},
				[26793] = {
					"Crystalline Frayer", -- [1]
					"The Nexus", -- [2]
				},
				[24698] = {
					"Ethereum Smuggler", -- [1]
					"Magister's Terrace", -- [2]
				},
				[144765] = {
					"Asithra Diresong", -- [1]
					"Warfronts Darkshore - Horde", -- [2]
				},
				[61929] = {
					"Sik'thik Amber-Weaver", -- [1]
					"Siege of Niuzao Temple", -- [2]
				},
				[57962] = {
					"Deathwing", -- [1]
					"Dragon Soul", -- [2]
				},
				[150396] = {
					"Aerial Unit R-21/X", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[146813] = {
					"Gunther the Gray", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[53134] = {
					"Ancient Core Hound", -- [1]
					"Firelands", -- [2]
				},
				[4257] = {
					"Lana Thunderbrew", -- [1]
					"Alterac Valley", -- [2]
				},
				[29305] = {
					"Moorabi", -- [1]
					"Gundrak", -- [2]
				},
				[132481] = {
					"Kul Tiran Vanguard", -- [1]
					"Siege of Boralus", -- [2]
				},
				[16424] = {
					"Spectral Sentry", -- [1]
					"Karazhan", -- [2]
				},
				[21128] = {
					"Coilfang Ray", -- [1]
					"Coilfang: The Slave Pens", -- [2]
				},
				[150397] = {
					"King Mechagon", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[75034] = {
					"Twilight Tormentor", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[114629] = {
					"Spectral Retainer", -- [1]
					"Return to Karazhan", -- [2]
				},
				[34928] = {
					"Argent Confessor Paletress", -- [1]
					"Trial of the Champion", -- [2]
				},
				[9036] = {
					"Vile'rel", -- [1]
					"Blackrock Depths", -- [2]
				},
				[44976] = {
					"Neferset Plaguebringer", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[36807] = {
					"Deathspeaker Disciple", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[135248] = {
					"Briona the Bloodthirsty", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[158588] = {
					"Gamon", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[52076] = {
					"Gurubashi Cauldron-Mixer", -- [1]
					"Zul'Gurub", -- [2]
				},
				[139345] = {
					"Deathwhisperer Kulu", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[56427] = {
					"Warmaster Blackhorn", -- [1]
					"Dragon Soul", -- [2]
				},
				[140161] = {
					"Duneburrower", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[9056] = {
					"Fineous Darkvire", -- [1]
					"Blackrock Depths", -- [2]
				},
				[139400] = {
					"Mirelurk Rivercaller", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[61699] = {
					"Sik'thik Amberwing", -- [1]
					"Siege of Niuzao Temple", -- [2]
				},
				[32906] = {
					"Freya", -- [1]
					"Ulduar", -- [2]
				},
				[146816] = {
					"Sir Barton Brigham", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[163708] = {
					"Umbral Gatekeeper", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[19168] = {
					"Sunseeker Astromage", -- [1]
					"Tempest Keep: The Mechanar", -- [2]
				},
				[111047] = {
					"Parasitic Shadow Demon", -- [1]
					"The Nighthold", -- [2]
				},
				[37232] = {
					"Nerub'ar Broodling", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[137091] = {
					"High Perch Initiate", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[140450] = {
					"Dunu the Blind", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[37782] = {
					"Flesh-eating Insect", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[138627] = {
					"Amathet Hierophant", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[135044] = {
					"Shredmaw the Voracious", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[9018] = {
					"High Interrogator Gerstahn", -- [1]
					"Blackrock Depths", -- [2]
				},
				[141285] = {
					"Kul Tiran Marksman", -- [1]
					"Siege of Boralus", -- [2]
				},
				[34161] = {
					"Mechanostriker 54-A", -- [1]
					"Ulduar", -- [2]
				},
				[137092] = {
					"Valorcall Faithful", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[28583] = {
					"Blistering Steamrager", -- [1]
					"Halls of Lightning", -- [2]
				},
				[18331] = {
					"Ethereal Darkcaster", -- [1]
					"Auchindoun: Mana-Tombs", -- [2]
				},
				[138628] = {
					"Amathet Priest", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[47086] = {
					"Crimsonborne Firestarter", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[139348] = {
					"Baga the Frostshield", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[131974] = {
					"Lieutenant Valen", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[59544] = {
					"The Nodding Tiger", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[8896] = {
					"Shadowforge Peasant", -- [1]
					"Blackrock Depths", -- [2]
				},
				[146653] = {
					"Champion Huntress", -- [1]
					"Warfronts Darkshore - Horde", -- [2]
				},
				[37016] = {
					"Skybreaker Luminary", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[52077] = {
					"Gurubashi Berserker", -- [1]
					"Zul'Gurub", -- [2]
				},
				[135368] = {
					"Ironforge Artillerist", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[37003] = {
					"Skybreaker Vindicator", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[127021] = {
					"Muradin Bronzebeard", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[140677] = {
					"Hulking Frostbeard", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[147938] = {
					"Azergem Crystalback", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[138470] = {
					"Obsidian Drake", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[114264] = {
					"Midnight", -- [1]
					"Return to Karazhan", -- [2]
				},
				[138630] = {
					"Cleric Izzad", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[163712] = {
					"Dying Voidspawn", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[32882] = {
					"Jormungar Behemoth", -- [1]
					"Ulduar", -- [2]
				},
				[14399] = {
					"Arcane Torrent", -- [1]
					"Dire Maul", -- [2]
				},
				[140678] = {
					"Frostbeard Howler", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[16523] = {
					"Shattered Hand Savage", -- [1]
					"Hellfire Citadel: The Shattered Halls", -- [2]
				},
				[29774] = {
					"Spitting Cobra", -- [1]
					"Gundrak", -- [2]
				},
				[53648] = {
					"Inferno Hawk", -- [1]
					"Firelands", -- [2]
				},
				[135834] = {
					"Vile Cloud", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[20988] = {
					"Sunseeker Engineer", -- [1]
					"Tempest Keep: The Mechanar", -- [2]
				},
				[68098] = {
					"Ashtongue Worker", -- [1]
					"Pursuing the Black Harvest", -- [2]
				},
				[29306] = {
					"Gal'darah", -- [1]
					"Gundrak", -- [2]
				},
				[140679] = {
					"Frostbeard Wendigo", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[105419] = {
					"Dire Basilisk", -- [1]
					"Warsong Gulch", -- [2]
				},
				[19016] = {
					"Hellfire Familiar", -- [1]
					"Hellfire Citadel: The Blood Furnace", -- [2]
				},
				[17547] = {
					"Tinhead", -- [1]
					"Karazhan", -- [2]
				},
				[134280] = {
					"Vindicator Baatul", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[114633] = {
					"Spectral Valet", -- [1]
					"Return to Karazhan", -- [2]
				},
				[47087] = {
					"Azureborne Destroyer", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[140168] = {
					"Elder Chest-Thump", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[18836] = {
					"Blindeye the Seer", -- [1]
					"Gruul's Lair", -- [2]
				},
				[137097] = {
					"Valorcall Spellweaver", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[20883] = {
					"Spiteful Temptress", -- [1]
					"Tempest Keep: The Arcatraz", -- [2]
				},
				[138475] = {
					"Tyrantion", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[138633] = {
					"Brother Maat", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[60396] = {
					"Emperor's Rage", -- [1]
					"Mogu'shan Vaults", -- [2]
				},
				[132491] = {
					"Kul Tiran Marksman", -- [1]
					"Siege of Boralus", -- [2]
				},
				[117193] = {
					"Agronox", -- [1]
					"Cathedral of Eternal Night", -- [2]
				},
				[144776] = {
					"Airyn Swiftfeet", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[139027] = {
					"Crescent Oracle", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[15263] = {
					"The Prophet Skeram", -- [1]
					"Ahn'Qiraj Temple", -- [2]
				},
				[45062] = {
					"Oathsworn Scorpid Keeper", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[138634] = {
					"Prophet Lapisa", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[114634] = {
					"Undying Servant", -- [1]
					"Return to Karazhan", -- [2]
				},
				[15391] = {
					"Captain Qeez", -- [1]
					"Ruins of Ahn'Qiraj", -- [2]
				},
				[140986] = {
					"Acidic Burrower", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[18312] = {
					"Ethereal Spellbinder", -- [1]
					"Auchindoun: Mana-Tombs", -- [2]
				},
				[57807] = {
					"Twilight Frost Evoker", -- [1]
					"Dragon Soul", -- [2]
				},
				[16545] = {
					"Ethereal Spellfilcher", -- [1]
					"Karazhan", -- [2]
				},
				[128455] = {
					"T'lonja", -- [1]
					"Atal'Dazar", -- [2]
				},
				[33651] = {
					"VX-001", -- [1]
					"Ulduar", -- [2]
				},
				[140769] = {
					"Goldenvein", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[139659] = {
					"Dampscale Oracle", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[140440] = {
					"Bloodfur the Gorer", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[30277] = {
					"Ahn'kahar Slasher", -- [1]
					"Ahn'kahet: The Old Kingdom", -- [2]
				},
				[28579] = {
					"Hardened Steel Berserker", -- [1]
					"Halls of Lightning", -- [2]
				},
				[138516] = {
					"Twilight Evolutionist", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[16470] = {
					"Ghostly Philanthropist", -- [1]
					"Karazhan", -- [2]
				},
				[138636] = {
					"Prince Abari", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[133836] = {
					"Reanimated Guardian", -- [1]
					"The Underrot", -- [2]
				},
				[15547] = {
					"Spectral Charger", -- [1]
					"Karazhan", -- [2]
				},
				[161243] = {
					"Samh'rek, Beckoner of Chaos", -- [1]
					"Atal'Dazar", -- [2]
				},
				[140684] = {
					"Crushstomp", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[137059] = {
					"Headshrinker Gaha", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[24684] = {
					"Sunblade Blood Knight", -- [1]
					"Magister's Terrace", -- [2]
				},
				[60397] = {
					"Emperor's Strength", -- [1]
					"Mogu'shan Vaults", -- [2]
				},
				[146827] = {
					"Feral Dog", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[120778] = {
					"Wrathguard Invader", -- [1]
					"Cathedral of Eternal Night", -- [2]
				},
				[17447] = {
					"Core Hound", -- [1]
					"Coilfang: The Slave Pens", -- [2]
				},
				[12096] = {
					"Stormpike Quartermaster", -- [1]
					"Alterac Valley", -- [2]
				},
				[37532] = {
					"Frostwing Whelp", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[133007] = {
					"Unbound Abomination", -- [1]
					"The Underrot", -- [2]
				},
				[131009] = {
					"Spirit of Gold", -- [1]
					"Atal'Dazar", -- [2]
				},
				[95072] = {
					"Greater Earth Elemental", -- [1]
					"Eye of the Storm", -- [2]
				},
				[146828] = {
					"Feral Pup", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[114636] = {
					"Phantom Guardsman", -- [1]
					"Return to Karazhan", -- [2]
				},
				[74446] = {
					"Ghamoo-Ra", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[136160] = {
					"King Dazar", -- [1]
					"Kings' Rest", -- [2]
				},
				[32875] = {
					"Iron Honor Guard", -- [1]
					"Ulduar", -- [2]
				},
				[137103] = {
					"Blood Visage", -- [1]
					"The Underrot", -- [2]
				},
				[18835] = {
					"Kiggler the Crazed", -- [1]
					"Gruul's Lair", -- [2]
				},
				[108360] = {
					"Acidmaw Scorpid", -- [1]
					"The Nighthold", -- [2]
				},
				[128969] = {
					"Ashvane Commander", -- [1]
					"Siege of Boralus", -- [2]
				},
				[120779] = {
					"Helblaze Felbringer", -- [1]
					"Cathedral of Eternal Night", -- [2]
				},
				[34164] = {
					"Mechagnome Battletank", -- [1]
					"Ulduar", -- [2]
				},
				[29307] = {
					"Drakkari Colossus", -- [1]
					"Gundrak", -- [2]
				},
				[144782] = {
					"Brother Bruen", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[52405] = {
					"Mor'Lek the Dismantler", -- [1]
					"Zul'Gurub", -- [2]
				},
				[53635] = {
					"Cinderweb Drone", -- [1]
					"Firelands", -- [2]
				},
				[140294] = {
					"Snowfur Wolf", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[32904] = {
					"Dark Rune Commoner", -- [1]
					"Ulduar", -- [2]
				},
				[114637] = {
					"Spectral Sentry", -- [1]
					"Return to Karazhan", -- [2]
				},
				[15509] = {
					"Princess Huhuran", -- [1]
					"Ahn'Qiraj Temple", -- [2]
				},
				[29819] = {
					"Drakkari Lancer", -- [1]
					"Gundrak", -- [2]
				},
				[114284] = {
					"Elfyra", -- [1]
					"Return to Karazhan", -- [2]
				},
				[14327] = {
					"Lethtendris", -- [1]
					"Dire Maul", -- [2]
				},
				[158092] = {
					"Fallen Heartpiercer", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[8897] = {
					"Doomforge Craftsman", -- [1]
					"Blackrock Depths", -- [2]
				},
				[138641] = {
					"Kvaldir Dreadbringer", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[60398] = {
					"Emperor's Courage", -- [1]
					"Mogu'shan Vaults", -- [2]
				},
				[17461] = {
					"Shattered Hand Blood Guard", -- [1]
					"Hellfire Citadel: The Shattered Halls", -- [2]
				},
				[127799] = {
					"Dazar'ai Honor Guard", -- [1]
					"Atal'Dazar", -- [2]
				},
				[140689] = {
					"Dreadfang Slitherer", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[26746] = {
					"Crazed Mana-Wraith", -- [1]
					"The Nexus", -- [2]
				},
				[17623] = {
					"Reaver Guard", -- [1]
					"Hellfire Citadel: The Shattered Halls", -- [2]
				},
				[53188] = {
					"Flamewaker Subjugator", -- [1]
					"Firelands", -- [2]
				},
				[36724] = {
					"Servant of the Throne", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[38125] = {
					"Ymirjar Deathbringer", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[139666] = {
					"Orgl the Totemic", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[136083] = {
					"Forgotten Denizen", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[140690] = {
					"Dreadfang Viper", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[13280] = {
					"Hydrospawn", -- [1]
					"Dire Maul", -- [2]
				},
				[131311] = {
					"Unleashed Azerite", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[33525] = {
					"Mangrove Ent", -- [1]
					"Ulduar", -- [2]
				},
				[146833] = {
					"Necromancer Conjurer", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[15316] = {
					"Qiraji Scarab", -- [1]
					"Ahn'Qiraj Temple", -- [2]
				},
				[129227] = {
					"Azerokk", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[140985] = {
					"Acidic Worm", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[140691] = {
					"Giant Dreadfang", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[145298] = {
					"Feral Hungerer", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[134895] = {
					"Ironweb Weaver", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[52079] = {
					"Gurubashi Bloodrager", -- [1]
					"Zul'Gurub", -- [2]
				},
				[146834] = {
					"Necromancer Master", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[17398] = {
					"Nascent Fel Orc", -- [1]
					"Hellfire Citadel: The Blood Furnace", -- [2]
				},
				[134216] = {
					"Shadeweaver Zarra", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[140180] = {
					"Brutalgore", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[35189] = {
					"Skjoll", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[19710] = {
					"Gatewatcher Iron-Hand", -- [1]
					"Tempest Keep: The Mechanar", -- [2]
				},
				[20898] = {
					"Gargantuan Abyssal", -- [1]
					"Tempest Keep: The Arcatraz", -- [2]
				},
				[60143] = {
					"Gara'jal the Spiritbinder", -- [1]
					"Mogu'shan Vaults", -- [2]
				},
				[146835] = {
					"Ghoul", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[159632] = {
					"Cultist Shadowblade", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[136838] = {
					"Zgordo the Brutalizer", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[20885] = {
					"Dalliah the Doomsayer", -- [1]
					"Tempest Keep: The Arcatraz", -- [2]
				},
				[139667] = {
					"Seer Grglok", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[159633] = {
					"Cultist Executioner", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[53617] = {
					"Molten Erupter", -- [1]
					"Firelands", -- [2]
				},
				[36597] = {
					"The Lich King", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[36725] = {
					"Nerub'ar Broodkeeper", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[20478] = {
					"Arcane Servant", -- [1]
					"Tempest Keep: The Mechanar", -- [2]
				},
				[32886] = {
					"Dark Rune Acolyte", -- [1]
					"Ulduar", -- [2]
				},
				[14400] = {
					"Arcane Feedback", -- [1]
					"Dire Maul", -- [2]
				},
				[140694] = {
					"Gorgejaw the Glutton", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[37027] = {
					"Skybreaker Hierophant", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[30622] = {
					"Granmir", -- [1]
					"Ahn'kahet: The Old Kingdom", -- [2]
				},
				[33526] = {
					"Ironroot Lasher", -- [1]
					"Ulduar", -- [2]
				},
				[138647] = {
					"Hjana Fogbringer", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[20990] = {
					"Bloodwarder Physician", -- [1]
					"Tempest Keep: The Mechanar", -- [2]
				},
				[122973] = {
					"Dazar'ai Confessor", -- [1]
					"Atal'Dazar", -- [2]
				},
				[29308] = {
					"Prince Taldaram", -- [1]
					"Ahn'kahet: The Old Kingdom", -- [2]
				},
				[114316] = {
					"Baroness Dorothea Millstipe", -- [1]
					"Return to Karazhan", -- [2]
				},
				[105427] = {
					"Skyfury Totem", -- [1]
					"Warsong Gulch", -- [2]
				},
				[45700] = {
					"Twilight Portal Shaper", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[16406] = {
					"Phantom Attendant", -- [1]
					"Karazhan", -- [2]
				},
				[146838] = {
					"Brittle Skeleton", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[116550] = {
					"Spectral Patron", -- [1]
					"Return to Karazhan", -- [2]
				},
				[37126] = {
					"Sister Svalna", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[29820] = {
					"Drakkari God Hunter", -- [1]
					"Gundrak", -- [2]
				},
				[140838] = {
					"Mischievous Flood", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[145303] = {
					"Kaldorei Glaive Thrower", -- [1]
					"Warfronts Darkshore - Horde", -- [2]
				},
				[99541] = {
					"Risen Skulker", -- [1]
					"Warsong Gulch", -- [2]
				},
				[19167] = {
					"Bloodwarder Slayer", -- [1]
					"Tempest Keep: The Mechanar", -- [2]
				},
				[52082] = {
					"Gurubashi Cauldron-Mixer", -- [1]
					"Zul'Gurub", -- [2]
				},
				[60400] = {
					"Jan-xi", -- [1]
					"Mogu'shan Vaults", -- [2]
				},
				[18982] = {
					"Sable Jaguar", -- [1]
					"Opening of the Dark Portal", -- [2]
				},
				[15168] = {
					"Vile Scarab", -- [1]
					"Ruins of Ahn'Qiraj", -- [2]
				},
				[18311] = {
					"Ethereal Crypt Raider", -- [1]
					"Auchindoun: Mana-Tombs", -- [2]
				},
				[145304] = {
					"Feral Strangler", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[15264] = {
					"Anubisath Sentinel", -- [1]
					"Ahn'Qiraj Temple", -- [2]
				},
				[14324] = {
					"Cho'Rush the Observer", -- [1]
					"Dire Maul", -- [2]
				},
				[146840] = {
					"Skeleton Guardian", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[18431] = {
					"Ethereal Beacon", -- [1]
					"Auchindoun: Mana-Tombs", -- [2]
				},
				[15392] = {
					"Captain Tuubid", -- [1]
					"Ruins of Ahn'Qiraj", -- [2]
				},
				[89] = {
					"Infernal", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[161173] = {
					"Abyssal Watcher", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[74716] = {
					"Aqua Guardian", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[19219] = {
					"Mechano-Lord Capacitus", -- [1]
					"Tempest Keep: The Mechanar", -- [2]
				},
				[33527] = {
					"Nature's Blade", -- [1]
					"Ulduar", -- [2]
				},
				[11489] = {
					"Tendris Warpwood", -- [1]
					"Dire Maul", -- [2]
				},
				[56915] = {
					"Sun", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[129231] = {
					"Rixxa Fluxflame", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[17991] = {
					"Rokmar the Crackler", -- [1]
					"Coilfang: The Slave Pens", -- [2]
				},
				[121553] = {
					"Dreadhunter", -- [1]
					"Cathedral of Eternal Night", -- [2]
				},
				[134993] = {
					"Mchimba the Embalmer", -- [1]
					"Kings' Rest", -- [2]
				},
				[16473] = {
					"Spectral Performer", -- [1]
					"Karazhan", -- [2]
				},
				[36829] = {
					"Deathspeaker High Priest", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[145305] = {
					"Feral Hulk", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[17671] = {
					"Shattered Hand Champion", -- [1]
					"Hellfire Citadel: The Shattered Halls", -- [2]
				},
				[21702] = {
					"Ethereum Life-Binder", -- [1]
					"Tempest Keep: The Arcatraz", -- [2]
				},
				[160663] = {
					"Essence of Nightmare", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[17543] = {
					"Strawman", -- [1]
					"Karazhan", -- [2]
				},
				[15548] = {
					"Spectral Stallion", -- [1]
					"Karazhan", -- [2]
				},
				[17880] = {
					"Temporus", -- [1]
					"Opening of the Dark Portal", -- [2]
				},
				[16471] = {
					"Skeletal Usher", -- [1]
					"Karazhan", -- [2]
				},
				[146843] = {
					"Spiked Ghoul", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[52339] = {
					"Lesser Priest of Bethekk", -- [1]
					"Zul'Gurub", -- [2]
				},
				[129232] = {
					"Mogul Razdunk", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[133593] = {
					"Expert Technician", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[12129] = {
					"Onyxian Warder", -- [1]
					"Onyxia's Lair", -- [2]
				},
				[114312] = {
					"Moroes", -- [1]
					"Return to Karazhan", -- [2]
				},
				[12017] = {
					"Broodlord Lashlayer", -- [1]
					"Blackwing Lair", -- [2]
				},
				[21126] = {
					"Coilfang Scale-Healer", -- [1]
					"Coilfang: The Slave Pens", -- [2]
				},
				[138654] = {
					"Vestar of the Tattered Sail", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[36855] = {
					"Lady Deathwhisper", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[36811] = {
					"Deathspeaker Attendant", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[45261] = {
					"Twilight Shadow Knight", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[152987] = {
					"Faceless Willbreaker", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[157594] = {
					"Lesser Void Elemental", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[16704] = {
					"Shattered Hand Sharpshooter", -- [1]
					"Hellfire Citadel: The Shattered Halls", -- [2]
				},
				[33528] = {
					"Guardian of Life", -- [1]
					"Ulduar", -- [2]
				},
				[146845] = {
					"Jared the Jagged", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[68176] = {
					"Unbound Centurion", -- [1]
					"Pursuing the Black Harvest", -- [2]
				},
				[138837] = {
					"Zara'thik Ambershaper", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[29309] = {
					"Elder Nadox", -- [1]
					"Ahn'kahet: The Old Kingdom", -- [2]
				},
				[152988] = {
					"Faceless Shadowcaller", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[45699] = {
					"Twilight Shadow Mender", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[144971] = {
					"Druid of the Branch", -- [1]
					"Warfronts Darkshore - Horde", -- [2]
				},
				[154524] = {
					"K'thir Mindcarver", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[46965] = {
					"Cho'gall", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[140182] = {
					"Trampleleaf the Jungle Quake", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[132056] = {
					"Venture Co. Skyscorcher", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[45872] = {
					"Rohash", -- [1]
					"Throne of the Four Winds", -- [2]
				},
				[135169] = {
					"Spirit Drain Totem", -- [1]
					"The Underrot", -- [2]
				},
				[74719] = {
					"Blindlight Rotmouth", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[14308] = {
					"Ferra", -- [1]
					"Dire Maul", -- [2]
				},
				[162715] = {
					"Fanatical Cultist", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[37023] = {
					"Plague Scientist", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[60402] = {
					"Zandalari Fire-Dancer", -- [1]
					"Mogu'shan Vaults", -- [2]
				},
				[52340] = {
					"Tiki Lord Mu'Loa", -- [1]
					"Zul'Gurub", -- [2]
				},
				[11457] = {
					"Wildspawn Hellcaller", -- [1]
					"Dire Maul", -- [2]
				},
				[135923] = {
					"Hound of Gazzran", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[36678] = {
					"Professor Putricide", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[140085] = {
					"Pinegraze Greatstag", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[162716] = {
					"Spellbound Ritualist", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[53108] = {
					"Temple Rat", -- [1]
					"Zul'Gurub", -- [2]
				},
				[46382] = {
					"Petty Criminal", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[131492] = {
					"Devout Blood Priest", -- [1]
					"The Underrot", -- [2]
				},
				[122984] = {
					"Dazar'ai Colossus", -- [1]
					"Atal'Dazar", -- [2]
				},
				[74565] = {
					"Subjugator Kor'ul", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[74720] = {
					"Blindlight Murloc", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[135931] = {
					"Ashstone", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[162717] = {
					"Sinister Soulcarver", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[15341] = {
					"General Rajaxx", -- [1]
					"Ruins of Ahn'Qiraj", -- [2]
				},
				[132005] = {
					"Grayson Bell", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[13601] = {
					"Tinkerer Gizlock", -- [1]
					"Maraudon", -- [2]
				},
				[136100] = {
					"Sunken Denizen", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[15388] = {
					"Major Pakkon", -- [1]
					"Ruins of Ahn'Qiraj", -- [2]
				},
				[138489] = {
					"Shadow of Zul", -- [1]
					"Kings' Rest", -- [2]
				},
				[136841] = {
					"Thu'zun the Vile", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[162718] = {
					"Iron-Willed Enforcer", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[138660] = {
					"Mist Hound", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[114544] = {
					"Skeletal Usher", -- [1]
					"Return to Karazhan", -- [2]
				},
				[33136] = {
					"Guardian of Yogg-Saron", -- [1]
					"Ulduar", -- [2]
				},
				[13022] = {
					"Whip Lasher", -- [1]
					"Dire Maul", -- [2]
				},
				[74721] = {
					"Blindlight Bilefin", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[19712] = {
					"Mechanar Driller", -- [1]
					"Tempest Keep: The Mechanar", -- [2]
				},
				[34014] = {
					"Sanctum Sentry", -- [1]
					"Ulduar", -- [2]
				},
				[162719] = {
					"Void Ascendant", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[104154] = {
					"Gul'dan", -- [1]
					"The Nighthold", -- [2]
				},
				[11456] = {
					"Wildspawn Shadowstalker", -- [1]
					"Dire Maul", -- [2]
				},
				[17959] = {
					"Coilfang Slavehandler", -- [1]
					"Coilfang: The Slave Pens", -- [2]
				},
				[156577] = {
					"Therum Deepforge", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[118716] = {
					"Bilespray Lasher", -- [1]
					"Cathedral of Eternal Night", -- [2]
				},
				[130765] = {
					"Jungle Stalker Cub", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[129830] = {
					"Clackclaw the Behemoth", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[11790] = {
					"Putridus Satyr", -- [1]
					"Maraudon", -- [2]
				},
				[146852] = {
					"Konrad the Enslaver", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[133588] = {
					"Automatic Explosive Ejector", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[14369] = {
					"Shen'dralar Zealot", -- [1]
					"Dire Maul", -- [2]
				},
				[144293] = {
					"Waste Processing Unit", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[157450] = {
					"Spellbound Ritualist", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[14465] = {
					"Alliance Battle Standard", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[45687] = {
					"Twilight-Shifter", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[134056] = {
					"Aqu'sirr", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[161229] = {
					"Aqir Venomweaver", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[52061] = {
					"Pride of Bethekk", -- [1]
					"Zul'Gurub", -- [2]
				},
				[32865] = {
					"Thorim", -- [1]
					"Ulduar", -- [2]
				},
				[144294] = {
					"Mechagon Tinkerer", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[140334] = {
					"Nightscale Coilfang", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[157603] = {
					"Void Globule", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[146854] = {
					"Stella Darkpaw", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[36612] = {
					"Lord Marrowgar", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[29630] = {
					"Fanged Pit Viper", -- [1]
					"Gundrak", -- [2]
				},
				[140059] = {
					"Grizzlefur Mauler", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[119000] = {
					"Dreadbeard", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[29822] = {
					"Drakkari Fire Weaver", -- [1]
					"Gundrak", -- [2]
				},
				[59764] = {
					"Healing Tide Totem", -- [1]
					"Eye of the Storm", -- [2]
				},
				[157604] = {
					"Crawling Corruption", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[11472] = {
					"Eldreth Spirit", -- [1]
					"Dire Maul", -- [2]
				},
				[134058] = {
					"Galecaller Faye", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[37662] = {
					"Darkfallen Commander", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[132051] = {
					"Blood Tick", -- [1]
					"The Underrot", -- [2]
				},
				[88288] = {
					"Dungeoneer's Training Dummy", -- [1]
					"FW Horde Garrison Level 3", -- [2]
				},
				[144296] = {
					"Spider Tank", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[52598] = {
					"Gurubashi Soul-Eater", -- [1]
					"Zul'Gurub", -- [2]
				},
				[18177] = {
					"Tainted Stoneskin Totem", -- [1]
					"Coilfang: The Slave Pens", -- [2]
				},
				[16699] = {
					"Shattered Hand Reaver", -- [1]
					"Hellfire Citadel: The Shattered Halls", -- [2]
				},
				[126423] = {
					"Coralback Crab", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[140542] = {
					"Kindleweb Spider", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[57333] = {
					"Acidic Globule", -- [1]
					"Dragon Soul", -- [2]
				},
				[139690] = {
					"Brineshell Seacaller", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[53494] = {
					"Baleroc", -- [1]
					"Firelands", -- [2]
				},
				[120556] = {
					"Dreadwing", -- [1]
					"Cathedral of Eternal Night", -- [2]
				},
				[140441] = {
					"Muskflank Calf", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[74980] = {
					"Twilight Storm Mender", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[11458] = {
					"Petrified Treant", -- [1]
					"Dire Maul", -- [2]
				},
				[11490] = {
					"Zevrim Thornhoof", -- [1]
					"Dire Maul", -- [2]
				},
				[36853] = {
					"Sindragosa", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[139691] = {
					"Brineshell Squallshaper", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[144298] = {
					"Defense Bot Mk III", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[35332] = {
					"Darnassus Champion", -- [1]
					"Trial of the Champion", -- [2]
				},
				[157607] = {
					"Faceless Shadowcaller", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[16507] = {
					"Shattered Hand Sentry", -- [1]
					"Hellfire Citadel: The Shattered Halls", -- [2]
				},
				[142251] = {
					"Yogursa", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[129032] = {
					"Stranded Crewman", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[138502] = {
					"Naroviak Wyrm-Bender", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[139692] = {
					"Brineshell Elder", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[144299] = {
					"Workshop Defender", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[19713] = {
					"Mechanar Wrecker", -- [1]
					"Tempest Keep: The Mechanar", -- [2]
				},
				[157608] = {
					"Faceless Willbreaker", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[35451] = {
					"The Black Knight", -- [1]
					"Trial of the Champion", -- [2]
				},
				[162303] = {
					"Aqir Swarmkeeper", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[146859] = {
					"Enslaved Rock Elemental", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[37011] = {
					"The Damned", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[158774] = {
					"Broken Citizen", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[144300] = {
					"Mechagon Citizen", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[147225] = {
					"Azerite Extractor", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[157609] = {
					"K'thir Mindcarver", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[113043] = {
					"Abyss Watcher", -- [1]
					"The Nighthold", -- [2]
				},
				[134063] = {
					"Brother Ironhull", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[12258] = {
					"Razorlash", -- [1]
					"Maraudon", -- [2]
				},
				[20481] = {
					"Raging Flames", -- [1]
					"Tempest Keep: The Mechanar", -- [2]
				},
				[14398] = {
					"Eldreth Darter", -- [1]
					"Dire Maul", -- [2]
				},
				[144301] = {
					"Living Waste", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[12435] = {
					"Razorgore the Untamed", -- [1]
					"Blackwing Lair", -- [2]
				},
				[157610] = {
					"K'thir Dominator", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[138466] = {
					"Obsidian Whelp", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[20865] = {
					"Protean Horror", -- [1]
					"Tempest Keep: The Arcatraz", -- [2]
				},
				[146893] = {
					"Fleshrot Mystic", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[62205] = {
					"Wing Leader Ner'onok", -- [1]
					"Siege of Niuzao Temple", -- [2]
				},
				[20864] = {
					"Protean Nightmare", -- [1]
					"Tempest Keep: The Arcatraz", -- [2]
				},
				[29311] = {
					"Herald Volazj", -- [1]
					"Ahn'kahet: The Old Kingdom", -- [2]
				},
				[12416] = {
					"Blackwing Legionnaire", -- [1]
					"Blackwing Lair", -- [2]
				},
				[53631] = {
					"Cinderweb Spiderling", -- [1]
					"Firelands", -- [2]
				},
				[140428] = {
					"Chasm-Jumper", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[28923] = {
					"Loken", -- [1]
					"Halls of Lightning", -- [2]
				},
				[162305] = {
					"Aqir Heartpiercer", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[53119] = {
					"Flamewaker Forward Guard", -- [1]
					"Firelands", -- [2]
				},
				[144303] = {
					"G.U.A.R.D.", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[111070] = {
					"Soul Fragment of Azzinoth", -- [1]
					"The Nighthold", -- [2]
				},
				[132530] = {
					"Kul Tiran Vanguard", -- [1]
					"Siege of Boralus", -- [2]
				},
				[157612] = {
					"Eye of Drest'agath", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[74983] = {
					"Twilight Disciple", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[8899] = {
					"Doomforge Dragoon", -- [1]
					"Blackrock Depths", -- [2]
				},
				[52088] = {
					"Gurubashi Cauldron-Mixer", -- [1]
					"Zul'Gurub", -- [2]
				},
				[32873] = {
					"Ancient Rune Giant", -- [1]
					"Ulduar", -- [2]
				},
				[56439] = {
					"Sha of Doubt", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[25756] = {
					"Ahunite Coldwave", -- [1]
					"Coilfang: The Slave Pens", -- [2]
				},
				[56732] = {
					"Liu Flameheart", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[157613] = {
					"Maw of Drest'agath", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[5913] = {
					"Tremor Totem", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[13282] = {
					"Noxxion", -- [1]
					"Maraudon", -- [2]
				},
				[44922] = {
					"Oathsworn Axemaster", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[68096] = {
					"Ashtongue Primalist", -- [1]
					"Pursuing the Black Harvest", -- [2]
				},
				[139698] = {
					"Clattercraw the Oracle", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[37116] = {
					"Skybreaker Sorcerer", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[132532] = {
					"Kul Tiran Marksman", -- [1]
					"Siege of Boralus", -- [2]
				},
				[157614] = {
					"Tentacle of Drest'agath", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[74984] = {
					"Blindlight Murloc", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[11792] = {
					"Putridus Shadowstalker", -- [1]
					"Maraudon", -- [2]
				},
				[134060] = {
					"Lord Stormsong", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[14323] = {
					"Guard Slip'kik", -- [1]
					"Dire Maul", -- [2]
				},
				[135962] = {
					"Crag Rager", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[126424] = {
					"Coralback Surfcrawler", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[161198] = {
					"Warpweaver Dushar", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[68140] = {
					"Hungering Soul Fragment", -- [1]
					"Pursuing the Black Harvest", -- [2]
				},
				[133557] = {
					"Razak Ironsides", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[134069] = {
					"Vol'zith the Whisperer", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[146866] = {
					"Enslaved Frost Elemental", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[15233] = {
					"Vekniss Guardian", -- [1]
					"Ahn'Qiraj Temple", -- [2]
				},
				[136976] = {
					"T'zala", -- [1]
					"Kings' Rest", -- [2]
				},
				[146890] = {
					"Fleshrot Runeweaver", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[63508] = {
					"Xuen", -- [1]
					"Eye of the Storm", -- [2]
				},
				[74729] = {
					"Voidwalker Minion", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[152699] = {
					"Voidbound Berserker", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[114714] = {
					"Ghostly Steward", -- [1]
					"Return to Karazhan", -- [2]
				},
				[52089] = {
					"Gurubashi Worker", -- [1]
					"Zul'Gurub", -- [2]
				},
				[139189] = {
					"Lumberclaw the Ancient", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[52345] = {
					"Pride of Bethekk", -- [1]
					"Zul'Gurub", -- [2]
				},
				[33271] = {
					"General Vezax", -- [1]
					"Ulduar", -- [2]
				},
				[52325] = {
					"Gurubashi Blood Drinker", -- [1]
					"Zul'Gurub", -- [2]
				},
				[64947] = {
					"Mogu'shan Warden", -- [1]
					"Mogu'shan Vaults", -- [2]
				},
				[123286] = {
					"Southsea Gambler", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[126429] = {
					"Encrusted Coralback", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[146889] = {
					"Fleshrot Deathwalker", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[138187] = {
					"Grotesque Horror", -- [1]
					"The Underrot", -- [2]
				},
				[14370] = {
					"Cadaverous Worm", -- [1]
					"Dire Maul", -- [2]
				},
				[15551] = {
					"Spectral Stable Hand", -- [1]
					"Karazhan", -- [2]
				},
				[52624] = {
					"Twisted Spirit", -- [1]
					"Zul'Gurub", -- [2]
				},
				[140076] = {
					"Knucklebump Silverback", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[37501] = {
					"Nerub'ar Champion", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[20866] = {
					"Soul Devourer", -- [1]
					"Tempest Keep: The Arcatraz", -- [2]
				},
				[37122] = {
					"Captain Arnath", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[139191] = {
					"Underbrush", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[16700] = {
					"Shattered Hand Legionnaire", -- [1]
					"Hellfire Citadel: The Shattered Halls", -- [2]
				},
				[56173] = {
					"Deathwing", -- [1]
					"Dragon Soul", -- [2]
				},
				[144822] = {
					"Golden Flametongue", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[114632] = {
					"Spectral Attendant", -- [1]
					"Return to Karazhan", -- [2]
				},
				[17534] = {
					"Julianne", -- [1]
					"Karazhan", -- [2]
				},
				[17371] = {
					"Shadowmoon Warlock", -- [1]
					"Hellfire Citadel: The Blood Furnace", -- [2]
				},
				[118175] = {
					"Storm Elemental", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[52606] = {
					"Gurubashi Warmonger", -- [1]
					"Zul'Gurub", -- [2]
				},
				[114584] = {
					"Phantom Crew", -- [1]
					"Return to Karazhan", -- [2]
				},
				[78314] = {
					"Glacial Icemaw", -- [1]
					"FW Horde Garrison Level 3", -- [2]
				},
				[133660] = {
					"BomBot 9000", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[157620] = {
					"Prophet Skitra", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[140858] = {
					"Pyrekin", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[136836] = {
					"Shadowbreaker Urzula", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[45264] = {
					"Twilight Crossfire", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[37229] = {
					"Frostwarden Sorceress", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[17669] = {
					"Rabid Warhound", -- [1]
					"Hellfire Citadel: The Shattered Halls", -- [2]
				},
				[144954] = {
					"Bloodgorger", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[144824] = {
					"Slimeskin Toad", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[153526] = {
					"Aqir Swarmer", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[140834] = {
					"Laughing Blaze", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[35330] = {
					"Exodar Champion", -- [1]
					"Trial of the Champion", -- [2]
				},
				[44924] = {
					"Oathsworn Myrmidon", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[36969] = {
					"Skybreaker Rifleman", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[133556] = {
					"Razak Ironsides", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[1933] = {
					"Sheep", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[74476] = {
					"Domina", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[153527] = {
					"Aqir Swarmleader", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[37502] = {
					"Nerub'ar Webweaver", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[11459] = {
					"Ironbark Protector", -- [1]
					"Dire Maul", -- [2]
				},
				[52417] = {
					"Shredtooth Frenzy", -- [1]
					"Zul'Gurub", -- [2]
				},
				[137160] = {
					"Valorcall Engineer", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[160182] = {
					"Void Initiate", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[37531] = {
					"Frostwarden Handler", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[162764] = {
					"Twisted Appendage", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[129469] = {
					"Deepsea Crawler", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[145850] = {
					"Gilnean Defuser", -- [1]
					"Warfronts Darkshore - Horde", -- [2]
				},
				[140069] = {
					"Rustpelt Wolf", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[146874] = {
					"Windcaller Mariah", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[140091] = {
					"Snowhoof", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[160183] = {
					"Void Fanatic", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[132903] = {
					"Witherbranch Villager", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[158146] = {
					"Fallen Riftwalker", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[74989] = {
					"Twilight Disciple", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[158136] = {
					"Inquisitor Darkspeak", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[161217] = {
					"Aqir Skitterer", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[17535] = {
					"Dorothee", -- [1]
					"Karazhan", -- [2]
				},
				[5139] = {
					"Kurdrum Barleybeard", -- [1]
					"Alterac Valley", -- [2]
				},
				[156089] = {
					"Aqir Venomweaver", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[12099] = {
					"Firesworn", -- [1]
					"Molten Core", -- [2]
				},
				[33515] = {
					"Auriaya", -- [1]
					"Ulduar", -- [2]
				},
				[40446] = {
					"Skar'this the Summoner", -- [1]
					"Coilfang: The Slave Pens", -- [2]
				},
				[130272] = {
					"Constrictor Vine", -- [1]
					"Maraudon", -- [2]
				},
				[53115] = {
					"Molten Lord", -- [1]
					"Firelands", -- [2]
				},
				[12259] = {
					"Gehennas", -- [1]
					"Molten Core", -- [2]
				},
				[132904] = {
					"Sandscalp Villager", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[126181] = {
					"Ramut the Black", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[139014] = {
					"Feral Moonseeker", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[159764] = {
					"Jesh'ra", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[153531] = {
					"Aqir Bonecrusher", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[121318] = {
					"Fulminating Lasher", -- [1]
					"Cathedral of Eternal Night", -- [2]
				},
				[20867] = {
					"Death Watcher", -- [1]
					"Tempest Keep: The Arcatraz", -- [2]
				},
				[146185] = {
					"Firesting Drone", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[24761] = {
					"Brightscale Wyrm", -- [1]
					"Magister's Terrace", -- [2]
				},
				[138970] = {
					"Vengeful Spirit", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[49825] = {
					"Bound Deluge", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[162331] = {
					"Corrupted Neuron", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[153532] = {
					"Aqir Mindhunter", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[130273] = {
					"Celebrian Dryad", -- [1]
					"Maraudon", -- [2]
				},
				[19716] = {
					"Mechanar Tinkerer", -- [1]
					"Tempest Keep: The Mechanar", -- [2]
				},
				[11665] = {
					"Lava Annihilator", -- [1]
					"Molten Core", -- [2]
				},
				[52730] = {
					"Gurubashi Spirit", -- [1]
					"Zul'Gurub", -- [2]
				},
				[34944] = {
					"Keep Cannon", -- [1]
					"Isle of Conquest", -- [2]
				},
				[160699] = {
					"Angry Mailemental", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[140078] = {
					"Knucklebump Gorilla", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[35328] = {
					"Stormwind Champion", -- [1]
					"Trial of the Champion", -- [2]
				},
				[158140] = {
					"Frenzied Rat", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[8900] = {
					"Doomforge Arcanasmith", -- [1]
					"Blackrock Depths", -- [2]
				},
				[140335] = {
					"Nightscale Screecher", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[140438] = {
					"Old Longtooth", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[52348] = {
					"Berserking Boulder Roller", -- [1]
					"Zul'Gurub", -- [2]
				},
				[28825] = {
					"Cyclone", -- [1]
					"Halls of Lightning", -- [2]
				},
				[153022] = {
					"Snang", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[44926] = {
					"Oathsworn Wanderer", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[130274] = {
					"Creeping Sludge", -- [1]
					"Maraudon", -- [2]
				},
				[9156] = {
					"Ambassador Flamelash", -- [1]
					"Blackrock Depths", -- [2]
				},
				[53116] = {
					"Unbound Blazing Elemental", -- [1]
					"Firelands", -- [2]
				},
				[61434] = {
					"Sik'thik Vanguard", -- [1]
					"Siege of Niuzao Temple", -- [2]
				},
				[34198] = {
					"Iron Mender", -- [1]
					"Ulduar", -- [2]
				},
				[54303] = {
					"Doomguard", -- [1]
					"Dire Maul", -- [2]
				},
				[136643] = {
					"Azerite Extractor", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[15728] = {
					"Giant Claw Tentacle", -- [1]
					"Ahn'Qiraj Temple", -- [2]
				},
				[146832] = {
					"Necromancer Disciple", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[57080] = {
					"Corrupted Scroll", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[112675] = {
					"Duskwatch Sentinel", -- [1]
					"The Nighthold", -- [2]
				},
				[140341] = {
					"Cloudscraper", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[12098] = {
					"Sulfuron Harbinger", -- [1]
					"Molten Core", -- [2]
				},
				[144970] = {
					"Kaldorei Archer", -- [1]
					"Warfronts Darkshore - Horde", -- [2]
				},
				[53244] = {
					"Flamewaker Trainee", -- [1]
					"Firelands", -- [2]
				},
				[17370] = {
					"Laughing Skull Enforcer", -- [1]
					"Hellfire Citadel: The Blood Furnace", -- [2]
				},
				[130275] = {
					"Sister of Celebras", -- [1]
					"Maraudon", -- [2]
				},
				[69943] = {
					"Maxo", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[133935] = {
					"Animated Guardian", -- [1]
					"Kings' Rest", -- [2]
				},
				[139758] = {
					"Annie Two-Pistols", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[2442] = {
					"Cow", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[15343] = {
					"Qiraji Swarmguard", -- [1]
					"Ruins of Ahn'Qiraj", -- [2]
				},
				[47081] = {
					"Elemental Firelord", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[35329] = {
					"Ironforge Champion", -- [1]
					"Trial of the Champion", -- [2]
				},
				[13036] = {
					"Gordok Hound", -- [1]
					"Dire Maul", -- [2]
				},
				[53616] = {
					"Kar the Everburning", -- [1]
					"Firelands", -- [2]
				},
				[120550] = {
					"Wrathguard Invader", -- [1]
					"Cathedral of Eternal Night", -- [2]
				},
				[135470] = {
					"Aka'ali the Conqueror", -- [1]
					"Kings' Rest", -- [2]
				},
				[74728] = {
					"Twilight Lord Bathiel", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[113128] = {
					"Withered Skulker", -- [1]
					"The Nighthold", -- [2]
				},
				[14351] = {
					"Gordok Bushwacker", -- [1]
					"Dire Maul", -- [2]
				},
				[136835] = {
					"Kin'toga Beastbane", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[122086] = {
					"Slitherblade Ironscale", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[28546] = {
					"Ionar", -- [1]
					"Halls of Lightning", -- [2]
				},
				[155951] = {
					"Ruffer", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[16389] = {
					"Spectral Apprentice", -- [1]
					"Karazhan", -- [2]
				},
				[14371] = {
					"Shen'dralar Provisioner", -- [1]
					"Dire Maul", -- [2]
				},
				[140846] = {
					"Impish Breeze", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[144837] = {
					"Darkshore Stag", -- [1]
					"Warfronts Darkshore - Horde", -- [2]
				},
				[145851] = {
					"Kaldorei Hippogryph Rider", -- [1]
					"Warfronts Darkshore - Horde", -- [2]
				},
				[10404] = {
					"Pustulating Horror", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[20868] = {
					"Entropic Eye", -- [1]
					"Tempest Keep: The Arcatraz", -- [2]
				},
				[140300] = {
					"Ripshread", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[163836] = {
					"Psychophage", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[66549] = {
					"Bovin", -- [1]
					"Eye of the Storm", -- [2]
				},
				[14303] = {
					"Petrified Guardian", -- [1]
					"Dire Maul", -- [2]
				},
				[161218] = {
					"Aqir Crusher", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[105451] = {
					"Counterstrike Totem", -- [1]
					"Eye of the Storm", -- [2]
				},
				[19389] = {
					"Lair Brute", -- [1]
					"Gruul's Lair", -- [2]
				},
				[144825] = {
					"Toxinbelly Croaker", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[15312] = {
					"Obsidian Nullifier", -- [1]
					"Ahn'Qiraj Temple", -- [2]
				},
				[11488] = {
					"Illyanna Ravenoak", -- [1]
					"Dire Maul", -- [2]
				},
				[17477] = {
					"Hellfire Imp", -- [1]
					"Hellfire Citadel: The Blood Furnace", -- [2]
				},
				[29826] = {
					"Drakkari Medicine Man", -- [1]
					"Gundrak", -- [2]
				},
				[144839] = {
					"Whitetail Doe", -- [1]
					"Warfronts Darkshore - Horde", -- [2]
				},
				[153541] = {
					"Slavemaster Ul'rok", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[135045] = {
					"Spinesnapper", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[16540] = {
					"Shadow Pillager", -- [1]
					"Karazhan", -- [2]
				},
				[146887] = {
					"Ghern the Rancid", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[60701] = {
					"Zian of the Endless Shadow", -- [1]
					"Mogu'shan Vaults", -- [2]
				},
				[131383] = {
					"Sporecaller Zancha", -- [1]
					"The Underrot", -- [2]
				},
				[140670] = {
					"Hulking Rockmane", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[144840] = {
					"Mottled Fawn", -- [1]
					"Warfronts Darkshore - Horde", -- [2]
				},
				[15235] = {
					"Vekniss Stinger", -- [1]
					"Ahn'Qiraj Temple", -- [2]
				},
				[139769] = {
					"Second Mate Barnaby", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[18309] = {
					"Ethereal Scavenger", -- [1]
					"Auchindoun: Mana-Tombs", -- [2]
				},
				[20869] = {
					"Arcatraz Sentinel", -- [1]
					"Tempest Keep: The Arcatraz", -- [2]
				},
				[61436] = {
					"Sik'thik Bladedancer", -- [1]
					"Siege of Niuzao Temple", -- [2]
				},
				[135718] = {
					"Nightsaber Cub", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[136139] = {
					"Mechanized Peacekeeper", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[53630] = {
					"Unstable Pyrelord", -- [1]
					"Firelands", -- [2]
				},
				[138623] = {
					"Amathet Archer", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[145865] = {
					"Worgen Musketeer", -- [1]
					"Warfronts Darkshore - Horde", -- [2]
				},
				[11460] = {
					"Alzzin's Minion", -- [1]
					"Dire Maul", -- [2]
				},
				[11492] = {
					"Alzzin the Wildshaper", -- [1]
					"Dire Maul", -- [2]
				},
				[139010] = {
					"Savage Sharpclaw", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[140343] = {
					"Razorwing", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[16410] = {
					"Spectral Retainer", -- [1]
					"Karazhan", -- [2]
				},
				[144842] = {
					"Tide Crawler", -- [1]
					"Warfronts Darkshore - Horde", -- [2]
				},
				[130334] = {
					"Gritplate Gazer", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[122089] = {
					"Slitherblade Oracle", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[21148] = {
					"Rift Keeper", -- [1]
					"Opening of the Dark Portal", -- [2]
				},
				[130791] = {
					"Khut'een", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[55294] = {
					"Ultraxion", -- [1]
					"Dragon Soul", -- [2]
				},
				[146848] = {
					"Eerie Conglomeration", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[46251] = {
					"Riverpaw Looter", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[143753] = {
					"Vazun Starspeaker", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[35331] = {
					"Gnomeregan Champion", -- [1]
					"Trial of the Champion", -- [2]
				},
				[20859] = {
					"Arcatraz Warder", -- [1]
					"Tempest Keep: The Arcatraz", -- [2]
				},
				[16412] = {
					"Ghostly Baker", -- [1]
					"Karazhan", -- [2]
				},
				[12018] = {
					"Majordomo Executus", -- [1]
					"Molten Core", -- [2]
				},
				[129000] = {
					"Southsea Brawler", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[146864] = {
					"Mistscorn Earthbinder", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[12100] = {
					"Lava Reaver", -- [1]
					"Molten Core", -- [2]
				},
				[15327] = {
					"Hive'Zara Stinger", -- [1]
					"Ruins of Ahn'Qiraj", -- [2]
				},
				[138438] = {
					"Tidereaver Steelfang", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[126185] = {
					"Zian-Ti Shadowcaster", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[28547] = {
					"Storming Vortex", -- [1]
					"Halls of Lightning", -- [2]
				},
				[146892] = {
					"Fleshrot Marauder", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[144295] = {
					"Mechagon Mechanic", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[136837] = {
					"Venomancer Ant'su", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[17533] = {
					"Romulo", -- [1]
					"Karazhan", -- [2]
				},
				[148940] = {
					"Kaldorei Chimaera", -- [1]
					"Warfronts Darkshore - Horde", -- [2]
				},
				[12420] = {
					"Blackwing Mage", -- [1]
					"Blackwing Lair", -- [2]
				},
				[15249] = {
					"Qiraji Lasher", -- [1]
					"Ahn'Qiraj Temple", -- [2]
				},
				[54015] = {
					"Majordomo Staghelm", -- [1]
					"Firelands", -- [2]
				},
				[54143] = {
					"Molten Flamefather", -- [1]
					"Firelands", -- [2]
				},
				[157602] = {
					"Drest'agath", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[57382] = {
					"Dark Globule", -- [1]
					"Dragon Soul", -- [2]
				},
				[53094] = {
					"Patriarch Fire Turtle", -- [1]
					"Firelands", -- [2]
				},
				[30276] = {
					"Ahn'kahar Web Winder", -- [1]
					"Ahn'kahet: The Old Kingdom", -- [2]
				},
				[45993] = {
					"Theralion", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[133585] = {
					"Dizzy Dina", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[138192] = {
					"Champion Mountaineer", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[16539] = {
					"Homunculus", -- [1]
					"Karazhan", -- [2]
				},
				[17414] = {
					"Shadowmoon Technician", -- [1]
					"Hellfire Citadel: The Blood Furnace", -- [2]
				},
				[140071] = {
					"Old One-Fang", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[132050] = {
					"Huntmaster Theodore", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[135247] = {
					"Varigg", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[17670] = {
					"Shattered Hand Houndmaster", -- [1]
					"Hellfire Citadel: The Shattered Halls", -- [2]
				},
				[14401] = {
					"Master Elemental Shaper Krixix", -- [1]
					"Blackwing Lair", -- [2]
				},
				[8901] = {
					"Anvilrage Reservist", -- [1]
					"Blackrock Depths", -- [2]
				},
				[146895] = {
					"Fleshrot Vandal", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[46381] = {
					"Shifty Thief", -- [1]
					"Stormwind Stockade", -- [2]
				},
				[132879] = {
					"Crystalline Giant", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[56575] = {
					"Burning Tendons", -- [1]
					"Dragon Soul", -- [2]
				},
				[157605] = {
					"Burrowing Appendage", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[11471] = {
					"Eldreth Apparition", -- [1]
					"Dire Maul", -- [2]
				},
				[158157] = {
					"Overlord Mathias Shaw", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[138194] = {
					"Champion Priest of Ironforge", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[53120] = {
					"Flamewaker Pathfinder", -- [1]
					"Firelands", -- [2]
				},
				[61139] = {
					"Shan-xi Watershaper", -- [1]
					"Mogu'shan Vaults", -- [2]
				},
				[53088] = {
					"Temple Rat", -- [1]
					"Zul'Gurub", -- [2]
				},
				[148432] = {
					"Thunderaan's Fury Totem", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[144849] = {
					"Darkscale Scout", -- [1]
					"Warfronts Darkshore - Horde", -- [2]
				},
				[74722] = {
					"Razorshell Snapjaw", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[158158] = {
					"Forge-Guard Hurrul", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[28926] = {
					"Spark of Ionar", -- [1]
					"Halls of Lightning", -- [2]
				},
				[134612] = {
					"Grasping Tentacles", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[140792] = {
					"Breakbeak Bonepicker", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[56854] = {
					"Twilight Elite Dreadblade", -- [1]
					"Dragon Soul", -- [2]
				},
				[122266] = {
					"Spineshell Turtle", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[144850] = {
					"Darkscale Siren", -- [1]
					"Warfronts Darkshore - Horde", -- [2]
				},
				[52085] = {
					"Razzashi Adder", -- [1]
					"Zul'Gurub", -- [2]
				},
				[140563] = {
					"Brimstone Tracker", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[157452] = {
					"Nightmare Antigen", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[98035] = {
					"Dreadstalker", -- [1]
					"Isle of Conquest", -- [2]
				},
				[12467] = {
					"Death Talon Captain", -- [1]
					"Blackwing Lair", -- [2]
				},
				[15246] = {
					"Qiraji Mindslayer", -- [1]
					"Ahn'Qiraj Temple", -- [2]
				},
				[61341] = {
					"Mounted Mogu", -- [1]
					"Mogu'shan Vaults", -- [2]
				},
				[140562] = {
					"Brimstone Hound", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[156575] = {
					"Dark Inquisitor Xanesh", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[114801] = {
					"Spectral Apprentice", -- [1]
					"Return to Karazhan", -- [2]
				},
				[14020] = {
					"Chromaggus", -- [1]
					"Blackwing Lair", -- [2]
				},
				[68137] = {
					"Akama", -- [1]
					"Pursuing the Black Harvest", -- [2]
				},
				[139009] = {
					"Feral Hunter", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[56448] = {
					"Wise Mari", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[11583] = {
					"Nefarian", -- [1]
					"Blackwing Lair", -- [2]
				},
				[32885] = {
					"Captured Mercenary Soldier", -- [1]
					"Ulduar", -- [2]
				},
				[133079] = {
					"Newstead Farmhand", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[134912] = {
					"Violet Creeper", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[52402] = {
					"Venomtooth", -- [1]
					"Zul'Gurub", -- [2]
				},
				[53121] = {
					"Flamewaker Cauterizer", -- [1]
					"Firelands", -- [2]
				},
				[8898] = {
					"Anvilrage Marshal", -- [1]
					"Blackrock Depths", -- [2]
				},
				[61567] = {
					"Vizier Jin'bak", -- [1]
					"Siege of Niuzao Temple", -- [2]
				},
				[37125] = {
					"Captain Rupert", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[134823] = {
					"Unbreakable Crystalspine", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[161745] = {
					"Hepthys", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[53889] = {
					"Corrupted Blood", -- [1]
					"Dragon Soul", -- [2]
				},
				[20870] = {
					"Zereketh the Unbound", -- [1]
					"Tempest Keep: The Arcatraz", -- [2]
				},
				[33670] = {
					"Aerial Command Unit", -- [1]
					"Ulduar", -- [2]
				},
				[53619] = {
					"Druid of the Flame", -- [1]
					"Firelands", -- [2]
				},
				[21062] = {
					"Nether Wraith", -- [1]
					"Tempest Keep: The Mechanar", -- [2]
				},
				[129517] = {
					"Reanimated Raptor", -- [1]
					"Atal'Dazar", -- [2]
				},
				[11455] = {
					"Wildspawn Felsworn", -- [1]
					"Dire Maul", -- [2]
				},
				[161746] = {
					"Ossirat", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[126190] = {
					"Zian-Ti Brutalizer", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[26729] = {
					"Steward", -- [1]
					"The Nexus", -- [2]
				},
				[26782] = {
					"Crystalline Keeper", -- [1]
					"The Nexus", -- [2]
				},
				[138644] = {
					"Kvaldir Cursewalker", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[16411] = {
					"Spectral Chef", -- [1]
					"Karazhan", -- [2]
				},
				[140248] = {
					"Moonchaser the Swift", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[140760] = {
					"Earthliving Giant", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[74747] = {
					"Deep Terror", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[145026] = {
					"Swifttail Scavenger", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[35590] = {
					"Risen Champion", -- [1]
					"Trial of the Champion", -- [2]
				},
				[10981] = {
					"Frost Wolf", -- [1]
					"Alterac Valley", -- [2]
				},
				[135130] = {
					"Siege Tower", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[135642] = {
					"Duskcoat Tiger Cub", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[60399] = {
					"Qin-xi", -- [1]
					"Mogu'shan Vaults", -- [2]
				},
				[17399] = {
					"Seductress", -- [1]
					"Hellfire Citadel: The Blood Furnace", -- [2]
				},
				[15236] = {
					"Vekniss Wasp", -- [1]
					"Ahn'Qiraj Temple", -- [2]
				},
				[61056] = {
					"Primal Earth Elemental", -- [1]
					"Alterac Valley", -- [2]
				},
				[15300] = {
					"Vekniss Drone", -- [1]
					"Ahn'Qiraj Temple", -- [2]
				},
				[44932] = {
					"Oathsworn Pathfinder", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[139804] = {
					"Venture Inspector", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[36998] = {
					"Skybreaker Protector", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[140250] = {
					"Pinegraze Stag", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[140262] = {
					"Runehoof Doe", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[29264] = {
					"Spirit Wolf", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[53890] = {
					"Hideous Amalgamation", -- [1]
					"Dragon Soul", -- [2]
				},
				[11461] = {
					"Warpwood Guardian", -- [1]
					"Dire Maul", -- [2]
				},
				[50051] = {
					"Imafaggie", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[139766] = {
					"Former Navigator Dublin", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[53642] = {
					"Cinderweb Spinner", -- [1]
					"Firelands", -- [2]
				},
				[14368] = {
					"Lorekeeper Lydros", -- [1]
					"Dire Maul", -- [2]
				},
				[34183] = {
					"Arachnopod Destroyer", -- [1]
					"Ulduar", -- [2]
				},
				[139341] = {
					"Icetusk Shadowcaster", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[417] = {
					"Zhaagrym", -- [1]
					"Temple of Kotmogu", -- [2]
				},
				[19875] = {
					"Baroness Dorothea Millstipe", -- [1]
					"Karazhan", -- [2]
				},
				[140070] = {
					"Bloodscent the Tracker", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[140541] = {
					"Kindleweb Creeper", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[37534] = {
					"Spinestalker", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[108359] = {
					"Volatile Scorpid", -- [1]
					"The Nighthold", -- [2]
				},
				[159219] = {
					"Umbral Seer", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[14349] = {
					"Pimgib", -- [1]
					"Dire Maul", -- [2]
				},
				[152033] = {
					"Inconspicuous Plant", -- [1]
					"Operation: Mechagon", -- [2]
				},
				[16485] = {
					"Arcane Watchman", -- [1]
					"Karazhan", -- [2]
				},
				[126215] = {
					"Zian-Ti Darkweaver", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[123402] = {
					"Garothi Decimator", -- [1]
					"Antorus, the Burning Throne", -- [2]
				},
				[125828] = {
					"Fallken", -- [1]
					"Atal'Dazar", -- [2]
				},
				[12101] = {
					"Lava Surger", -- [1]
					"Molten Core", -- [2]
				},
				[145065] = {
					"Fledgling Nightwing", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[145372] = {
					"Wild Mooncaller", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[140082] = {
					"Gibb", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[140990] = {
					"Bonescale Spitter", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[155098] = {
					"Rexxar", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[140106] = {
					"Deathsting Broodwatcher", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[147932] = {
					"Agitated Azershard", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[37127] = {
					"Ymirjar Frostbinder", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[161241] = {
					"Voidweaver Mal'thir", -- [1]
					"Atal'Dazar", -- [2]
				},
				[33288] = {
					"Yogg-Saron", -- [1]
					"Ulduar", -- [2]
				},
				[53891] = {
					"Corruption", -- [1]
					"Dragon Soul", -- [2]
				},
				[139012] = {
					"Feral Guardian", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[24689] = {
					"Wretched Bruiser", -- [1]
					"Magister's Terrace", -- [2]
				},
				[15389] = {
					"Captain Drenn", -- [1]
					"Ruins of Ahn'Qiraj", -- [2]
				},
				[147933] = {
					"Geoactive Azershard", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[21127] = {
					"Coilfang Tempest", -- [1]
					"Coilfang: The Slave Pens", -- [2]
				},
				[34184] = {
					"Clockwork Mechanic", -- [1]
					"Ulduar", -- [2]
				},
				[134739] = {
					"Purification Construct", -- [1]
					"Kings' Rest", -- [2]
				},
				[133870] = {
					"Diseased Lasher", -- [1]
					"The Underrot", -- [2]
				},
				[29573] = {
					"Drakkari Elemental", -- [1]
					"Gundrak", -- [2]
				},
				[16809] = {
					"Warbringer O'mrogg", -- [1]
					"Hellfire Citadel: The Shattered Halls", -- [2]
				},
				[102392] = {
					"Resonance Totem", -- [1]
					"The Battle for Gilneas", -- [2]
				},
				[135649] = {
					"Clawflurry", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[29829] = {
					"Drakkari Earthshaker", -- [1]
					"Gundrak", -- [2]
				},
				[140768] = {
					"Guuru the Mountain-Breaker", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[18344] = {
					"Nexus-Prince Shaffar", -- [1]
					"Auchindoun: Mana-Tombs", -- [2]
				},
				[16807] = {
					"Grand Warlock Nethekurse", -- [1]
					"Hellfire Citadel: The Shattered Halls", -- [2]
				},
				[8902] = {
					"Shadowforge Citizen", -- [1]
					"Blackrock Depths", -- [2]
				},
				[140359] = {
					"Thunderhawk Devourer", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[15516] = {
					"Battleguard Sartura", -- [1]
					"Ahn'Qiraj Temple", -- [2]
				},
				[147935] = {
					"Azergem Crawler", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[149635] = {
					"Blooming Protector", -- [1]
					"Warfronts Darkshore - Horde", -- [2]
				},
				[161244] = {
					"Blood of the Corruptor", -- [1]
					"Atal'Dazar", -- [2]
				},
				[87761] = {
					"Dungeoneer's Training Dummy", -- [1]
					"FW Horde Garrison Level 3", -- [2]
				},
				[33432] = {
					"Leviathan Mk II", -- [1]
					"Ulduar", -- [2]
				},
				[126451] = {
					"Crushclaw", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[13285] = {
					"Death Lash", -- [1]
					"Dire Maul", -- [2]
				},
				[126963] = {
					"Gwyndra Wildhammer", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[147936] = {
					"Azergem Shardback", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[53006] = {
					"Spirit Link Totem", -- [1]
					"Eye of the Storm", -- [2]
				},
				[137969] = {
					"Interment Construct", -- [1]
					"Kings' Rest", -- [2]
				},
				[141282] = {
					"Kul Tiran Footman", -- [1]
					"Siege of Boralus", -- [2]
				},
				[103673] = {
					"Darkglare", -- [1]
					"Warsong Gulch", -- [2]
				},
				[146401] = {
					"Darkscale Dig-Slave", -- [1]
					"Warfronts Darkshore - Horde", -- [2]
				},
				[12056] = {
					"Baron Geddon", -- [1]
					"Molten Core", -- [2]
				},
				[30287] = {
					"Plundering Geist", -- [1]
					"Ahn'kahet: The Old Kingdom", -- [2]
				},
				[139747] = {
					"Shipwrecked Pirate", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[140259] = {
					"Runehoof Greatstag", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[20882] = {
					"Skulking Witch", -- [1]
					"Tempest Keep: The Arcatraz", -- [2]
				},
				[141283] = {
					"Kul Tiran Halberd", -- [1]
					"Siege of Boralus", -- [2]
				},
				[63106] = {
					"Sik'thik Swarmer", -- [1]
					"Siege of Niuzao Temple", -- [2]
				},
				[75285] = {
					"Twilight Storm Mender", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[13797] = {
					"Mountaineer Boombellow", -- [1]
					"Alterac Valley", -- [2]
				},
				[134894] = {
					"Ironweb Spinner", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[139748] = {
					"Shipwrecked Smuggler", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[140260] = {
					"Runehoof Courser", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[47161] = {
					"Twilight Brute", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[141284] = {
					"Kul Tiran Wavetender", -- [1]
					"Siege of Boralus", -- [2]
				},
				[126094] = {
					"Slitherblade Wavecaller", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[114526] = {
					"Ghostly Understudy", -- [1]
					"Return to Karazhan", -- [2]
				},
				[33985] = {
					"Corruptor Tentacle", -- [1]
					"Ulduar", -- [2]
				},
				[139486] = {
					"Skycrack", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[146657] = {
					"Veteran Sentinel", -- [1]
					"Warfronts Darkshore - Horde", -- [2]
				},
				[156641] = {
					"Enthralled Weaponsmith", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[138626] = {
					"Amathet Zealot", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[32517] = {
					"Ink", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[118724] = {
					"Helblaze Felbringer", -- [1]
					"Cathedral of Eternal Night", -- [2]
				},
				[30319] = {
					"Twilight Darkcaster", -- [1]
					"Ahn'kahet: The Old Kingdom", -- [2]
				},
				[45267] = {
					"Twilight Phase-Twister", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[45063] = {
					"Bonesnapper Scorpid", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[139750] = {
					"Stranded Bruiser", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[156642] = {
					"Enthralled Laborer", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[138471] = {
					"Obsidian Wyrmguard", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[138427] = {
					"Spitefin Harpooner", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[45703] = {
					"Faceless Minion", -- [1]
					"The Bastion of Twilight", -- [2]
				},
				[158690] = {
					"Cultist Tormenter", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[75522] = {
					"Bloodtail Grouper", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[114260] = {
					"Mrrgria", -- [1]
					"Return to Karazhan", -- [2]
				},
				[139751] = {
					"Stranded Blockader", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[140263] = {
					"Runehoof Stag", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[9502] = {
					"Phalanx", -- [1]
					"Blackrock Depths", -- [2]
				},
				[136846] = {
					"Sandscalp Blood Drinker", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[12468] = {
					"Death Talon Hatcher", -- [1]
					"Blackwing Lair", -- [2]
				},
				[17462] = {
					"Shattered Hand Zealot", -- [1]
					"Hellfire Citadel: The Shattered Halls", -- [2]
				},
				[33818] = {
					"Twilight Adherent", -- [1]
					"Ulduar", -- [2]
				},
				[119930] = {
					"Dreadwing", -- [1]
					"Cathedral of Eternal Night", -- [2]
				},
				[11465] = {
					"Warpwood Stomper", -- [1]
					"Dire Maul", -- [2]
				},
				[140264] = {
					"Runehoof Calf", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[161251] = {
					"Cultist Sycophant", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[56762] = {
					"Yu'lon", -- [1]
					"Temple of the Jade Serpent", -- [2]
				},
				[140841] = {
					"Snickering Ripple", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[139337] = {
					"Icetusk Blood-Drinker", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[45379] = {
					"Augh", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[56250] = {
					"Twilight Assaulter", -- [1]
					"Dragon Soul", -- [2]
				},
				[139753] = {
					"Shipwrecked Strongarm", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[160249] = {
					"Spike Tentacle", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[140777] = {
					"Gemshard Colossus", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[139394] = {
					"Mirelurk Bog Priest", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[132743] = {
					"Flamescale Wavebreaker", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[18313] = {
					"Ethereal Sorcerer", -- [1]
					"Auchindoun: Mana-Tombs", -- [2]
				},
				[15333] = {
					"Silicate Feeder", -- [1]
					"Ruins of Ahn'Qiraj", -- [2]
				},
				[8927] = {
					"Dark Screecher", -- [1]
					"Blackrock Depths", -- [2]
				},
				[139754] = {
					"Shipwrecked Navigator", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[140299] = {
					"Ghostfang", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[157158] = {
					"Cultist Slavedriver", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[24744] = {
					"Vexallus", -- [1]
					"Magister's Terrace", -- [2]
				},
				[145033] = {
					"Arctic Hunter", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[11462] = {
					"Warpwood Treant", -- [1]
					"Dire Maul", -- [2]
				},
				[15589] = {
					"Eye of C'Thun", -- [1]
					"Ahn'Qiraj Temple", -- [2]
				},
				[15621] = {
					"Yauj Brood", -- [1]
					"Ahn'Qiraj Temple", -- [2]
				},
				[76036] = {
					"Twilight Shadow", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[140267] = {
					"Greathorn Uwanu", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[136684] = {
					"Wildhammer Flame-Binder", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[140974] = {
					"Eldercraw", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[24688] = {
					"Wretched Skulker", -- [1]
					"Magister's Terrace", -- [2]
				},
				[36950] = {
					"Skybreaker Marine", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[140663] = {
					"Mountain Lord Grum", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[28965] = {
					"Titanium Thunderer", -- [1]
					"Halls of Lightning", -- [2]
				},
				[36805] = {
					"Deathspeaker Servant", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[134519] = {
					"Bert", -- [1]
					"Eye of the Storm", -- [2]
				},
				[153065] = {
					"Voidbound Ravager", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[113694] = {
					"Meemi", -- [1]
					"Eye of the Storm", -- [2]
				},
				[44704] = {
					"Minion of Siamat", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[55265] = {
					"Morchok", -- [1]
					"Dragon Soul", -- [2]
				},
				[138507] = {
					"Warlord Ultriss", -- [1]
					"The Rotting Mire (Islands 9)", -- [2]
				},
				[129016] = {
					"Southsea Musketeer", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[76037] = {
					"Twilight Storm Mender", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[136839] = {
					"Mrogan", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[139396] = {
					"Mirelurk Guardian", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[37022] = {
					"Blighted Abomination", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[124489] = {
					"Highlands Lumberjack", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[29768] = {
					"Unyielding Constrictor", -- [1]
					"Gundrak", -- [2]
				},
				[53127] = {
					"Fire Scorpion", -- [1]
					"Firelands", -- [2]
				},
				[45065] = {
					"Tol'vir Merchant", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[147948] = {
					"Coagulated Azerite", -- [1]
					"The Dread Chain (Islands 4)", -- [2]
				},
				[156650] = {
					"Dark Manifestation", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[53639] = {
					"Flamewaker Cauterizer", -- [1]
					"Firelands", -- [2]
				},
				[12422] = {
					"Death Talon Dragonspawn", -- [1]
					"Blackwing Lair", -- [2]
				},
				[21724] = {
					"Beemi", -- [1]
					"Eye of the Storm", -- [2]
				},
				[20873] = {
					"Negaton Warp-Master", -- [1]
					"Tempest Keep: The Arcatraz", -- [2]
				},
				[14187] = {
					"Athramanis", -- [1]
					"Alterac Valley", -- [2]
				},
				[134417] = {
					"Deepsea Ritualist", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[76038] = {
					"Twilight Shadowmage", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[62632] = {
					"Sik'thik Engineer", -- [1]
					"Siege of Niuzao Temple", -- [2]
				},
				[136688] = {
					"Fanatical Driller", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[47720] = {
					"Camel", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[134338] = {
					"Tidesage Enforcer", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[9041] = {
					"Warder Stilgiss", -- [1]
					"Blackrock Depths", -- [2]
				},
				[135496] = {
					"Cami Cogwizzle", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[136224] = {
					"Stromgarde Spellweaver", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[45259] = {
					"Servant of Siamat", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[140272] = {
					"Forest-Strider", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[9039] = {
					"Doom'rel", -- [1]
					"Blackrock Depths", -- [2]
				},
				[145064] = {
					"Blaze", -- [1]
					"Molten Cay (Islands 6)", -- [2]
				},
				[137713] = {
					"Big Money Crab", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[44980] = {
					"Neferset Theurgist", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[130488] = {
					"Mech Jockey", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[136347] = {
					"Tidesage Initiate", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[30279] = {
					"Deep Crawler", -- [1]
					"Ahn'kahet: The Old Kingdom", -- [2]
				},
				[9031] = {
					"Anub'shiah", -- [1]
					"Blackrock Depths", -- [2]
				},
				[129786] = {
					"Brineshell Makrura", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[49045] = {
					"Augh", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[130298] = {
					"Water Elemental", -- [1]
					"Whispering Reef (Islands 10)", -- [2]
				},
				[18314] = {
					"Nexus Stalker", -- [1]
					"Auchindoun: Mana-Tombs", -- [2]
				},
				[53128] = {
					"Giant Fire Scorpion", -- [1]
					"Firelands", -- [2]
				},
				[13318] = {
					"Commander Mortimer", -- [1]
					"Alterac Valley", -- [2]
				},
				[37004] = {
					"Skybreaker Dreadblade", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[37132] = {
					"Ymirjar Battle-Maiden", -- [1]
					"Icecrown Citadel", -- [2]
				},
				[9319] = {
					"Houndmaster Grebmar", -- [1]
					"Blackrock Depths", -- [2]
				},
				[33293] = {
					"XT-002 Deconstructor", -- [1]
					"Ulduar", -- [2]
				},
				[15543] = {
					"Princess Yauj", -- [1]
					"Ahn'Qiraj Temple", -- [2]
				},
				[33216] = {
					"Mechagnome Pilot", -- [1]
					"Ulduar", -- [2]
				},
				[135378] = {
					"Ironforge Artillerist", -- [1]
					"Warfronts Arathi - Horde", -- [2]
				},
				[61910] = {
					"Resin Flake", -- [1]
					"Siege of Niuzao Temple", -- [2]
				},
				[156143] = {
					"Voidcrazed Hulk", -- [1]
					"Horrific Vision of Orgrimmar", -- [2]
				},
				[137484] = {
					"King A'akul", -- [1]
					"Kings' Rest", -- [2]
				},
				[146187] = {
					"Firesting Dominator", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[62982] = {
					"Mindbender", -- [1]
					"Warsong Gulch", -- [2]
				},
				[137716] = {
					"Bottom Feeder", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[156884] = {
					"Essence of Vita", -- [1]
					"Ny'alotha, the Waking City", -- [2]
				},
				[34701] = {
					"Colosos", -- [1]
					"Trial of the Champion", -- [2]
				},
				[52155] = {
					"High Priest Venoxis", -- [1]
					"Zul'Gurub", -- [2]
				},
				[525] = {
					"Bob", -- [1]
					"The Battle for Gilneas", -- [2]
				},
				[136181] = {
					"Volcano", -- [1]
					"Havenswood (Islands 2)", -- [2]
				},
				[74505] = {
					"Thruk", -- [1]
					"Blackfathom Deeps", -- [2]
				},
				[151096] = {
					"Hati", -- [1]
					"Isle of Conquest", -- [2]
				},
				[129372] = {
					"Blacktar Bomber", -- [1]
					"Siege of Boralus", -- [2]
				},
				[14022] = {
					"Corrupted Red Whelp", -- [1]
					"Blackwing Lair", -- [2]
				},
				[140038] = {
					"Abyssal Eel", -- [1]
					"Shrine of the Storm", -- [2]
				},
				[138255] = {
					"Ashvane Spotter", -- [1]
					"Siege of Boralus", -- [2]
				},
				[156145] = {
					"Burrowing Appendage", -- [1]
					"Horrific Vision of Stormwind", -- [2]
				},
				[34793] = {
					"Catapult", -- [1]
					"Isle of Conquest", -- [2]
				},
				[130436] = {
					"Off-Duty Laborer", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[136005] = {
					"Rowdy Reveler", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
				[126205] = {
					"Profit-O-Matic", -- [1]
					"Verdant Wilds (Islands 8)", -- [2]
				},
				[48906] = {
					"Blaze of the Heavens", -- [1]
					"Lost City of the Tol'vir", -- [2]
				},
				[135975] = {
					"Off-Duty Laborer", -- [1]
					"The MOTHERLODE!!", -- [2]
				},
			},
			["hook_data"] = {
				{
					["Enabled"] = false,
					["Revision"] = 50,
					["semver"] = "",
					["HooksTemp"] = {
					},
					["Author"] = "Kastfall-Azralon",
					["version"] = -1,
					["Desc"] = "Easy way to change the color of an unit. Open the constructor script and follow the examples.",
					["Hooks"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --attempt to get the color from the unit color list\n    local color = envTable.NpcColors [unitFrame.namePlateUnitNameLower] or envTable.NpcColors [unitFrame.namePlateUnitName] or envTable.NpcColors [unitFrame.namePlateNpcId]\n    \n    --if the color exists, set the health bar color\n    if (color) then\n        Plater.SetNameplateColor (unitFrame, color)\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --list of npcs and their colors, can be inserted:\n    --name of the unit\n    --name of the unit in lower case\n    --npcID of the unit\n    \n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    \n    envTable.NpcColors = {\n        \n        --examples, using the unit name in lower case, regular unit name and the unitID:\n        \n        [\"Thunderlord Windreader\"] = \"red\", --using regular mob name and color it as red\n        [\"thunderlord crag-leaper\"] = {1, 1, 0}, --using lower case and coloring it yellow\n        [75790] = \"#00FF00\", --using the ID of the unit and using green as color\n        \n        --insert the new mobs here:\n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n    } --close custom color bracket\n    \nend\n\n\n\n\n",
					},
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["role"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["Time"] = 1547392935,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\color_bar",
					["Name"] = "Color Automation [Plater]",
				}, -- [1]
				{
					["Enabled"] = false,
					["Revision"] = 59,
					["semver"] = "",
					["HooksTemp"] = {
					},
					["Author"] = "Izimode-Azralon",
					["version"] = -1,
					["Desc"] = "Change the nameplate color when a nameplate does not have the auras set in the constructor script.",
					["Hooks"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --do nothing if the player isn't in combat\n    if (not Plater.IsInCombat()) then\n        return \n    end\n    \n    --do nothing if the unit isn't in combat\n    if (not unitFrame.InCombat) then\n        return\n    end\n    \n    --do nothing if the unit is the player it self\n    if (unitFrame.IsSelf) then\n        return\n    end\n    \n    --check the auras\n    local hasAura = false\n    \n    for auraName, _ in pairs (envTable.TrackingAuras) do\n        if (Plater.NameplateHasAura (unitFrame, auraName)) then\n            hasAura = true\n            break\n        end\n    end\n    \n    if (not hasAura) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    else\n        if (envTable.ForceRefreshNameplateColor) then\n            Plater.RefreshNameplateColor (unitFrame) \n        end\n    end    \n    \nend",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    --Important: lines starting with double dashes are comments and are not part of the script\n    \n    --set this to true if you are not using threat colors in the health bar\n    envTable.ForceRefreshNameplateColor = true\n    \n    --if the unit does not have any of the following auras, it will be painted with the color listed below\n    --list of spells to track, can be the spell name (case-sensitive) or the spellID\n    envTable.TrackingAuras = {\n        --[\"Nightblade\"] = true, --this is an example using the spell name\n        --[195452] = true, --this is an example using the spellID\n        \n    }\n    \n    --which color the nameplate wil be changed\n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    --you may also use /plater colors\n    envTable.NameplateColor = \"pink\"\n    \nend",
					},
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["role"] = {
						},
					},
					["Time"] = 1554138845,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["url"] = "",
					["Icon"] = 136207,
					["Name"] = "Don't Have Aura [Plater]",
				}, -- [2]
				{
					["Enabled"] = false,
					["Revision"] = 176,
					["semver"] = "",
					["HooksTemp"] = {
					},
					["Author"] = "Tecno-Azralon",
					["version"] = -1,
					["Desc"] = "Add another border with more customizations. This border can also be manipulated by other scripts.",
					["Hooks"] = {
						["Nameplate Created"] = "function (self, unitId, unitFrame, envTable)\n    \n    --run constructor!\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    if (envTable.IsEnabled) then\n        if (unitFrame.IsSelf) then\n            if (envTable.ShowOnPersonalBar) then\n                envTable.BorderFrame:Show()\n            else\n                envTable.BorderFrame:Hide() \n            end\n        else\n            envTable.BorderFrame:Show()\n        end   \n    end\n    \nend   \n\n\n\n",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.BorderFrame:Hide()\n    \nend\n\n\n",
						["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.BorderFrame:Hide()\n    \nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --border color\n    local borderColor = \"yellow\"\n    \n    --size of the border\n    local borderSize = 1\n    \n    --transparency\n    local borderAlpha = 1\n    \n    --enabled (set to false it you only want to use the extra border in other scripts)\n    local isEnabled = true\n    \n    --export border (allow the border to be used by other scripts)\n    --other scripts can use:\n    --unitFrame.healthBar.extraBorder:Show()\n    --unitFrame.healthBar.extraBorder:SetVertexColor (r, g, b)\n    --unitFrame.healthBar.extraBorder:SetBorderSizes (borderSize)\n    local canExportBorder = true\n    \n    --do not add the border to personal bar\n    local noPersonalBar = true\n    \n    --private\n    do\n        \n        local newBorder = CreateFrame (\"frame\", nil, unitFrame.healthBar, \"NamePlateFullBorderTemplate\")\n        envTable.BorderFrame = newBorder\n        \n        newBorder:SetBorderSizes (borderSize, borderSize, borderSize, borderSize)\n        newBorder:UpdateSizes()\n        \n        local r, g, b = DetailsFramework:ParseColors (borderColor)\n        newBorder:SetVertexColor (r, g, b, borderAlpha)\n        \n        envTable.ShowOnPersonalBar = not noPersonalBar\n        \n        if (canExportBorder) then\n            unitFrame.healthBar.extraBorder = newBorder\n        end\n        \n        if (not isEnabled) then\n            envTable.IsEnabled = false\n        else\n            envTable.IsEnabled = true\n        end\n    end\n    \nend\n\n\n",
					},
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["race"] = {
						},
					},
					["Time"] = 1547409079,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["url"] = "",
					["Icon"] = 133689,
					["Name"] = "Extra Border [Plater]",
				}, -- [3]
				{
					["Enabled"] = false,
					["Revision"] = 73,
					["semver"] = "",
					["HooksTemp"] = {
					},
					["Author"] = "Izimode-Azralon",
					["version"] = -1,
					["Desc"] = "Hide neutral units, show when selected, see the constructor script for options.",
					["Hooks"] = {
						["Leave Combat"] = "function (self, unitId, unitFrame, envTable)\n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat) then\n            envTable.HideNameplate (unitFrame)\n        end\n    end\nend\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end\n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat and InCombatLockdown()) then\n            return\n        end\n        \n        envTable.HideNameplate (unitFrame)\n    end\n    \nend\n\n\n\n\n\n\n",
						["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat and InCombatLockdown()) then\n            return\n        end\n        \n        --check the unit reaction\n        if (unitFrame.namePlateIsTarget) then\n            envTable.ShowNameplate (unitFrame)\n            \n        else\n            envTable.HideNameplate (unitFrame)\n            \n        end    \n    end\n    \nend\n\n\n\n\n\n\n",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        envTable.ShowNameplate (unitFrame)\n    end\n    \nend\n\n\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --when plater finishes an update on the nameplate\n    --check within the envTable if the healthBar of this nameplate should be hidden\n    if (envTable.IsHidden) then\n        if (unitFrame.healthBar:IsShown()) then\n            envTable.HideNameplate (unitFrame)\n        end\n    end\n    \nend\n\n\n\n\n",
						["Enter Combat"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat) then\n            envTable.ShowNameplate (unitFrame)\n        end\n    end\nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.OnlyInOpenWorld = true;\n    envTable.ShowInCombat = true;\n    \n    --consts\n    envTable.REACTION_NEUTRAL = 4;\n    \n    --functions to hide and show the healthBar\n    function envTable.HideNameplate (unitFrame)\n        Plater.HideHealthBar (unitFrame)\n        Plater.DisableHighlight (unitFrame)\n        envTable.IsHidden = true\n    end\n    \n    function envTable.ShowNameplate (unitFrame)\n        Plater.ShowHealthBar (unitFrame)\n        Plater.EnableHighlight (unitFrame)\n        envTable.IsHidden = false\n    end\n    \nend\n\n\n\n\n",
					},
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["race"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["Time"] = 1541606242,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["url"] = "",
					["Icon"] = 1990989,
					["Name"] = "Hide Neutral Units [Plater]",
				}, -- [4]
				{
					["Enabled"] = true,
					["Revision"] = 55,
					["semver"] = "",
					["HooksTemp"] = {
					},
					["Author"] = "Kastfall-Azralon",
					["version"] = -1,
					["Desc"] = "Script for Stormwall Blockade encounter on Battle for Dazzar'alor",
					["Hooks"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateNpcId == envTable.NpcIDs.TemptingSiren) then\n        \n        if (envTable.Colors.TemptingSiren) then\n            Plater.SetNameplateColor (unitFrame, envTable.Colors.TemptingSiren)\n        end\n        \n    end\n    \n    \nend\n\n\n\n\n\n\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateNpcId == envTable.NpcIDs.TemptingSiren) then\n        \n        if (envTable.NameplateHeight.TemptingSiren) then\n            \n            Plater.SetNameplateSize (unitFrame, nil, envTable.NameplateHeight.TemptingSiren)\n            \n        end\n        \n    end    \n    \nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --nameplate colors for unit\n    envTable.Colors = {}\n    envTable.Colors.TemptingSiren = \"orange\"\n    \n    --npcID\n    envTable.NpcIDs = {}\n    envTable.NpcIDs.TemptingSiren = 146436\n    \n    --nameplate height for each unit\n    envTable.NameplateHeight = {}\n    envTable.NameplateHeight.TemptingSiren = 18\n    \n    \n    \nend\n\n\n",
					},
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
							2280, -- [1]
							["Enabled"] = true,
						},
						["role"] = {
						},
					},
					["Time"] = 1548117267,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\encounter_stormwall_blockade",
					["Name"] = "Stormwall Encounter [Plater]",
				}, -- [5]
				{
					["Enabled"] = true,
					["Revision"] = 220,
					["semver"] = "",
					["HooksTemp"] = {
					},
					["Author"] = "Kastfall-Azralon",
					["version"] = -1,
					["Desc"] = "Script for the Jaina encounter on Battle for Dazzar'alor",
					["Hooks"] = {
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --Unexploded Ordinance\n    if (unitFrame.namePlateNpcId == envTable.NpcIDs.UnexplodedOrdinance) then\n        \n        --make the life percent be bigger than the regular size\n        --so it's better to see the health percent of the barrel\n        local currentSize = Plater.db.profile.plate_config.enemynpc.percent_text_size\n        Plater:SetFontSize (unitFrame.healthBar.lifePercent, currentSize + envTable.UnexplodedOrdinanceTextSizeIncrease)\n    end\n    \n    if (envTable.IncreaseSize [unitFrame.namePlateNpcId]) then\n        local currentHeight = unitFrame.healthBar:GetHeight()\n        Plater.SetNameplateSize (unitFrame, nil, currentHeight + envTable.IncreaseSize [unitFrame.namePlateNpcId])\n    end\n    \nend\n\n\n\n\n\n\n",
						["Cast Start"] = "function (self, unitId, unitFrame, envTable)\n    if (envTable.UnexplodedOrdinanceCast and envTable._SpellID == envTable.UnexplodedOrdinanceSpellID) then\n        Plater.SetCastBarSize (unitFrame, nil, envTable.UnexplodedOrdinanceCastBarHeight)\n        Plater:SetFontSize (unitFrame.castBar.percentText, envTable.UnexplodedOrdinanceTimerSize)\n    end\nend\n\n\n",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    --reset the health percent text size\n    local currentSize = Plater.db.profile.plate_config.enemynpc.percent_text_size\n    Plater:SetFontSize (unitFrame.healthBar.lifePercent, currentSize)    \n    \nend\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --Override the color\n    if (envTable.Colors [unitFrame.namePlateNpcId]) then\n        Plater.SetNameplateColor (unitFrame, envTable.Colors [unitFrame.namePlateNpcId])\n    end    \n    \n    --Show the name of the unit in the Ice Block nameplate\n    if (unitFrame.namePlateNpcId == envTable.NpcIDs.IceBlock) then\n        --find which player this block are holding\n        for i = 1, GetNumGroupMembers() do\n            local unit = \"raid\" .. i\n            if (UnitExists (unit)) then\n                for debuffId = 1, 40 do\n                    local name, texture, count, debuffType, duration, expirationTime, caster = UnitDebuff (unit, debuffId)\n                    \n                    --cancel the loop if there's no more debuffs on the player\n                    if (not name) then \n                        break \n                    end                    \n                    \n                    --check if who casted this debuff is the unit shown on this nameplate\n                    if (UnitIsUnit (caster or \"\", unitId)) then\n                        local unitName = UnitName (unit)\n                        \n                        --color the text by the class\n                        unitName = Plater.SetTextColorByClass (unit, unitName)\n                        \n                        --add the role icon\n                        if (Details) then\n                            local role = UnitGroupRolesAssigned (unit)\n                            unitName = Details:AddRoleIcon (unitName, role, 12)\n                        end\n                        \n                        unitFrame.unitName:SetText (unitName)\n                        unitFrame.castBar.Text:SetText (unitName)\n                        break\n                    end\n                    \n                end\n            else\n                break\n            end\n        end\n    end\nend",
						["Cast Stop"] = "function (self, unitId, unitFrame, envTable)\n    if (envTable.UnexplodedOrdinanceCast and envTable._SpellID == envTable.UnexplodedOrdinanceSpellID) then\n        Plater.SetCastBarSize (unitFrame)\n        Plater:SetFontSize (unitFrame.castBar.percentText, Plater.db.profile.plate_config.enemynpc.spellpercent_text_size)\n    end\nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --nameplate colors for unit\n    envTable.Colors = {}\n    envTable.Colors [148631] = \"orange\" --Unexploded Ordinance\n    envTable.Colors [148522] = \"white\" --Ice Block\n    \n    --increase the nameplate height for these units\n    envTable.IncreaseSize = {}\n    envTable.IncreaseSize [148522] = 4 --Ice Block (increase in 4 pixels)\n    \n    --increase the size of the life percent for the nameplate of the barrel\n    envTable.UnexplodedOrdinanceTextSizeIncrease = 3\n    \n    --increase the castbar size for the unexploded ordinance explosion cast\n    envTable.UnexplodedOrdinanceCast = true\n    envTable.UnexplodedOrdinanceSpellID = 288221 --12058 --(debug)\n    envTable.UnexplodedOrdinanceCastBarHeight = 18\n    envTable.UnexplodedOrdinanceTimerSize = 18\n    \n    --npcIDs\n    envTable.NpcIDs = {}\n    envTable.NpcIDs.UnexplodedOrdinance = 148631\n    envTable.NpcIDs.IceBlock = 148522\nend\n\n--tests 126023 --harbor saurid - dazar'alor harbor\n--tests 3127 venomtail scorpid - durotar\n--tests 12058 dustwind storm witch - durotar\n--Load Condition: EncounterID 2281\n\n\n",
					},
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["role"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
							2281, -- [1]
							["Enabled"] = true,
						},
						["spec"] = {
						},
					},
					["Time"] = 1548612537,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\encounter_jaina",
					["Name"] = "Jaina Encounter [Plater]",
				}, -- [6]
				{
					["Enabled"] = false,
					["Revision"] = 84,
					["semver"] = "",
					["HooksTemp"] = {
					},
					["Author"] = "Ahwa-Azralon",
					["version"] = -1,
					["Desc"] = "Add extra effects to execute range. See the constructor script for options.",
					["Hooks"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (envTable.UseCustomExecutePercent) then\n        \n        --manual detection\n        local healthBar = unitFrame.healthBar\n        if (healthBar.CurrentHealth / healthBar.CurrentHealthMax <= envTable.ExecutePercent) then\n            envTable.UnitInExecuteRange (unitFrame)\n        end        \n        \n    else\n        \n        --auto detection\n        if (unitFrame.InExecuteRange) then\n            envTable.UnitInExecuteRange (unitFrame)\n        end\n        \n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --execute detection, if true the script will handle the execute percent\n    --while false Plater will automatically trigger the execute range\n    --you only want to set this to true in case of Plater not detecting the execute range correctly\n    envTable.UseCustomExecutePercent = false\n    --execute percent, if not detecting automatic, this is the percent to active the execute range\n    --use from zero to one, 0.20 is equal to 20% of the unit life\n    envTable.ExecutePercent = 0.20\n    \n    --allow this script to change the nameplate color when the unit is in execute range\n    envTable.CanChangeColor = true\n    --change the health bar color to this color when the unit is in execute range\n    --color can be set as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}\n    envTable.ExecuteColor = \"green\"\n    \n    --border color\n    envTable.CanChangeBorderColor = false\n    envTable.BorderColor = \"red\"\n    \n    --hide the default health divisor and the health execute indicator\n    envTable.HideHealthDivisor = false\n    --if not hidden, adjust the health divisor settings and the health execute indicator\n    envTable.HealthDivisorAlpha = 0.5\n    envTable.HealthDivisorColor = \"white\"\n    envTable.HealthExecuteIndicatorAlpha = 0.15\n    envTable.HealthExecuteIndicatorColor = \"darkred\"\n    \n    \n    --private (internal functions)\n    do\n        function envTable.UnitInExecuteRange (unitFrame)\n            --check if can change the execute color\n            if (envTable.CanChangeColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.ExecuteColor)\n            end\n            \n            if (envTable.CanChangeBorderColor) then\n                Plater.SetBorderColor (unitFrame, envTable.BorderColor)\n            end\n            \n            if (envTable.HideHealthDivisor) then\n                unitFrame.healthBar.healthCutOff:Hide() \n                unitFrame.healthBar.executeRange:Hide()\n                \n            else\n                envTable.UpdateHealthDivisor (unitFrame)\n                \n            end\n        end\n        \n        function envTable.UpdateHealthDivisor (unitFrame)\n            local healthBar = unitFrame.healthBar\n            \n            healthBar.healthCutOff:Show()\n            healthBar.healthCutOff:SetVertexColor (DetailsFramework:ParseColors (envTable.HealthDivisorColor))\n            healthBar.healthCutOff:SetAlpha (envTable.HealthDivisorAlpha)\n            \n            healthBar.executeRange:Show()\n            healthBar.executeRange:SetVertexColor (DetailsFramework:ParseColors (envTable.HealthExecuteIndicatorColor))\n            healthBar.executeRange:SetAlpha (envTable.HealthExecuteIndicatorAlpha)\n            \n            if (envTable.UseCustomExecutePercent) then\n                healthBar.healthCutOff:ClearAllPoints()\n                healthBar.executeRange:ClearAllPoints()\n                \n                healthBar.healthCutOff:SetSize (healthBar:GetHeight(), healthBar:GetHeight())\n                healthBar.healthCutOff:SetPoint (\"center\", healthBar, \"left\", healthBar:GetWidth() * envTable.ExecutePercent, 0)\n                \n                healthBar.executeRange:SetTexCoord (0, envTable.ExecutePercent, 0, 1)\n                healthBar.executeRange:SetHeight (healthBar:GetHeight())\n                healthBar.executeRange:SetPoint (\"left\", healthBar, \"left\", 0, 0)\n                healthBar.executeRange:SetPoint (\"right\", healthBar.healthCutOff, \"center\")\n            end\n            \n        end\n    end\n    \nend",
					},
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["role"] = {
						},
					},
					["Time"] = 1547406548,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["url"] = "",
					["Icon"] = 135358,
					["Name"] = "Execute Range [Plater]",
				}, -- [7]
				{
					["Enabled"] = false,
					["Revision"] = 88,
					["semver"] = "",
					["HooksTemp"] = {
					},
					["Author"] = "Kastfall-Azralon",
					["version"] = -1,
					["Desc"] = "Function Plater.UpdatePlateSize from Plater.lua exported to scritps.",
					["Hooks"] = {
						["Nameplate Added"] = "\n\n-- exported function Plater.UpdatePlateSize() from Plater.lua\n--this is for advanced users which wants to reorder the nameplate frame at their desire\n\n\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --check if there's a type of unit on this nameplate\n    local plateFrame = unitFrame:GetParent()\n    if (not plateFrame.actorType) then\n        return\n    end\n    \n    --get all the frames and cache some variables\n    local ACTORTYPE_ENEMY_PLAYER = \"enemyplayer\"\n    local profile = Plater.db.profile\n    local DB_PLATE_CONFIG = profile.plate_config\n    local isInCombat = Plater.IsInCombat()\n    local actorType = plateFrame.actorType\n    \n    local unitFrame = plateFrame.unitFrame\n    local healthBar = unitFrame.healthBar\n    local castBar = unitFrame.castBar\n    local powerBar = unitFrame.powerBar\n    local buffFrame1 = unitFrame.BuffFrame\n    local buffFrame2 = unitFrame.BuffFrame2\n    \n    --use in combat bars when in pvp\n    if (plateFrame.actorType == ACTORTYPE_ENEMY_PLAYER) then\n        if ((Plater.ZoneInstanceType == \"pvp\" or Plater.ZoneInstanceType == \"arena\") and DB_PLATE_CONFIG.player.pvp_always_incombat) then\n            isInCombat = true\n        end\n    end\n    \n    --get the config for this actor type\n    local plateConfigs = DB_PLATE_CONFIG [actorType]\n    --get the config key based if the player is in combat\n    local castBarConfigKey, healthBarConfigKey, manaConfigKey = Plater.GetHashKey (isInCombat)\n    \n    --get the width and height from what the user set in the options panel\n    local healthBarWidth, healthBarHeight = unitFrame.customHealthBarWidth or plateConfigs [healthBarConfigKey][1], unitFrame.customHealthBarHeight or plateConfigs [healthBarConfigKey][2]\n    local castBarWidth, castBarHeight = unitFrame.customCastBarWidth or plateConfigs [castBarConfigKey][1], unitFrame.customCastBarHeight or plateConfigs [castBarConfigKey][2]\n    local powerBarWidth, powerBarHeight = unitFrame.customPowerBarHeight or plateConfigs [manaConfigKey][1], unitFrame.customPowerBarHeight or plateConfigs [manaConfigKey][2]\n    \n    --calculate the offset for the cast bar, this is done due to the cast bar be anchored to topleft and topright\n    local castBarOffSetX = (healthBarWidth - castBarWidth) / 2\n    local castBarOffSetY = plateConfigs.castbar_offset\n    \n    --calculate offsets for the power bar\n    local powerBarOffSetX = (healthBarWidth - powerBarWidth) / 2\n    local powerBarOffSetY = 0\n    \n    --calculate the size deviation for pets\n    local unitType = Plater.GetUnitType (plateFrame)\n    if (unitType == \"pet\") then\n        healthBarHeight = healthBarHeight * Plater.db.profile.pet_height_scale\n        healthBarWidth = healthBarWidth * Plater.db.profile.pet_width_scale\n        \n    elseif (unitType == \"minus\") then\n        healthBarHeight = healthBarHeight * Plater.db.profile.minor_height_scale\n        healthBarWidth = healthBarWidth * Plater.db.profile.minor_width_scale\n    end\n    \n    --unit frame - is set to be the same size as the plateFrame\n    unitFrame:ClearAllPoints()\n    unitFrame:SetAllPoints()\n    \n    --calculates the health bar anchor points\n    --it will always be placed in the center of the nameplate area (where it accepts mouse clicks) \n    local xOffSet = (plateFrame:GetWidth() - healthBarWidth) / 2\n    local yOffSet = (plateFrame:GetHeight() - healthBarHeight) / 2\n    \n    --set the health bar point\n    healthBar:ClearAllPoints()\n    PixelUtil.SetPoint (healthBar, \"topleft\", unitFrame, \"topleft\", xOffSet + profile.global_offset_x, -yOffSet + profile.global_offset_y)\n    PixelUtil.SetPoint (healthBar, \"bottomright\", unitFrame, \"bottomright\", -xOffSet + profile.global_offset_x, yOffSet + profile.global_offset_y)\n    \n    --set the cast bar point and size\n    castBar:ClearAllPoints()\n    PixelUtil.SetPoint (castBar, \"topleft\", healthBar, \"bottomleft\", castBarOffSetX, castBarOffSetY)\n    PixelUtil.SetPoint (castBar, \"topright\", healthBar, \"bottomright\", -castBarOffSetX, castBarOffSetY)\n    PixelUtil.SetHeight (castBar, castBarHeight)\n    PixelUtil.SetSize (castBar.Icon, castBarHeight, castBarHeight)\n    PixelUtil.SetSize (castBar.BorderShield, castBarHeight * 1.4, castBarHeight * 1.4)\n    \n    --set the power bar point and size\n    powerBar:ClearAllPoints()\n    PixelUtil.SetPoint (powerBar, \"topleft\", healthBar, \"bottomleft\", powerBarOffSetX, powerBarOffSetY)\n    PixelUtil.SetPoint (powerBar, \"topright\", healthBar, \"bottomright\", -powerBarOffSetX, powerBarOffSetY)\n    PixelUtil.SetHeight (powerBar, powerBarHeight)\n    \n    --power bar are hidden by default, show it if there's a custom size for it\n    if (unitFrame.customPowerBarWidth and unitFrame.customPowerBarHeight) then\n        powerBar:SetUnit (unitFrame.unit)\n    end\n    \n    --aura frames\n    buffFrame1:ClearAllPoints()\n    PixelUtil.SetPoint (buffFrame1, \"bottom\", unitFrame, \"top\", profile.aura_x_offset,  plateConfigs.buff_frame_y_offset + profile.aura_y_offset)\n    \n    buffFrame2:ClearAllPoints()\n    PixelUtil.SetPoint (buffFrame2, \"bottom\", unitFrame, \"top\", profile.aura2_x_offset,  plateConfigs.buff_frame_y_offset + profile.aura2_y_offset)    \n    \nend\n\n\n",
					},
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["race"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["Time"] = 1548077443,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["url"] = "",
					["Icon"] = 574574,
					["Name"] = "Reorder Nameplate [Plater]",
				}, -- [8]
				{
					["Enabled"] = false,
					["Revision"] = 222,
					["semver"] = "",
					["HooksTemp"] = {
					},
					["Author"] = "Kastfall-Azralon",
					["version"] = -1,
					["Desc"] = "Change the nameplate color if the unit is attacking a specific unit like Monk's Ox Statue or Druid's Treants. You may edit which units it track in the constructor script.",
					["Hooks"] = {
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --list of npcs and their colors, can be inserted:\n    --name of the unit\n    --name of the unit in lower case\n    --npcID of the unit\n    \n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    \n    envTable.ListOfNpcs = {\n        [61146] = \"olive\", --monk statue npcID\n        [103822] = \"olive\", --druid treant npcID\n        \n    }\n    \n    \nend\n\n\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the GUID of the target of the unit\n    local targetGUID = UnitGUID (unitId .. \"target\")\n    \n    if (targetGUID) then\n        \n        --get the npcID of the target\n        local npcID = Plater.GetNpcIDFromGUID (targetGUID)\n        --check if the npcID of this unit is in the npc list \n        if (envTable.ListOfNpcs [npcID]) then\n            Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [npcID])\n            \n        else\n            --check if the name of ths unit is in the list\n            local unitName = UnitName (unitId .. \"target\")\n            if (envTable.ListOfNpcs [unitName]) then\n                Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [unitName])\n                \n            else\n                --check if the name of the unit in lower case is in the npc list\n                unitName = string.lower (unitName)\n                if (envTable.ListOfNpcs [unitName]) then\n                    Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [unitName])                \n                    \n                end\n            end\n        end\n        \n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
					},
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["role"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["Time"] = 1547993111,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_attacking_unit",
					["Name"] = "Attacking Specific Unit [Plater]",
				}, -- [9]
				{
					["Enabled"] = true,
					["Revision"] = 37,
					["semver"] = "",
					["HooksTemp"] = {
					},
					["Author"] = "Izimode-Azralon",
					["version"] = -1,
					["Desc"] = "Tint nameplates of Reaping Soul units (Mythic Dungeon Affix) depending on its target and role of the player",
					["Hooks"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --can detect the reaping souls aggro?\n    if (envTable.detectAggro and Plater.IsInCombat()) then\n        \n        --is this npc a reaping soul?\n        if (envTable.npcIDs [unitFrame.namePlateNpcId]) then\n            \n            --check if the mob is attacking the player\n            if (UnitIsUnit (unitFrame.targetUnitID, \"player\")) then\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateAggroColor)\n                \n            else\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateNoAggroColor)\n            end\n            \n        end\n        \n    end\n    \nend",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --when the nameplate is added and the npcID matches, cache the color for the nameplate\n    if (envTable.detectAggro) then\n        if (envTable.npcIDs [unitFrame.namePlateNpcId]) then\n            local profile = Plater.db.profile\n            local role = Plater:GetPlayerRole()\n            \n            if (role == \"TANK\") then\n                envTable.NameplateAggroColor = profile.tank.colors.aggro\n                envTable.NameplateNoAggroColor = profile.tank.colors.noaggro\n            else\n                envTable.NameplateAggroColor = profile.dps.colors.aggro\n                envTable.NameplateNoAggroColor = profile.dps.colors.noaggro\n            end\n            \n        end\n    end\n    \n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --npcs affected by this script\n    \n    envTable.npcIDs = {\n        [148716] = true, --risen soul\n        [148893] = true, --tormented soul\n        [148894] = true, --lost soul\n        \n        [127278] = true, --skittering feeder (tests and debug, also need to disable the load conditions)\n    }\n    \n    --detect aggro, if true it will see which group member the soul is attacking and override the color\n    envTable.detectAggro = true\n    \n    \nend\n\n\n",
					},
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
							["Enabled"] = true,
							["party"] = true,
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["race"] = {
						},
						["affix"] = {
							[117] = true,
							["Enabled"] = true,
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["Time"] = 1549827281,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["url"] = "",
					["Icon"] = 2446016,
					["Name"] = "M+ Bwonsamdi Reaping",
				}, -- [10]
				{
					["Enabled"] = false,
					["Revision"] = 189,
					["semver"] = "",
					["HooksTemp"] = {
					},
					["Author"] = "Izimode-Azralon",
					["version"] = -1,
					["Desc"] = "Show combo points above the nameplate for Druid Feral and Rogues.",
					["Hooks"] = {
						["Nameplate Created"] = "function (self, unitId, unitFrame, envTable)\n    \n    --run constructor!\n    --constructor is executed only once when any script of the hook runs.\n    \nend\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if need update the amount of combo points shown\n    if (envTable.LastPlayerTalentUpdate > envTable.LastUpdate) then\n        envTable.UpdateComboPointAmount()\n    end    \n    \n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.ComboPointFrame:Show()\n        envTable.UpdateComboPoints()\n        \n    else\n        envTable.ComboPointFrame:Hide()\n    end    \n    \nend\n\n\n",
						["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if this nameplate is the current target\n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.ComboPointFrame:Show()\n        \n    else\n        envTable.ComboPointFrame:Hide()\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Player Power Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.UpdateComboPoints()\n    end\n    \n    \nend\n\n\n\n\n\n\n",
						["Player Talent Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    --update the amount of comboo points shown when the player changes talents or specialization\n    envTable.UpdateComboPointAmount()\n    \n    --save the time of the last talent change\n    envTable.LastPlayerTalentUpdate = GetTime()\n    \n    \nend\n\n\n",
						["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.ComboPointFrame:Hide()\n    \nend\n\n\n\n\n",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.ComboPointFrame:Hide()\n    \nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    local anchors = {\n        {\"bottom\", unitFrame.healthBar, \"top\", 0, 24},\n    }\n    \n    local sizes = {\n        width = 12,\n        height = 12,\n        scale = 1,\n    }\n    \n    local textures = {\n        backgroundTexture = [[Interface\\PLAYERFRAME\\ClassOverlayComboPoints]],\n        backgroundTexCoords = {78/128, 98/128, 21/64, 41/64},\n        \n        comboPointTexture = [[Interface\\PLAYERFRAME\\ClassOverlayComboPoints]],\n        comboPointTexCoords = {100/128, 120/128, 21/64, 41/64},\n    }\n    \n    local frameLevel = 1000\n    local frameStrata = \"high\"    \n    \n    --private\n    do\n        --store combo points frames on this table\n        envTable.ComboPoints = {}\n        --save when the player changed talents or spec\n        envTable.LastPlayerTalentUpdate = GetTime()\n        --save when this nameplate got a combo point amount and alignment update        \n        \n        --build combo points frame anchor (combo point are anchored to this)\n        if (not unitFrame.PlaterComboPointFrame) then\n            local hostFrame = CreateFrame (\"frame\", nil, unitFrame)\n            hostFrame.ComboPointFramesPool = {}\n            unitFrame.PlaterComboPointFrame = hostFrame\n            envTable.ComboPointFrame = hostFrame\n            \n            --DetailsFramework:ApplyStandardBackdrop (envTable.ComboPointFrame) --debug anchor size\n            \n            --animations\n            local onPlayShowAnimation = function (animation)\n                --stop the hide animation if it's playing\n                if (animation:GetParent():GetParent().HideAnimation:IsPlaying()) then\n                    animation:GetParent():GetParent().HideAnimation:Stop()\n                end\n                \n                animation:GetParent():Show()\n            end\n            \n            local onPlayHideAnimation = function (animation)\n                --stop the show animation if it's playing\n                if (animation:GetParent():GetParent().ShowAnimation:IsPlaying()) then\n                    animation:GetParent():GetParent().ShowAnimation:Stop()\n                end\n            end        \n            local onStopHideAnimation = function (animation)\n                animation:GetParent():Hide()       \n            end\n            \n            local createAnimations = function (comboPoint)\n                --on show\n                comboPoint.ShowAnimation = Plater:CreateAnimationHub (comboPoint.comboPointTexture, onPlayShowAnimation, nil)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"scale\", 1, 0.1, 0, 0, 1, 1)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"alpha\", 1, 0.1, .5, 1)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"scale\", 2, 0.1, 1.2, 1.2, 1, 1)\n                \n                --on hide\n                comboPoint.HideAnimation = Plater:CreateAnimationHub (comboPoint.comboPointTexture, onPlayHideAnimation, onStopHideAnimation)\n                Plater:CreateAnimation (comboPoint.HideAnimation, \"scale\", 1, 0.1, 1, 1, 0, 0)\n                Plater:CreateAnimation (comboPoint.HideAnimation, \"alpha\", 1, 0.1, 1, 0)\n            end\n            \n            --build combo point frame        \n            for i =1, 10 do \n                local f = CreateFrame (\"frame\", nil, envTable.ComboPointFrame)\n                f:SetSize (sizes.width, sizes.height)\n                tinsert (envTable.ComboPoints, f)\n                tinsert (unitFrame.PlaterComboPointFrame.ComboPointFramesPool, f)\n                \n                local backgroundTexture = f:CreateTexture (nil, \"background\")\n                backgroundTexture:SetTexture (textures.backgroundTexture)\n                backgroundTexture:SetTexCoord (unpack (textures.backgroundTexCoords))\n                backgroundTexture:SetSize (sizes.width, sizes.height)\n                backgroundTexture:SetPoint (\"center\")\n                \n                local comboPointTexture = f:CreateTexture (nil, \"artwork\")\n                comboPointTexture:SetTexture (textures.comboPointTexture)\n                comboPointTexture:SetTexCoord (unpack (textures.comboPointTexCoords))\n                \n                comboPointTexture:SetSize (sizes.width, sizes.height)\n                comboPointTexture:SetPoint (\"center\")\n                comboPointTexture:Hide()            \n                \n                f.IsActive = false\n                \n                f.backgroundTexture = backgroundTexture\n                f.comboPointTexture = comboPointTexture\n                \n                createAnimations (f)\n            end\n            \n        else\n            envTable.ComboPointFrame = unitFrame.PlaterComboPointFrame\n            envTable.ComboPointFrame:SetScale (sizes.scale)\n            envTable.ComboPoints = unitFrame.PlaterComboPointFrame.ComboPointFramesPool\n            \n        end            \n        \n        envTable.ComboPointFrame:SetFrameLevel (frameLevel)\n        envTable.ComboPointFrame:SetFrameStrata (frameStrata)\n        \n        function envTable.UpdateComboPoints()\n            local comboPoints = UnitPower (\"player\", Enum.PowerType.ComboPoints)\n            \n            for i = 1, envTable.TotalComboPoints do\n                local thisComboPoint = envTable.ComboPoints [i]\n                \n                if (i <= comboPoints ) then\n                    --combo point enabled\n                    if (not thisComboPoint.IsActive) then\n                        thisComboPoint.ShowAnimation:Play()\n                        thisComboPoint.IsActive = true\n                        \n                    end\n                    \n                else\n                    --combo point disabled\n                    if (thisComboPoint.IsActive) then\n                        thisComboPoint.HideAnimation:Play()\n                        thisComboPoint.IsActive = false\n                        \n                    end\n                end\n            end\n            \n            \n        end\n        \n        function envTable.UpdateComboPointAmount()\n            local namePlateWidth = Plater.db.profile.plate_config.enemynpc.health_incombat[1]\n            local comboPoints = UnitPowerMax (\"player\", Enum.PowerType.ComboPoints)\n            local reservedSpace = namePlateWidth / comboPoints\n            \n            --store the total amount of combo points\n            envTable.TotalComboPoints = comboPoints\n            \n            --update anchor frame\n            envTable.ComboPointFrame:SetWidth (namePlateWidth)\n            envTable.ComboPointFrame:SetHeight (20)\n            envTable.ComboPointFrame:ClearAllPoints()\n            for i = 1, #anchors do\n                local anchor = anchors[i]\n                envTable.ComboPointFrame:SetPoint (unpack (anchor))\n            end        \n            \n            --\n            for i = 1, #envTable.ComboPoints do\n                envTable.ComboPoints[i]:Hide()\n                envTable.ComboPoints[i]:ClearAllPoints()\n            end\n            \n            for i = 1, comboPoints do\n                local comboPoint = envTable.ComboPoints[i]\n                comboPoint:SetPoint (\"left\", envTable.ComboPointFrame, \"left\", reservedSpace * (i-1), 0)\n                comboPoint:Show()\n            end\n            \n            envTable.LastUpdate = GetTime()\n            \n            envTable.UpdateComboPoints()\n        end\n        \n        --initialize\n        envTable.UpdateComboPointAmount()\n        envTable.ComboPointFrame:Hide()\n    end\n    \n    \nend",
					},
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
							["Enabled"] = true,
							["DRUID"] = true,
							["ROGUE"] = true,
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
							[103] = true,
							["Enabled"] = true,
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["race"] = {
						},
					},
					["Time"] = 1548354524,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["url"] = "",
					["Icon"] = 135426,
					["Name"] = "Combo Points [Plater]",
				}, -- [11]
				{
					["Enabled"] = false,
					["Revision"] = 182,
					["semver"] = "",
					["HooksTemp"] = {
					},
					["Author"] = "Izimode-Azralon",
					["version"] = -1,
					["Desc"] = "Show how many raid members are targeting the unit",
					["Hooks"] = {
						["Leave Combat"] = "function (self, unitId, unitFrame, envTable)\n    envTable.CanShow = false;\n    envTable.TargetAmount:SetText (\"\")\nend\n\n\n",
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --when a nameplate is added to the screen check if the player is in combat\n    if (InCombatLockdown()) then\n        --player is in combat, check if can check amount of targets\n        envTable.CanShow = envTable.CanShowTargetAmount();\n        \n    else\n        envTable.CanShow = false; \n    end\n    \n    envTable.TargetAmount:SetText (\"\");\n    \nend",
						["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.TargetAmount:SetText (\"\");\n    envTable.CanShow = false;\n    \nend\n\n\n",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --if the script is allowed to show the amount of targets\n    --also check if the unit is in combat\n    if (envTable.CanShow and UnitAffectingCombat (unitId)) then\n        \n        --check if can update the amount of targets following the cooldown set in the constructor script\n        --by default Plater updates the nameplate every 250ms, by default the cooldown is 2, so it'll update the amuont of target every 1/2 of a second\n        envTable.UpdateCooldown = envTable.UpdateCooldown + 1\n        if (envTable.UpdateCooldown < envTable.UpdateInterval) then\n            return\n        else\n            \n            --reset the cooldown interval to check the amount of target again\n            envTable.UpdateCooldown = 0\n            \n            --get the amount of targets\n            local amount;\n            if (envTable.InRaid) then\n                amount = envTable.NumTargetsInRaid (unitFrame)      \n                \n            elseif (envTable.InParty) then\n                amount = envTable.NumTargetsInParty (unitFrame)   \n                \n            else\n                envTable.TargetAmount:SetText (\"\")\n                return\n            end\n            \n            --update the amount text\n            if (amount == 0) then\n                envTable.TargetAmount:SetText (\"\")\n            else\n                envTable.TargetAmount:SetText (amount)\n            end\n            \n        end\n    end\nend\n\n\n",
						["Enter Combat"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can show the amount of targets\n    envTable.CanShow = envTable.CanShowTargetAmount();\n    \n    if (not envTable.CanShow) then\n        envTable.TargetAmount:SetText (\"\") \n    end\nend\n\n\n\n\n",
						["Constructor"] = "--all gray text like this are comments and do not run as code\n--build the settings and basic functions for the hook\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --declare setting variables:\n    local textColor = \"orange\";\n    local textSize = 12;\n    \n    local showInRaid = true;\n    local showInDungeon = true;\n    local showInArena = false;\n    local showInBattleground = false;\n    local showInOpenWorld = true;\n    \n    envTable.UpdateInterval = 2; --each 2 updates in the nameplate it'll update the amount of targets\n    \n    local anchor = {\n        side = 6, --1 = topleft 2 = left 3 = bottomleft 4 = bottom 5 = bottom right 6 = right 7 = topright 8 = top\n        x = 4, --x offset\n        y = 0, --y offset\n    };\n    \n    \n    ---------------------------------------------------------------------------------------------------------------------------------------------\n    \n    \n    --frames:\n    \n    --create the text that will show the amount of people targeting the unit\n    if (not  unitFrame.healthBar.TargetAmount) then\n        envTable.TargetAmount = Plater:CreateLabel (unitFrame.healthBar, \"\", textSize, textColor);\n        Plater.SetAnchor (envTable.TargetAmount, anchor);\n        unitFrame.healthBar.TargetAmount = envTable.TargetAmount\n    end\n    \n    --in case Plater wipes the envTable\n    envTable.TargetAmount = unitFrame.healthBar.TargetAmount\n    \n    ---------------------------------------------------------------------------------------------------------------------------------------------           \n    --private variables (they will be used in the other scripts within this hook)\n    envTable.CanShow = false;\n    envTable.UpdateCooldown = 0;\n    envTable.InRaid = false;\n    envTable.InParty = false;\n    \n    ---------------------------------------------------------------------------------------------------------------------------------------------           \n    --functions\n    \n    --update the InRaid or InParty proprieties\n    function envTable.UpdateGroupType()\n        if (IsInRaid()) then\n            envTable.InRaid = true;\n            envTable.InParty = false;     \n            \n        elseif (IsInGroup()) then\n            envTable.InRaid = false;\n            envTable.InParty = true;   \n            \n        else\n            envTable.InRaid = false;            \n            envTable.InParty = false;\n        end\n    end\n    \n    --this function controls if the amount of targets can show following the settings in the top of this script\n    function envTable.CanShowTargetAmount()\n        \n        local _, instanceType, difficultyID, _, _, _, _, instanceMapID, instanceGroupSize = GetInstanceInfo()\n        \n        if (showInRaid and instanceType == \"raid\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInDungeon and instanceType == \"party\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInArena and instanceType == \"arena\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInBattleground and instanceType == \"pvp\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInOpenWorld and instanceType == \"none\") then\n            envTable.UpdateGroupType()\n            if (envTable.InRaid or envTable.InParty) then\n                return true\n            end\n        end\n        \n        return false\n    end\n    \n    --get the amount of player targetting the unit in raid or party\n    function envTable.NumTargetsInRaid (unitFrame)\n        local amount = 0\n        for i = 1, GetNumGroupMembers() do\n            local unit = \"raid\" .. i .. \"target\"\n            if (UnitGUID (unit) == unitFrame.namePlateUnitGUID) then\n                amount = amount + 1\n            end\n        end\n        \n        return amount\n    end\n    \n    function envTable.NumTargetsInParty()\n        local amount = 0\n        for i = 1, GetNumGroupMembers() - 1 do\n            local unit = \"party\" .. i .. \"target\"\n            if (UnitGUID (unit) == unitFrame.namePlateUnitGUID) then\n                amount = amount + 1\n            end\n        end\n        \n        local unit = \"playertarget\"\n        if (UnitGUID (unit) == unitFrame.namePlateUnitGUID) then\n            amount = amount + 1\n        end        \n        \n        return amount\n    end\n    \nend",
					},
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["role"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["Time"] = 1548278227,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["url"] = "",
					["Icon"] = 1966587,
					["Name"] = "Players Targeting a Target [Plater]",
				}, -- [12]
				{
					["Enabled"] = false,
					["Revision"] = 93,
					["semver"] = "",
					["HooksTemp"] = {
					},
					["Author"] = "Izimode-Azralon",
					["version"] = -1,
					["Desc"] = "Changes the target color to the color set in the constructor script.",
					["Hooks"] = {
						["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    envTable.UpdateColor (unitFrame)\nend",
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    envTable.UpdateColor (unitFrame)\nend",
						["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    envTable.UpdateColor (unitFrame)\nend\n\n\n\n\n\n\n\n\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --usage: color name e.g \"red\" \"yellow\"; color table e.g {1, 0, 0} {1, 1, 0}; hex string e.g. \"#FF0000\" \"FFFF00\"\n    \n    envTable.TargetColor = \"purple\"\n    --envTable.TargetColor = \"#FF00FF\"\n    --envTable.TargetColor = {252/255, 0/255, 254/255}\n    \n    function envTable.UpdateColor (unitFrame)\n        --do not change the color of the personal bar\n        if (not unitFrame.IsSelf) then\n            \n            --if this nameplate the current target of the player?\n            if (unitFrame.namePlateIsTarget) then\n                Plater.SetNameplateColor (unitFrame, envTable.TargetColor)  --rgb\n            else\n                --refresh the nameplate color\n                Plater.RefreshNameplateColor (unitFrame)\n            end\n        end\n    end\n    \nend\n\n\n\n\n",
					},
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["race"] = {
						},
						["pvptalent"] = {
						},
						["spec"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["role"] = {
						},
					},
					["Time"] = 1552354619,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["url"] = "",
					["Icon"] = 878211,
					["Name"] = "Current Target Color [Plater]",
				}, -- [13]
				{
					["Enabled"] = false,
					["Revision"] = 272,
					["semver"] = "",
					["HooksTemp"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    local auraContainers = {unitFrame.BuffFrame.PlaterBuffList}\n\n    if (Plater.db.profile.buffs_on_aura2) then\n        auraContainers [2] = unitFrame.BuffFrame2.PlaterBuffList\n    end\n    \n    for containerID = 1, #auraContainers do\n        \n        local auraContainer = auraContainers [containerID]\n        local aurasShown = {}\n        local aurasDuplicated = {}\n        \n        --build the list of auras shown in the buff frame and check for each aura priority\n        --also check if the consolidate (stack) auras with the same name is enabled\n        for index, auraIcon in ipairs (auraContainer) do\n            if (auraIcon:IsShown()) then\n                if (envTable.consolidadeRepeatedAuras) then\n                    --is this aura already shown?\n                    local iconShownIndex = aurasDuplicated [auraIcon.SpellName]\n                    if (iconShownIndex) then\n                        --get the table with information about the shown icon\n                        local auraShownTable = aurasShown [iconShownIndex]\n                        --get the icon already in the table\n                        local icon = auraShownTable[1]\n                        --increase the amount of stacks\n                        auraShownTable[3] = auraShownTable[3] + 1\n                        \n                        --check if the remaining time of the icon already added in the table is lower than the current\n                        if (auraIcon.RemainingTime > icon.RemainingTime) then\n                            --replace the icon for the icon with bigger duration\n                            auraShownTable[1] = auraIcon\n                            icon:Hide()\n                        else\n                            auraIcon:Hide()\n                        end\n                    else    \n                        local priority = envTable.priority[auraIcon.SpellName] or envTable.priority[auraIcon.spellId] or 1\n                        tinsert (aurasShown, {auraIcon, priority, 1}) --icon frame, priority, stack amount\n                        aurasDuplicated [auraIcon.SpellName] = #aurasShown\n                    end\n                else\n                    --not stacking similar auras\n                    local priority = envTable.priority[auraIcon.SpellName] or envTable.priority[auraIcon.spellId] or 1\n                    tinsert (aurasShown, {auraIcon, priority})\n                    \n                end           \n            end\n        end\n        \n        --sort auras by priority\n        table.sort (aurasShown, DetailsFramework.SortOrder2)\n        \n        local growDirection\n        if (containerID == 1) then --debuff container\n            growDirection = Plater.db.profile.aura_grow_direction\n            --force to grow to right if it is anchored to center\n            if (growDirection == 2) then\n                growDirection = 3\n            end\n            -- \"Left\", \"Center\", \"Right\" - 1  2  3\n            \n        elseif (containerID == 2) then --buff container\n            growDirection = Plater.db.profile.aura2_grow_direction\n            --force to grow to left if it is anchored to center\n            if (growDirection == 2) then\n                growDirection = 1\n            end\n            \n        end\n        \n        local padding = envTable.padding\n        local framersPerRow = envTable.maxAurasPerRow + 1\n        \n        --first icon is where the row starts\n        local firstIcon = aurasShown[1] and aurasShown[1][1]\n        \n        if (firstIcon) then\n            local anchorPoint = firstIcon:GetParent() --anchor point is the BuffFrame\n            anchorPoint:SetSize (1, 1)\n            \n            firstIcon:ClearAllPoints()\n            firstIcon:SetPoint (\"center\", anchorPoint, \"center\", 0, 5)\n            \n            --check the consolidaded stacks, this is not the regular buff stacks\n            local firstIconStacks = aurasShown[1][3]\n            if (firstIconStacks and firstIconStacks > 1) then\n                firstIcon.StackText:SetText (firstIconStacks)\n                firstIcon.StackText:Show()\n            end\n            \n            --> left to right\n            if (growDirection == 3) then\n                --> iterate among all aura icons\n                for i = 2, #aurasShown do\n                    local auraIcon = aurasShown [i][1]\n                    auraIcon:ClearAllPoints()\n                    \n                    if (i == framersPerRow) then\n                        auraIcon:SetPoint (\"bottomleft\", firstIcon, \"topleft\", 0, envTable.rowPadding)\n                        framersPerRow = framersPerRow + framersPerRow\n                        \n                    else\n                        auraIcon:SetPoint (\"topleft\", aurasShown [i-1][1], \"topright\", padding, 0)\n                    end\n                    \n                    local stacks = aurasShown[i][3]\n                    if (stacks and stacks > 1) then\n                        auraIcon.StackText:SetText (stacks)\n                        auraIcon.StackText:Show()\n                    end\n                end        \n                \n                --right to left\n            elseif (growDirection == 1) then\n                --> iterate among all aura icons\n                for i = 2, #aurasShown do\n                    local auraIcon = aurasShown [i][1]\n                    auraIcon:ClearAllPoints()\n                    \n                    if (i == framersPerRow) then\n                        auraIcon:SetPoint (\"bottomright\", firstIcon, \"topright\", 0, envTable.rowPadding)\n                        framersPerRow = framersPerRow + framersPerRow\n                        \n                    else\n                        auraIcon:SetPoint (\"topright\", aurasShown [i-1][1], \"topleft\", -padding, 0)\n                    end\n                    \n                    local stacks = aurasShown[i][3]\n                    if (stacks and stacks > 1) then\n                        auraIcon.StackText:SetText (stacks)\n                        auraIcon.StackText:Show()\n                    end\n                    \n                end                    \n            end\n            \n        end\n    end\nend\n\n\n",
					},
					["Author"] = "Ditador-Azralon",
					["version"] = -1,
					["Desc"] = "Reorder buffs and debuffs following the settings set in the constructor.",
					["Hooks"] = {
						["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    local auraContainers = {unitFrame.BuffFrame.PlaterBuffList}\n\n    if (Plater.db.profile.buffs_on_aura2) then\n        auraContainers [2] = unitFrame.BuffFrame2.PlaterBuffList\n    end\n    \n    for containerID = 1, #auraContainers do\n        \n        local auraContainer = auraContainers [containerID]\n        local aurasShown = {}\n        local aurasDuplicated = {}\n        \n        --build the list of auras shown in the buff frame and check for each aura priority\n        --also check if the consolidate (stack) auras with the same name is enabled\n        for index, auraIcon in ipairs (auraContainer) do\n            if (auraIcon:IsShown()) then\n                if (envTable.consolidadeRepeatedAuras) then\n                    --is this aura already shown?\n                    local iconShownIndex = aurasDuplicated [auraIcon.SpellName]\n                    if (iconShownIndex) then\n                        --get the table with information about the shown icon\n                        local auraShownTable = aurasShown [iconShownIndex]\n                        --get the icon already in the table\n                        local icon = auraShownTable[1]\n                        --increase the amount of stacks\n                        auraShownTable[3] = auraShownTable[3] + 1\n                        \n                        --check if the remaining time of the icon already added in the table is lower than the current\n                        if (auraIcon.RemainingTime > icon.RemainingTime) then\n                            --replace the icon for the icon with bigger duration\n                            auraShownTable[1] = auraIcon\n                            icon:Hide()\n                        else\n                            auraIcon:Hide()\n                        end\n                    else    \n                        local priority = envTable.priority[auraIcon.SpellName] or envTable.priority[auraIcon.spellId] or 1\n                        tinsert (aurasShown, {auraIcon, priority, 1}) --icon frame, priority, stack amount\n                        aurasDuplicated [auraIcon.SpellName] = #aurasShown\n                    end\n                else\n                    --not stacking similar auras\n                    local priority = envTable.priority[auraIcon.SpellName] or envTable.priority[auraIcon.spellId] or 1\n                    tinsert (aurasShown, {auraIcon, priority})\n                    \n                end           \n            end\n        end\n        \n        --sort auras by priority\n        table.sort (aurasShown, DetailsFramework.SortOrder2)\n        \n        local growDirection\n        if (containerID == 1) then --debuff container\n            growDirection = Plater.db.profile.aura_grow_direction\n            --force to grow to right if it is anchored to center\n            if (growDirection == 2) then\n                growDirection = 3\n            end\n            -- \"Left\", \"Center\", \"Right\" - 1  2  3\n            \n        elseif (containerID == 2) then --buff container\n            growDirection = Plater.db.profile.aura2_grow_direction\n            --force to grow to left if it is anchored to center\n            if (growDirection == 2) then\n                growDirection = 1\n            end\n            \n        end\n        \n        local padding = envTable.padding\n        local framersPerRow = envTable.maxAurasPerRow + 1\n        \n        --first icon is where the row starts\n        local firstIcon = aurasShown[1] and aurasShown[1][1]\n        \n        if (firstIcon) then\n            local anchorPoint = firstIcon:GetParent() --anchor point is the BuffFrame\n            anchorPoint:SetSize (1, 1)\n            \n            firstIcon:ClearAllPoints()\n            firstIcon:SetPoint (\"center\", anchorPoint, \"center\", 0, 5)\n            \n            --check the consolidaded stacks, this is not the regular buff stacks\n            local firstIconStacks = aurasShown[1][3]\n            if (firstIconStacks and firstIconStacks > 1) then\n                firstIcon.StackText:SetText (firstIconStacks)\n                firstIcon.StackText:Show()\n            end\n            \n            --> left to right\n            if (growDirection == 3) then\n                --> iterate among all aura icons\n                for i = 2, #aurasShown do\n                    local auraIcon = aurasShown [i][1]\n                    auraIcon:ClearAllPoints()\n                    \n                    if (i == framersPerRow) then\n                        auraIcon:SetPoint (\"bottomleft\", firstIcon, \"topleft\", 0, envTable.rowPadding)\n                        framersPerRow = framersPerRow + framersPerRow\n                        \n                    else\n                        auraIcon:SetPoint (\"topleft\", aurasShown [i-1][1], \"topright\", padding, 0)\n                    end\n                    \n                    local stacks = aurasShown[i][3]\n                    if (stacks and stacks > 1) then\n                        auraIcon.StackText:SetText (stacks)\n                        auraIcon.StackText:Show()\n                    end\n                end        \n                \n                --right to left\n            elseif (growDirection == 1) then\n                --> iterate among all aura icons\n                for i = 2, #aurasShown do\n                    local auraIcon = aurasShown [i][1]\n                    auraIcon:ClearAllPoints()\n                    \n                    if (i == framersPerRow) then\n                        auraIcon:SetPoint (\"bottomright\", firstIcon, \"topright\", 0, envTable.rowPadding)\n                        framersPerRow = framersPerRow + framersPerRow\n                        \n                    else\n                        auraIcon:SetPoint (\"topright\", aurasShown [i-1][1], \"topleft\", -padding, 0)\n                    end\n                    \n                    local stacks = aurasShown[i][3]\n                    if (stacks and stacks > 1) then\n                        auraIcon.StackText:SetText (stacks)\n                        auraIcon.StackText:Show()\n                    end\n                    \n                end                    \n            end\n            \n        end\n    end\nend\n\n\n",
						["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --ATTENTION: after enabling this script, you may have to adjust the anchor point at the Buff Settings tab\n    \n    --space between each aura icon\n    envTable.padding = 2\n    \n    --space between each row of icons\n    envTable.rowPadding = 12\n    \n    --amount of icons in the row, it'll breakline and start a new row after reach the threshold\n    envTable.maxAurasPerRow = 5\n    \n    --stack auras of the same name that arent stacked by default from the game\n    envTable.consolidadeRepeatedAuras = true    \n    \n    --which auras goes first, assign a value (any number), bigger value goes first\n    envTable.priority = {\n        [\"Vampiric Touch\"] = 50,\n        [\"Shadow Word: Pain\"] = 22,\n        [\"Mind Flay\"] = 5,\n    }\n    \nend \n\n\n\n\n",
					},
					["LoadConditions"] = {
						["talent"] = {
						},
						["group"] = {
						},
						["class"] = {
						},
						["map_ids"] = {
						},
						["role"] = {
						},
						["pvptalent"] = {
						},
						["race"] = {
						},
						["affix"] = {
						},
						["encounter_ids"] = {
						},
						["spec"] = {
						},
					},
					["Time"] = 1553450957,
					["PlaterCore"] = 1,
					["LastHookEdited"] = "",
					["url"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura_reorder",
					["Name"] = "Aura Reorder [Plater]",
				}, -- [14]
			},
			["script_auto_imported"] = {
				["Cast - Small Alert"] = 4,
				["Aura - Invalidate Unit"] = 1,
				["Aura - Buff Alert"] = 4,
				["Unit - Important"] = 5,
				["Aura Border Color"] = 1,
				["Cast - Very Important"] = 2,
				["Explosion Affix M+"] = 3,
				["Unit Power"] = 1,
				["Aura - Debuff Alert"] = 3,
				["Cast - Frontal Cone"] = 2,
				["Fixate"] = 3,
				["Aura - Blink Time Left"] = 1,
				["Color Change"] = 1,
				["Cast - Big Alert"] = 5,
				["Fixate On You"] = 2,
			},
			["extra_icon_auras"] = {
				277242, -- [1]
			},
			["captured_spells"] = {
				[164815] = {
					["source"] = "Bluen-TarrenMill",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[259489] = {
					["source"] = "Fàllkên",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[306474] = {
					["source"] = "Malendra-TwistingNether",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280375] = {
					["source"] = "Valdori-Draenor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[8222] = {
					["source"] = "Demøn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[53390] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bubblewitch-KulTiras",
					["npcID"] = 0,
				},
				[115192] = {
					["source"] = "Vaelviøza-Nathrezim",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[14443] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Wavecrest Mariner",
					["npcID"] = 35098,
				},
				[315176] = {
					["source"] = "Skwìp-Elune",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268607] = {
					["source"] = "Visryn-Magtheridon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[152279] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fällkên",
					["npcID"] = 0,
				},
				[193475] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nynelock-Draenor",
					["npcID"] = 0,
				},
				[255141] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fallkenez",
					["npcID"] = 0,
				},
				[183752] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mlord-Outland",
					["npcID"] = 0,
				},
				[275773] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Palalord-Stormscale",
					["npcID"] = 0,
				},
				[255909] = {
					["source"] = "Vaelviøza-Nathrezim",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[313643] = {
					["source"] = "Stornó-Blackmoore",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[315179] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Cjzx-Draenor",
					["npcID"] = 0,
				},
				[270657] = {
					["source"] = "Мальвада-Галакронд",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[281404] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Boegroeff-TarrenMill",
					["npcID"] = 0,
				},
				[85256] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Junboib-Draenor",
					["npcID"] = 0,
				},
				[168657] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bubblewitch-KulTiras",
					["npcID"] = 0,
				},
				[31661] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Drummina-Draenor",
					["npcID"] = 0,
				},
				[17364] = {
					["source"] = "Thunderfloof-Kazzak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[153561] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Doegrinder-Draenor",
					["npcID"] = 0,
				},
				[31821] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Palalord-Stormscale",
					["npcID"] = 0,
				},
				[403] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bubblewitch-KulTiras",
					["npcID"] = 0,
				},
				[315695] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Aqir Voidcaster",
					["npcID"] = 154352,
				},
				[275779] = {
					["source"] = "Caldrith-BurningLegion",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[288573] = {
					["source"] = "Жукан-СвежевательДуш",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268616] = {
					["source"] = "Bugne-Blackrock",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[408] = {
					["source"] = "Stornó-Blackmoore",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[118905] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Capacitor Totem",
					["npcID"] = 61245,
				},
				[223929] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Bèastmodè-TheMaelstrom",
					["npcID"] = 0,
				},
				[233397] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Fällkên",
					["npcID"] = 0,
				},
				[162264] = {
					["source"] = "Shoreks-Arygos",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[221883] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Palalord-Stormscale",
					["npcID"] = 0,
				},
				[194249] = {
					["source"] = "Ðice-Dragonblight",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[214975] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Fällkên",
					["npcID"] = 0,
				},
				[228537] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Demonsols-Doomhammer",
					["npcID"] = 0,
				},
				[301886] = {
					["source"] = "Malendra-TwistingNether",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[45524] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bèastmodè-TheMaelstrom",
					["npcID"] = 0,
				},
				[421] = {
					["source"] = "Shianata-BurningLegion",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[268623] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mithelas-Ysondre",
					["npcID"] = 0,
				},
				[335151] = {
					["source"] = "Hehkate-Anachronos",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[118779] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Tatusk-Draenor",
					["npcID"] = 0,
				},
				[221886] = {
					["source"] = "Matafaka-Norgannon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[313148] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lîlgåÿløkßøï-Alonsus",
					["npcID"] = 0,
				},
				[203975] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Yolandin-Nemesis",
					["npcID"] = 0,
				},
				[273232] = {
					["source"] = "Shoreks-Arygos",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[196555] = {
					["source"] = "Nurgîel-BurningLegion",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[270674] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Junboib-Draenor",
					["npcID"] = 0,
				},
				[1719] = {
					["source"] = "Shocktar-DunMorogh",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[290121] = {
					["source"] = "Peanamon-Nethersturm",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280398] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Massdebater-TarrenMill",
					["npcID"] = 0,
				},
				[1725] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fallkenez",
					["npcID"] = 0,
				},
				[288075] = {
					["source"] = "Dalrymple",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[167898] = {
					["source"] = "Muerte-Darksorrow",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[313663] = {
					["source"] = "Bluen-TarrenMill",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[302917] = {
					["source"] = "Kéran-ShatteredHalls",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[235450] = {
					["source"] = "Yasmine-Turalyon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[23922] = {
					["source"] = "Тормагеддон-СвежевательДуш",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[282449] = {
					["source"] = "Skwìp-Elune",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 144961,
				},
				[273238] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Grizzdh-Quel'Thalas",
					["npcID"] = 0,
				},
				[204490] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Grizzdh-Quel'Thalas",
					["npcID"] = 0,
				},
				[188370] = {
					["source"] = "Valdori-Draenor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[58511] = {
					["source"] = "Orgrimmar Grunt",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 3296,
				},
				[28272] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Drummina-Draenor",
					["npcID"] = 0,
				},
				[280404] = {
					["source"] = "Enriquillo-ArgentDawn",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[202188] = {
					["source"] = "Nashwan-Blackrock",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[267611] = {
					["source"] = "Diruh-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[290640] = {
					["source"] = "Vuuja-BurningLegion",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[271194] = {
					["source"] = "Durus-Blackhand",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[267612] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fallkenez",
					["npcID"] = 0,
				},
				[290641] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bubblewitch-KulTiras",
					["npcID"] = 0,
				},
				[30639] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Redfang Hunter",
					["npcID"] = 26356,
				},
				[305483] = {
					["source"] = "Nashwan-Blackrock",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[305484] = {
					["source"] = "Nashwan-Blackrock",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280409] = {
					["source"] = "Diruh-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[287062] = {
					["source"] = "Durus-Blackhand",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5217] = {
					["source"] = "Fäntom-Blackrock",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5225] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Neksi-Draenor",
					["npcID"] = 0,
				},
				[198097] = {
					["source"] = "Nàrutò-Thrall",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[271711] = {
					["source"] = "Worrlock-Terokkar",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1833] = {
					["source"] = "Vaelviøza-Nathrezim",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[266083] = {
					["source"] = "Krolusk Sandhunter",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 135582,
				},
				[298836] = {
					["source"] = "Haifaive-Draenor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[7384] = {
					["source"] = "Ðàenerýs-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[279902] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Soclean-ShatteredHand",
					["npcID"] = 0,
				},
				[298837] = {
					["source"] = "Fárleon-Draenor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[226757] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Fàllkén",
					["npcID"] = 0,
				},
				[298839] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Grimmjiow-Draenor",
					["npcID"] = 0,
				},
				[121471] = {
					["source"] = "Skwìp-Elune",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[295258] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Donskee-Draenor",
					["npcID"] = 0,
				},
				[201427] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Demonsols-Doomhammer",
					["npcID"] = 0,
				},
				[298841] = {
					["source"] = "Hjbjz-TarrenMill",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[201939] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Yolandin-Nemesis",
					["npcID"] = 0,
				},
				[204242] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Faallken",
					["npcID"] = 0,
				},
				[317265] = {
					["source"] = "Latexpaula-Thrall",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[266091] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lîlgåÿløkßøï-Alonsus",
					["npcID"] = 0,
				},
				[214222] = {
					["source"] = "Annalamy-Sunstrider",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[24275] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Junboib-Draenor",
					["npcID"] = 0,
				},
				[68506] = {
					["source"] = "High Commander Halford Wyrmbane",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 34924,
				},
				[251836] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nezìa-Hyjal",
					["npcID"] = 0,
				},
				[305497] = {
					["source"] = "Ankaa-Elune",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[114052] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Roltrap-Kazzak",
					["npcID"] = 0,
				},
				[298845] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Nöllan",
					["npcID"] = 0,
				},
				[185565] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fallkenez",
					["npcID"] = 0,
				},
				[198103] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Roltrap-Kazzak",
					["npcID"] = 0,
				},
				[251837] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Zhedd-Bladefist",
					["npcID"] = 0,
				},
				[7744] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Proita-Outland",
					["npcID"] = 0,
				},
				[251838] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nöllan",
					["npcID"] = 0,
				},
				[1943] = {
					["source"] = "Kipix-Elune",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[185311] = {
					["source"] = "Stornó-Blackmoore",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[251839] = {
					["source"] = "Piesta-Twilight'sHammer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[62544] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Faallken",
					["npcID"] = 0,
				},
				[207317] = {
					["source"] = "Dábur-Blackrock",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[42650] = {
					["source"] = "Dábur-Blackrock",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[195292] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Darkvandal-KhazModan",
					["npcID"] = 0,
				},
				[274289] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mlord-Outland",
					["npcID"] = 0,
				},
				[208086] = {
					["source"] = "Tordrei-Azshara",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[498] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Palalord-Stormscale",
					["npcID"] = 0,
				},
				[82326] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Palalord-Stormscale",
					["npcID"] = 0,
				},
				[212182] = {
					["source"] = "Stornó-Blackmoore",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[210391] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mssk-Skullcrusher",
					["npcID"] = 0,
				},
				[255937] = {
					["source"] = "Quantox-Frostwolf",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[298859] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bulinbuling-ShatteredHand",
					["npcID"] = 0,
				},
				[192225] = {
					["source"] = "Haifaive-Draenor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[48792] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bèastmodè-TheMaelstrom",
					["npcID"] = 0,
				},
				[198111] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Israckette-Archimonde",
					["npcID"] = 0,
				},
				[2050] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Erinqa-BurningLegion",
					["npcID"] = 0,
				},
				[115080] = {
					["source"] = "Контанго-Ясеневыйлес",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[286581] = {
					["source"] = "Stornó-Blackmoore",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[198368] = {
					["source"] = "Bugne-Blackrock",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[188389] = {
					["source"] = "Mirotvorac-Stormscale",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[45658] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kvaldir Mist Binder",
					["npcID"] = 34839,
				},
				[2094] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fallkenez",
					["npcID"] = 0,
				},
				[2098] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fi-BurningLegion",
					["npcID"] = 0,
				},
				[527] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Proita-Outland",
					["npcID"] = 0,
				},
				[528] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Proita-Outland",
					["npcID"] = 0,
				},
				[260291] = {
					["source"] = "Bladeguard Elite",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 130451,
				},
				[256453] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Gooman-Blade'sEdge",
					["npcID"] = 0,
				},
				[215769] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Erinqa-BurningLegion",
					["npcID"] = 0,
				},
				[228563] = {
					["source"] = "Proteinz-Kazzak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[12654] = {
					["source"] = "Latexpaula-Thrall",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[298357] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Israckette-Archimonde",
					["npcID"] = 0,
				},
				[91797] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Grubchewer",
					["npcID"] = 26125,
				},
				[273794] = {
					["type"] = "DEBUFF",
					["source"] = "Caldrith-BurningLegion",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[203233] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Misiekhuj-BurningLegion",
					["npcID"] = 0,
				},
				[272260] = {
					["source"] = "Ankaa-Elune",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[204513] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Grizzdh-Quel'Thalas",
					["npcID"] = 0,
				},
				[300919] = {
					["source"] = "Shianata-BurningLegion",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[205025] = {
					["source"] = "Yasmine-Turalyon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[256456] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mortalboo-Khadgar",
					["npcID"] = 0,
				},
				[238289] = {
					["source"] = "Vedjaina",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[315763] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bubbleoseven-Genjuros",
					["npcID"] = 0,
				},
				[145152] = {
					["source"] = "Portonas-Forscherliga",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[289666] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Erinqa-BurningLegion",
					["npcID"] = 0,
				},
				[279943] = {
					["source"] = "Ihotu-Blackmoore",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[6673] = {
					["source"] = "Xtreame-Sylvanas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[256459] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Zhedd-Bladefist",
					["npcID"] = 0,
				},
				[11327] = {
					["source"] = "Stornó-Blackmoore",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[171253] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Foxxis-Frostwhisper",
					["npcID"] = 0,
				},
				[585] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Proita-Outland",
					["npcID"] = 0,
				},
				[586] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Proita-Outland",
					["npcID"] = 0,
				},
				[589] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Jahvene-Stormreaver",
					["npcID"] = 0,
				},
				[236502] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Gooman-Blade'sEdge",
					["npcID"] = 0,
				},
				[91800] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Grubchewer",
					["npcID"] = 26125,
				},
				[204262] = {
					["source"] = "Enriquillo-ArgentDawn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272783] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dinzo-TarrenMill",
					["npcID"] = 0,
				},
				[268178] = {
					["type"] = "DEBUFF",
					["source"] = "Pascolarctos-BurningLegion",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[54680] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "jasonburne",
					["npcID"] = 71529,
				},
				[210660] = {
					["source"] = "Nashwan-Blackrock",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[111759] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Xvdb-TarrenMill",
					["npcID"] = 0,
				},
				[50842] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Darkvandal-KhazModan",
					["npcID"] = 0,
				},
				[605] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Proita-Outland",
					["npcID"] = 0,
				},
				[199658] = {
					["source"] = "Khurtz-Nemesis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[77472] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bubblewitch-KulTiras",
					["npcID"] = 0,
				},
				[275857] = {
					["source"] = "Diruh-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[34914] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Jahvene-Stormreaver",
					["npcID"] = 0,
				},
				[272276] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fréia-TarrenMill",
					["npcID"] = 0,
				},
				[272790] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Shainzy-Draenor",
					["npcID"] = 0,
				},
				[124682] = {
					["source"] = "Kalysto-Blackrock",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[33763] = {
					["source"] = "Ankaa-Elune",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[33891] = {
					["source"] = "Ankaa-Elune",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[58519] = {
					["source"] = "Orgrimmar Grunt",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 3296,
				},
				[279956] = {
					["source"] = "Эллотара-Галакронд",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[210152] = {
					["source"] = "Shoreks-Arygos",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[275351] = {
					["type"] = "BUFF",
					["source"] = "Pascolarctos-BurningLegion",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[275863] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mithelas-Ysondre",
					["npcID"] = 0,
				},
				[231390] = {
					["source"] = "Linkshänder-Antonidas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[295310] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Évè-Archimonde",
					["npcID"] = 0,
				},
				[288146] = {
					["source"] = "Vaelviøza-Nathrezim",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[197871] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Krecto-LesSentinelles",
					["npcID"] = 0,
				},
				[642] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Palalord-Stormscale",
					["npcID"] = 0,
				},
				[197104] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Paranorm",
					["npcID"] = 0,
				},
				[206572] = {
					["source"] = "Murthàg-Hyjal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[273310] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Proita-Outland",
					["npcID"] = 0,
				},
				[217832] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Demonsols-Doomhammer",
					["npcID"] = 0,
				},
				[268194] = {
					["source"] = "Enrique-BurningLegion",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[197874] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Krecto-LesSentinelles",
					["npcID"] = 0,
				},
				[273312] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Proita-Outland",
					["npcID"] = 0,
				},
				[131347] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fadrielad-Draenor",
					["npcID"] = 0,
				},
				[213995] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fi-BurningLegion",
					["npcID"] = 0,
				},
				[259285] = {
					["source"] = "Fàllkên",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[222695] = {
					["source"] = "Idkka",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[267685] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Israckette-Archimonde",
					["npcID"] = 0,
				},
				[5394] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bubblewitch-KulTiras",
					["npcID"] = 0,
				},
				[316814] = {
					["source"] = "Skwìp-Elune",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[66218] = {
					["source"] = "Catapult",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 34793,
				},
				[155145] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Palalord-Stormscale",
					["npcID"] = 0,
				},
				[190456] = {
					["source"] = "Тормагеддон-СвежевательДуш",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[79140] = {
					["source"] = "Stornó-Blackmoore",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[288158] = {
					["source"] = "Vaelviøza-Nathrezim",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[691] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Flashfakêr",
					["npcID"] = 0,
				},
				[135700] = {
					["source"] = "Fäntom-Blackrock",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[289184] = {
					["source"] = "Bullshiift",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[192249] = {
					["source"] = "Enriquillo-ArgentDawn",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[295838] = {
					["source"] = "Kazûtô-Blackhand",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[703] = {
					["source"] = "Kipix-Elune",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[20473] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Palalord-Stormscale",
					["npcID"] = 0,
				},
				[274346] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Demonsols-Doomhammer",
					["npcID"] = 0,
				},
				[295840] = {
					["source"] = "Kazûtô-Blackhand",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[193530] = {
					["source"] = "Hehkate-Anachronos",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[193786] = {
					["source"] = "Thunderfloof-Kazzak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[316823] = {
					["source"] = "Skwìp-Elune",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[278954] = {
					["source"] = "Valdori-Draenor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[295842] = {
					["source"] = "Janiah-Doomhammer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[290213] = {
					["source"] = "Nupko",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[303520] = {
					["source"] = "Ihotu-Blackmoore",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[316826] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Twisted Appendage",
					["npcID"] = 162764,
				},
				[113942] = {
					["source"] = "Ellocko-Darkspear",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[279471] = {
					["source"] = "Fäntom-Blackrock",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[273842] = {
					["source"] = "Litonya-Malfurion",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[61721] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Israckette-Archimonde",
					["npcID"] = 0,
				},
				[57755] = {
					["source"] = "Fällkèn",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[310690] = {
					["source"] = "Stornó-Blackmoore",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[311202] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fallkenez",
					["npcID"] = 0,
				},
				[278962] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fi-BurningLegion",
					["npcID"] = 0,
				},
				[41635] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dinzo-TarrenMill",
					["npcID"] = 0,
				},
				[139546] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fi-BurningLegion",
					["npcID"] = 0,
				},
				[117014] = {
					["source"] = "Hiawata-Blackrock",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[316835] = {
					["source"] = "Twisted Appendage",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 162764,
				},
				[300971] = {
					["source"] = "Vejrice",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[317859] = {
					["source"] = "Amazone-Lightbringer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[195072] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Jadeitza-Draenor",
					["npcID"] = 0,
				},
				[277943] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bubblewitch-KulTiras",
					["npcID"] = 0,
				},
				[295855] = {
					["source"] = "Kazûtô-Blackhand",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[49184] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fällkên",
					["npcID"] = 0,
				},
				[102558] = {
					["source"] = "Spiritzu-Ragnaros",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[295856] = {
					["source"] = "Guardian of Azeroth",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 152396,
				},
				[256739] = {
					["source"] = "Suivetwo",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[193538] = {
					["source"] = "Oksana-Al'Akir",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[3110] = {
					["source"] = "Zepnuk",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 58959,
				},
				[781] = {
					["source"] = "Amazone-Lightbringer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[783] = {
					["source"] = "Fallken",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[155158] = {
					["source"] = "Latexpaula-Thrall",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[12544] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Librarian Belleford",
					["npcID"] = 32374,
				},
				[58460] = {
					["source"] = "High Commander Halford Wyrmbane",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 34924,
				},
				[62618] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Proita-Outland",
					["npcID"] = 0,
				},
				[23161] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bosanac-Magtheridon",
					["npcID"] = 0,
				},
				[193796] = {
					["source"] = "Thunderfloof-Kazzak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[318378] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fallkenez",
					["npcID"] = 0,
				},
				[262115] = {
					["source"] = "Tordrei-Azshara",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[213243] = {
					["source"] = "Shoreks-Arygos",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[85288] = {
					["source"] = "Shocktar-DunMorogh",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[8690] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sutteplegend-TarrenMill",
					["npcID"] = 0,
				},
				[19483] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Infernal",
					["npcID"] = 89,
				},
				[21562] = {
					["source"] = "Itàchi-Archimonde",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[115098] = {
					["source"] = "Proteinz-Kazzak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[194310] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Ownsÿ-Ysondre",
					["npcID"] = 0,
				},
				[260070] = {
					["source"] = "Pa'kura Priest",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 131834,
				},
				[190984] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Torrid-Twilight'sHammer",
					["npcID"] = 0,
				},
				[274373] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bèastmodè-TheMaelstrom",
					["npcID"] = 0,
				},
				[319919] = {
					["source"] = "Peanamon-Nethersturm",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[200196] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Erinqa-BurningLegion",
					["npcID"] = 0,
				},
				[275909] = {
					["source"] = "Ihotu-Blackmoore",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[304056] = {
					["source"] = "Ankaa-Elune",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[260072] = {
					["source"] = "Pa'kura Priest",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 131834,
				},
				[83243] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Trollakläss-Hyjal",
					["npcID"] = 0,
				},
				[67251] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Argent Monk",
					["npcID"] = 35305,
				},
				[300989] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Gooman-Blade'sEdge",
					["npcID"] = 0,
				},
				[236021] = {
					["source"] = "Maryl-Arygos",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[298431] = {
					["source"] = "Enriquillo-ArgentDawn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[53600] = {
					["source"] = "Caldrith-BurningLegion",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[83244] = {
					["source"] = "Fàllkên",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[53] = {
					["source"] = "Skwìp-Elune",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[200200] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Erinqa-BurningLegion",
					["npcID"] = 0,
				},
				[243955] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Cjzx-Draenor",
					["npcID"] = 0,
				},
				[34026] = {
					["source"] = "Hehkate-Anachronos",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[297412] = {
					["source"] = "Calaisa-ArgentDawn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[157982] = {
					["type"] = "BUFF",
					["source"] = "Rudejin-Blackmoore",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[295367] = {
					["source"] = "Ankaa-Elune",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[295368] = {
					["source"] = "Olikéâ-KhazModan",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[176151] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lokzar-TarrenMill",
					["npcID"] = 0,
				},
				[263642] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Grizzdh-Quel'Thalas",
					["npcID"] = 0,
				},
				[54049] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Luudhum",
					["npcID"] = 417,
				},
				[108194] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bèastmodè-TheMaelstrom",
					["npcID"] = 0,
				},
				[4987] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Palalord-Stormscale",
					["npcID"] = 0,
				},
				[264667] = {
					["source"] = "tvojtatko",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 34640,
				},
				[5019] = {
					["source"] = "Malendra-TwistingNether",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[224001] = {
					["type"] = "BUFF",
					["source"] = "Wrék-Draenor",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[295373] = {
					["source"] = "Vaelviøza-Nathrezim",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[67255] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Argent Monk",
					["npcID"] = 35305,
				},
				[261616] = {
					["source"] = "Katy Stampwhistle",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 132969,
				},
				[303564] = {
					["source"] = "Dancewithme-Teldrassil",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[203277] = {
					["source"] = "Onesjit-TarrenMill",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[263648] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Grizzdh-Quel'Thalas",
					["npcID"] = 0,
				},
				[5171] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mithelas-Ysondre",
					["npcID"] = 0,
				},
				[119582] = {
					["source"] = "Proteinz-Kazzak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[275931] = {
					["source"] = "Viscdk-Eredar",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[24858] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Torrid-Twilight'sHammer",
					["npcID"] = 0,
				},
				[295378] = {
					["source"] = "Zedorogue-Hyjal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[269279] = {
					["source"] = "Hehkate-Anachronos",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[216328] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Palalord-Stormscale",
					["npcID"] = 0,
				},
				[224772] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kyimi-BurningLegion",
					["npcID"] = 0,
				},
				[268769] = {
					["source"] = "Thunderfloof-Kazzak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[66489] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Kvaldir Harpooner",
					["npcID"] = 34907,
				},
				[303570] = {
					["source"] = "Dancewithme-Teldrassil",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297941] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Pandameow-BurningLegion",
					["npcID"] = 0,
				},
				[275936] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Donskee-Draenor",
					["npcID"] = 0,
				},
				[132403] = {
					["type"] = "BUFF",
					["source"] = "Caldrith-BurningLegion",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[271843] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bubblewitch-KulTiras",
					["npcID"] = 0,
				},
				[295384] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ketshup-Draenor",
					["npcID"] = 0,
				},
				[132404] = {
					["source"] = "Тормагеддон-СвежевательДуш",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[157736] = {
					["source"] = "Ramthas-TwistingNether",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[101545] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Faideh-TarrenMill",
					["npcID"] = 0,
				},
				[203538] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Arzorr-Draenor",
					["npcID"] = 0,
				},
				[268776] = {
					["source"] = "Amani Battle Bear",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 130257,
				},
				[275429] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Moghr-Stormscale",
					["npcID"] = 0,
				},
				[219403] = {
					["source"] = "Blackskull-TarrenMill",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[227847] = {
					["source"] = "Vinkudestryr-Al'Akir",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[203539] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Gigagica-Draenor",
					["npcID"] = 0,
				},
				[203795] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Grizzdh-Quel'Thalas",
					["npcID"] = 0,
				},
				[188443] = {
					["source"] = "Hiawata-Blackrock",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[101546] = {
					["source"] = "Kanpaldi-Blutkessel",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[32727] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fallkenez",
					["npcID"] = 0,
				},
				[304603] = {
					["source"] = "Neuroth",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[203285] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mageeka-Lightbringer",
					["npcID"] = 0,
				},
				[88625] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Erinqa-BurningLegion",
					["npcID"] = 0,
				},
				[22812] = {
					["source"] = "Ankaa-Elune",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[264689] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Nerúb-Draenor",
					["npcID"] = 0,
				},
				[308188] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kirimox-Draenor",
					["npcID"] = 0,
				},
				[974] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bubblewitch-KulTiras",
					["npcID"] = 0,
				},
				[308189] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ivalera-BurningLegion",
					["npcID"] = 0,
				},
				[31224] = {
					["source"] = "Stornó-Blackmoore",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[100780] = {
					["source"] = "Proteinz-Kazzak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[146739] = {
					["source"] = "Шурлок-Гром",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[290792] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Fällkên",
					["npcID"] = 0,
				},
				[48743] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Bèastmodè-TheMaelstrom",
					["npcID"] = 0,
				},
				[313310] = {
					["source"] = "Enriquillo-ArgentDawn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[304611] = {
					["source"] = "Neuroth",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[270836] = {
					["source"] = "Sevriss",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 136593,
				},
				[304612] = {
					["source"] = "Neuroth",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[201754] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "jasonburne",
					["npcID"] = 71529,
				},
				[47528] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bèastmodè-TheMaelstrom",
					["npcID"] = 0,
				},
				[115750] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bubbleoseven-Genjuros",
					["npcID"] = 0,
				},
				[105771] = {
					["source"] = "Ðàenerýs-Thrall",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[236298] = {
					["source"] = "Shathris-Blackmoore",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[8042] = {
					["source"] = "Nashwan-Blackrock",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[32216] = {
					["source"] = "Тормагеддон-СвежевательДуш",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[48168] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Matron Alesso",
					["npcID"] = 50163,
				},
				[279028] = {
					["source"] = "Enriquillo-ArgentDawn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[279029] = {
					["source"] = "Thunderfloof-Kazzak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[279541] = {
					["source"] = "Ihotu-Blackmoore",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[207386] = {
					["source"] = "Zailar-ArgentDawn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1022] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Palalord-Stormscale",
					["npcID"] = 0,
				},
				[197919] = {
					["source"] = "Skaru-Ysondre",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[188196] = {
					["source"] = "Nashwan-Blackrock",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[274426] = {
					["source"] = "Fäntom-Blackrock",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[108843] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Israckette-Archimonde",
					["npcID"] = 0,
				},
				[121253] = {
					["source"] = "Proteinz-Kazzak",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[288756] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Israckette-Archimonde",
					["npcID"] = 0,
				},
				[216343] = {
					["source"] = "Xtreame-Sylvanas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[49576] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bèastmodè-TheMaelstrom",
					["npcID"] = 0,
				},
				[1044] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Faallken",
					["npcID"] = 0,
				},
				[193315] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fi-BurningLegion",
					["npcID"] = 0,
				},
				[270335] = {
					["source"] = "Fàllkên",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[66] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Drummina-Draenor",
					["npcID"] = 0,
				},
				[193316] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "American-Draenor",
					["npcID"] = 0,
				},
				[2139] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Drummina-Draenor",
					["npcID"] = 0,
				},
				[194084] = {
					["source"] = "Thunderfloof-Kazzak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[63010] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Undercity Valiant",
					["npcID"] = 33384,
				},
				[209693] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mlord-Outland",
					["npcID"] = 0,
				},
				[55078] = {
					["source"] = "Dreaddreamer-SteamwheedleCartel",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[29722] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lîlgåÿløkßøï-Alonsus",
					["npcID"] = 0,
				},
				[199203] = {
					["source"] = "Shocktar-DunMorogh",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[43308] = {
					["source"] = "Worrlock-Terokkar",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[271877] = {
					["source"] = "Bugne-Blackrock",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[289277] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Adandir-Draenor",
					["npcID"] = 0,
				},
				[203554] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Draidun",
					["npcID"] = 0,
				},
				[270343] = {
					["source"] = "Fàllkên",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[279555] = {
					["source"] = "Spiritzu-Ragnaros",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1122] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lîlgåÿløkßøï-Alonsus",
					["npcID"] = 0,
				},
				[184364] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Funkyt-Turalyon",
					["npcID"] = 0,
				},
				[272903] = {
					["source"] = "Darthino",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[254474] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Soliki",
					["npcID"] = 0,
				},
				[193065] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Proita-Outland",
					["npcID"] = 0,
				},
				[81340] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bèastmodè-TheMaelstrom",
					["npcID"] = 0,
				},
				[77758] = {
					["source"] = "Ihotu-Blackmoore",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[280583] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Drummina-Draenor",
					["npcID"] = 0,
				},
				[1160] = {
					["source"] = "Murthàg-Hyjal",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[262161] = {
					["source"] = "Khurtz-Nemesis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[184367] = {
					["source"] = "Shocktar-DunMorogh",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[203814] = {
					["source"] = "Grommäsh",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[48107] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Drummina-Draenor",
					["npcID"] = 0,
				},
				[6795] = {
					["source"] = "Spiritzu-Ragnaros",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[2383] = {
					["source"] = "Ankaa-Elune",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[195627] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fi-BurningLegion",
					["npcID"] = 0,
				},
				[292359] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Trollmon-Zenedar",
					["npcID"] = 0,
				},
				[13730] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Frostpaw Warrior",
					["npcID"] = 26357,
				},
				[178740] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Grizzdh-Quel'Thalas",
					["npcID"] = 0,
				},
				[292360] = {
					["source"] = "Scrubnoob",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[259597] = {
					["source"] = "Child of Gonk",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 127254,
				},
				[85948] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bèastmodè-TheMaelstrom",
					["npcID"] = 0,
				},
				[254224] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fållken",
					["npcID"] = 0,
				},
				[292362] = {
					["type"] = "BUFF",
					["source"] = "Snaffly-Drak'thul",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[185394] = {
					["source"] = "Dákaar-TarrenMill",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[267799] = {
					["source"] = "Quantox-Frostwolf",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268311] = {
					["source"] = "Thunderfloof-Kazzak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[97463] = {
					["source"] = "Shocktar-DunMorogh",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[207400] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Tss-Shadowsong",
					["npcID"] = 0,
				},
				[292364] = {
					["type"] = "BUFF",
					["source"] = "Rinok-ShatteredHand",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[195630] = {
					["source"] = "Proteinz-Kazzak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[204330] = {
					["source"] = "Enriquillo-ArgentDawn",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[48108] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Drummina-Draenor",
					["npcID"] = 0,
				},
				[96312] = {
					["source"] = "Ankaa-Elune",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[119085] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mystchivous-Draenor",
					["npcID"] = 0,
				},
				[308742] = {
					["source"] = "Fallken",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[268314] = {
					["source"] = "Thunderfloof-Kazzak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[202028] = {
					["source"] = "Fäntom-Blackrock",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[194608] = {
					["source"] = "Контанго-Ясеневыйлес",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[236060] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fàllkén",
					["npcID"] = 0,
				},
				[228128] = {
					["source"] = "Shikitom",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[246807] = {
					["source"] = "Løki-MarécagedeZangar",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[108211] = {
					["source"] = "Kipix-Elune",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[77762] = {
					["source"] = "Enriquillo-ArgentDawn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[260881] = {
					["source"] = "Enriquillo-ArgentDawn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[33076] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dinzo-TarrenMill",
					["npcID"] = 0,
				},
				[208683] = {
					["source"] = "Stornó-Blackmoore",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[285719] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Gaps",
					["npcID"] = 0,
				},
				[275996] = {
					["source"] = "Ravenous Ranishu",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 139614,
				},
				[257044] = {
					["source"] = "Milljaris-Blackhand",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[197937] = {
					["source"] = "Ðice-Dragonblight",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[285720] = {
					["source"] = "Saxtorph-Kazzak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[208684] = {
					["source"] = "Olikéâ-KhazModan",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[285721] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kraftd-Draenor",
					["npcID"] = 0,
				},
				[2643] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Trollakläss-Hyjal",
					["npcID"] = 0,
				},
				[5308] = {
					["source"] = "Artan-Kel'Thuzad",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[1330] = {
					["source"] = "Kipix-Elune",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[58984] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Yurrei-Magtheridon",
					["npcID"] = 0,
				},
				[40625] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Yolandin-Nemesis",
					["npcID"] = 0,
				},
				[276000] = {
					["source"] = "Ravenous Ranishu",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 139614,
				},
				[294935] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Zarzia-Draenor",
					["npcID"] = 0,
				},
				[268836] = {
					["source"] = "Mystìk-Frostwolf",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[204336] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bubblewitch-KulTiras",
					["npcID"] = 0,
				},
				[108853] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Drummina-Draenor",
					["npcID"] = 0,
				},
				[14914] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Erinqa-BurningLegion",
					["npcID"] = 0,
				},
				[154953] = {
					["source"] = "Stornó-Blackmoore",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[107574] = {
					["source"] = "Murthàg-Hyjal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[269352] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Roltrap-Kazzak",
					["npcID"] = 0,
				},
				[155722] = {
					["source"] = "Fäntom-Blackrock",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[288800] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Drummina-Draenor",
					["npcID"] = 0,
				},
				[66251] = {
					["source"] = "Catapult",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 34793,
				},
				[215598] = {
					["source"] = "Sylmael",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[192058] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Roltrap-Kazzak",
					["npcID"] = 0,
				},
				[204596] = {
					["source"] = "Pascolarctos-BurningLegion",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[2823] = {
					["source"] = "Kipix-Elune",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[289315] = {
					["source"] = "Ihotu-Blackmoore",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[65868] = {
					["npcID"] = 34657,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Jaelyne Evensong",
					["encounterID"] = 2022,
				},
				[272940] = {
					["source"] = "Sø",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[33206] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Proita-Outland",
					["npcID"] = 0,
				},
				[160331] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Croa-Draenor",
					["npcID"] = 0,
				},
				[199736] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Konceal",
					["npcID"] = 0,
				},
				[289318] = {
					["source"] = "Imadrillan-ArgentDawn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[204598] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Grizzdh-Quel'Thalas",
					["npcID"] = 0,
				},
				[165961] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Obtains-Draenor",
					["npcID"] = 0,
				},
				[36213] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Greater Earth Elemental",
					["npcID"] = 95072,
				},
				[278574] = {
					["source"] = "Quantox-Frostwolf",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1464] = {
					["source"] = "Khurtz-Nemesis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[148563] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Blóðhildur-TarrenMill",
					["npcID"] = 0,
				},
				[206647] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Roltrap-Kazzak",
					["npcID"] = 0,
				},
				[268854] = {
					["source"] = "Vaelviøza-Nathrezim",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[47536] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Proita-Outland",
					["npcID"] = 0,
				},
				[1490] = {
					["source"] = "Erzã-Chantséternels",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2983] = {
					["source"] = "Vaelviøza-Nathrezim",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[190784] = {
					["source"] = "Matafaka-Norgannon",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[287790] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ifyouseekay-TarrenMill",
					["npcID"] = 0,
				},
				[268856] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Proita-Outland",
					["npcID"] = 0,
				},
				[273974] = {
					["source"] = "Класснаяя-СтражСмерти",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[287280] = {
					["source"] = "Annalamy-Sunstrider",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[264764] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[269882] = {
					["source"] = "7th Legion Marine",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 136014,
				},
				[115767] = {
					["source"] = "Murthàg-Hyjal",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[124211] = {
					["source"] = "Lucario-BurningBlade",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[69070] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Erinqa-BurningLegion",
					["npcID"] = 0,
				},
				[130736] = {
					["source"] = "Viscdk-Eredar",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[267325] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fi-BurningLegion",
					["npcID"] = 0,
				},
				[276025] = {
					["source"] = "Skaru-Ysondre",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[267326] = {
					["source"] = "Darthino",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[267327] = {
					["source"] = "Darthino",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[67280] = {
					["source"] = "High Commander Halford Wyrmbane",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 34924,
				},
				[267329] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fi-BurningLegion",
					["npcID"] = 0,
				},
				[267330] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fi-BurningLegion",
					["npcID"] = 0,
				},
				[212283] = {
					["source"] = "Skwìp-Elune",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[267331] = {
					["source"] = "Darthino",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[294966] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ahrwe-Draenor",
					["npcID"] = 0,
				},
				[101568] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bèastmodè-TheMaelstrom",
					["npcID"] = 0,
				},
				[59052] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fällkên",
					["npcID"] = 0,
				},
				[187464] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Proita-Outland",
					["npcID"] = 0,
				},
				[100] = {
					["source"] = "Ðàenerýs-Thrall",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[235313] = {
					["source"] = "Pinggwin-BurningLegion",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1604] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Child of Gonk",
					["npcID"] = 127254,
				},
				[293946] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nöllan",
					["npcID"] = 0,
				},
				[66514] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "North Sea Kraken",
					["npcID"] = 34925,
				},
				[276036] = {
					["source"] = "Ravenous Ranishu",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 139614,
				},
				[301624] = {
					["source"] = "Fållkên",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[66515] = {
					["type"] = "BUFF",
					["source"] = "Argent Confessor Paletress",
					["npcID"] = 34928,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2023,
				},
				[273481] = {
					["source"] = "Mystìk-Frostwolf",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[302651] = {
					["source"] = "Dadoe-Turalyon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272970] = {
					["source"] = "Эллотара-Галакронд",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[212800] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Demonsols-Doomhammer",
					["npcID"] = 0,
				},
				[268877] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Trollakläss-Hyjal",
					["npcID"] = 0,
				},
				[290371] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nodhunter-TarrenMill",
					["npcID"] = 0,
				},
				[185422] = {
					["source"] = "Skwìp-Elune",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[20707] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Anéan-Draenor",
					["npcID"] = 0,
				},
				[208963] = {
					["source"] = "Skyfury Totem",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 105427,
				},
				[296003] = {
					["source"] = "Calaisa-ArgentDawn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[6788] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Ketshup-Draenor",
					["npcID"] = 0,
				},
				[1706] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Xvdb-TarrenMill",
					["npcID"] = 0,
				},
				[60781] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Forgotten Depths Acolyte",
					["npcID"] = 30205,
				},
				[119611] = {
					["source"] = "Peanamon-Nethersturm",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[19236] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Proita-Outland",
					["npcID"] = 0,
				},
				[17253] = {
					["source"] = "MechaCat",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 139328,
				},
				[193357] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Imekr-Eredar",
					["npcID"] = 0,
				},
				[280654] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Drummina-Draenor",
					["npcID"] = 0,
				},
				[313918] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fàllkén",
					["npcID"] = 0,
				},
				[262232] = {
					["source"] = "Vinkudestryr-Al'Akir",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272979] = {
					["source"] = "Valdori-Draenor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[193358] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "American-Draenor",
					["npcID"] = 0,
				},
				[47540] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Proita-Outland",
					["npcID"] = 0,
				},
				[268887] = {
					["source"] = "Ankaa-Elune",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[275540] = {
					["source"] = "Khurtz-Nemesis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[193359] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Imekr-Eredar",
					["npcID"] = 0,
				},
				[297034] = {
					["source"] = "Pixisham-Draenor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[116670] = {
					["source"] = "Контанго-Ясеневыйлес",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[297035] = {
					["source"] = "Kelaria-Quel'Thalas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1766] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fallkenez",
					["npcID"] = 0,
				},
				[40120] = {
					["source"] = "Fallken",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[198222] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Fallkenez",
					["npcID"] = 0,
				},
				[280149] = {
					["source"] = "Smigledk",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297037] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1784] = {
					["source"] = "Oksana-Al'Akir",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[24450] = {
					["source"] = "Кыска",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 94149,
				},
				[203852] = {
					["source"] = "Punkfukanda",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[289362] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Roltrap-Kazzak",
					["npcID"] = 0,
				},
				[287827] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Erinqa-BurningLegion",
					["npcID"] = 0,
				},
				[297039] = {
					["source"] = "Fourdy-Bladefist",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268893] = {
					["source"] = "Stornó-Blackmoore",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[287828] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lîlgåÿløkßøï-Alonsus",
					["npcID"] = 0,
				},
				[86606] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Krolusk Sandhunter",
					["npcID"] = 135582,
				},
				[78674] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Torrid-Twilight'sHammer",
					["npcID"] = 0,
				},
				[288853] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bèastmodè-TheMaelstrom",
					["npcID"] = 0,
				},
				[5221] = {
					["source"] = "Fäntom-Blackrock",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[1822] = {
					["source"] = "Fäntom-Blackrock",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[16870] = {
					["source"] = "Ankaa-Elune",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[73685] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bubblewitch-KulTiras",
					["npcID"] = 0,
				},
				[62574] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Faallken",
					["npcID"] = 0,
				},
				[5277] = {
					["source"] = "Stornó-Blackmoore",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268898] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Krazhil-Rajaxx",
					["npcID"] = 0,
				},
				[44535] = {
					["source"] = "Fallken",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[113858] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Tylblul-Stormscale",
					["npcID"] = 0,
				},
				[1850] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Truepurr-Draenor",
					["npcID"] = 0,
				},
				[55090] = {
					["source"] = "Dábur-Blackrock",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[8679] = {
					["source"] = "Zedorogue-Hyjal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1856] = {
					["source"] = "Stornó-Blackmoore",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[205648] = {
					["source"] = "Thunderfloof-Kazzak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268903] = {
					["source"] = "Yersen-Drak'thul",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[268904] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Palalord-Stormscale",
					["npcID"] = 0,
				},
				[312915] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Xldone-Draenor",
					["npcID"] = 0,
				},
				[268905] = {
					["source"] = "Shoreks-Arygos",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[106951] = {
					["source"] = "Fäntom-Blackrock",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[48438] = {
					["source"] = "Ankaa-Elune",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[121536] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Angiru-Draenor",
					["npcID"] = 0,
				},
				[223306] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Palalord-Stormscale",
					["npcID"] = 0,
				},
				[192090] = {
					["source"] = "Ihotu-Blackmoore",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[206931] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Darkvandal-KhazModan",
					["npcID"] = 0,
				},
				[223819] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bubbleoseven-Genjuros",
					["npcID"] = 0,
				},
				[211793] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Fällkên",
					["npcID"] = 0,
				},
				[185438] = {
					["source"] = "Skwìp-Elune",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[66268] = {
					["source"] = "Amazone-Lightbringer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[152175] = {
					["source"] = "Контанго-Ясеневыйлес",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[122] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Drummina-Draenor",
					["npcID"] = 0,
				},
				[312411] = {
					["source"] = "Thunderfloof-Kazzak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[278124] = {
					["source"] = "Murthàg-Hyjal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[109128] = {
					["source"] = "Ðàenerýs-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1966] = {
					["source"] = "Vaelviøza-Nathrezim",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[62960] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Silvermoon Hawkstrider",
					["npcID"] = 33323,
				},
				[117828] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lîlgåÿløkßøï-Alonsus",
					["npcID"] = 0,
				},
				[317020] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Asappi-BurningLegion",
					["npcID"] = 0,
				},
				[134522] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Maykel",
					["npcID"] = 0,
				},
				[49143] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fällkên",
					["npcID"] = 0,
				},
				[53365] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bèastmodè-TheMaelstrom",
					["npcID"] = 0,
				},
				[281711] = {
					["source"] = "Diruh-Thrall",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[121411] = {
					["source"] = "Kazûtô-Blackhand",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280177] = {
					["source"] = "Pinggwin-BurningLegion",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[19750] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Styleye-TarrenMill",
					["npcID"] = 0,
				},
				[17735] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Hukgorg",
					["npcID"] = 1860,
				},
				[191840] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kîngpao-TarrenMill",
					["npcID"] = 0,
				},
				[214613] = {
					["source"] = "Silverback Thumpknuckle",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 130543,
				},
				[269944] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 136374,
				},
				[12054] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Frostpaw Warrior",
					["npcID"] = 26357,
				},
				[197214] = {
					["source"] = "Thunderfloof-Kazzak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[66271] = {
					["source"] = "Amazone-Lightbringer",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[292463] = {
					["source"] = "Diruh-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[263806] = {
					["source"] = "Purpleeve-Kazzak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[288882] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fushime-TarrenMill",
					["npcID"] = 0,
				},
				[284277] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Taicligh-Draenor",
					["npcID"] = 0,
				},
				[45242] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Proita-Outland",
					["npcID"] = 0,
				},
				[191587] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Bèastmodè-TheMaelstrom",
					["npcID"] = 0,
				},
				[316007] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Frisør-BurningLegion",
					["npcID"] = 0,
				},
				[279673] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lîlgåÿløkßøï-Alonsus",
					["npcID"] = 0,
				},
				[105421] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Bubbleoseven-Genjuros",
					["npcID"] = 0,
				},
				[278650] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Pylenbooger-Draenor",
					["npcID"] = 0,
				},
				[281209] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Jayceepee-Bloodhoof",
					["npcID"] = 0,
				},
				[281721] = {
					["source"] = "Erzã-Chantséternels",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[258883] = {
					["source"] = "Erzã-Chantséternels",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[12550] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Chief Rageclaw",
					["npcID"] = 29690,
				},
				[133] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fàllkén",
					["npcID"] = 0,
				},
				[316522] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bèastmodè-TheMaelstrom",
					["npcID"] = 0,
				},
				[109132] = {
					["source"] = "Remmii",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[281724] = {
					["source"] = "Borntorock-Thrall",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2152] = {
					["source"] = "Mixak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[221527] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mlord-Outland",
					["npcID"] = 0,
				},
				[286331] = {
					["source"] = "Fällkèn",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[114250] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Junboib-Draenor",
					["npcID"] = 0,
				},
				[8680] = {
					["source"] = "Txærøkï-Blackmoore",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[292473] = {
					["source"] = "Zailar-ArgentDawn",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[215387] = {
					["source"] = "Sylmael",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[106830] = {
					["source"] = "Maryl-Arygos",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[278145] = {
					["source"] = "Annalamy-Sunstrider",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[212061] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 129276,
				},
				[216411] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Palalord-Stormscale",
					["npcID"] = 0,
				},
				[139] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dinzo-TarrenMill",
					["npcID"] = 0,
				},
				[8936] = {
					["source"] = "Ankaa-Elune",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[108366] = {
					["source"] = "Worrlock-Terokkar",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[216413] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Faallken",
					["npcID"] = 0,
				},
				[9080] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Conquest Hold Skirmisher",
					["npcID"] = 27456,
				},
				[34433] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Proita-Outland",
					["npcID"] = 0,
				},
				[55095] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Fällkên",
					["npcID"] = 0,
				},
				[192106] = {
					["source"] = "Pixisham-Draenor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268429] = {
					["source"] = "Thunderfloof-Kazzak",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[90328] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 121571,
				},
				[217694] = {
					["source"] = "Latexpaula-Thrall",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[179057] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Demonsols-Doomhammer",
					["npcID"] = 0,
				},
				[257099] = {
					["source"] = "Bloodemon",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[35201] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Carrion Fleshstripper",
					["npcID"] = 30206,
				},
				[286342] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Israckette-Archimonde",
					["npcID"] = 0,
				},
				[280713] = {
					["source"] = "Proteinz-Kazzak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[105809] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Palalord-Stormscale",
					["npcID"] = 0,
				},
				[270479] = {
					["source"] = "Sevriss",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 136593,
				},
				[247121] = {
					["source"] = "Shoreks-Arygos",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[6789] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lîlgåÿløkßøï-Alonsus",
					["npcID"] = 0,
				},
				[213602] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Erinqa-BurningLegion",
					["npcID"] = 0,
				},
				[280205] = {
					["source"] = "Enriquillo-ArgentDawn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[13750] = {
					["source"] = "Oksana-Al'Akir",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[126664] = {
					["source"] = "Ðàenerýs-Thrall",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[190319] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Drummina-Draenor",
					["npcID"] = 0,
				},
				[280719] = {
					["source"] = "Skwìp-Elune",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[45181] = {
					["source"] = "Stornó-Blackmoore",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[195181] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Darkvandal-KhazModan",
					["npcID"] = 0,
				},
				[51514] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Krazhil-Rajaxx",
					["npcID"] = 0,
				},
				[202090] = {
					["source"] = "Kanpaldi-Blutkessel",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[281744] = {
					["source"] = "Paperbroom-Ragnaros",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[202602] = {
					["source"] = "Hjbjz-TarrenMill",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[155777] = {
					["source"] = "Ankaa-Elune",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[294027] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Palalord-Stormscale",
					["npcID"] = 0,
				},
				[2484] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Roltrap-Kazzak",
					["npcID"] = 0,
				},
				[114255] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dinzo-TarrenMill",
					["npcID"] = 0,
				},
				[279187] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bubblewitch-KulTiras",
					["npcID"] = 0,
				},
				[213652] = {
					["source"] = "Caldrith-BurningLegion",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[199545] = {
					["type"] = "BUFF",
					["source"] = "Caldrith-BurningLegion",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[196718] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mlord-Outland",
					["npcID"] = 0,
				},
				[268953] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Roltrap-Kazzak",
					["npcID"] = 0,
				},
				[197548] = {
					["type"] = "BUFF",
					["source"] = "Kèryon-Sargeras",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[115151] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lovebuny-Draenor",
					["npcID"] = 0,
				},
				[208769] = {
					["type"] = "BUFF",
					["source"] = "Pascolarctos-BurningLegion",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268954] = {
					["source"] = "Stornó-Blackmoore",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[261711] = {
					["source"] = "Krolusk Dunecrawler",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 124654,
				},
				[16953] = {
					["source"] = "Fäntom-Blackrock",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[270332] = {
					["source"] = "Fàllkên",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268955] = {
					["source"] = "Enriquillo-ArgentDawn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[118455] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Trollakläss-Hyjal",
					["npcID"] = 0,
				},
				[259387] = {
					["source"] = "Fàllkên",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[54861] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Yolandin-Nemesis",
					["npcID"] = 0,
				},
				[98008] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Roltrap-Kazzak",
					["npcID"] = 0,
				},
				[113656] = {
					["source"] = "Контанго-Ясеневыйлес",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[259277] = {
					["source"] = "tvojtatko",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 34640,
				},
				[278931] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lîlgåÿløkßøï-Alonsus",
					["npcID"] = 0,
				},
				[299662] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Deathblade-TarrenMill",
					["npcID"] = 0,
				},
				[300174] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Palalord-Stormscale",
					["npcID"] = 0,
				},
				[80353] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fàllkén",
					["npcID"] = 0,
				},
				[264352] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rawrecksde-TarrenMill",
					["npcID"] = 0,
				},
				[281240] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Zmatureeno",
					["npcID"] = 0,
				},
				[259491] = {
					["source"] = "Fàllkên",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[66536] = {
					["npcID"] = 34928,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Argent Confessor Paletress",
					["encounterID"] = 2023,
				},
				[35395] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Palalord-Stormscale",
					["npcID"] = 0,
				},
				[299664] = {
					["source"] = "Fallken",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[273977] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Darkvandal-KhazModan",
					["npcID"] = 0,
				},
				[276124] = {
					["source"] = "Slyziwr-Kazzak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[270339] = {
					["source"] = "Fàllkên",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[64373] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Faallken",
					["npcID"] = 0,
				},
				[5246] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Orcboi-Lightbringer",
					["npcID"] = 0,
				},
				[317065] = {
					["source"] = "Kéran-ShatteredHalls",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[207289] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bèastmodè-TheMaelstrom",
					["npcID"] = 0,
				},
				[274742] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bèastmodè-TheMaelstrom",
					["npcID"] = 0,
				},
				[213610] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Erinqa-BurningLegion",
					["npcID"] = 0,
				},
				[80354] = {
					["source"] = "Fallken",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297108] = {
					["source"] = "Tordrei-Azshara",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[80610] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fisherman Haito",
					["npcID"] = 59584,
				},
				[279709] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Torrid-Twilight'sHammer",
					["npcID"] = 0,
				},
				[300691] = {
					["source"] = "Mystìk-Frostwolf",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[113746] = {
					["source"] = "Kalysto-Blackrock",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[209261] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Managodx-Draenor",
					["npcID"] = 0,
				},
				[56222] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Darkvandal-KhazModan",
					["npcID"] = 0,
				},
				[52174] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Soclean-ShatteredHand",
					["npcID"] = 0,
				},
				[173183] = {
					["source"] = "Hiawata-Blackrock",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[265888] = {
					["source"] = "Fàllkên",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[194509] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fållken",
					["npcID"] = 0,
				},
				[300693] = {
					["source"] = "Enriquillo-ArgentDawn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280735] = {
					["source"] = "Shocktar-DunMorogh",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[185562] = {
					["source"] = "Srslyno",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[181842] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Tylovanus-Drak'thul",
					["npcID"] = 0,
				},
				[279194] = {
					["source"] = "Тормагеддон-СвежевательДуш",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[53563] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Palalord-Stormscale",
					["npcID"] = 0,
				},
				[289523] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fållken",
					["npcID"] = 0,
				},
				[216890] = {
					["source"] = "Méreqt-BurningBlade",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[316703] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Croa-Draenor",
					["npcID"] = 0,
				},
				[48018] = {
					["source"] = "Ellocko-Darkspear",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[204255] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Grizzdh-Quel'Thalas",
					["npcID"] = 0,
				},
				[31884] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Palalord-Stormscale",
					["npcID"] = 0,
				},
				[138130] = {
					["source"] = "Earth Spirit",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 69792,
				},
				[8921] = {
					["source"] = "Borntorock-Thrall",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[132168] = {
					["source"] = "Тормагеддон-СвежевательДуш",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[279715] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ugaris-Draenor",
					["npcID"] = 0,
				},
				[370] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Roltrap-Kazzak",
					["npcID"] = 0,
				},
				[17962] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lîlgåÿløkßøï-Alonsus",
					["npcID"] = 0,
				},
				[137619] = {
					["source"] = "Nàrutò-Thrall",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[63560] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bèastmodè-TheMaelstrom",
					["npcID"] = 0,
				},
				[307128] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Vividbrew-Draenor",
					["npcID"] = 0,
				},
				[272986] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Grizzdh-Quel'Thalas",
					["npcID"] = 0,
				},
				[256607] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Atal'Shadra Bloodletter",
					["npcID"] = 122872,
				},
				[195182] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Darkvandal-KhazModan",
					["npcID"] = 0,
				},
				[280615] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bubblewitch-KulTiras",
					["npcID"] = 0,
				},
				[297117] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Keltozene-Bloodhoof",
					["npcID"] = 0,
				},
				[272723] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Khatmorg-Draenor",
					["npcID"] = 0,
				},
				[24423] = {
					["source"] = "tvojtatko",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 34640,
				},
				[203720] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Grizzdh-Quel'Thalas",
					["npcID"] = 0,
				},
				[297118] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Gázbon-Draenor",
					["npcID"] = 0,
				},
				[199721] = {
					["source"] = "Dábur-Blackrock",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268439] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rhux",
					["npcID"] = 0,
				},
				[123904] = {
					["source"] = "Контанго-Ясеневыйлес",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[22568] = {
					["source"] = "Fäntom-Blackrock",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[12294] = {
					["source"] = "Ðàenerýs-Thrall",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[260643] = {
					["source"] = "Mërkåh-Hyjal",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[43265] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bèastmodè-TheMaelstrom",
					["npcID"] = 0,
				},
				[236645] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Drummina-Draenor",
					["npcID"] = 0,
				},
				[1776] = {
					["source"] = "Bugne-Blackrock",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[204021] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Grizzdh-Quel'Thalas",
					["npcID"] = 0,
				},
				[84963] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Boguspala-TarrenMill",
					["npcID"] = 0,
				},
				[289324] = {
					["source"] = "Remmii",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[228287] = {
					["source"] = "Контанго-Ясеневыйлес",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[79206] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bubblewitch-KulTiras",
					["npcID"] = 0,
				},
				[59942] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Scourge Banner-Bearer",
					["npcID"] = 31900,
				},
				[280746] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Pohrosim",
					["npcID"] = 0,
				},
				[185123] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mlord-Outland",
					["npcID"] = 0,
				},
				[77575] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bèastmodè-TheMaelstrom",
					["npcID"] = 0,
				},
				[272987] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Grizzdh-Quel'Thalas",
					["npcID"] = 0,
				},
				[217200] = {
					["source"] = "Olikéâ-KhazModan",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[5782] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lîlgåÿløkßøï-Alonsus",
					["npcID"] = 0,
				},
				[315161] = {
					["source"] = "Stornó-Blackmoore",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[258908] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sethrak Invader",
					["npcID"] = 130411,
				},
				[204157] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Grizzdh-Quel'Thalas",
					["npcID"] = 0,
				},
				[326419] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Blóðhildur-TarrenMill",
					["npcID"] = 0,
				},
				[67761] = {
					["type"] = "BUFF",
					["source"] = "The Black Knight",
					["npcID"] = 35451,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2021,
				},
				[313113] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fallkenez",
					["npcID"] = 0,
				},
				[196414] = {
					["source"] = "Slyziwr-Kazzak",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[232893] = {
					["source"] = "Shoreks-Arygos",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[46968] = {
					["source"] = "Тормагеддон-СвежевательДуш",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[5672] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Healing Stream Totem",
					["npcID"] = 3527,
				},
				[297126] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Vividbrew-Draenor",
					["npcID"] = 0,
				},
				[20243] = {
					["source"] = "Тормагеддон-СвежевательДуш",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[3019] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kvaldir Berserker",
					["npcID"] = 34947,
				},
				[2948] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Drummina-Draenor",
					["npcID"] = 0,
				},
				[260249] = {
					["source"] = "Fàllkên",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[266030] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lîlgåÿløkßøï-Alonsus",
					["npcID"] = 0,
				},
				[287916] = {
					["source"] = "Cyanidè",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[210294] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Palalord-Stormscale",
					["npcID"] = 0,
				},
				[34942] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Argent Priestess",
					["npcID"] = 35307,
				},
				[57723] = {
					["source"] = "Kármä-TarrenMill",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297040] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Glorytroll-Draenor",
					["npcID"] = 0,
				},
				[62575] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Silvermoon Hawkstrider",
					["npcID"] = 33323,
				},
				[196733] = {
					["source"] = "Proteinz-Kazzak",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[66798] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "The Black Knight",
					["npcID"] = 35451,
				},
				[191837] = {
					["source"] = "Fàllkèn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[72968] = {
					["source"] = "Xtreame-Sylvanas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[199804] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fi-BurningLegion",
					["npcID"] = 0,
				},
				[198013] = {
					["source"] = "Shoreks-Arygos",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[12024] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Redfang Hunter",
					["npcID"] = 26356,
				},
				[188290] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bèastmodè-TheMaelstrom",
					["npcID"] = 0,
				},
				[205351] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Jahvene-Stormreaver",
					["npcID"] = 0,
				},
				[194384] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Proita-Outland",
					["npcID"] = 0,
				},
				[261396] = {
					["source"] = "Daiqquiri",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[300714] = {
					["source"] = "Kazûtô-Blackhand",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[202164] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Soclean-ShatteredHand",
					["npcID"] = 0,
				},
				[270022] = {
					["source"] = "Silverback Thumpknuckle",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 130543,
				},
				[277187] = {
					["source"] = "Ankaa-Elune",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[199373] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Army of the Dead",
					["npcID"] = 24207,
				},
				[17174] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Wavecrest Mariner",
					["npcID"] = 35098,
				},
				[85222] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Faallken",
					["npcID"] = 0,
				},
				[81256] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Darkvandal-KhazModan",
					["npcID"] = 0,
				},
				[38557] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Kvaldir Berserker",
					["npcID"] = 34947,
				},
				[61578] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Converted Hero",
					["npcID"] = 32255,
				},
				[107428] = {
					["source"] = "Kanpaldi-Blutkessel",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[285472] = {
					["source"] = "Viscdk-Eredar",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[276126] = {
					["source"] = "Slyziwr-Kazzak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[233582] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Lîlgåÿløkßøï-Alonsus",
					["npcID"] = 0,
				},
				[67823] = {
					["npcID"] = 35451,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "The Black Knight",
					["encounterID"] = 2021,
				},
				[232698] = {
					["source"] = "Fourdy-Bladefist",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[276154] = {
					["source"] = "Самбоженька-Дракономор",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[232559] = {
					["source"] = "Ankaa-Elune",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[57724] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Lëifi-Twilight'sHammer",
					["npcID"] = 0,
				},
				[288803] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Drummina-Draenor",
					["npcID"] = 0,
				},
				[100784] = {
					["source"] = "Kanpaldi-Blutkessel",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[68719] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[279033] = {
					["source"] = "Enriquillo-ArgentDawn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[12472] = {
					["source"] = "Teszla-ArgentDawn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[258920] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Symadh-Draenor",
					["npcID"] = 0,
				},
				[41425] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Israckette-Archimonde",
					["npcID"] = 0,
				},
				[6262] = {
					["source"] = "Stornó-Blackmoore",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[241260] = {
					["source"] = "Hehkate-Anachronos",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[51124] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fällkên",
					["npcID"] = 0,
				},
				[29893] = {
					["source"] = "Ellocko-Darkspear",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[277181] = {
					["source"] = "Vaelviøza-Nathrezim",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[274598] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Drummina-Draenor",
					["npcID"] = 0,
				},
				[286393] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bubbleoseven-Genjuros",
					["npcID"] = 0,
				},
				[267558] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Numbull-Draenor",
					["npcID"] = 0,
				},
				[185736] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Holadín-Draenor",
					["npcID"] = 0,
				},
				[207640] = {
					["source"] = "Zailar-ArgentDawn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[303380] = {
					["source"] = "Skwìp-Elune",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[65081] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Proita-Outland",
					["npcID"] = 0,
				},
				[261947] = {
					["source"] = "Контанго-Ясеневыйлес",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[162794] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mlord-Outland",
					["npcID"] = 0,
				},
				[280200] = {
					["source"] = "Stornó-Blackmoore",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[300142] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Israckette-Archimonde",
					["npcID"] = 0,
				},
				[262652] = {
					["source"] = "Thunderfloof-Kazzak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[164547] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Torrid-Twilight'sHammer",
					["npcID"] = 0,
				},
				[118000] = {
					["source"] = "Shocktar-DunMorogh",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[59752] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lîlgåÿløkßøï-Alonsus",
					["npcID"] = 0,
				},
				[289467] = {
					["source"] = "Stornó-Blackmoore",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[274420] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lîlgåÿløkßøï-Alonsus",
					["npcID"] = 0,
				},
				[285978] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 0,
				},
				[252216] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Neksi-Draenor",
					["npcID"] = 0,
				},
				[271045] = {
					["source"] = "Fàllkên",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[115546] = {
					["source"] = "Proteinz-Kazzak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[66546] = {
					["npcID"] = 34928,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Argent Confessor Paletress",
					["encounterID"] = 2023,
				},
				[196741] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Skritekx",
					["npcID"] = 0,
				},
				[23881] = {
					["source"] = "Shocktar-DunMorogh",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[293142] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Tylblul-Stormscale",
					["npcID"] = 0,
				},
				[302775] = {
					["source"] = "Shianata-BurningLegion",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[319241] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Demonsols-Doomhammer",
					["npcID"] = 0,
				},
				[271896] = {
					["source"] = "Bugne-Blackrock",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[271559] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Darkvandal-KhazModan",
					["npcID"] = 0,
				},
				[198533] = {
					["source"] = "Jade Serpent Statue",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 60849,
				},
				[196742] = {
					["source"] = "Контанго-Ясеневыйлес",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[79892] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Farseer Lopaa",
					["npcID"] = 50174,
				},
				[268956] = {
					["source"] = "Skwìp-Elune",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[203651] = {
					["source"] = "Ankaa-Elune",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[288343] = {
					["source"] = "Ðice-Dragonblight",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[271049] = {
					["source"] = "Fàllkên",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[285976] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Shilmerinn-Draenor",
					["npcID"] = 0,
				},
				[66547] = {
					["npcID"] = 34928,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Argent Confessor Paletress",
					["encounterID"] = 2023,
				},
				[318216] = {
					["source"] = "Malendra-TwistingNether",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[132157] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Erinqa-BurningLegion",
					["npcID"] = 0,
				},
				[277703] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Mageeka-Lightbringer",
					["npcID"] = 0,
				},
				[32645] = {
					["source"] = "Stornó-Blackmoore",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[124503] = {
					["source"] = "Proteinz-Kazzak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[294926] = {
					["source"] = "Тормагеддон-СвежевательДуш",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[255595] = {
					["source"] = "Krolusk Sandhunter",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 135582,
				},
				[60103] = {
					["source"] = "Thunderfloof-Kazzak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[163201] = {
					["source"] = "Khurtz-Nemesis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[116189] = {
					["source"] = "Proteinz-Kazzak",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[214621] = {
					["source"] = "Dogor-Tichondrius",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[292363] = {
					["source"] = "Monsheri-TarrenMill",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280776] = {
					["source"] = "Shocktar-DunMorogh",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[314040] = {
					["source"] = "Jilliy-Eredar",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[277706] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lîlgåÿløkßøï-Alonsus",
					["npcID"] = 0,
				},
				[186254] = {
					["source"] = "Hehkate-Anachronos",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[115804] = {
					["source"] = "Tordrei-Azshara",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[278379] = {
					["source"] = "Âtreus-Blackmoore",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[26297] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Roltrap-Kazzak",
					["npcID"] = 0,
				},
				[319237] = {
					["source"] = "Rymè-Draenor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[298703] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Blackcowmoo-Draenor",
					["npcID"] = 0,
				},
				[85739] = {
					["source"] = "Méreqt-BurningBlade",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[94028] = {
					["source"] = "Fallken",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[208772] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Proita-Outland",
					["npcID"] = 0,
				},
				[198793] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Vonskurkx-TarrenMill",
					["npcID"] = 0,
				},
				[137639] = {
					["source"] = "Контанго-Ясеневыйлес",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[3408] = {
					["source"] = "Zedorogue-Hyjal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[190411] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Numbull-Draenor",
					["npcID"] = 0,
				},
				[269239] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kalhyx-Twilight'sHammer",
					["npcID"] = 0,
				},
				[68720] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[299789] = {
					["source"] = "Spiritzu-Ragnaros",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[118699] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Lîlgåÿløkßøï-Alonsus",
					["npcID"] = 0,
				},
				[48707] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bèastmodè-TheMaelstrom",
					["npcID"] = 0,
				},
				[197003] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fallkenez",
					["npcID"] = 0,
				},
				[81262] = {
					["source"] = "Efflorescence",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 47649,
				},
				[258925] = {
					["source"] = "Dancewithme-Teldrassil",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1680] = {
					["source"] = "Khurtz-Nemesis",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[197862] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Proita-Outland",
					["npcID"] = 0,
				},
				[35361] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Grove Walker",
					["npcID"] = 31228,
				},
				[96231] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bubbleoseven-Genjuros",
					["npcID"] = 0,
				},
				[278736] = {
					["source"] = "Kelaria-Quel'Thalas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[184662] = {
					["source"] = "Darthino",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[205448] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Jahvene-Stormreaver",
					["npcID"] = 0,
				},
				[186258] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Misiekhuj-BurningLegion",
					["npcID"] = 0,
				},
				[228477] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Grizzdh-Quel'Thalas",
					["npcID"] = 0,
				},
				[188499] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mlord-Outland",
					["npcID"] = 0,
				},
				[215607] = {
					["source"] = "Sylmael",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[66550] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[287825] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Erinqa-BurningLegion",
					["npcID"] = 0,
				},
				[225921] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Grizzdh-Quel'Thalas",
					["npcID"] = 0,
				},
				[296138] = {
					["source"] = "Vuuja-BurningLegion",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[242551] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Yakyakyak-TarrenMill",
					["npcID"] = 0,
				},
				[124506] = {
					["source"] = "Proteinz-Kazzak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[63661] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Silvermoon Hawkstrider",
					["npcID"] = 33323,
				},
				[287504] = {
					["source"] = "Контанго-Ясеневыйлес",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[36554] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fallkenez",
					["npcID"] = 0,
				},
				[280787] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Proita-Outland",
					["npcID"] = 0,
				},
				[247677] = {
					["source"] = "Indomita-Pozzodell'Eternità",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[80240] = {
					["source"] = "Ramthas-TwistingNether",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[65147] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Orgrimmar Valiant",
					["npcID"] = 33306,
				},
				[280788] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Proita-Outland",
					["npcID"] = 0,
				},
				[152108] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Tylblul-Stormscale",
					["npcID"] = 0,
				},
				[123986] = {
					["source"] = "Áshia-Draenor",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[202636] = {
					["source"] = "Fallken",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[288977] = {
					["source"] = "Dábur-Blackrock",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[117679] = {
					["source"] = "Ankaa-Elune",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[275672] = {
					["source"] = "Artan-Kel'Thuzad",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[278231] = {
					["source"] = "Âtreus-Blackmoore",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[191634] = {
					["source"] = "Enriquillo-ArgentDawn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[49028] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Darkvandal-KhazModan",
					["npcID"] = 0,
				},
				[66680] = {
					["type"] = "BUFF",
					["source"] = "Argent Confessor Paletress",
					["npcID"] = 34928,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2023,
				},
				[275895] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Torrid-Twilight'sHammer",
					["npcID"] = 0,
				},
				[8219] = {
					["source"] = "Skwìp-Elune",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[224189] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kyimi-BurningLegion",
					["npcID"] = 0,
				},
				[3600] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Earthbind Totem",
					["npcID"] = 2630,
				},
				[302797] = {
					["source"] = "Fàllkèn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297168] = {
					["source"] = "Stornó-Blackmoore",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[117952] = {
					["source"] = "Áshia-Draenor",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[157348] = {
					["source"] = "Primal Storm Elemental",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 77942,
				},
				[300751] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Nöllan",
					["npcID"] = 0,
				},
				[288981] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fållken",
					["npcID"] = 0,
				},
				[57984] = {
					["source"] = "Greater Fire Elemental",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 95061,
				},
				[5215] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Truepurr-Draenor",
					["npcID"] = 0,
				},
				[248622] = {
					["source"] = "Fällkèn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[115008] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mystchivous-Draenor",
					["npcID"] = 0,
				},
				[271071] = {
					["source"] = "Ankaa-Elune",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[277724] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Imekr-Eredar",
					["npcID"] = 0,
				},
				[186263] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Proita-Outland",
					["npcID"] = 0,
				},
				[47788] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Erinqa-BurningLegion",
					["npcID"] = 0,
				},
				[235903] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mlord-Outland",
					["npcID"] = 0,
				},
				[203407] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Draidun",
					["npcID"] = 0,
				},
				[121557] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Angiru-Draenor",
					["npcID"] = 0,
				},
				[264420] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Obrubník-BurningBlade",
					["npcID"] = 0,
				},
				[51505] = {
					["source"] = "Enriquillo-ArgentDawn",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[138927] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rasta-Dentarg",
					["npcID"] = 0,
				},
				[87023] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Israckette-Archimonde",
					["npcID"] = 0,
				},
				[298343] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kirimox-Draenor",
					["npcID"] = 0,
				},
				[59008] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sinewy Wolf",
					["npcID"] = 31233,
				},
				[298197] = {
					["source"] = "Spiritzu-Ragnaros",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280286] = {
					["source"] = "Mystìk-Frostwolf",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[304851] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[297162] = {
					["source"] = "Stornó-Blackmoore",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[108446] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Unknown",
					["npcID"] = 17252,
				},
				[3716] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Hukgorg",
					["npcID"] = 1860,
				},
				[277185] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mlord-Outland",
					["npcID"] = 0,
				},
				[317420] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Gázbon-Draenor",
					["npcID"] = 0,
				},
				[295248] = {
					["source"] = "Enriquillo-ArgentDawn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[51460] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bèastmodè-TheMaelstrom",
					["npcID"] = 0,
				},
				[288988] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fi-BurningLegion",
					["npcID"] = 0,
				},
				[185313] = {
					["source"] = "Skwìp-Elune",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[67452] = {
					["source"] = "Keep Cannon",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 34944,
				},
				[87024] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Meagekng-Stormscale",
					["npcID"] = 0,
				},
				[264761] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Frostforest-Draenor",
					["npcID"] = 0,
				},
				[120032] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[277731] = {
					["source"] = "Vaelviøza-Nathrezim",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[275544] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Proita-Outland",
					["npcID"] = 0,
				},
				[5487] = {
					["source"] = "Ankaa-Elune",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[69369] = {
					["source"] = "Fäntom-Blackrock",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[188501] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mlord-Outland",
					["npcID"] = 0,
				},
				[300761] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Erinqa-BurningLegion",
					["npcID"] = 0,
				},
				[201846] = {
					["source"] = "Thunderfloof-Kazzak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[292361] = {
					["source"] = "Inflextion-Draenor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[300802] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fallkenez",
					["npcID"] = 0,
				},
				[43681] = {
					["source"] = "Fallken",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[74589] = {
					["source"] = "Dalrymple",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[210320] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[264760] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Raggyroo-Draenor",
					["npcID"] = 0,
				},
				[270058] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Choyungfat-Al'Akir",
					["npcID"] = 0,
				},
				[66042] = {
					["npcID"] = 34702,
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Ambrose Boltspark",
					["encounterID"] = 2022,
				},
				[286835] = {
					["source"] = "Viscdk-Eredar",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[192081] = {
					["source"] = "Spiritzu-Ragnaros",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[185245] = {
					["source"] = "Pascolarctos-BurningLegion",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[196941] = {
					["source"] = "Valdori-Draenor",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[110310] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Bubblewitch-KulTiras",
					["npcID"] = 0,
				},
				[275689] = {
					["source"] = "Artan-Kel'Thuzad",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[268899] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Krazhil-Rajaxx",
					["npcID"] = 0,
				},
				[260734] = {
					["source"] = "Nashwan-Blackrock",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[212704] = {
					["source"] = "Hehkate-Anachronos",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[209746] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Torrid-Twilight'sHammer",
					["npcID"] = 0,
				},
				[324851] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Eeveescerate-Draenor",
					["npcID"] = 0,
				},
				[154797] = {
					["source"] = "Zedorogue-Hyjal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[16591] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Nielus",
					["npcID"] = 0,
				},
				[2818] = {
					["source"] = "Kipix-Elune",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[15496] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Conquest Hold Skirmisher",
					["npcID"] = 27456,
				},
				[210126] = {
					["source"] = "Yasmine-Turalyon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[81141] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Darkvandal-KhazModan",
					["npcID"] = 0,
				},
				[123725] = {
					["source"] = "Proteinz-Kazzak",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[184575] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Junboib-Draenor",
					["npcID"] = 0,
				},
				[275175] = {
					["source"] = "Dunegorger Kraulok",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 138794,
				},
				[114014] = {
					["source"] = "Skwìp-Elune",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[54212] = {
					["source"] = "Bambams-Bronzebeard",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[112042] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 1860,
				},
				[270576] = {
					["source"] = "Ankaa-Elune",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[227723] = {
					["source"] = "Yasmine-Turalyon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[19574] = {
					["source"] = "Hehkate-Anachronos",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[231895] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Junboib-Draenor",
					["npcID"] = 0,
				},
				[19505] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Shaafum",
					["npcID"] = 417,
				},
				[281178] = {
					["source"] = "Mystìk-Frostwolf",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[298700] = {
					["source"] = "Pathogen-BurningBlade",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[47541] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bèastmodè-TheMaelstrom",
					["npcID"] = 0,
				},
				[116014] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Doegrinder-Draenor",
					["npcID"] = 0,
				},
				[303211] = {
					["source"] = "Foxyna-BurningBlade",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[302307] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fallkenez",
					["npcID"] = 0,
				},
				[206803] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Demonsols-Doomhammer",
					["npcID"] = 0,
				},
				[188838] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bubblewitch-KulTiras",
					["npcID"] = 0,
				},
				[275194] = {
					["source"] = "Dunegorger Kraulok",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 138794,
				},
				[81782] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[196770] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fällkên",
					["npcID"] = 0,
				},
				[48265] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bèastmodè-TheMaelstrom",
					["npcID"] = 0,
				},
				[313948] = {
					["source"] = "Jilliy-Eredar",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[65918] = {
					["type"] = "BUFF",
					["source"] = "Ambrose Boltspark's Mount",
					["npcID"] = 35633,
					["event"] = "SPELL_AURA_APPLIED",
					["encounterID"] = 2022,
				},
				[257413] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kelrosh-Dethecus",
					["npcID"] = 0,
				},
				[25771] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Palalord-Stormscale",
					["npcID"] = 0,
				},
				[259454] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Hellslol-Vashj",
					["npcID"] = 0,
				},
				[275699] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bèastmodè-TheMaelstrom",
					["npcID"] = 0,
				},
				[270070] = {
					["source"] = "Kipix-Elune",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[280817] = {
					["source"] = "Artan-Kel'Thuzad",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[275200] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dunegorger Kraulok",
					["npcID"] = 138794,
				},
				[197277] = {
					["source"] = "Бараборка-ТкачСмерти",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[1079] = {
					["source"] = "Fäntom-Blackrock",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[122470] = {
					["source"] = "Контанго-Ясеневыйлес",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[54149] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Palalord-Stormscale",
					["npcID"] = 0,
				},
				[281854] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mlord-Outland",
					["npcID"] = 0,
				},
				[197561] = {
					["source"] = "Valdori-Draenor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[198813] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Mlord-Outland",
					["npcID"] = 0,
				},
				[279810] = {
					["source"] = "Hehkate-Anachronos",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[281843] = {
					["source"] = "Ankaa-Elune",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[115175] = {
					["source"] = "Kalysto-Blackrock",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[213405] = {
					["source"] = "Nurgîel-BurningLegion",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[202140] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Grizzdh-Quel'Thalas",
					["npcID"] = 0,
				},
				[245686] = {
					["source"] = "Hehkate-Anachronos",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272121] = {
					["source"] = "Visryn-Magtheridon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[61295] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bubblewitch-KulTiras",
					["npcID"] = 0,
				},
				[279584] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Sutteplegend-TarrenMill",
					["npcID"] = 0,
				},
				[45438] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Israckette-Archimonde",
					["npcID"] = 0,
				},
				[258945] = {
					["source"] = "Sethrak Relic Hunter",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 127406,
				},
				[276046] = {
					["source"] = "Dunegorger Kraulok",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 138794,
				},
				[257410] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Choyungfat-Al'Akir",
					["npcID"] = 0,
				},
				[34767] = {
					["source"] = "Ellestia-BurningBlade",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[270661] = {
					["source"] = "Hehkate-Anachronos",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[51271] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fällkên",
					["npcID"] = 0,
				},
				[246152] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Trollakläss-Hyjal",
					["npcID"] = 0,
				},
				[212552] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Gázbon-Draenor",
					["npcID"] = 0,
				},
				[210657] = {
					["source"] = "Nashwan-Blackrock",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[259388] = {
					["source"] = "Жукан-СвежевательДуш",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[289524] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fållken",
					["npcID"] = 0,
				},
				[211881] = {
					["source"] = "Shoreks-Arygos",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[194153] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Torrid-Twilight'sHammer",
					["npcID"] = 0,
				},
				[119910] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lîlgåÿløkßøï-Alonsus",
					["npcID"] = 0,
				},
				[164273] = {
					["source"] = "Amazone-Lightbringer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[193641] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Yurrei-Magtheridon",
					["npcID"] = 0,
				},
				[272126] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lufanos-Doomhammer",
					["npcID"] = 0,
				},
				[13877] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fi-BurningLegion",
					["npcID"] = 0,
				},
				[199754] = {
					["source"] = "Oksana-Al'Akir",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[211805] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fällkên",
					["npcID"] = 0,
				},
				[93622] = {
					["source"] = "Ihotu-Blackmoore",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[303344] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lîlgåÿløkßøï-Alonsus",
					["npcID"] = 0,
				},
				[129250] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Proita-Outland",
					["npcID"] = 0,
				},
				[294133] = {
					["source"] = "Darthino",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[259456] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Grizzan-Draenor",
					["npcID"] = 0,
				},
				[303345] = {
					["source"] = "Spiritzu-Ragnaros",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[271105] = {
					["source"] = "Shocktar-DunMorogh",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[45182] = {
					["source"] = "Stornó-Blackmoore",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[6343] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Baroon-TarrenMill",
					["npcID"] = 0,
				},
				[287379] = {
					["source"] = "Murthàg-Hyjal",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[318187] = {
					["source"] = "Stornó-Blackmoore",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[269571] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Junboib-Draenor",
					["npcID"] = 0,
				},
				[201633] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Earthen Wall Totem",
					["npcID"] = 100943,
				},
				[17] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ketshup-Draenor",
					["npcID"] = 0,
				},
				[271107] = {
					["source"] = "Qlex-Agamaggan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[245388] = {
					["source"] = "Stornó-Blackmoore",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[774] = {
					["source"] = "Ankaa-Elune",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[116841] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fumonki-TarrenMill",
					["npcID"] = 0,
				},
				[131493] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Gongwed-Kazzak",
					["npcID"] = 0,
				},
				[20572] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fallkenez",
					["npcID"] = 0,
				},
				[2061] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Dinzo-TarrenMill",
					["npcID"] = 0,
				},
				[186257] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Misiekhuj-BurningLegion",
					["npcID"] = 0,
				},
				[257415] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Justfog-Drak'thul",
					["npcID"] = 0,
				},
				[245389] = {
					["source"] = "Nàrutò-Thrall",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[288509] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Madminep-TarrenMill",
					["npcID"] = 0,
				},
				[11366] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Drummina-Draenor",
					["npcID"] = 0,
				},
				[113899] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Demonic Gateway",
					["npcID"] = 59262,
				},
				[205473] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Calisi-Onyxia",
					["npcID"] = 0,
				},
				[259455] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Adanakebab-Draenor",
					["npcID"] = 0,
				},
				[132627] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Kirimox-Draenor",
					["npcID"] = 0,
				},
				[313571] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Tatusk-Draenor",
					["npcID"] = 0,
				},
				[33917] = {
					["source"] = "Ankaa-Elune",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[77130] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Roltrap-Kazzak",
					["npcID"] = 0,
				},
				[185763] = {
					["source"] = "Rizzy-Wildhammer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[303568] = {
					["source"] = "Dancewithme-Teldrassil",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[8122] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Proita-Outland",
					["npcID"] = 0,
				},
				[278769] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Grizzdh-Quel'Thalas",
					["npcID"] = 0,
				},
				[257161] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 134169,
				},
				[273453] = {
					["source"] = "Enriquillo-ArgentDawn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[260843] = {
					["source"] = "Jahden Fla",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 122704,
				},
				[287340] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Erinqa-BurningLegion",
					["npcID"] = 0,
				},
				[20271] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Junboib-Draenor",
					["npcID"] = 0,
				},
				[113900] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Demonic Gateway",
					["npcID"] = 59271,
				},
				[6770] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fallkenez",
					["npcID"] = 0,
				},
				[143625] = {
					["source"] = "Zonoz-TarrenMill",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[286979] = {
					["source"] = "Viscdk-Eredar",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[108271] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Roltrap-Kazzak",
					["npcID"] = 0,
				},
				[16739] = {
					["source"] = "Ankaa-Elune",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[11426] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Calisi-Onyxia",
					["npcID"] = 0,
				},
				[300832] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Fällkên",
					["npcID"] = 0,
				},
				[63619] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Shadowfiend",
					["npcID"] = 19668,
				},
				[215711] = {
					["source"] = "Viscdk-Eredar",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[279913] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Tylblul-Stormscale",
					["npcID"] = 0,
				},
				[115308] = {
					["source"] = "Proteinz-Kazzak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[204197] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Proita-Outland",
					["npcID"] = 0,
				},
				[261769] = {
					["source"] = "Durus-Blackhand",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[295137] = {
					["source"] = "Enriquillo-ArgentDawn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[116011] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Doegrinder-Draenor",
					["npcID"] = 0,
				},
				[200587] = {
					["source"] = "Malendra-TwistingNether",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[768] = {
					["source"] = "Zonoz-TarrenMill",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[316744] = {
					["source"] = "Sáylin-TarrenMill",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[301312] = {
					["source"] = "Nöllan",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[257420] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mimooz-Draenor",
					["npcID"] = 0,
				},
				[3409] = {
					["source"] = "Kipix-Elune",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[300801] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Imekr-Eredar",
					["npcID"] = 0,
				},
				[116858] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lîlgåÿløkßøï-Alonsus",
					["npcID"] = 0,
				},
				[6807] = {
					["source"] = "Ihotu-Blackmoore",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[104773] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lîlgåÿløkßøï-Alonsus",
					["npcID"] = 0,
				},
				[115181] = {
					["source"] = "Proteinz-Kazzak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[43195] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Blóðhildur-TarrenMill",
					["npcID"] = 0,
				},
				[296059] = {
					["source"] = "Ankaa-Elune",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[223829] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bèastmodè-TheMaelstrom",
					["npcID"] = 0,
				},
				[278244] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fällkên",
					["npcID"] = 0,
				},
				[111771] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lîlgåÿløkßøï-Alonsus",
					["npcID"] = 0,
				},
				[130] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Israckette-Archimonde",
					["npcID"] = 0,
				},
				[312107] = {
					["source"] = "Rymè-Draenor",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[304722] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Proita-Outland",
					["npcID"] = 0,
				},
				[279572] = {
					["source"] = "Ðice-Dragonblight",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[257422] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dinzo-TarrenMill",
					["npcID"] = 0,
				},
				[5740] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Tylblul-Stormscale",
					["npcID"] = 0,
				},
				[186289] = {
					["source"] = "Fàllkên",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[188592] = {
					["source"] = "Hiawata-Blackrock",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[53385] = {
					["source"] = "Mystìk-Frostwolf",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[93402] = {
					["source"] = "Borntorock-Thrall",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[313088] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Soclean-ShatteredHand",
					["npcID"] = 0,
				},
				[115310] = {
					["source"] = "Fàllkèn",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[259161] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Terry-Emeriss",
					["npcID"] = 0,
				},
				[310530] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dinzo-TarrenMill",
					["npcID"] = 0,
				},
				[206760] = {
					["source"] = "Skwìp-Elune",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[213771] = {
					["source"] = "Ankaa-Elune",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[290512] = {
					["source"] = "Контанго-Ясеневыйлес",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[273685] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Évè-Archimonde",
					["npcID"] = 0,
				},
				[193455] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Trollakläss-Hyjal",
					["npcID"] = 0,
				},
				[178266] = {
					["source"] = "Matafaka-Norgannon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[257424] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ámáterásu-Twilight'sHammer",
					["npcID"] = 0,
				},
				[194223] = {
					["source"] = "Дарммаму-ТкачСмерти",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272090] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Draidun",
					["npcID"] = 0,
				},
				[196782] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Bèastmodè-TheMaelstrom",
					["npcID"] = 0,
				},
				[30283] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Lîlgåÿløkßøï-Alonsus",
					["npcID"] = 0,
				},
				[2580] = {
					["source"] = "Hehkate-Anachronos",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[193456] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Ámáterásu-Twilight'sHammer",
					["npcID"] = 0,
				},
				[212423] = {
					["source"] = "Risen Skulker",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 99541,
				},
				[187827] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Grizzdh-Quel'Thalas",
					["npcID"] = 0,
				},
				[51714] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Fällkên",
					["npcID"] = 0,
				},
				[853] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Palalord-Stormscale",
					["npcID"] = 0,
				},
				[225919] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Grizzdh-Quel'Thalas",
					["npcID"] = 0,
				},
				[318211] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Demonsols-Doomhammer",
					["npcID"] = 0,
				},
				[66004] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Malithus Brightblade",
					["npcID"] = 36120,
				},
				[290577] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Abomination",
					["npcID"] = 149555,
				},
				[199854] = {
					["source"] = "Fällkèn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[26573] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Faallken",
					["npcID"] = 0,
				},
				[278917] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Yurrei-Magtheridon",
					["npcID"] = 0,
				},
				[2565] = {
					["source"] = "Тормагеддон-СвежевательДуш",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[8221] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rapssody",
					["npcID"] = 0,
				},
				[269085] = {
					["source"] = "Spiritzu-Ragnaros",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[224126] = {
					["source"] = "Spirit Wolf",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 100820,
				},
				[300814] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fällkên",
					["npcID"] = 0,
				},
				[22703] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Lîlgåÿløkßøï-Alonsus",
					["npcID"] = 0,
				},
				[5176] = {
					["source"] = "Borntorock-Thrall",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[205523] = {
					["source"] = "Proteinz-Kazzak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[51723] = {
					["source"] = "Stornó-Blackmoore",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[295186] = {
					["source"] = "Enriquillo-ArgentDawn",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[174524] = {
					["source"] = "Xanin",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[164545] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Torrid-Twilight'sHammer",
					["npcID"] = 0,
				},
				[199600] = {
					["source"] = "Bugne-Blackrock",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[60231] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fallen Hero's Spirit",
					["npcID"] = 32149,
				},
				[198065] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Boovi-Draenor",
					["npcID"] = 0,
				},
				[296211] = {
					["source"] = "Kalysto-Blackrock",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[266018] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Proita-Outland",
					["npcID"] = 0,
				},
				[215479] = {
					["source"] = "Proteinz-Kazzak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[162243] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Demonsols-Doomhammer",
					["npcID"] = 0,
				},
				[248473] = {
					["source"] = "Matafaka-Norgannon",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2645] = {
					["source"] = "Enriquillo-ArgentDawn",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[2649] = {
					["source"] = "Oondasta",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 69161,
				},
				[300893] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fallkenez",
					["npcID"] = 0,
				},
				[1329] = {
					["source"] = "Stornó-Blackmoore",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[268756] = {
					["source"] = "Thunderfloof-Kazzak",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[207744] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Grizzdh-Quel'Thalas",
					["npcID"] = 0,
				},
				[318219] = {
					["source"] = "Linkshänder-Antonidas",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[285979] = {
					["source"] = "Fallken",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[228260] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Jahvene-Stormreaver",
					["npcID"] = 0,
				},
				[3714] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lexdk-Draenor",
					["npcID"] = 0,
				},
				[273415] = {
					["source"] = "Khurtz-Nemesis",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[16583] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Scourge Banner-Bearer",
					["npcID"] = 31900,
				},
				[223143] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Mlord-Outland",
					["npcID"] = 0,
				},
				[116849] = {
					["source"] = "Kalysto-Blackrock",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[231843] = {
					["source"] = "Mystìk-Frostwolf",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[285981] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Kirintas-Ysondre",
					["npcID"] = 0,
				},
				[199603] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fi-BurningLegion",
					["npcID"] = 0,
				},
				[196608] = {
					["source"] = "Контанго-Ясеневыйлес",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[315787] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Bèastmodè-TheMaelstrom",
					["npcID"] = 0,
				},
				[212653] = {
					["source"] = "Pinggwin-BurningLegion",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[97462] = {
					["source"] = "Shocktar-DunMorogh",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[101643] = {
					["source"] = "Remmii",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[60023] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Scourge Banner-Bearer",
					["npcID"] = 31900,
				},
				[267560] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Numbull-Draenor",
					["npcID"] = 0,
				},
				[316036] = {
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[272678] = {
					["source"] = "Fàllkên",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[198069] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Proita-Outland",
					["npcID"] = 0,
				},
				[281000] = {
					["source"] = "Fällkèn",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[49020] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Fällkên",
					["npcID"] = 0,
				},
				[54185] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Forgotten Depths Slayer",
					["npcID"] = 30333,
				},
				[203981] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Grizzdh-Quel'Thalas",
					["npcID"] = 0,
				},
				[22888] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[772] = {
					["source"] = "Khurtz-Nemesis",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[184362] = {
					["source"] = "Shocktar-DunMorogh",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[348] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Moghr-Stormscale",
					["npcID"] = 0,
				},
				[253595] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Foxxis-Frostwhisper",
					["npcID"] = 0,
				},
				[32612] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Drummina-Draenor",
					["npcID"] = 0,
				},
				[198838] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bubblewitch-KulTiras",
					["npcID"] = 0,
				},
				[318227] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Tylblul-Stormscale",
					["npcID"] = 0,
				},
				[214968] = {
					["source"] = "Dreaddreamer-SteamwheedleCartel",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[288546] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Magus of the Dead",
					["npcID"] = 148797,
				},
				[278134] = {
					["source"] = "Shocktar-DunMorogh",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[293664] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Asappi-BurningLegion",
					["npcID"] = 0,
				},
				[6660] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Wavecrest Mariner",
					["npcID"] = 35098,
				},
				[257946] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Trollakläss-Hyjal",
					["npcID"] = 0,
				},
				[198839] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Earthen Wall Totem",
					["npcID"] = 100943,
				},
				[203819] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Grizzdh-Quel'Thalas",
					["npcID"] = 0,
				},
				[288613] = {
					["source"] = "Milljaris-Blackhand",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[288548] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Magus of the Dead",
					["npcID"] = 148797,
				},
				[51533] = {
					["source"] = "Thunderfloof-Kazzak",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[204213] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Proita-Outland",
					["npcID"] = 0,
				},
				[247456] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fushime-TarrenMill",
					["npcID"] = 0,
				},
				[157644] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fàllkén",
					["npcID"] = 0,
				},
				[272685] = {
					["source"] = "Dreaddreamer-SteamwheedleCartel",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[57994] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bubblewitch-KulTiras",
					["npcID"] = 0,
				},
				[285514] = {
					["source"] = "Hiawata-Blackrock",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[114165] = {
					["source"] = "Haylia-TwistingNether",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[49998] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bèastmodè-TheMaelstrom",
					["npcID"] = 0,
				},
				[108280] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Roltrap-Kazzak",
					["npcID"] = 0,
				},
				[260069] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Priest of Gonk",
					["npcID"] = 131809,
				},
				[61684] = {
					["source"] = "Unknown",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 94149,
				},
				[15407] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Jahvene-Stormreaver",
					["npcID"] = 0,
				},
				[278359] = {
					["source"] = "Slyziwr-Kazzak",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[270323] = {
					["source"] = "Fàllkên",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[193356] = {
					["source"] = "Bugne-Blackrock",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[27576] = {
					["source"] = "Stornó-Blackmoore",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[109304] = {
					["source"] = "Amazone-Lightbringer",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[107570] = {
					["source"] = "Artan-Kel'Thuzad",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[1459] = {
					["source"] = "Bibabanki-Durotan",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[266779] = {
					["source"] = "Fàllkên",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[197051] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Fallkenez",
					["npcID"] = 0,
				},
				[296230] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Erinqa-BurningLegion",
					["npcID"] = 0,
				},
				[316801] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Rhux",
					["npcID"] = 0,
				},
				[13787] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Shadow Channeler",
					["npcID"] = 32262,
				},
				[206930] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Darkvandal-KhazModan",
					["npcID"] = 0,
				},
				[273714] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Évè-Archimonde",
					["npcID"] = 0,
				},
				[277904] = {
					["source"] = "Cidaris",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[274738] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bèastmodè-TheMaelstrom",
					["npcID"] = 0,
				},
				[32919] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Sinewy Wolf",
					["npcID"] = 31233,
				},
				[147193] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Jahvene-Stormreaver",
					["npcID"] = 0,
				},
				[164812] = {
					["source"] = "Bluen-TarrenMill",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[310595] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Darkvandal-KhazModan",
					["npcID"] = 0,
				},
				[43410] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Kvaldir Berserker",
					["npcID"] = 34947,
				},
				[47568] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Fällkên",
					["npcID"] = 0,
				},
				[207682] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Grizzdh-Quel'Thalas",
					["npcID"] = 0,
				},
				[274740] = {
					["source"] = "Контанго-Ясеневыйлес",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[118922] = {
					["source"] = "Amazone-Lightbringer",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[124274] = {
					["source"] = "Proteinz-Kazzak",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[77489] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Dinzo-TarrenMill",
					["npcID"] = 0,
				},
				[315681] = {
					["source"] = "Kelaria-Quel'Thalas",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[273006] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "DEBUFF",
					["source"] = "Patasila-Drak'thul",
					["npcID"] = 0,
				},
				[275765] = {
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[198589] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Demonsols-Doomhammer",
					["npcID"] = 0,
				},
				[62537] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Lake Frog",
					["npcID"] = 33211,
				},
				[33943] = {
					["source"] = "Mhairi",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[200166] = {
					["source"] = "Shoreks-Arygos",
					["event"] = "SPELL_CAST_SUCCESS",
					["npcID"] = 0,
				},
				[115191] = {
					["source"] = "Stornó-Blackmoore",
					["type"] = "BUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[77535] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Darkvandal-KhazModan",
					["npcID"] = 0,
				},
				[8004] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Bubblewitch-KulTiras",
					["npcID"] = 0,
				},
				[273992] = {
					["event"] = "SPELL_AURA_APPLIED",
					["type"] = "BUFF",
					["source"] = "Wakku-Blackmoore",
					["npcID"] = 0,
				},
				[278326] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Mlord-Outland",
					["npcID"] = 0,
				},
				[8143] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Roltrap-Kazzak",
					["npcID"] = 0,
				},
				[310592] = {
					["event"] = "SPELL_CAST_SUCCESS",
					["source"] = "Darkvandal-KhazModan",
					["npcID"] = 0,
				},
				[124275] = {
					["source"] = "Proteinz-Kazzak",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
				[273836] = {
					["source"] = "Bluen-TarrenMill",
					["type"] = "DEBUFF",
					["event"] = "SPELL_AURA_APPLIED",
					["npcID"] = 0,
				},
			},
			["first_run3"] = true,
			["ui_parent_scale_tune"] = 1.111111140545504,
			["aura_tracker"] = {
				["buff_tracked"] = {
					[209859] = true,
				},
			},
			["hook_auto_imported"] = {
				["Reorder Nameplate"] = 3,
				["Dont Have Aura"] = 1,
				["Players Targetting Amount"] = 4,
				["Color Automation"] = 1,
				["Bwonsamdi Reaping"] = 1,
				["Blockade Encounter"] = 1,
				["Hide Neutral Units"] = 1,
				["Aura Reorder"] = 1,
				["Combo Points"] = 3,
				["Extra Border"] = 2,
				["Attacking Specific Unit"] = 1,
				["Target Color"] = 3,
				["Execute Range"] = 1,
				["Jaina Encounter"] = 6,
			},
			["saved_cvars"] = {
				["ShowClassColorInNameplate"] = "1",
				["nameplateOverlapV"] = "1.1",
				["ShowNamePlateLoseAggroFlash"] = "1",
				["nameplateShowEnemyMinus"] = "1",
				["nameplatePersonalShowAlways"] = "0",
				["nameplateMotionSpeed"] = "0.05",
				["nameplateSelfTopInset"] = "0.5",
				["nameplateShowFriendlyTotems"] = "0",
				["nameplateShowEnemyMinions"] = "1",
				["nameplateShowFriendlyPets"] = "0",
				["nameplateShowFriendlyNPCs"] = "0",
				["nameplateSelectedScale"] = "1.15",
				["nameplatePersonalShowInCombat"] = "1",
				["nameplatePersonalShowWithTarget"] = "0",
				["nameplateGlobalScale"] = "1.0",
				["nameplatePersonalHideDelaySeconds"] = "0.2",
				["nameplateResourceOnTarget"] = "0",
				["nameplateMotion"] = "0",
				["nameplateShowAll"] = "1",
				["nameplateMinScale"] = "1",
				["nameplateMaxDistance"] = "100",
				["nameplateShowFriendlyMinions"] = "0",
				["nameplateSelfScale"] = "1.0",
				["nameplateSelfBottomInset"] = "0.2",
				["nameplateOccludedAlphaMult"] = "1",
				["nameplateShowFriendlyGuardians"] = "0",
				["nameplateSelfAlpha"] = "0.75",
				["NamePlateHorizontalScale"] = "1",
				["nameplateOtherTopInset"] = "0.085",
				["nameplateShowSelf"] = "0",
				["NamePlateVerticalScale"] = "1",
			},
			["login_counter"] = 1899,
			["patch_version"] = 9,
			["number_region_first_run"] = true,
		},
	},
}
