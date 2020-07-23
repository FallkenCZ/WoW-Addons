
ElvDB = {
	["global"] = {
		["nameplate"] = {
			["filters"] = {
				["ElvUI_NonTarget"] = {
				},
				["ElvUI_Explosives"] = {
				},
				["ElvUI_Target"] = {
				},
				["ElvUI_Boss"] = {
				},
			},
		},
		["sle"] = {
			["advanced"] = {
				["general"] = true,
				["confirmed"] = true,
			},
		},
		["unitframe"] = {
			["ChannelTicks"] = {
				[47540] = 3,
			},
		},
		["general"] = {
			["commandBarSetting"] = "DISABLED",
			["UIScale"] = 0.79,
			["fadeMapWhenMoving"] = false,
		},
	},
	["SLE_DB_Ver"] = "3.59",
	["namespaces"] = {
		["LibDualSpec-1.0"] = {
		},
	},
	["class"] = {
		["Burning Blade"] = {
			["Fallken"] = "DRUID",
		},
	},
	["profiles"] = {
		["Fallken - Burning Blade"] = {
			["databars"] = {
				["reputation"] = {
					["enable"] = true,
					["width"] = 787,
					["height"] = 10,
				},
				["azerite"] = {
					["textFormat"] = "CURMAX",
					["width"] = 787,
					["orientation"] = "HORIZONTAL",
					["height"] = 10,
				},
				["experience"] = {
					["width"] = 787,
					["height"] = 10,
					["textSize"] = 12,
				},
				["honor"] = {
					["textFormat"] = "CURMAX",
					["height"] = 10,
					["width"] = 787,
					["orientation"] = "HORIZONTAL",
				},
			},
			["currentTutorial"] = 5,
			["general"] = {
				["totems"] = {
					["spacing"] = 2,
					["size"] = 30,
					["growthDirection"] = "HORIZONTAL",
				},
				["valuecolor"] = {
					["a"] = 1,
					["b"] = 0,
					["g"] = 0.66666666666667,
					["r"] = 0,
				},
				["threat"] = {
					["enable"] = false,
				},
				["stickyFrames"] = false,
				["vehicleSeatIndicatorSize"] = 88,
				["altPowerBar"] = {
					["enable"] = false,
				},
				["autoRepair"] = "PLAYER",
				["minimap"] = {
					["locationText"] = "HIDE",
					["size"] = 220,
				},
				["talkingHeadFrameBackdrop"] = true,
				["bottomPanel"] = false,
				["objectiveFrameHeight"] = 400,
				["talkingHeadFrameScale"] = 0.8,
				["bonusObjectivePosition"] = "RIGHT",
				["hideErrorFrame"] = false,
				["bordercolor"] = {
					["b"] = 0,
					["g"] = 0,
					["r"] = 0,
				},
			},
			["bags"] = {
				["itemLevelFont"] = "PT Sans Narrow",
				["currencyFormat"] = "ICON",
				["itemLevelThreshold"] = 140,
				["bagSize"] = 33,
				["junkIcon"] = true,
				["bankSize"] = 33,
				["itemLevelFontOutline"] = "OUTLINE",
				["countFontSize"] = 12,
				["itemLevelFontSize"] = 12,
				["vendorGrays"] = {
					["enable"] = true,
				},
				["scrapIcon"] = true,
				["bagWidth"] = 472,
				["countFont"] = "Univers",
				["clearSearchOnClose"] = true,
				["countFontOutline"] = "OUTLINE",
				["bankWidth"] = 472,
				["transparent"] = true,
				["moneyFormat"] = "BLIZZARD2",
			},
			["auras"] = {
				["debuffs"] = {
					["countFontSize"] = 10,
					["durationFontSize"] = 12,
					["size"] = 40,
					["horizontalSpacing"] = 3,
					["wrapAfter"] = 10,
				},
				["timeYOffset"] = -2,
				["font"] = "PT Sans Narrow",
				["fontOutline"] = "OUTLINE",
				["buffs"] = {
					["countFontSize"] = 10,
					["durationFontSize"] = 12,
					["size"] = 40,
					["horizontalSpacing"] = 3,
					["wrapAfter"] = 10,
				},
			},
			["layoutSet"] = "dpsCaster",
			["movers"] = {
				["SLE_DataPanel_6_Mover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-369,-394",
				["ElvUF_FocusCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,254,458",
				["MinimapMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,1,0",
				["RaidMarkerBarAnchor"] = "BOTTOM,ElvUIParent,BOTTOM,279,133",
				["PetAB"] = "BOTTOM,ElvUIParent,BOTTOM,-328,267",
				["ElvUF_RaidMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,2,223",
				["LeftChatMover"] = "BOTTOMLEFT,UIParent,BOTTOMLEFT,0,19",
				["GMMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,0,-62",
				["TopCenterContainerMover"] = "TOP,ElvUIParent,TOP,1,-33",
				["GhostFrameMover"] = "TOP,ElvUIParent,TOP,257,0",
				["ZoneAbility"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-407,220",
				["RightChatMover"] = "BOTTOMRIGHT,UIParent,BOTTOMRIGHT,0,19",
				["SLE_UIButtonsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,0,-245",
				["LootFrameMover"] = "TOP,ElvUIParent,TOP,-324,-433",
				["SLE_DataPanel_3_Mover"] = "BOTTOM,ElvUIParent,BOTTOM,248,0",
				["SocialMenuMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-187",
				["ElvUF_PetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-226,319",
				["ElvUIBagMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-133,221",
				["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,736",
				["BossHeaderMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,0,-262",
				["ElvUF_TargetTargetMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-478,321",
				["ElvUF_FocusMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-476,-454",
				["BossButton"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-335,219",
				["ElvAB_6"] = "BOTTOM,ElvUIParent,BOTTOM,192,40",
				["ExperienceBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,538,19",
				["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,15,252",
				["UIErrorsFrameMover"] = "TOP,ElvUIParent,TOP,0,-150",
				["VehicleSeatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,475,131",
				["VOICECHAT"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-473,163",
				["SLE_DataPanel_7_Mover"] = "BOTTOM,ElvUIParent,BOTTOM,205,0",
				["ElvUIBankMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-133,244",
				["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,275,349",
				["LevelUpBossBannerMover"] = "TOP,ElvUIParent,TOP,0,-52",
				["LossControlMover"] = "BOTTOM,ElvUIParent,BOTTOM,-1,507",
				["ElvUF_Raid40Mover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,432",
				["MirrorTimer1Mover"] = "TOP,ElvUIParent,TOP,0,-150",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,1546,288",
				["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,-194,99",
				["ElvAB_2"] = "BOTTOM,ElvUIParent,BOTTOM,193,99",
				["BelowMinimapContainerMover"] = "TOP,ElvUIParent,TOP,0,-94",
				["SLE_DataPanel_8_Mover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-297,-401",
				["TalkingHeadFrameMover"] = "TOP,ElvUIParent,TOP,-1,-16",
				["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,-194,40",
				["AltPowerBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,264,185",
				["ElvAB_3"] = "BOTTOM,ElvUIParent,BOTTOM,-194,69",
				["ReputationBarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-378,302",
				["AzeriteBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,28",
				["ElvAB_4"] = "BOTTOM,ElvUIParent,BOTTOM,192,69",
				["SLE_DataPanel_4_Mover"] = "BOTTOM,ElvUIParent,BOTTOM,256,0",
				["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,0,-262",
				["BNETMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,0,0",
				["ElvNP_PlayerMover"] = "TOP,ElvUIParent,TOP,152,-339",
				["ArenaHeaderMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,0,-262",
				["HonorBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,19",
				["ElvUF_TargetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,276,297",
				["TooltipMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,0,219",
				["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-254,349",
				["SLE_Location_Mover"] = "TOP,ElvUIParent,TOP,0,0",
				["TotemBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,-199,283",
				["ElvUF_PetMover"] = "BOTTOM,ElvUIParent,BOTTOM,-337,319",
				["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,195",
				["AlertFrameMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,464",
				["SLE_DataPanel_1_Mover"] = "BOTTOM,ElvUIParent,BOTTOM,-254,0",
				["SLE_DataPanel_2_Mover"] = "BOTTOM,ElvUIParent,BOTTOM,149,0",
			},
			["tooltip"] = {
				["itemCount"] = "NONE",
				["healthBar"] = {
					["fontSize"] = 12,
					["height"] = 12,
					["font"] = "PT Sans Narrow",
				},
				["fontSize"] = 10,
			},
			["v11NamePlateReset"] = true,
			["unitframe"] = {
				["fontSize"] = 12,
				["statusbar"] = "Polished Wood",
				["units"] = {
					["tank"] = {
						["enable"] = false,
					},
					["targettargettarget"] = {
						["health"] = {
							["frequentUpdates"] = true,
						},
					},
					["boss"] = {
						["debuffs"] = {
							["sizeOverride"] = 27,
							["yOffset"] = -16,
							["numrows"] = 1,
							["maxDuration"] = 300,
						},
						["name"] = {
							["position"] = "TOPLEFT",
							["xOffset"] = 4,
							["text_format"] = "[namecolor][name]",
							["yOffset"] = -2,
						},
						["power"] = {
							["xOffset"] = 2,
							["text_format"] = "[powercolor][curpp]",
							["yOffset"] = -4,
							["position"] = "BOTTOMRIGHT",
						},
						["width"] = 246,
						["infoPanel"] = {
							["height"] = 17,
						},
						["health"] = {
							["frequentUpdates"] = true,
							["position"] = "RIGHT",
							["yOffset"] = -2,
						},
						["portrait"] = {
							["width"] = 45,
							["camDistanceScale"] = 2,
						},
						["height"] = 40,
						["buffs"] = {
							["sizeOverride"] = 27,
							["yOffset"] = 16,
							["maxDuration"] = 300,
						},
						["castbar"] = {
							["width"] = 256,
							["format"] = "CURRENTMAX",
						},
					},
					["party"] = {
						["enable"] = false,
					},
					["focustarget"] = {
						["health"] = {
							["frequentUpdates"] = true,
						},
					},
					["targettarget"] = {
						["debuffs"] = {
							["anchorPoint"] = "TOPRIGHT",
							["enable"] = false,
						},
						["threatStyle"] = "GLOW",
						["power"] = {
							["enable"] = false,
						},
						["disableMouseoverGlow"] = true,
						["width"] = 100,
						["height"] = 25,
						["health"] = {
							["frequentUpdates"] = true,
						},
						["raidicon"] = {
							["attachTo"] = "RIGHT",
							["yOffset"] = 0,
							["xOffset"] = 20,
							["size"] = 20,
						},
					},
					["raid"] = {
						["infoPanel"] = {
							["enable"] = true,
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["position"] = "LEFT",
							["xOffset"] = 2,
						},
						["height"] = 28,
						["visibility"] = "[nogroup] hide;show",
						["raidicon"] = {
							["attachTo"] = "TOPRIGHT",
							["attachToObject"] = "Health",
							["yOffset"] = 0,
						},
						["rdebuffs"] = {
							["fontSize"] = 12,
							["yOffset"] = 15,
							["font"] = "PT Sans Narrow",
							["fontOutline"] = "OUTLINE",
							["size"] = 24,
						},
						["growthDirection"] = "RIGHT_UP",
						["resurrectIcon"] = {
							["attachTo"] = "BOTTOMRIGHT",
						},
						["power"] = {
							["height"] = 6,
						},
						["numGroups"] = 8,
						["width"] = 91,
						["health"] = {
							["xOffset"] = 4,
							["text_format"] = "",
							["yOffset"] = -4,
							["position"] = "TOPLEFT",
							["bgUseBarTexture"] = false,
						},
						["roleIcon"] = {
							["attachTo"] = "InfoPanel",
							["position"] = "BOTTOMRIGHT",
							["xOffset"] = 0,
							["size"] = 12,
						},
					},
					["assist"] = {
						["enable"] = false,
					},
					["player"] = {
						["debuffs"] = {
							["yOffset"] = 15,
							["perrow"] = 7,
						},
						["portrait"] = {
							["overlay"] = true,
							["enable"] = true,
							["overlayAlpha"] = 1,
							["fullOverlay"] = true,
							["camDistanceScale"] = 3,
						},
						["raidicon"] = {
							["attachTo"] = "TOPLEFT",
							["yOffset"] = 17,
							["xOffset"] = -20,
							["size"] = 24,
						},
						["classbar"] = {
							["enable"] = false,
							["height"] = 14,
						},
						["CombatIcon"] = {
							["anchorPoint"] = "TOPRIGHT",
							["size"] = 32,
							["xOffset"] = 14,
							["yOffset"] = -7,
						},
						["RestIcon"] = {
							["anchorPoint"] = "BOTTOMRIGHT",
							["xOffset"] = 10,
							["yOffset"] = 0,
						},
						["power"] = {
							["powerPrediction"] = true,
							["xOffset"] = 2,
							["text_format"] = "[powercolor][curpp]",
							["yOffset"] = -10,
							["position"] = "BOTTOMLEFT",
							["height"] = 12,
							["attachTextTo"] = "InfoPanel",
						},
						["customTexts"] = {
							["Absorbs"] = {
								["attachTextTo"] = "Health",
								["xOffset"] = 2,
								["text_format"] = "[absorbs:sl-short]",
								["yOffset"] = -8,
								["font"] = "PT Sans Narrow",
								["justifyH"] = "LEFT",
								["fontOutline"] = "OUTLINE",
								["enable"] = true,
								["size"] = 12,
							},
						},
						["disableMouseoverGlow"] = true,
						["width"] = 220,
						["castbar"] = {
							["iconAttachedTo"] = "Castbar",
							["iconSize"] = 32,
							["format"] = "CURRENTMAX",
							["insideInfoPanel"] = false,
							["iconAttached"] = false,
							["width"] = 220,
							["iconXOffset"] = -2,
							["height"] = 22,
						},
						["name"] = {
							["position"] = "TOPRIGHT",
							["text_format"] = "[name] [level]",
							["yOffset"] = 13,
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["frequentUpdates"] = true,
							["position"] = "TOPLEFT",
							["yOffset"] = -2,
						},
						["height"] = 50,
						["buffs"] = {
							["perrow"] = 7,
						},
						["pvpIcon"] = {
							["anchorPoint"] = "LEFT",
							["xOffset"] = -30,
							["enable"] = true,
						},
						["pvp"] = {
							["text_format"] = "",
						},
					},
					["raid40"] = {
						["enable"] = false,
					},
					["focus"] = {
						["castbar"] = {
							["width"] = 270,
							["height"] = 20,
							["format"] = "CURRENTMAX",
						},
						["width"] = 150,
						["health"] = {
							["frequentUpdates"] = true,
						},
						["raidicon"] = {
							["attachTo"] = "LEFT",
							["yOffset"] = 0,
							["xOffset"] = -20,
							["size"] = 22,
						},
					},
					["target"] = {
						["debuffs"] = {
							["anchorPoint"] = "TOPLEFT",
							["perrow"] = 7,
							["attachTo"] = "FRAME",
							["maxDuration"] = 0,
						},
						["castbar"] = {
							["insideInfoPanel"] = false,
							["iconAttached"] = false,
							["width"] = 220,
							["iconPosition"] = "RIGHT",
							["height"] = 22,
							["iconAttachedTo"] = "Castbar",
							["iconSize"] = 32,
							["format"] = "CURRENTMAX",
							["iconXOffset"] = 2,
						},
						["portrait"] = {
							["overlay"] = true,
							["enable"] = true,
							["overlayAlpha"] = 1,
							["fullOverlay"] = true,
							["camDistanceScale"] = 3,
						},
						["power"] = {
							["powerPrediction"] = true,
							["yOffset"] = -10,
							["position"] = "BOTTOMRIGHT",
							["height"] = 12,
							["attachTextTo"] = "InfoPanel",
						},
						["customTexts"] = {
							["Absorbs"] = {
								["attachTextTo"] = "Health",
								["xOffset"] = 0,
								["text_format"] = "[absorbs:sl-short]",
								["yOffset"] = -6,
								["font"] = "PT Sans Narrow",
								["justifyH"] = "RIGHT",
								["fontOutline"] = "OUTLINE",
								["enable"] = true,
								["size"] = 12,
							},
						},
						["disableMouseoverGlow"] = true,
						["width"] = 220,
						["pvpIcon"] = {
							["anchorPoint"] = "RIGHT",
							["xOffset"] = 30,
							["enable"] = true,
						},
						["name"] = {
							["position"] = "TOPRIGHT",
							["text_format"] = "[name] [level]",
							["yOffset"] = 13,
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["frequentUpdates"] = true,
							["position"] = "TOPRIGHT",
							["xOffset"] = 2,
							["yOffset"] = -2,
						},
						["orientation"] = "LEFT",
						["buffs"] = {
							["anchorPoint"] = "TOPLEFT",
							["perrow"] = 7,
							["attachTo"] = "DEBUFFS",
							["enable"] = false,
						},
						["height"] = 50,
						["raidicon"] = {
							["attachTo"] = "TOPRIGHT",
							["yOffset"] = 17,
							["xOffset"] = 20,
							["size"] = 24,
						},
					},
					["arena"] = {
						["castbar"] = {
							["format"] = "CURRENTMAX",
						},
						["power"] = {
							["xOffset"] = 2,
							["text_format"] = "[powercolor][curpp]",
							["yOffset"] = -4,
							["position"] = "BOTTOMRIGHT",
						},
						["name"] = {
							["position"] = "TOPLEFT",
							["xOffset"] = 4,
							["text_format"] = "[level] [namecolor][name]",
							["yOffset"] = -2,
						},
						["height"] = 40,
						["health"] = {
							["frequentUpdates"] = true,
							["position"] = "RIGHT",
							["yOffset"] = -2,
						},
					},
					["pettarget"] = {
						["health"] = {
							["frequentUpdates"] = true,
						},
					},
					["pet"] = {
						["debuffs"] = {
							["anchorPoint"] = "TOPRIGHT",
							["enable"] = true,
						},
						["portrait"] = {
							["camDistanceScale"] = 2,
						},
						["disableTargetGlow"] = false,
						["width"] = 100,
						["infoPanel"] = {
							["height"] = 14,
						},
						["health"] = {
							["frequentUpdates"] = true,
						},
						["height"] = 25,
						["castbar"] = {
							["width"] = 118,
							["iconSize"] = 32,
							["height"] = 25,
						},
					},
				},
				["font"] = "PT Sans Narrow",
				["colors"] = {
					["healthclass"] = true,
					["castColor"] = {
						["b"] = 0.25098039215686,
						["g"] = 0.76470588235294,
						["r"] = 0.8156862745098,
					},
					["auraBarBuff"] = {
						["b"] = 0.4078431372549,
						["g"] = 0.82352941176471,
						["r"] = 0.48235294117647,
					},
					["healPrediction"] = {
						["absorbs"] = {
							["a"] = 0.61000001430511,
							["b"] = 0.5921568627451,
							["r"] = 0.95686274509804,
						},
						["overabsorbs"] = {
							["a"] = 0.61073982715607,
							["b"] = 1,
						},
						["overhealabsorbs"] = {
							["a"] = 0.61000001430511,
						},
					},
				},
				["fontOutline"] = "OUTLINE",
				["thinBorders"] = true,
			},
			["datatexts"] = {
				["fontSize"] = 17,
				["goldFormat"] = "BLIZZARD2",
				["panelTransparency"] = true,
				["panels"] = {
					["LeftMiniPanel"] = "Coords",
					["RightChatDataPanel"] = {
						["right"] = "S&L Currency",
						["left"] = "Talent/Loot Specialization",
						["middle"] = "System",
					},
					["LeftChatDataPanel"] = {
						["right"] = "S&L Guild",
						["left"] = "Combat/Arena Time",
					},
					["RightMiniPanel"] = "Time",
					["SLE_DataPanel_1"] = {
						["right"] = "Bags",
						["left"] = "S&L Friends",
						["middle"] = "S&L Item Level",
					},
					["SLE_DataPanel_2"] = {
						["right"] = "S&L Target Range",
						["left"] = "S&L Friends",
						["middle"] = "S&L Mail",
					},
				},
				["fontOutline"] = "OUTLINE",
				["noCombatClick"] = true,
				["goldCoins"] = true,
				["noCombatHover"] = true,
			},
			["actionbar"] = {
				["bar3"] = {
					["buttons"] = 12,
					["buttonsPerRow"] = 12,
					["buttonsize"] = 31,
				},
				["barPet"] = {
					["point"] = "TOPLEFT",
					["buttonspacing"] = -1,
					["backdrop"] = false,
					["buttonsPerRow"] = 5,
					["buttonsize"] = 24,
				},
				["backdropSpacingConverted"] = true,
				["bar1"] = {
					["buttonsize"] = 31,
				},
				["bar2"] = {
					["enabled"] = true,
					["buttonsize"] = 31,
				},
				["bar5"] = {
					["buttons"] = 12,
					["buttonsPerRow"] = 12,
					["buttonsize"] = 31,
				},
				["lockActionBars"] = false,
				["bar6"] = {
					["enabled"] = true,
					["buttonsize"] = 31,
				},
				["transparent"] = true,
				["stanceBar"] = {
					["buttonspacing"] = -1,
					["enabled"] = false,
					["buttonsize"] = 22,
					["style"] = "classic",
				},
				["cooldown"] = {
					["fonts"] = {
						["enable"] = true,
						["fontSize"] = 16,
					},
					["mmssThreshold"] = 900,
					["checkSeconds"] = true,
				},
				["bar4"] = {
					["backdrop"] = false,
					["buttonsPerRow"] = 12,
					["buttonsize"] = 31,
				},
			},
			["nameplates"] = {
				["lowHealthThreshold"] = 0,
				["clickThrough"] = {
					["personal"] = true,
				},
				["threat"] = {
					["beingTankedByTank"] = false,
				},
				["units"] = {
					["PLAYER"] = {
						["debuffs"] = {
							["enable"] = false,
						},
						["showWithTarget"] = true,
						["useStaticPosition"] = true,
						["showInCombat"] = true,
						["classpower"] = {
							["yOffset"] = 9,
							["width"] = 146,
						},
						["buffs"] = {
							["enable"] = false,
						},
						["castbar"] = {
							["enable"] = false,
						},
					},
					["FRIENDLY_NPC"] = {
						["questIconSize"] = 24,
					},
					["ENEMY_PLAYER"] = {
						["debuffs"] = {
							["yOffset"] = 10,
							["filters"] = {
								["priority"] = "Blacklist,Personal,CCDebuffs",
							},
						},
						["level"] = {
							["fontSize"] = 14,
						},
						["castbar"] = {
							["sourceInterrupt"] = false,
						},
						["health"] = {
							["height"] = 12,
							["text"] = {
								["fontSize"] = 14,
								["format"] = "[health:current-percent]",
							},
						},
						["power"] = {
							["enable"] = true,
							["yOffset"] = -9,
							["height"] = 4,
						},
						["buffs"] = {
							["yOffset"] = 40,
							["filters"] = {
								["maxDuration"] = 0,
							},
						},
						["name"] = {
							["fontSize"] = 14,
							["format"] = "[name:medium]",
						},
					},
					["ENEMY_NPC"] = {
						["debuffs"] = {
							["yOffset"] = 10,
						},
						["level"] = {
							["fontSize"] = 14,
						},
						["questIconSize"] = 24,
						["health"] = {
							["height"] = 12,
							["text"] = {
								["fontSize"] = 14,
								["format"] = "[health:current-percent]",
							},
						},
						["castbar"] = {
							["sourceInterrupt"] = false,
						},
						["eliteIcon"] = {
							["enable"] = true,
							["xOffset"] = 20,
							["yOffset"] = 14,
						},
						["buffs"] = {
							["yOffset"] = 40,
						},
						["name"] = {
							["fontSize"] = 14,
							["format"] = "[name:medium]",
						},
						["power"] = {
							["enable"] = true,
							["yOffset"] = -9,
							["height"] = 4,
						},
					},
				},
				["clampToScreen"] = true,
				["statusbar"] = "Polished Wood",
			},
			["sle"] = {
				["databars"] = {
					["azerite"] = {
						["longtext"] = true,
					},
					["honor"] = {
						["chatfilter"] = {
							["awardStyle"] = "STYLE2",
							["enable"] = true,
							["style"] = "STYLE8",
						},
					},
					["rep"] = {
						["chatfilter"] = {
							["style"] = "STYLE2",
							["enable"] = true,
							["styleDec"] = "STYLE2",
						},
					},
					["exp"] = {
						["chatfilter"] = {
							["enable"] = true,
							["style"] = "STYLE2",
						},
					},
				},
				["media"] = {
					["fonts"] = {
						["zone"] = {
							["font"] = "2002",
						},
						["subzone"] = {
							["font"] = "Old Cyrillic",
						},
						["pvp"] = {
							["font"] = "Old Cyrillic",
						},
					},
				},
				["Armory"] = {
					["Character"] = {
						["Enchant"] = {
							["FontSize"] = 11,
						},
						["Stats"] = {
							["IlvlFull"] = true,
							["List"] = {
								["HEALTH"] = true,
								["POWER"] = true,
							},
							["IlvlColor"] = true,
						},
						["Backdrop"] = {
							["Overlay"] = false,
						},
						["Durability"] = {
							["FontSize"] = 10,
						},
						["Gradation"] = {
							["ItemQuality"] = true,
						},
						["Level"] = {
							["FontSize"] = 12,
						},
					},
					["Inspect"] = {
						["Level"] = {
							["FontSize"] = 12,
						},
						["Enchant"] = {
							["FontSize"] = 10,
						},
					},
				},
				["chat"] = {
					["tab"] = {
						["select"] = true,
					},
					["dpsSpam"] = true,
				},
				["loot"] = {
					["looticons"] = {
						["enable"] = true,
					},
					["enable"] = true,
					["autoroll"] = {
						["autoconfirm"] = true,
						["autogreed"] = true,
					},
				},
				["tooltip"] = {
					["alwaysCompareItems"] = true,
					["showFaction"] = true,
				},
				["uibuttons"] = {
					["point"] = "TOPRIGHT",
					["spacing"] = 1,
					["size"] = 20,
					["anchor"] = "BOTTOMRIGHT",
					["orientation"] = "horizontal",
					["yoffset"] = -1,
				},
				["raidmanager"] = {
					["roles"] = true,
				},
				["datatexts"] = {
					["leftchat"] = {
						["width"] = 386,
					},
					["panel7"] = {
						["transparent"] = true,
						["pethide"] = false,
						["width"] = 253,
					},
					["chathandle"] = true,
					["panel6"] = {
						["transparent"] = true,
						["pethide"] = false,
						["width"] = 277,
					},
					["panel2"] = {
						["enabled"] = true,
						["width"] = 396,
					},
					["rightchat"] = {
						["width"] = 502,
					},
					["panel8"] = {
						["transparent"] = true,
						["pethide"] = false,
						["width"] = 470,
					},
					["panel1"] = {
						["enabled"] = true,
						["width"] = 423,
					},
				},
				["minimap"] = {
					["locPanel"] = {
						["width"] = 310,
						["enable"] = true,
					},
					["instance"] = {
						["enable"] = true,
					},
				},
				["nameplates"] = {
					["threat"] = {
						["enable"] = true,
					},
					["targetcount"] = {
						["enable"] = true,
					},
				},
				["dt"] = {
					["durability"] = {
						["threshold"] = 30,
						["gradient"] = true,
					},
					["currency"] = {
						["Unused"] = false,
						["Jewelcrafting"] = false,
						["Archaeology"] = false,
						["gold"] = {
							["method"] = "amount",
						},
					},
					["guild"] = {
						["hide_guildname"] = true,
						["hide_gmotd"] = true,
						["totals"] = true,
					},
					["friends"] = {
						["totals"] = true,
						["expandBNBroadcast"] = true,
					},
				},
				["quests"] = {
					["autoReward"] = true,
				},
				["pvp"] = {
					["duels"] = {
						["pet"] = true,
						["regular"] = true,
					},
					["autorelease"] = true,
				},
			},
			["chat"] = {
				["tabFontOutline"] = "OUTLINE",
				["fontOutline"] = "OUTLINE",
				["tapFontSize"] = 10,
				["panelWidth"] = 472,
				["fontSize"] = 10,
				["tabFontSize"] = 16,
				["whisperSound"] = "None",
				["panelColorConverted"] = true,
				["panelHeight"] = 201,
				["timeStampFormat"] = "%H:%M:%S ",
			},
		},
		["Minimalistic"] = {
			["currentTutorial"] = 2,
			["general"] = {
				["font"] = "Expressway",
				["bottomPanel"] = false,
				["backdropfadecolor"] = {
					["a"] = 0.80000001192093,
					["r"] = 0.058823529411765,
					["g"] = 0.058823529411765,
					["b"] = 0.058823529411765,
				},
				["reputation"] = {
					["orientation"] = "HORIZONTAL",
					["textFormat"] = "PERCENT",
					["height"] = 16,
					["width"] = 200,
				},
				["bordercolor"] = {
					["r"] = 0.30588235294118,
					["g"] = 0.30588235294118,
					["b"] = 0.30588235294118,
				},
				["valuecolor"] = {
					["a"] = 1,
					["r"] = 1,
					["g"] = 1,
					["b"] = 1,
				},
				["fontSize"] = 11,
			},
			["movers"] = {
				["PetAB"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-50,-428",
				["ElvUF_RaidMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,51,120",
				["LeftChatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,50,50",
				["GMMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,250,-50",
				["BossButton"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-117,-298",
				["LootFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,249,-216",
				["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,50,827",
				["MicrobarMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-52",
				["VehicleSeatMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,51,-87",
				["ElvUF_TargetTargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,143",
				["ElvUF_Raid40Mover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,392,1073",
				["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,0,50",
				["ElvAB_2"] = "BOTTOM,ElvUIParent,BOTTOM,0,90",
				["ElvAB_4"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-50,-394",
				["AltPowerBarMover"] = "TOP,ElvUIParent,TOP,0,-186",
				["ElvAB_3"] = "BOTTOM,ElvUIParent,BOTTOM,305,50",
				["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,-305,50",
				["MinimapMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-50,-50",
				["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,230,140",
				["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-122,-393",
				["BNETMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,50,232",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,50,1150",
				["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,133",
				["ElvUF_PartyMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,184,773",
				["ElvAB_6"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-488,330",
				["TooltipMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-50,50",
				["ElvUF_TankMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,50,995",
				["ElvUF_PetMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,200",
				["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-230,140",
				["TotemBarMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,463,50",
				["RightChatMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-50,50",
				["AlertFrameMover"] = "TOP,ElvUIParent,TOP,0,-50",
				["ReputationBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-50,-228",
				["ElvUF_AssistMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,51,937",
			},
			["bags"] = {
				["itemLevelFontSize"] = 9,
				["countFontSize"] = 9,
			},
			["hideTutorial"] = true,
			["auras"] = {
				["font"] = "Expressway",
				["buffs"] = {
					["countFontSize"] = 11,
					["maxWraps"] = 2,
					["durationFontSize"] = 11,
				},
				["debuffs"] = {
					["countFontSize"] = 11,
					["durationFontSize"] = 11,
				},
			},
			["unitframe"] = {
				["statusbar"] = "ElvUI Blank",
				["fontOutline"] = "THICKOUTLINE",
				["smoothbars"] = true,
				["font"] = "Expressway",
				["fontSize"] = 9,
				["units"] = {
					["tank"] = {
						["enable"] = false,
					},
					["targettarget"] = {
						["infoPanel"] = {
							["enable"] = true,
						},
						["debuffs"] = {
							["enable"] = false,
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["yOffset"] = -2,
							["position"] = "TOP",
						},
						["height"] = 50,
						["width"] = 122,
					},
					["pet"] = {
						["infoPanel"] = {
							["enable"] = true,
							["height"] = 14,
						},
						["debuffs"] = {
							["enable"] = true,
						},
						["threatStyle"] = "NONE",
						["castbar"] = {
							["width"] = 122,
						},
						["height"] = 50,
						["portrait"] = {
							["camDistanceScale"] = 2,
						},
						["width"] = 122,
					},
					["party"] = {
						["horizontalSpacing"] = 3,
						["debuffs"] = {
							["numrows"] = 4,
							["anchorPoint"] = "BOTTOM",
							["perrow"] = 1,
						},
						["power"] = {
							["text_format"] = "",
							["height"] = 5,
						},
						["enable"] = false,
						["rdebuffs"] = {
							["font"] = "Expressway",
						},
						["growthDirection"] = "RIGHT_DOWN",
						["infoPanel"] = {
							["enable"] = true,
						},
						["roleIcon"] = {
							["position"] = "TOPRIGHT",
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["orientation"] = "VERTICAL",
							["text_format"] = "[healthcolor][health:current]",
							["position"] = "RIGHT",
						},
						["healPrediction"] = true,
						["height"] = 59,
						["verticalSpacing"] = 0,
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[namecolor][name:short]",
							["position"] = "LEFT",
						},
						["width"] = 110,
					},
					["player"] = {
						["infoPanel"] = {
							["enable"] = true,
						},
						["debuffs"] = {
							["perrow"] = 7,
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[healthcolor][health:current-max]",
						},
						["power"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[powercolor][power:current-max]",
							["height"] = 15,
						},
						["height"] = 80,
						["castbar"] = {
							["iconAttached"] = false,
							["iconSize"] = 54,
							["height"] = 35,
							["width"] = 478,
						},
						["classbar"] = {
							["height"] = 15,
							["autoHide"] = true,
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[namecolor][name]",
						},
					},
					["raid40"] = {
						["enable"] = false,
						["rdebuffs"] = {
							["font"] = "Expressway",
						},
					},
					["focus"] = {
						["infoPanel"] = {
							["height"] = 17,
							["enable"] = true,
						},
						["threatStyle"] = "NONE",
						["castbar"] = {
							["iconSize"] = 26,
							["width"] = 122,
						},
						["height"] = 56,
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["position"] = "LEFT",
						},
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[healthcolor][health:current]",
						},
						["width"] = 189,
					},
					["target"] = {
						["debuffs"] = {
							["perrow"] = 7,
						},
						["power"] = {
							["attachTextTo"] = "InfoPanel",
							["hideonnpc"] = false,
							["text_format"] = "[powercolor][power:current-max]",
							["height"] = 15,
						},
						["infoPanel"] = {
							["enable"] = true,
						},
						["name"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[namecolor][name]",
						},
						["castbar"] = {
							["iconSize"] = 54,
							["iconAttached"] = false,
						},
						["height"] = 80,
						["buffs"] = {
							["perrow"] = 7,
						},
						["smartAuraPosition"] = "DEBUFFS_ON_BUFFS",
						["health"] = {
							["attachTextTo"] = "InfoPanel",
							["text_format"] = "[healthcolor][health:current-max]",
						},
					},
					["raid"] = {
						["roleIcon"] = {
							["position"] = "RIGHT",
						},
						["debuffs"] = {
							["enable"] = true,
							["sizeOverride"] = 27,
							["perrow"] = 4,
						},
						["rdebuffs"] = {
							["enable"] = false,
							["font"] = "Expressway",
						},
						["growthDirection"] = "UP_RIGHT",
						["health"] = {
							["yOffset"] = -6,
						},
						["width"] = 140,
						["height"] = 28,
						["name"] = {
							["position"] = "LEFT",
						},
						["visibility"] = "[nogroup] hide;show",
						["groupsPerRowCol"] = 5,
					},
					["arena"] = {
						["castbar"] = {
							["width"] = 246,
						},
						["spacing"] = 26,
					},
					["assist"] = {
						["enable"] = false,
					},
				},
			},
			["datatexts"] = {
				["minimapPanels"] = false,
				["fontSize"] = 11,
				["leftChatPanel"] = false,
				["goldFormat"] = "SHORT",
				["panelTransparency"] = true,
				["font"] = "Expressway",
				["panels"] = {
					["BottomMiniPanel"] = "Time",
					["RightMiniPanel"] = "",
					["RightChatDataPanel"] = {
						["right"] = "",
						["left"] = "",
						["middle"] = "",
					},
					["LeftMiniPanel"] = "",
					["LeftChatDataPanel"] = {
						["right"] = "",
						["left"] = "",
						["middle"] = "",
					},
				},
				["rightChatPanel"] = false,
			},
			["actionbar"] = {
				["bar3"] = {
					["inheritGlobalFade"] = true,
					["buttonsize"] = 38,
					["buttonsPerRow"] = 3,
				},
				["fontSize"] = 9,
				["bar2"] = {
					["enabled"] = true,
					["inheritGlobalFade"] = true,
					["buttonsize"] = 38,
				},
				["bar1"] = {
					["heightMult"] = 2,
					["inheritGlobalFade"] = true,
					["buttonsize"] = 38,
				},
				["bar5"] = {
					["inheritGlobalFade"] = true,
					["buttonsize"] = 38,
					["buttonsPerRow"] = 3,
				},
				["globalFadeAlpha"] = 0.87,
				["stanceBar"] = {
					["inheritGlobalFade"] = true,
				},
				["bar6"] = {
					["buttonsize"] = 38,
				},
				["bar4"] = {
					["enabled"] = false,
					["backdrop"] = false,
					["buttonsize"] = 38,
				},
			},
			["layoutSet"] = "dpsMelee",
			["chat"] = {
				["chatHistory"] = false,
				["fontSize"] = 11,
				["tabFont"] = "Expressway",
				["tabFontSize"] = 11,
				["fadeUndockedTabs"] = false,
				["editBoxPosition"] = "ABOVE_CHAT",
				["fadeTabsNoBackdrop"] = false,
				["font"] = "Expressway",
				["panelBackdrop"] = "HIDEBOTH",
			},
			["tooltip"] = {
				["textFontSize"] = 11,
				["font"] = "Expressway",
				["healthBar"] = {
					["font"] = "Expressway",
				},
				["smallTextFontSize"] = 11,
				["fontSize"] = 11,
				["headerFontSize"] = 11,
			},
			["nameplates"] = {
				["filters"] = {
				},
			},
		},
	},
	["gold"] = {
		["Burning Blade"] = {
			["Fallken"] = 4691935062,
		},
	},
	["profileKeys"] = {
		["Fallken - Burning Blade"] = "Fallken - Burning Blade",
	},
	["sle"] = {
		["TimePlayed"] = {
			["Burning Blade"] = {
				["Fallken"] = {
					["Class"] = "DRUID",
					["Level"] = 120,
					["TotalTime"] = 15592866,
					["LevelTime"] = 4808182,
				},
			},
		},
	},
	["faction"] = {
		["Burning Blade"] = {
			["Horde"] = {
				["Fallken"] = 4691935062,
			},
			["Alliance"] = {
			},
		},
	},
}
ElvPrivateDB = {
	["profileKeys"] = {
		["Fallken - Burning Blade"] = "Fallken - Burning Blade",
	},
	["profiles"] = {
		["Fallken - Burning Blade"] = {
			["sle"] = {
				["module"] = {
					["screensaver"] = true,
				},
				["characterGoldsSorting"] = {
					["Burning Blade"] = {
					},
				},
				["pvpreadydialogreset"] = true,
				["minimap"] = {
					["mapicons"] = {
						["enable"] = true,
					},
				},
				["chat"] = {
					["chatHistory"] = {
						["CHAT_MSG_GUILD_ACHIEVEMENT"] = false,
						["CHAT_MSG_EMOTE"] = false,
					},
				},
				["uibuttons"] = {
					["style"] = "dropdown",
				},
				["skins"] = {
					["merchant"] = {
						["enable"] = true,
						["style"] = "List",
					},
					["objectiveTracker"] = {
						["scenarioBG"] = true,
					},
				},
				["equip"] = {
					["setoverlay"] = true,
				},
				["install_complete"] = "3.59",
			},
			["skins"] = {
				["blizzard"] = {
					["questChoice"] = false,
				},
			},
			["general"] = {
				["minimap"] = {
					["hideClassHallReport"] = true,
				},
				["normTex"] = "Polished Wood",
				["chatBubbleFontOutline"] = "OUTLINE",
				["glossTex"] = "Polished Wood",
			},
			["install_complete"] = "11.23",
		},
	},
}
