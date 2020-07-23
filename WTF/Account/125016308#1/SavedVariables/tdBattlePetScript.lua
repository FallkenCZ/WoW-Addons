
TD_DB_BATTLEPETSCRIPT_GLOBAL = {
	["global"] = {
		["version"] = 80100.01,
		["scripts"] = {
			["AllInOne"] = {
			},
			["FirstEnemy"] = {
			},
			["Base"] = {
			},
			["Rematch"] = {
				[71929] = {
					["name"] = "Sully \"The Pickle\" McLeary",
					["code"] = "ability(Swarm of Flies:232) [!enemy.aura(Swarm of Flies:231).exists]\nability(Healing Wave:123) [self.hpp<75]\nability(Swarm of Flies:232) [enemy.aura(Undead:242).exists]\nability(Tongue Lash:228)\nchange(#2) [self(#1).dead & enemy(#2).active]\nability(Lift-Off:170) [enemy(#3).active]\nability(Thrash:202)\nchange(#3)\nability(Call Darkness:256)\nability(Nocturnal Strike:517) [weather(Darkness:257)]\nability(#1)",
				},
				[66730] = {
					["name"] = "Hyuna of the Shrines",
					["code"] = "if [ enemy(#1).active ]\nability(453) [ self.round=1 ]\nability(406)\nendif\nif [ enemy(#2).active ]\nchange(#2) [ self(#1).active ]\nability(710)\nability(384)\nendif\nif [ enemy(#3).active ]\nability(384)\nchange(#1) [ self(#2).dead ]\nability(406)\nendif\nstandby [ self(#1).aura(Stunned:927).exists ]",
				},
				[66738] = {
					["name"] = "Courageous Yon",
					["code"] = "change(#2) [self(#1).active & self.dead]\nchange(#3) [self(#2).active]\nstandby [self(#1).active & enemy(#3).hp<650]\nuse(Emerald Presence:597) [enemy(#1).active & enemy.round=2]\nuse(Emerald Presence:597) [enemy(#2).active & enemy.round=1]\nuse(Proto-Strike:612) [enemy.ability(Burrow:159).usable]\nuse(Emerald Bite:525)\nif [enemy(#3).active & !enemy.hp.full]\n  use(Howl:362) [enemy.hp>740]\n  use(Surge of Power:593)\nendif\nuse(Bite:110)",
				},
				[116792] = {
					["name"] = "Phyxia",
					["code"] = "change(next) [self.dead]\nuse(Toxic Smoke:640) [enemy.hpp<100 & !self.aura(Wind-Up:458).exists]\nuse(Supercharge:208) [enemy(#1).active & self.aura(Wind-Up:458).exists]\nuse(Wind-Up:459)\nuse(Moth Dust:508)\nuse(Cocoon Strike:506)\nuse(Slicing Wind:420)\nstandby",
				},
				[117951] = {
					["name"] = "Illidari Masters: Nameless Mystic",
					["code"] = "ability(Decoy:334) [self(#1).active]\nability(Thunderbolt:779) [!enemy(#1).active]\nability(Breath:115)\nability(Explode:282) [enemy.hp<618]\nability(Missile:777)\nchange(#2)",
				},
				[105386] = {
					["name"] = "Rydyr",
					["code"] = "use(shield:1105) [ round = 1 ]\nuse(filler:384) [ round = 2 ]\nuse(boom:282)\nchange(next)",
				},
				[68564] = {
					["name"] = "Dos-Ryga",
					["code"] = "change(#1) [self(#2).active & self.dead]\nchange(#2) [round=2]\nuse(Supercharge:208) [self.aura(Wind-Up:458).exists]\nuse(Wind-Up:459)\nuse(Howl:362) [self.aura(Undead:242).exists]\nuse(Diseased Bite:499)",
				},
				[161663] = {
					["name"] = "Tempton",
					["code"] = "ability(#2) [!enemy.aura(Shattered Defenses:542).exists]\nability(#3)\nability(#1)",
				},
				[71930] = {
					["name"] = "Shademaster Kiryn",
					["code"] = "if [enemy(Nairn:1288).active]\nability(Black Claw:919) [enemy.round=1]\nability(Hunting Party:921) [enemy.round=2]\nability(Bloodfang:917) [enemy.round=4]\nendif\nif [enemy(Stormoen:1287).active]\nability(Black Claw:919)\nchange(Terrible Turnip:650) [self(#1).dead]\nability(Sons of the Root:828) [self.round=1]\nability(Tidal Wave:419)\nendif\nif [enemy(Summer:1286).active]\nability(Tidal Wave:419) [enemy.round=1]\nability(Tidal Wave:419) [enemy.round=2]\nability(Leech Seed:745) [enemy.round=3]\nability(Tidal Wave:419) [enemy.round=4]\nchange(Iron Starlette:1387) [enemy.round=5]\nability(Supercharge:208) [self.aura(Wind-Up:458).exists]\nability(Wind-Up:459)\nendif",
				},
				[66739] = {
					["name"] = "Wastewalker Shu",
					["code"] = "standby [self(#1).active & enemy(#3).hp<618]\nchange(#2) [self(#1).active & self.dead]\nuse(Arcane Blast:421) [enemy.hp<370]\nuse(Evanescence:440) [self.aura(Whirlpool:512).exists]\nuse(Evanescence:440) [enemy(#3).active & enemy.round=2]\nuse(Moonfire:595) [enemy.round=2]\nuse(Arcane Blast:421)\nuse(Explode:282) [enemy(#3).hp<618]\nuse(Flyby:515)",
				},
				[116793] = {
					["name"] = "Hiss",
					["code"] = "if [enemy(#1).active]\n    ability(513) [enemy.round=1]\n    ability(204) [enemy.round=2]\n    change(#2) [enemy.round=3]\n    ability(710) [self.round=1]\n    ability(384)\nendif\nability(710)\nability(384)\nchange(#1) [self(#2).dead]\nability(204)\nability(424)\nchange(#3) [self(#1).dead]\nability(597) [self.aura(823).duration<=1]\nability(598) [self.hp<1000]\nability(525)",
				},
				[119341] = {
					["name"] = "Mining Monkey",
					["code"] = "ability(Launch Rocket:293) [ !self.aura(Setup Rocket:294).exists ]\nability(Launch Rocket:293) [ self.round>2 ]\nability(Blingtron Gift Package:989) [ !enemy(#1).active ]\nability(#1)\nchange(next)",
				},
				[105387] = {
					["name"] = "Andurs",
					["code"] = "use(Explode:282) [enemy.hp<=620]\nuse(Toxic Smoke:640) [enemy.aura(Toxic Smoke:639).duration!=2]\nuse(Wind-Up:459)",
				},
				[161649] = {
					["name"] = "Rampage",
					["code"] = "ability(Blistering Cold:786)\nability(Chop:943)\nability(Flock:581) [!enemy.aura(Shattered Defenses:542).exists]\nability(Shock and Awe:646)\nability(Ion Cannon:209)\nability(#1)\nstandby\nchange(next)",
				},
				[68462] = {
					["name"] = "Flowing Pandaren Spirit",
					["code"] = "if [enemy(#1).active]\nability(312) [enemy.round=3]\nability(504)\nendif\n\nif [enemy(#2).active]\nability(312)\nability(504)\nendif\n\nif [enemy(#3).active]\nability(312) [enemy.round=4]\nability(504)\nendif",
				},
				[150918] = {
					["name"] = "Tommy the Cruel",
					["code"] = "ability(706) [self.round=1]\nability(119) [self.round=4]\nability(119) [self.round=5]\nstandby [self.round=6]",
				},
				[160205] = {
					["name"] = "Pixy Whizzle",
					["code"] = "ability(Photosynthesis:268) [self.aura(Photosynthesis:267).duration<=2]\nability(Sunlight:404) [weather(Sunny Day:403).duration<=5]\nchange(next)",
				},
				[71931] = {
					["name"] = "Taran Zhu",
					["code"] = "standby [self.aura(Stunned:927).exists]\nstandby [self.aura(Blinded:1014).exists]\nability(Black Claw:919) [round=1]\nability(Infected Claw:117) [enemy.aura(Shattered Defenses:542).exists]\nability(Flock:581)\nability(Curse of Doom:218) [enemy.round=1 & enemy(Yen:1295).dead]\nability(Kick:307) [enemy.round=2 & enemy(Bolo:1292).active & enemy(Yen:1295).dead]\nability(Skull Toss:1483) \nability(Bone Bite:648)\nchange(next)",
				},
				[161650] = {
					["name"] = "Liz",
					["code"] = "ability(Blistering Cold:786)\nability(Chop:943)\nability(Flock:581) [!enemy.aura(Shattered Defenses:542).exists]\nability(Shock and Awe:646)\nability(Ion Cannon:209)\nability(#1)\nchange(next)",
				},
				[116786] = {
					["name"] = "Deviate Smallclaw",
					["code"] = "change(next) [self.dead]\nuse(Moth Dust:508)\nuse(Cocoon Strike:506)\nuse(Slicing Wind:420)\nstandby",
				},
				[116794] = {
					["name"] = "Growing Ectoplasm 1",
					["code"] = "change(#3) [self(#1).dead]\nchange(#2) [self(#3).dead]\nability(334)\nability(115)\nability(597) [self.aura(823).duration<=1]\nability(598) [self.hp<1000]\nability(525)",
				},
				[119342] = {
					["name"] = "Angry Geode",
					["code"] = "use(Squeeze:1572)\nuse(Bubble:934)\nuse(Deep Bite:1372)\nuse(Rend:441)\nchange(next)",
				},
				[160206] = {
					["name"] = "Alran Heartshade",
					["code"] = "if [enemy(Frill:2804).active]\nstandby [self.aura(Stunned:927).exists & !enemy(Ruddy:2805).dead]\nuse(Sear Magic:763) [self.aura(Magma Trap:810).exists & enemy(Ruddy:2805).dead & !enemy(Wanderer:2806).dead]\nuse(Arcane Storm:589)\nuse(Tail Sweep:122) [!enemy.aura(Immolation:408).exists]\nuse(Tail Sweep:122) [enemy(Ruddy:2805).dead & enemy(Wanderer:2806).dead]\nuse(Sear Magic:763) [self.aura(Magma Trap:810).exists]\nchange(#2) [enemy.aura(Immolation:408).exists & !self.aura(Magma Trap:810).exists]\n\nuse(Stoneskin:436) [!self.aura(Stoneskin:435).exists]\nuse(Stoneskin:436) [self.aura(Stoneskin:435).duration<=2]\nuse(Headbutt:376)\nuse(Deep Bite:1372)\n\nchange(#1) [self(#2).active]\nstandby [self(#3).aura(Stunned:927).exists]\nchange(next)\nendif\n\nif [enemy(Ruddy:2805).active]\nchange(#2) [self(#1).active]\nuse(Diseased Bite:499) [enemy.hp<218]\nuse(Plagued Blood:657) [!enemy.aura(Plagued Blood:658).exists]\nuse(Acidic Goo:369) [!enemy.aura(Acidic Goo:368).exists & enemy.hpp>70]\nuse(Plagued Blood:657) [enemy.aura(Plagued Blood:658).duration=1]\nuse(Diseased Bite:499)\nendif\n\nif [enemy(Wanderer:2806).active]\nuse(Plagued Blood:657) [!enemy.aura(Plagued Blood:658).exists]\nuse(Acidic Goo:369) [!enemy.aura(Acidic Goo:368).exists & enemy.hpp>70]\nuse(Stoneskin:436) [!self.aura(Stoneskin:435).exists]\nuse(Stoneskin:436) [self.aura(Stoneskin:435).duration=1]\nuse(Deep Bite:1372)\nchange(next)\nendif",
				},
				["Wastewalker Shu (2)"] = {
					["name"] = "Wastewalker Shu (2)",
					["code"] = "standby [self(#1).active & enemy(#3).hp<618]\nchange(#2) [self(#1).active & self.dead]\nuse(Arcane Blast:421) [enemy.hp<370]\nuse(Evanescence:440) [self.aura(Whirlpool:512).exists]\nuse(Evanescence:440) [enemy(#3).active & enemy.round=2]\nuse(Moonfire:595) [enemy.round=2]\nuse(Arcane Blast:421)\nuse(Explode:282) [enemy(#3).hp<618]\nuse(Flyby:515)",
				},
				[161651] = {
					["name"] = "Ralf",
					["code"] = "ability(Blistering Cold:786)\nability(Chop:943)\nability(Flock:581) [!enemy.aura(Shattered Defenses:542).exists]\nability(Shock and Awe:646)\nability(Ion Cannon:209)\nability(#1)\nchange(next)",
				},
				[105674] = {
					["name"] = "Chopped",
					["code"] = "quit [ self(#3).dead ]\nchange(#3) [ enemy(#3).active & !self(#3).played ]\nchange(#2) [ self(#1).dead ]\nability(Crouch:165) [ round = 1 ]\nability(Burn:113) [ round > 2 & enemy(#1).active ]\nability(Flamethrower:503)\nability(Ironskin:1758)\nability(Predatory Strike:518) [ enemy.aura(Shattered Defenses:542).exists ]\nability(Falcosaur Swarm!:1773)\nstandby",
				},
				[160207] = {
					["name"] = "Therin Skysong",
					["code"] = "if [enemy(#1).active & self(#2).active]\nability(Sunlight:404) [enemy.aura(Mechanical:244).exists & enemy.hp<155 & self.aura(Photosynthesis:267).duration=5]\nability(Photosynthesis:268) [enemy.aura(Mechanical:244).exists & enemy.hp<155 & self.ability(Sunlight:404).usable]\nability(Sunlight:404) \nability(Photosynthesis:268) [self.aura(Photosynthesis:267).duration<3]\nability(Photosynthesis:268) [weather(Sunny Day:403).duration=9]\nability(Solar Beam:753) \nendif\n\nif [enemy(#2).active & self(#2).active]\nability(Sunlight:404)\nability(Solar Beam:753) [enemy.ability(Interrupting Jolt:938).duration=1]\nendif\n\nability(Disruption:1123) [round=1]\nability(Life Exchange:277) [round=4]\nability(Dodge:312)\nability(Stampede:163)\nability(#1)\nchange(next)",
				},
				[71924] = {
					["name"] = "Wrathion",
					["code"] = "use(Burrow:159) [self.aura(Ice Tomb:623).duration=1]\nuse(Toxic Skin:1087) [enemy.aura(Undead:242).exists]\nuse(Scratch:119)\n\nif [enemy(Dah'da:1300).active]\nuse(Prowl:536)\nuse(Roar of the Dead:2071)\nuse(Amber Prison:1026)\n\nuse(Call Darkness:256)\nuse(Tornado Punch:1052)\nuse(Takedown:221) [enemy.aura(Stunned:1030).exists]\nendif\n\nuse(Jab:219)\nuse(Club:1079)\nuse(Onyx Bite:437)\nuse(Pounce:535)\nuse(Sticky Web:339)\n\nstandby [self.aura(Stunned:927).exists]\nchange(#2)\nuse(#1)",
				},
				[155413] = {
					["name"] = "Postmaster Malown",
					["code"] = "if [enemy(#1).active]\n ability(Flurry:360) [enemy.aura(Shattered Defenses:542).exists]\n ability(Dodge:312)\n ability(Stampede:163)\nendif\n\nability(Stampede:163)\nability(Flame Breath:501) [enemy(#2).active]\nability(Glowing Toxin:270) [!enemy.aura(Glowing Toxin:271).exists]\nability(Burrow:159)\nability(#1)\nchange(next)",
				},
				[79179] = {
					["name"] = "Deebs, Tyri and Puzzle",
					["code"] = "ability(Sweep:457) [ round=1 ]\nchange(next) [ !self(#3).active & !self(#3).played ]\nability(Wind-Up:459) [ enemy(#3).active ]\nability(#1)\nability(#2)\nability(#3)\nchange(#1)",
				},
				[66741] = {
					["name"] = "Aki the Chosen",
					["code"] = "change(#2) [self(#1).dead]\nchange(#2) [self(#3).played]\nchange(#3) [enemy(#3).active & enemy.round = 5]\nability(Vicious Slice:1223) [round=1]\nability(Headbutt:376) [round=5]\nability(Vicious Slice:1223) [enemy.aura(Shattered Defenses:542).exists]\nability(Stampede:163)\nability(Tail Sweep:122) [enemy(#2).active]\nability(Lift-Off:170)\nability(Healing Flame:168)\nability(Tail Sweep:122)",
				},
				[116787] = {
					["name"] = "Deviate Flapper",
					["code"] = "change(next) [self.dead]\nuse(Moth Dust:508)\nuse(Cocoon Strike:506)\nuse(Slicing Wind:420)\nstandby",
				},
				[116795] = {
					["name"] = "Everliving Spore",
					["code"] = "change(#2) [self(#1).dead]\nchange(#3) [self(#2).dead]\nif [enemy(#1).active]\n    ability(919) [enemy.round=1]\n    ability(1370) [enemy.aura(542).exists]\n    ability(581)\nendif\nability(919) [!enemy.aura(918).exists]\nability(581)\nability(597) [self.aura(823).duration<=1]\nability(598) [self.hp<1000]\nability(525)",
				},
				[104992] = {
					["name"] = "Meet The Maw",
					["code"] = "change(#3) [self(#2).active]\nuse(Black Claw:919) [self.round=1]\nuse(Hunting Party:921) [self.round=2]\nchange(#2)",
				},
				[160208] = {
					["name"] = "Zuna Skullcrush",
					["code"] = "change(#2) [round~3,16]\nchange(#3) [round~8]\nchange(#1) [round~13]\n\n-- exs\nability(484) [self.aura(1033).exists & enemy(#3).active]\nability(1032) [enemy(#3).active & !self(#3).dead]\n\n-- (#1)\nability(465)\nability(1032) \n\n--(#2)\nstandby [enemy.aura(267).exists]\nability(163) [enemy(#3).active]\nability(519)\nability(1583)\n\n--(#3)\nability(919) [!enemy.aura(918).exists]\nability(921)\nability(917)\n\nchange(#1) [enemy(#3).active & self(#2).dead]",
				},
				[155414] = {
					["name"] = "Fras Siabi",
					["code"] = "use(Shell Armor:1380)\nuse(Pinch:2067) [enemy.hp<286]\nuse(Whirlpool:513)\nuse(Pinch:2067)\nchange(#3) [enemy(Infectus:2770).active]\nchange(#3) [enemy(Pyro:2769).aura(Stunned:927).exists & !enemy(Pyro:2769).aura(Rooted:248).exists]\nuse(Tornado Punch:1052) [enemy(Pyro:2769).hp<335]\nuse(Jab:219) [enemy(Pyro:2769).hp<188]\nuse(Dodge:312) [self.aura(Elementium Bolt:605).exists]\nstandby [enemy.aura(Undead:242).exists]\nuse(Tornado Punch:1052)\nuse(Jab:219)\nuse(Swarm:706) [enemy.aura(Black Claw:918).exists]\nuse(Skitter:626) [enemy.aura(Shattered Defenses:542).exists]\nuse(Skitter:626) [enemy.hp<155]\nuse(Black Claw:919)\nchange(next)\nability(#1)",
				},
				[150858] = {
					["name"] = "Blackmane",
					["code"] = "standby [enemy.aura(Undead:242).exists]\nstandby [round=5]\nability(Ironskin:1758)\nstandby [enemy.aura(Dodge:2060).exists]\nability(Predatory Strike:518) [enemy.aura(Shattered Defenses:542).exists & enemy.hpp>5 & self(#1).active]\nability(Predatory Strike:518) [enemy.aura(Shattered Defenses:542).exists & self(#2).active]\nability(Falcosaur Swarm!:1773)\nability(#1)\nchange(next)",
				},
				[68464] = {
					["name"] = "Whispering Pandaren Spirit",
					["code"] = "ability(611) [self.round> 2]\nability(299)\nchange(#2) [self(#1).dead]\nability(779)\nability(115)\nstandby",
				},
				["Shademaster Kiryn"] = {
					["name"] = "Shademaster Kiryn",
					["code"] = "if [ self(Sister of Temptation:1628).active & enemy(Nairn:1288).active ]\n    ability(Curse of Doom:218) [ round=1 ]\n    ability(Shadow Shock:422)\nendif\nif [ self(Sister of Temptation:1628).active & enemy(Stormoen:1287).active & !enemy(Summer:1286).played ]\n    ability(Lovestruck:772)\n    ability(Curse of Doom:218)\nendif\nchange(Ashstone Core:1150) [ self(#3).active ]\nchange(#3) [ self(Sister of Temptation:1628).active & enemy(Summer:1286).active & !enemy(Stormoen:1287).dead & enemy.round=1 ]\nif [ self(Ashstone Core:1150).active & enemy(Summer:1286).active & !enemy(Stormoen:1287).dead ]\n    ability(Crystal Prison:569)\n    ability(Stoneskin:436)\nendif\nability(Burn:113) [ self(Ashstone Core:1150).active & enemy(Stormoen:1287).active & !enemy(Summer:1286).dead ]\nif [ self(Ashstone Core:1150).active & enemy(Summer:1286).active & enemy(Stormoen:1287).dead ]\n    ability(Stoneskin:436) [ enemy.round=1 ]\n    standby [ enemy.round=2 ]\n    ability(Crystal Prison:569) [ enemy.round=3 ]\n    ability(Burn:113) [ enemy.round=4 ]\n    ability(Burn:113) [ enemy.round=5 ]\n    change(Sister of Temptation:1628) [ enemy.round=6 ]\nendif\nif [ self(Sister of Temptation:1628).active & enemy(Summer:1286).active & enemy(Stormoen:1287).dead ]\n    standby [ self.round=1 ]\n    ability(Lovestruck:772) [ self.round=3 ]\n    ability(Shadow Shock:422)\nendif",
				},
				[119407] = {
					["name"] = "Cookie's Leftovers",
					["code"] = "standby [ self.aura(926).exists & self.speed.fast ]\nability(334)\nability(779)\nability(115)\nchange(#2)\nability(312) [ enemy.ability(#3).usable ]\nability(574) [ self.aura(820).duration < 2 & self.speed.slow ]\nability(574) [ !self.aura(820).exists ]\nability(504)",
				},
				[160209] = {
					["name"] = "Horu Cloudwatcher",
					["code"] = "ability(Dead Man's Party:1093) [!enemy.aura(Shattered Defenses:542).exists]\nability(Dead Man's Party:1093) [enemy(#2).active]\nability(Explode:282) [enemy(#3).active & enemy.round=3]\nability(Ion Cannon:209)\nability(#1)\nchange(next)",
				},
				[146001] = {
					["name"] = "Prototype Annoy-O-Tron",
					["code"] = "ability(Blistering Cold:786) [ self.round = 1 ]\nchange(Ikky:1532) [ self.round = 2 ]\nability(Black Claw:919) [ !enemy.aura(Black Claw:918).exists ]\nability(Flock:581)",
				},
				[71933] = {
					["name"] = "Blingtron 4000",
					["code"] = "use(350) [round=1]\nchange(#2) [round=2]\nchange(#1) [enemy(#1).dead]\nuse(#3) [self(#1).active & self(#1).aura(544).exists]\nuse(#2) [self(#1).active]\nuse(#2) [self(#2).active & self(#2).aura(309).duration<=1]\nuse(#3) [self(#2).active]",
				},
				[66734] = {
					["name"] = "Farmer Nishi",
					["code"] = "if [enemy(#1).active]\nability(453)\nability(490) [self.round> 2]\nability(406)\nendif\nif [enemy(#2).active]\nstandby [enemy.round <= 3]\nstandby [enemy.round=11]\nstandby [enemy.round= 12]\nability(490) [enemy.round=4]\nability(490) [enemy.round=9]\nability(490) [enemy.round=14]\nability(453) [enemy.round=10]\nability(406)\nendif\nif [enemy(#3).active]\nstandby [enemy.round=2]\nability(490) [enemy.round=3]\nability(406) [enemy.round= 1]\nchange(#2) [self(#1).active]\nability(646)\nability(777) [enemy.round = 6]\nability(209)\nendif",
				},
				["Wise Mari"] = {
					["name"] = "Wise Mari",
					["code"] = "if [enemy(#1).active]\nability(453)\nability(490)\nability(406)\nendif\nif [enemy(#2).active]\nchange(#2) [self(#1).active]\nability(334) [enemy.round= 2]\nability(779)\nability(115)\nendif\nif [enemy(#3).active]\nchange(#1) [self(#2).active]\nability(453)\nability(490)\nability(406)\nendif",
				},
				[116788] = {
					["name"] = "Deviate Chomper",
					["code"] = "ability(Evanescence:440)\nability(Forboding Curse:1068) [!enemy.aura(Forboding Curse:1067).exists]\nability(#1)\nchange(next)",
				},
				[119344] = {
					["name"] = "Klutz's Battle Bird",
					["code"] = "ability(589)\nability(489)\nability(122)\nchange(#2)\nability(597) [ self.aura(823).duration < 2 & self.speed.slow ]\nability(597) [ !self.aura(823).exists ]\nability(598) [ self.hpp < 50 ]\nability(525)",
				},
				[150923] = {
					["name"] = "Belchling",
					["code"] = "ability(Dodge:312) [enemy.aura(Undead:242).exists]\nability(Great Sting:1966)\nability(Cleave:1273)\nability(Flurry:360)\nchange(next)",
				},
				[160210] = {
					["name"] = "Tasha Riley",
					["code"] = "standby [enemy.aura(Undead:242).exists]\nability(Black Claw:919) [!enemy.aura(Black Claw:918).exists]\nability(Swarm:706)\nability(Inflation:1002) [enemy(#3).active]\nability(Ion Cannon:209) [enemy(#3).aura(Shattered Defenses:542).exists & enemy.hp<1152]\nability(#2)\nability(#3)\nability(#1)\nchange(next)",
				},
				[146002] = {
					["name"] = "Gnomeregan Guard Wolf",
					["code"] = "ability(508)\nability(506)\nability(504)\nchange(next)",
				},
				[105779] = {
					["name"] = "Threads of Fate",
					["code"] = "ability(#1) [ enemy.round~1,2 ] \nability(#2) [ enemy(#3).hp<556 ] \nability(#3) [ enemy(#3).active & enemy.hp>555 ] \nability(#1) \nchange(#2)",
				},
				[161662] = {
					["name"] = "Char",
					["code"] = "standby [enemy.aura(Undead:242).exists]\nability(Chew:541) [round=1]\nability(Stampede:163) [round=2]\nability(#1)\nchange(next)",
				},
				[85519] = {
					["name"] = "Christoph VonFeasel",
					["code"] = "if [ self(Enchanted Broom:213).active ]\nability(Sweep:457) [ self.round == 1 ]\nability(Wind-Up:459) [ self.round ==2 ]\nchange(Iron Starlette:1387) [ self.round ==3 ]\nendif\nif [ self(Iron Starlette:1387).active ]\nability(Wind-Up:459) [ self.round ==1 ]\nability(Supercharge:208) [ self.round ==2 ]\nability(Wind-Up:459) [ self.round ==3 ]\nability(Toxic Smoke:640) [ self.round > 3 ]\nchange(#2) [ self(Iron Starlette:1387).dead ]\nendif\nchange(Enchanted Broom:213) [ self(#2).active ]\nif [ self(Enchanted Broom:213).active ]\nability(Sweep:457) [ self.round ==1 ]\nability(Wind-Up:459) [ self.round > 1 & self.round < 5 ]\nability(Batter:455) [ self.round > 4 ]\nendif",
				},
				[68465] = {
					["name"] = "Thundering Pandaren Spirit",
					["code"] = "if [enemy(#1).active]\nability(Dive:564) [self.round =1]\nability(Acidic Goo:369) [self.round =3]\nability(Ooze Touch:445)\nendif\n\nif [enemy(#2).active]\nability(Acidic Goo:369) [enemy.round =1]\nability(Ooze Touch:445)\nchange(#2) [self(#1).dead]\nability(777)\nendif\n\nif [enemy(#3).active]\nability(334) [enemy.round =2]\nability(282) [enemy.hp < 618]\nability(777)\nendif",
				},
				[146003] = {
					["name"] = "Gnomeregan Guard Tiger",
					["code"] = "change(next) [ self.dead ] \nchange(#3) [ enemy.type = 5 ] \nability(173) [ self.hp < 1000 ] \nability(1354) \nability(#1)",
				},
				[119408] = {
					["name"] = "\"Captain\" Klutz",
					["code"] = "standby [ enemy.round < 3 ]\nability(218)\nability(652)\nchange(#2)\nability(919) [ !enemy.aura(918).exists ]\nability(581)",
				},
				[161656] = {
					["name"] = "Splint",
					["code"] = "standby [round=1]\nability(#2) [!enemy.aura(Creeping Fungus:742).exists]\nability(Haunt:652)\nability(#1)\nchange(next)",
				},
				[71926] = {
					["name"] = "Lorewalker Cho",
					["code"] = "ability(Life Exchange:277) [enemy(#2).active]\nability(Moonfire:595)\nif [enemy(#3).active]\n  ability(Plagued Blood:657) [!enemy.aura(Plagued Blood:658).exists]\n  ability(Death and Decay:214) [!enemy.aura(Death and Decay:213).exists]\n  ability(Kick:307)\nendif\nability(#1)\nchange(#2)",
				},
				[71934] = {
					["name"] = "Dr. Ion Goldbloom",
					["code"] = "change(#2) [enemy(#1).hp<800]\nability(Arcane Storm:589) [round=1]\nability(Shock and Awe:646) [self.round=1]\nif [enemy(#1).active]\n  standby [enemy.round=1]\n  ability(Ion Cannon:209)\nendif\nability(#1)\nchange(#2)\nchange(#3)",
				},
				[67370] = {
					["name"] = "Jeremy Feasel",
					["code"] = "change(#3) [self(#2).active]\nstandby [self.aura(Stunned:927).exists]\nability(Crystal Prison:569) [enemy(#1).active & enemy.hp>235]\nchange(#2) [!self(#2).played & enemy(#3).active]\nability(Burn:113)\nability(Extra Plating:392) [self.round=1]\nability(Make it Rain:985) [self.speed.slow]\nability(Make it Rain:985) [!enemy.aura(Make it Rain:986).exists]\nability(SMCKTHAT.EXE:983)\nchange(#1)",
				},
				[104970] = {
					["name"] = "Dealing with Satyrs",
					["code"] = "if [enemy(#1).active]\n    ability(564) [self.round=1]\n    ability(369) [self.round=3]\n    ability(449)\nendif\nif [ enemy(#2).active ]\n    ability(369) [enemy.round=1]\n    change(#2)\n    ability(115)\nendif\nif [enemy(#3).active]\n    ability(334) [enemy.round=1]\n    ability(779) [enemy.round=2]\n    ability(115)\n    change(#3) [self(#2).dead & !self(#3).played]\n    change(#1)\n    ability(369) [self.round=1]\n    ability(564) [self.round=2]\n    ability(449)\nendif",
				},
				[116789] = {
					["name"] = "Son of Skum",
					["code"] = "ability(Black Claw:919) [!enemy.aura(Black Claw:918).exists]\nability(#1) [enemy.aura(Shattered Defenses:542).exists]\nability(Flock:581)\nability(Mana Surge:489)\nability(#1)\nchange(next)",
				},
				[155145] = {
					["name"] = "Plagued Critters",
					["code"] = "ability(Rain Dance:1062) [ round>2 ]\nability(Water Jet:118) [enemy(#2).dead & enemy(#3).dead]\nability(Tidal Wave:419)\nchange(next)",
				},
				[119345] = {
					["name"] = "Klutz's Battle Monkey",
					["code"] = "ability(Ironskin:1758) [ round>2 ]\nability(Predatory Strike:518) [ enemy.aura(Shattered Defenses:542).exists & enemy.hpp>25 ]\nability(#1)\nchange(#2)",
				},
				[145988] = {
					["name"] = "Pulverizer Bot Mk 6001",
					["code"] = "standby [ self.aura(Lightning Shield:907).exists ] \nability(Lightning Shield:906) \nability(#1)",
				},
				[146004] = {
					["name"] = "Gnomeregan Guard Mechanostrider",
					["code"] = "change(next) [ self.dead ]\nability(Photosynthese:268) [ !self.aura(Photosynthese:267).exists ]\nability(Sonnenlicht:404) [ !weather(Sonnenschein:403) ]\nability(Panzerschild:310) [ !self.aura(Panzerschild:309).exists ]\nstandby [ enemy.aura(Untot:242).exists ]\nability(#1)",
				},
				[66918] = {
					["name"] = "Seeker Zusshi",
					["code"] = "if [enemy(#1).active]\nability(453)\nability(490)\nability(406)\nendif\n\nif [enemy(#2).active]\nability(490) [enemy.round=3]\nability(406) [enemy.round <=2]\nchange(#2) [self(#1).active]\nability(597) [!self.aura(823).exists]\nability(612) [enemy.round= 8]\nability(525)\nendif\n\nif [enemy(#3).active]\nability(525)\nchange(#1) [self(#2).dead]\nability(490) [enemy.aura(269).exists]\nability(453)\nability(406)\nstandby\nendif",
				},
				[161657] = {
					["name"] = "Ninn Jah",
					["code"] = "ability(Black Claw:919) [round=1]\nability(Flock:581) [!enemy.aura(Shattered Defenses:542).exists]\nability(Predatory Strike:518)\nability(#1)\nchange(next)",
				},
				[119343] = {
					["name"] = "Klutz's Battle Rat",
					["code"] = "ability(Frenzyheart Brew:740) [ !self.aura(Frenzy:739).exists ]\nability(Maul:345)\nability(#1)\nchange(next)",
				},
				[150929] = {
					["name"] = "Nefarious Terry",
					["code"] = "standby [enemy.aura(Undead:242).exists]\nability(Whirlpool:513) [round=1]\nability(Scratch:119) [enemy.aura(Shattered Defenses:542).exists]\nability(Stampede:163)\nability(#1)\nchange(next)",
				},
				[146005] = {
					["name"] = "Bloated Leper Rat",
					["code"] = "change(next) [ self.dead ] \nability(218) [ !enemy.aura(217).exists ] \nability(652) \nability(919) [ !enemy.aura(918).exists ] \nability(581) \nability(#1)",
				},
				[119409] = {
					["name"] = "Foe Reaper 50",
					["code"] = "ability(418)\nability(564)\nability(118)\nchange(#2)\nability(#1)",
				},
				[117934] = {
					["name"] = "Illidari Masters: Sissix",
					["code"] = "standby [enemy.aura(Undead:242).exists]\nchange(#2) [self(#3).active]\nuse(Ironskin:1758) [round=1]\nuse(Predatory Strike:518) [enemy.aura(Shattered Defenses:542).exists]\nuse(Powerball:566) [enemy.hp<333]\nif [self.aura(Wind-Up:458).exists]\n  use(Powerball:566) [!self.aura(Speed Boost:831).exists & self.power<341]\n  use(Supercharge:208)\nendif\nuse(Falcosaur Swarm!:1773)\nuse(Wind-Up:459)\nchange(#3)",
				},
				[71927] = {
					["name"] = "Chen Stormstout",
					["code"] = "standby [ self.aura(Stunned:927).exists ]\nif [ self(Menagerie Custodian:1227).active ]\nability(Shock and Awe:646) [ enemy(Tonsa:1282).active ]\nability(Ion Cannon:209) [ enemy(Tonsa:1282).active ]\nability(Zap:116)\nchange(Lil' Bad Wolf:1226) [ self.dead ]\nendif\nif [ self(Lil' Bad Wolf:1226).active ]\nability(Howl:362)\nability(Claw:429)\nchange(Shimmershell Snail:493) [ self.dead ]\nendif\nif [ self(Shimmershell Snail:493).active ]\nability(Dive:564)\nability(Absorb:449)\nendif",
				},
				["Growing Ectoplasm 2"] = {
					["name"] = "Growing Ectoplasm 2",
					["code"] = "change(#2) [self(#1).dead]\nchange(#3) [self(#2).dead]\nif [enemy(#1).active]\n    ability(919) [!enemy.aura(918).exists]\n    ability(921)\n    ability(364) [enemy.aura(542).exists]\nendif\nability(919) [!enemy.aura(918).exists]\nability(921)\nability(597) [self.aura(823).duration<=1]\nability(598) [self.hp<1000]\nability(525)",
				},
				[161658] = {
					["name"] = "Shred",
					["code"] = "use(ToxcSkn:1087) [self.aura(1086).duration<=1]\nuse(EmeralDr:598)\nuse(#1)",
				},
				[72291] = {
					["name"] = "Yu'la, Broodling of Yu'lon",
					["code"] = "standby [self.aura(Ice Barrier:480).exists]\nability(Claw:429) [round=1]\nability(Ice Tomb:624)\nability(Ice Barrier:479)\nability(#1)",
				},
				[116790] = {
					["name"] = "Vilefang",
					["code"] = "ability(Ironskin:1758)\nability(Predatory Strike:518) [enemy.aura(Shattered Defenses:542).exists]\nability(#1)\nchange(next)",
				},
				[150911] = {
					["name"] = "Crypt Fiend",
					["code"] = "standby [enemy(#3).active & enemy.aura(Undead:242).exists]\n\nability(Drain Blood:1043) [enemy(#2).type=4 & enemy(#1).aura(Undead:242).exists]\nability(Drain Blood:1043) [enemy(#3).type=4 & enemy(#2).aura(Undead:242).exists]\nability(Drain Blood:1043) [enemy(#2).type=2 & enemy(#1).aura(Undead:242).exists]\nability(Drain Blood:1043) [enemy(#3).type=2 & enemy(#2).aura(Undead:242).exists]\nchange(#2) [enemy(#1).aura(Undead:242).exists & enemy(#2).type=6]\nchange(#2) [enemy(#2).aura(Undead:242).exists & enemy(#3).type=6] \n-----------------------------\nability(Lift-Off:170) [round=2]\nability(Decoy:334) [enemy.round=2]\nability(Thunderbolt:779)\nability(Drain Blood:1043) [!enemy(#1).active]\nchange(#1) [self(#2).active & enemy.type=4]\nability(#1)\nchange(next)",
				},
				[119346] = {
					["name"] = "Unfortunate Defias",
					["code"] = "change(next) [self.dead]\nstandby [enemy.aura(Undead:242).exists]\nuse(Dodge:312) [enemy.round=1]\nuse(Stampede:163) [enemy.round=2]\nuse(Flurry:360)\nuse(Moth Dust:508)\nuse(Cocoon Strike:506)\nuse(Slicing Wind:420)\nstandby",
				},
				[150922] = {
					["name"] = "Sludge Belcher",
					["code"] = "standby [enemy.aura(Undead:242).exists]\nability(Flurry:360) [enemy.aura(Shattered Defenses:542).exists]\nability(Dodge:312)\nability(Stampede:163)\nchange(next)",
				},
				[145971] = {
					["name"] = "Cockroach",
					["code"] = "standby [enemy.aura(Dodge:2060).exists]\nstandby [enemy.aura(Undead:242).exists] \nability(Rampage:124)\nability(Leap:364) [enemy(Cockroach:2486).active]\nability(Claw:429) [self.ability(Claw:429).strong]\nability(Ice Tomb:624) \nability(Frost Nova:414) [self.ability(Frost Nova:414).strong]\nability(Unstable Shield:1598)\nability(Burrow:159) [self.round>3]\nability(#1)\nchange(next)",
				},
				[145968] = {
					["name"] = "Leper Rat",
					["code"] = "ability(#3) [!enemy.aura(502).exists]\nstandby [enemy.aura(2060).exists] \nstandby [enemy.aura(242).exists]\nability(2067) [enemy.aura(542).exists]\nability(2067) [enemy(2486).active]\nability(163)\nability(179) [enemy.aura(502).exists]\nability(503) [self.ability(503).strong]\nability(#1) \nchange(next)",
				},
				[146932] = {
					["name"] = "Door Control Console",
					["code"] = "ability(Acidic Goo:369) [ enemy.hp.full ]\nuse(Dive:564) [round=2] \nuse(Dive:564) [self.aura(Ice Tomb:623).duration=1] \nuse(Dive:564) [self.aura(Sewage Eruption:2063).duration=1] \nuse(Ooze Touch:445) \nchange(next)",
				},
				[146181] = {
					["name"] = "Living Permafrost",
					["code"] = "ability(1087) [self.aura(1086).duration<=1]\nstandby [self.speed.slow & enemy.ability(2239).usable]\nstandby [enemy.aura(2060).exists]\nstandby [enemy.aura(242).exists]\nability(159) [self.ability(159).strong]\nability(429) [self.ability(429).strong]\nability(179) [enemy.aura(502).exists]\nability(503)\nability(#1)\nchange(next)",
				},
				[150925] = {
					["name"] = "Liz the Tormentor",
					["code"] = "ability(Black Claw:919) [self.round=1]\nability(Hunting Party:921) [self.round=2]\nability(Leap:364) \nchange(next)",
				},
				[72285] = {
					["name"] = "Chi-Chi, Hatchling of Chi-Ji",
					["code"] = "ability(Immolation:409) [!self.aura(Immolation:408).exists]\nability(Wild Magic:592) [!enemy.aura(Wild Magic:591).exists]\nability(Acidic Goo:369) [self.round=1]\nability(Dive:564) [self.round=4]\nchange(#2)\nability(#1)",
				},
				["Aki the Chosen"] = {
					["name"] = "Aki the Chosen",
					["code"] = "if [enemy(#1).active]\nability(436) [!self.aura(435).exists]\nability(406)\nendif\nif [enemy(#2).active]\nability(490) [enemy.round=1]\nability(436) [self.aura(435).duration < 2]\nability(406)\nendif\nif [enemy(#3).active]\nability(436) [enemy.round=1]\nability(490) [enemy.round=2]\nability(406)\nchange(#2) [self(#1).dead]\nability(312) [enemy.aura(830).exists]\nability(574) [!self.aura(820).exists]\nability(504)\nendif",
				},
				[150917] = {
					["name"] = "Huncher",
					["code"] = "standby [enemy.aura(Undead:242).exists]\nability(Flurry:360) [enemy.aura(Shattered Defenses:542).duration=2]\nability(Dodge:312)\nability(Flurry:360) [enemy.hp<=309]\nability(Stampede:163)\nability(#1)\nchange(next)",
				},
				[97709] = {
					["name"] = "Flummoxed",
					["code"] = "ability(218)\nability(652)\nchange(#2) [self(#1).dead]\nability(919) [!enemy.aura(918).exists]\nability(581)",
				},
				[72009] = {
					["name"] = "Xu-Fu, Cub of Xuen",
					["code"] = "ability(Black Claw:919) [round=1]\nability(Swarm:706)\nability(#1)\nchange(next)",
				},
				[98270] = {
					["name"] = "My Beast's Bidding",
					["code"] = "if [enemy(#3).active]\nchange(#2) [!self(#2).played]\nchange(#3) [self(#2).active]\nability(646)\nability(209)\nendif\nability(392)\nability(985) [!enemy.aura(986).exists]\nability(983)",
				},
				[146182] = {
					["name"] = "Living Sludge",
					["code"] = "use(def:310) [ self.aura(def:309).duration <= 1 ]\nuse(heal:511) [ !self.aura(heal:510).exists ]\nuse(filler:509)\nuse(#1)\nchange(#3) [ enemy.type = 10 ]\nchange(next)",
				},
				[116791] = {
					["name"] = "Dreadcoil",
					["code"] = "if [enemy(#1).active]\n    ability(392) [self.round=1]\n    ability(985) [self.round=2]\n    ability(1002)\nendif\nability(1002)\nchange(#2) [self(#1).dead]\n\nability(#3) [enemy.hp<618 & enemy.type !~ 3]\nability(#3) [enemy.hp<406 & enemy.type ~ 3]\nability(#2) [!self(#2).aura(820).exists]\nability(#1)",
				},
				[72290] = {
					["name"] = "Zao, Calfling of Niuzao",
					["code"] = "ability(Ironskin:1758) [round=1]\nability(Predatory Strike:518) [enemy.aura(Shattered Defenses:542).exists]\nability(Savage Talon:1370) [enemy.aura(Shattered Defenses:542).exists]\nability(Falcosaur Swarm!:1773)\nchange(next)",
				},
				[117950] = {
					["name"] = "Illidari Masters: Madam Viciosa",
					["code"] = "change(#3) [self.aura(Decoy:333).exists & !self(#3).played]\nchange(#2) [self(#3).active]\nstandby [round=1]\nstandby [self.aura(Stunned:927).exists]\nuse(Curse of Doom:218) [enemy(#3).active]\nuse(Haunt:652) [enemy(#2).active]\nuse(Shadow Slash:210)\nif [enemy(#3).active]\n  use(Decoy:334) [enemy.round=1]\n  use(Thunderbolt:779)\nendif\nuse(Breath:115)\nchange(#1)",
				},
				[155267] = {
					["name"] = "Risen Guard",
					["code"] = "standby [enemy.aura(Undead:242).exists]\nability(Flurry:360) [round=1]\nability(Flurry:360) [enemy.aura(Shattered Defenses:542).exists]\nability(Dodge:312)\nability(Stampede:163)\nchange(next)",
				},
				[71932] = {
					["name"] = "Wise Mari",
					["code"] = "ability(Deflection:490) [enemy.aura(Underwater:830).exists]\nchange(Anubisath Idol:1155) [enemy(River:1297).active]\nchange(Mechanical Pandaren Dragonling:844) [enemy(Spirus:1298).active]\nability(Sandstorm:453) [enemy.hp<556]\nability(Crush:406) [self.round=7]\nability(Sandstorm:453)\nability(Crush:406)\nability(Decoy:334)\nability(Thunderbolt:779) [enemy.hp<245 & !enemy.aura(Soul Ward:750).exists]\nability(Breath:115)",
				},
				[106417] = {
					["name"] = "The Wine's Gone Bad",
					["code"] = "if [enemy(#1).active]\nability(218) [enemy.round=1]\nquit [!enemy.aura(217).exists & self(#1).active]\nstandby [enemy.round=2]\nability(652) [enemy.round=3]\nquit [!enemy.aura(653).exists & self(#1).active]\nchange(#2) [self(#1).dead]\nability(919) [!enemy.aura(918).exists]\nability(581)\nendif\nability(1370)\nchange(#1) [self(#2).dead]\nability(422)",
				},
				[161661] = {
					["name"] = "Wilbur",
					["code"] = "ability(Black Claw:919) [round=1]\nability(Flock:581) [round=2]\nability(Explode:282) [enemy.hp.can_explode]\nability(#1)\nchange(next)",
				},
				[146183] = {
					["name"] = "Living Napalm",
					["code"] = "ability(Rampage:124)\nability(Thrash:202)\nchange(#3) [enemy(#1).dead]\nability(Surge:509) [enemy.hp < 235 & !enemy.aura(Dodge).exists]\nability(Shell Shield:310) [ !self.speed.fast & self.aura(Shell Shield:309).duration<2 ]\nability(Shell Shield:310) [ self.aura(Shell Shield:309).duration<1 ]\nability(Renewing Mists:511) [!self.aura(Renewing Mists:510).exists]\nability(Surge:509)\nability(Deflection:490) [enemy.aura(Dodge).exists]\nability(Sandstorm:453)\nability(Crush:406)\nchange(#2)\nchange(next)",
				},
				["Courageous Yon"] = {
					["name"] = "Courageous Yon",
					["code"] = "if [enemy(#1).active]\nability(453)\nstandby [enemy.round=2]\nability(490) [enemy.aura(341).exists]\nability(406)\nendif\n\nif [enemy(#2).active]\nability(453)\nability(490) [enemy.aura(340).exists]\nability(406)\nendif\n\nif [enemy(#3).active]\nability(453)\nability(490) [enemy.aura(540).exists]\nability(406)\nendif",
				},
				[150914] = {
					["name"] = "Wandering Phantasm",
					["code"] = "change(next) [self.hp<250]\nchange(Tolai Hare Pup:730) [enemy(Zasz the Tiny:2607).active & self(Tolai Hare Pup:730).hp>500]\nchange(Tolai Hare Pup:730) [enemy(Lost Soul:2596).active & self(Tolai Hare Pup:730).hp>500]\n\nif [enemy(Zasz the Tiny:2607).active]\nability(Dodge:312) [enemy.ability(Deep Freeze:481).usable]\nability(Dodge:312) [enemy.aura(Undead:242).exists]\nability(Burrow:159) [!self.aura(Dodge:311).exists]\nability(Flurry:360)\nendif\n\nif [enemy(Lost Soul:2596).active]\nability(Dodge:312) [enemy.ability(Phase Punch:1765).usable]\nability(Burrow:159) [!self.aura(Dodge:311).exists]\nability(Flurry:360)\nendif\n\nability(Snap:356) [enemy(Plague Whelp:2606).active & enemy(Plague Whelp:2606).hp<378]\nability(Snap:356) [enemy(Gargy:2601).active & enemy.hp<378]\nability(Healing Wave:123) [self.hp<1000]\nability(Healing Wave:123) [enemy.aura(Undead:242).exists]\nability(Shell Shield:310) [ self.aura(Shell Shield:309).duration<2 & self.speed.slow]\nability(Shell Shield:310) [ self.aura(Shell Shield:309).duration<1 & self.speed.fast]\nability(Snap:356)\n\nability(Dodge:312)\nability(Burrow)\nability(Flurry:360)\n\n\nability(Extra Plating:392)\nability(Repair:278)\nability(Thrash:202)",
				},
				[68463] = {
					["name"] = "Burning Pandaren Spirit",
					["code"] = "if [enemy(#1).active]\nability(453) [enemy.round >= 2]\nability(490) [enemy.round =3]\nability(406)\nendif\n\nif [enemy(#2).active]\nability(490) [enemy(#2).ability(179).usable]\nability(453)\nability(406)\nendif\n\nif [enemy(#3).active]\nability(453)\nability(406)\nendif",
				},
				[66733] = {
					["name"] = "Mo'ruk",
					["code"] = "if [enemy(#1).active]\nability(334) [self.round=2]\nability(777)\nstandby\nendif\nif [enemy(#2).active]\nability(647)\nchange(#2) [self(#1).active]\nability(595) [enemy.round=3]\nability(421)\nstandby\nendif\nif [enemy(#3).active]\nability(277) [enemy.round=1]\nability(421)\nchange(#1) [self(#2).dead]\nability(647)\nability(334)\nability(777)\nstandby\nendif",
				},
			},
		},
	},
	["profileKeys"] = {
		["Fállkén - Drak'thul"] = "Default",
		["Fållkèn - Drak'thul"] = "Default",
		["Fàllkèn - Drak'thul"] = "Default",
		["Fãllkên - Drak'thul"] = "Default",
		["Fállkèn - Burning Blade"] = "Default",
		["Fàllkên - Drak'thul"] = "Default",
		["Fällkèn - Drak'thul"] = "Default",
		["Fállkên - Drak'thul"] = "Default",
		["Fallkenxd - Burning Blade"] = "Default",
		["Fallkenez - Drak'thul"] = "Default",
		["Fàllkèn - Burning Blade"] = "Default",
		["Gfgdhfdghfgh - Burning Blade"] = "Default",
		["Fållken - Burning Blade"] = "Default",
		["Fallkên - Drak'thul"] = "Default",
		["Fallken - Burning Blade"] = "Default",
		["Fallkenthicc - Burning Blade"] = "Default",
		["Fållkên - Drak'thul"] = "Default",
		["Fallkentiny - Burning Blade"] = "Default",
		["Fallkenfurry - Drak'thul"] = "Default",
		["Fàllkén - Drak'thul"] = "Default",
		["Fallkenji - Burning Blade"] = "Default",
		["Fâllken - Drak'thul"] = "Default",
		["Fállken - Burning Blade"] = "Default",
		["Faallken - Drak'thul"] = "Default",
		["Fallkenmekac - Burning Blade"] = "Default",
		["Fällkên - Drak'thul"] = "Default",
		["Fallkenchoco - Burning Blade"] = "Default",
		["Fallkengold - Sylvanas"] = "Default",
	},
	["profiles"] = {
		["Default"] = {
			["settings"] = {
				["hideMinimap"] = true,
				["autoButtonHotKey"] = "SPACE",
			},
			["position"] = {
				["y"] = -6.32098388671875,
				["x"] = 272.593017578125,
				["scale"] = 1,
			},
			["pluginOrders"] = {
				"Rematch", -- [1]
				"Base", -- [2]
				"FirstEnemy", -- [3]
				"AllInOne", -- [4]
			},
			["minimap"] = {
				["hide"] = true,
			},
		},
	},
}
