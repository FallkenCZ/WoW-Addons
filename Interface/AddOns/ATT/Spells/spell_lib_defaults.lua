local addon, ATTdefault = ...

 ATTdefault.Abilities = {
	["GENERAL"] = {
		["ALL"] = {	-- All specs
			{305252, 120}, 	-- Gladiator's Maledict
			{286342, 120}, 	-- Gladiator's Safeguard
		},
	},
	["DRUID"] = {
		["ALL"] = {	-- All specs
			{5211, 50}, -- Mighty Bash
		},
		[102] = {	-- Balance
			{78675, 60}, -- Solar Beam
			{22812, 60},    -- Barkskin
		},
		[103] = {	-- Feral
			{106839, 15}, -- Skull Bash
			{61336, 120, 2}, -- Survival Instincts

		},
		[104] = {	-- Guardian
		},
		[105] = {	-- Restoration
			{22812, 60},    -- Barkskin
			{102342, 60}, -- Ironbark
		},
	},
	["HUNTER"] = {
		["ALL"] = {	-- All specs
			{186265, 180}, 	-- Aspect of the Turtle
			{187650, 30}, -- Freezing Trap
			{53480, 60},  -- Roar of Sacrifice
		},
		[253] = {	-- Beast Mastery
		},
		[254] = {	-- Marksmanship
		},
		[255] = {	-- Survival
		},
	},
	["MAGE"] = 	{
		["ALL"] = {	-- All specs
			{198111, 45}, -- Temporal Shield
			{2139, 24}, 	-- Counterspell
			{45438, 240},   -- Ice Block
			{113724, 45}, -- Ring of Frost
		},
		[62] = {	-- Arcane
		},
		[63] = {	-- Fire
			{31661, 20}, -- Dragon's Breath
		},
		[64] = {	-- Frost

		},
	},
	["PALADIN"] = {
		["ALL"] = {	-- All specs
			{853, 60}, 	-- Hammer of Justice
		},
		[65] = {	-- Holy
			{6940, 120}, -- Blessing of Sacrifice
			{642, 300}, -- Divine Shield
			{216331, 120}, -- Avenging Crusader
			{1022, 300}, -- Blessing of Protection
			{1044, 25}, -- Blessing of Freedom
		},
		[66] = {	-- Protection
			{96231, 15}, -- Rebuke
		},
		[70] = {	-- Retribution
			{642, 300}, -- Divine Shield
			{96231, 15},  -- Rebuke
			{1022, 300}, -- Blessing of Protection
			{1044, 25}, -- Blessing of Freedom
			{210256, 45}, -- Blessing of Sanctuary
			{205191, 60}, -- Eye for an Eye	
		},

	},
	["PRIEST"] = {
		["ALL"] = {	-- All specs
			
		},
		[256] = {	-- Discipline		
			{8122, 60}, 	-- Psychic Scream
			{33206, 180},	-- Pain Suppression
			{62618, 180}, -- Power Word: Barrier
		},
		[257] = {	-- Holy
			{213602, 45}, -- Greater Fade
			{197268, 60}, -- Ray of Hope
			{47788, 180}, -- Guardian Spirit
		},
		[258] = {	-- Shadow
			{47585, 120},  	-- Dispersion
			{8122, 60}, 	-- Psychic Scream
			{15487, 45},   	-- Silence
		},
	},
	["ROGUE"] = {
		["ALL"] = {	-- All specs
			{1766, 15}, 	-- Kick
			{31224, 120},   -- Cloak of Shadows
		},
		[259] = {	-- Assassination
			{5277, 120}, -- Evasion
			{2094, 120},  -- Blind
			{212182, 180},  -- Smoke Bomb

		},
		[260] = {	-- Combat
		},
		[261] = {	-- Subtlety
			{5277, 120}, -- Evasion
			{212182, 180},  -- Smoke Bomb
		},
	},
	["SHAMAN"] = {
		["ALL"] = {	-- All specs
			{108271, 90}, -- Astral Shift
			{57994, 12}, 	-- Wind Shear
			{114052, 180},   -- Ascendance

		},
		[262] = {	-- Elemental

		},
		[263] = {	-- Enhancement
		
		},
		[264] = {	-- Restoration
			{98008, 180},   -- Spirit Link Totem
			{198838, 60},   -- Earthen Wall Totem
		},
	},
	["WARLOCK"] = {
		["ALL"] = {	-- All specs
			{19647, 24}, 	-- Spell Lock
			{104773, 180}, -- Unending Resolve
			{108416, 60}, -- Dark Pact
			{212295, 45}, -- Nether Ward
		},
		[265] = {	-- Affliction
		},
		[266] = {	-- Demonology
		},
		[267] = {	-- Destruction
		},
	},
	["WARRIOR"] = {
		["ALL"] = {	-- All specs
			{6552, 15}, 	-- Pummel
			{236077, 45}, -- Disarm
			{107570, 30}, -- Storm Bolt
		},
		[71] = {	-- Arms
			{5246, 90}, 	-- Intimidating Shout
			{118038, 180}, -- Die by the Sword
		},
		[72] = {	-- Fury
			{5246, 90}, 	-- Intimidating Shout
		},
		[73] = {	-- Protection
		},
	},
	["DEATHKNIGHT"] = {
		["ALL"] = {	-- All specs
			{47528, 15}, 	-- Mind Freeze
			{48707, 60},   	-- Anti-Magic Shell
			{48792, 180}, -- Icebound Fortitude
		},
		[250] = {	-- Blood
		},
		[251] = {	-- Frost
			{212552, 60}, -- Wraith Walk
		},
		[252] = {	-- Unholy
			{108194, 45}, -- Asphyxiate
			{47482, 30}, -- Leap (Interrupt pet)
		},
	},
	["MONK"] = {
		["ALL"] = {	-- All specs
			{119381, 60}, -- Leg Sweep
		},
		[268] = {	-- Brewmaster
		},
		[269] = {	-- Windwalker
			{116705, 15}, -- Spear Hand Strike
			{122470, 90}, -- Touch of Karma
			{201318 , 90}, -- Fortifying Brew
		},
		[270] = {	-- Mistweaver
			{116849, 120}, 	-- Life Cocoon
		},
	},
	["DEMONHUNTER"] = {
		["ALL"] = {
			{198589, 60}, -- Blur
			{183752, 10}, -- Consume Magic
			{217832, 45}, -- Imprison
		},
		[577] = { -- Havoc
            {196718, 180}, -- Darkness
		},
		[581] = { -- Vengeance

		},
	}
}