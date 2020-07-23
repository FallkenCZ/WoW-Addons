if GetLocale() == "deDE" then
qcLocalize = {
	ABYSSALDEPTHS = "Abyssische Tiefen",
	AHNKAHETTHEOLDKINGDOM = "Ahn'kahet: Das Alte Königreich",
	AHNQIRAJ = "Ahn'Qiraj",
	AHNQIRAJTHEFALLENKINGDOM = "Ahn'Qiraj: Das Gefallene Königreich",
	ALCHEMY = "Alchemie",
	ALTERACVALLEY = "Alteractal",
	ARATHIBASIN = "Arathibecken",
	ARATHIHIGHLANDS = "Arathihochland",
	ARCHAEOLOGY = "Archäologie",
	ASHENVALE = "Eschental",
	ASHRAN = "Ashran",
	ASSAULTONTHEDARKPORTAL = "Angriff auf das Dunkle Portal",
	AUCHENAICRYPTS = "Auchenaikrypta",
	AUCHINDOUN = "Auchindoun",
	AZEROTH = "Azeroth",
	AZJOLNERUB = "Azjol-Nerub",
	AZSHARA = "Azshara",
	AZUREMYSTISLE = "Azurmythosinsel",
	BADLANDS = "Ödland",
	BARADINHOLD = "Baradinfestung",
	BATTLEGROUNDS = "Schlachtfelder",
	BATTLEPETS = "Kampfhaustiere",
	BLACKFATHOMDEEPS = "Tiefschwarze Grotte",
	BLACKROCKCAVERNS = "Schwarzfelshöhlen",
	BLACKROCKDEPTHS = "Schwarzfelstiefen",
	BLACKROCKFOUNDRY = "Blackrock Foundry", -- Requires localization
	BLACKROCKSPIRE = "Schwarzfelsspitze",
	BLACKSMITHING = "Schmiedekunst",
	BLACKTEMPLE = "Der Schwarze Tempel",
	BLACKWINGDESCENT = "Pechschwingenabstieg",
	BLACKWINGLAIR = "Pechschwingenhort",
	BLADESEDGEMOUNTAINS = "Schergrat",
	BLASTEDLANDS = "Verwüstete Lande",
	BLOODMAULSLAGMINES = "Bloodmaul Slag Mines", -- Requires localization
	BLOODMYSTISLE = "Blutmythosinsel",
	BOREANTUNDRA = "Boreanische Tundra",
	BRAWLERSGUILD = "Kampfgilde",
	BREWFEST = "Braufest",
	BREWMOONFESTIVAL = "Brewmoon Festival", -- Requires localization
	BURNINGSTEPPES = "Brennende Steppe",
	CAVERNSOFTIME = "Höhlen der Zeit",
	CENTRALKALIMDOR = "Zentral Kalimdor",
	CHILDRENSWEEK = "Kinderwoche",
	CLASSES = "Klassen",
	CLASSQUESTS = "Klassenquests",
	CLEARUPDATECACHE = "Lösche und aktualisiere Cache...",
	COILFANGRESERVOIR = "Echsenkessel",
	COMBINEDMAPANDQUESTFILTERS = "Kombinierte Karten- und Questlisten-Filter",
	CONFIGSUBTITLE = "Diese Option erlaubt dir die Art und Weise zu ändern, wie Quest Completist seine Daten verwendet und filtert.",
	CONFIGTITLE = "Quest Completist - Konfiguration",
	CONTINENTS = "Kontinente",
	COOKING = "Kochen",
	CRYSTALSONGFOREST = "Kristallsangwald",
	DALARAN = "Dalaran",
	DARKMOONFAIRE = "Dunkelmond-Jahrmarkt",
	DARKSHORE = "Dunkelküste",
	DARNASSUS = "Darnassus",
	DAYOFTHEDEAD = "Tag der Toten",
	DEADWINDPASS = "Gebirgspass der Totenwinde",
	DEATHKNIGHT = "Todesritter",
	DEEPHOLM = "Tiefenheim",
	DEEPRUNTRAM = "Die Tiefenbahn",
	DESOLACE = "Desolace",
	DIREMAUL = "Düsterbruch",
	DRAENOR = "Draenor",
	DRAGONBLIGHT = "Drachenöde",
	DRAGONSOUL = "Drachenseele",
	DRAKTHARONKEEP = "Feste Drak'Tharon",
	DREADWASTES = "Schreckensöde",
	DRUID = "Druide",
	DUNGEONSANDRAIDS = "Dungeons und Schlachtzüge",
	DUNMOROGH = "Dun Morogh",
	DUROTAR = "Durotar",
	DUSKWOOD = "Dämmerwald",
	DUSTWALLOWMARSH = "Düstermarschen",
	EASTERNKINGDOMS = "Östliche Königreiche",
	EASTERNPLAGUELANDS = "Östliche Pestländer",
	ELEMENTALBONDS = "Elementare Bande",
	ELWYNNFOREST = "Wald von Elwynn",
	ENCHANTING = "Verzauberkunst",
	ENDTIME = "Die Endzeit",
	ENGINEERING = "Ingenieurskunst",
	EVERSONGWOODS = "Immersangwald",
	EYEOFTHESTORM = "Auge des Sturms",
	FELWOOD = "Teufelswald",
	FERALAS = "Feralas",
	FIRELANDS = "Feuerlande",
	FIRELANDSINVASION = "Die Invasion der Feuerlande",
	FIRSTAID = "Erste Hilfe",
	FISHING = "Angeln",
	FROSTFIRERIDGE = "Frostfeuergrat",
	GARRISONCAMPAIGN = "Garnisonskampagne",
	GARRISONSUPPORT = "Unterstützung der Garnison",
	GATEOFTHESETTINGSUN = "Gate of the Setting Sun", -- Requires localization
	GHOSTLANDS = "Geisterlande",
	GILNEAS = "Gilneas",
	GILNEASCITY = "Gilneas",
	GNOMEREGAN = "Gnomeregan",
	GORGROND = "Gorgrond",
	GREENSTONEVILLAGE = "Greenstone Village", -- Requires localization
	GRIMBATOL = "Grim Batol",
	GRIMRAILDEPOT = "Grimrail Depot", -- Requires localization
	GRIZZLYHILLS = "Grizzlyhügel",
	GRUULSLAIR = "Gruuls Unterschlupf",
	GUNDRAK = "Gundrak",
	HALLOWSEND = "Schlotternächte",
	HALLSOFLIGHTNING = "Hallen der Blitze",
	HALLSOFORIGINATION = "Hallen des Ursprungs",
	HALLSOFREFLECTION = "Hallen der Reflexion",
	HALLSOFSTONE = "Hallen des Steins",
	HARVESTFESTIVAL = "Erntedankfest",
	HELLFIRECITADEL = "Höllenfeuerzitadelle",
	HELLFIREPENINSULA = "Höllenfeuerhalbinsel",
	HELLFIRERAMPARTS = "Höllenfeuerbollwerk",
	HERBALISM = "Kräuterkunde",
	HIDECOMPLETEDQUESTS = "Verstecke abgeschlossene Quests",
	WORLDQUEST = "World Quests",
	HIDEDAILYANDWORLD = "Hide Daily and World Quests",
	HIDEINPROGRESSQUESTS = "Verstecke laufende Quests",
	HIDELOWLEVELQUESTS = "Verstecke niedrigstufige Quests",
	HIDENONACTIVESEASONALQUESTS = "Verstecke nicht aktive saisonale Quests",
	HIDEOTHERFACTIONQUESTS = "Verstecke Quests der anderen Fraktion",
	HIDEOTHERPROFESSIONQUESTS = "Verstecke Quests anderer Berufe",
	HIDEOTHERRACEANDCLASSQUESTS = "Verstecke Quests anderer Rassen und Klassen",
	HIDEWORLDQUEST = "Hide Daily and World Quests",
	HIGHMAUL = "Highmaul", -- Requires localization
	HILLSBRADFOOTHILLS = "Vorgebirge des Hügellands",
	HOUROFTWILIGHT = "Stunde des Zwielichts",
	HOWLINGFJORD = "Der Heulende Fjord",
	HROTHGARSLANDING = "Hrothgars Landestelle",
	HUNTER = "Jäger",
	HYJALSUMMIT = "Hyjalgipfel",
	ICECROWN = "Eiskrone",
	ICECROWNCITADEL = "Eiskronenzitadelle",
	INSCRIPTION = "Inschriftenkunde",
	IRONDOCKS = "Iron Docks", -- Requires localization
	IRONFORGE = "Eisenschmiede",
	ISLEOFCONQUEST = "Insel der Eroberung",
	ISLEOFGIANTS = "Insel der Riesen",
	ISLEOFQUELDANAS = "Insel von Quel'Danas",
	ISLEOFTHUNDER = "Insel des Donners",
	JADETEMPLEGROUNDS = "Jade Temple Grounds", -- Requires localization
	JEWELCRAFTING = "Juwelenschleifen",
	KALIMDOR = "Kalimdor",
	KARAZHAN = "Karazhan",
	KELPTHARFOREST = "Tang'tharwald",
	KEZAN = "Kezan",
	KHAZMODAN = "Khaz Modan",
	KRASARANGWILDS = "Krasarangwildnis",
	KUNLAISUMMIT = "Gipfel von Kun-Lai",
	LANDFALL = "Landung",
	LEATHERWORKING = "Lederverarbeitung",
	LEGENDARY = "Legendär",
	LOCHMODAN = "Loch Modan",
	LORDAERON = "Lordaeron",
	LOSTCITYOFTHETOLVIR = "Die Verlorene Stadt der Tol'vir",
	LOVEISINTHEAIR = "Liebe liegt in der Luft",
	LUNARFESTIVAL = "Mondfest",
	MAGE = "Magier",
	MAGISTERSTERRACE = "Terrasse der Magister",
	MAGTHERIDONSLAIR = "Magtheridons Kammer",
	MANATOMBS = "Managruft",
	MAPFILTERS = "Kartenfilter",
	MARAUDON = "Maraudon",
	MIDSUMMERFIREFESTIVAL = "Sonnenwendfest",
	MINING = "Bergbau",
	MISCELLANEOUS = "Verschiedenes",
	MOGUSHANPALACE = "Mogu'shan Palace", -- Requires localization
	MOGUSHANVAULTS = "Mogu'shans Kammern",
	MOLTENCORE = "Geschmolzener Kern",
	MOLTENFRONT = "Geschmolzene Front",
	MONK = "Mönch",
	MOONGLADE = "Mondlichtung",
	MOUNTHYJAL = "Berg Hyjal",
	MULGORE = "Mulgore",
	NAGRAND = "Nagrand",
	NAXXRAMAS = "Naxxramas",
	NETHERSTORM = "Nethersturm",
	NEWYEARSEVE = "Silvester",
	NOBLEGARDEN = "Nobelgartenfest",
	NORTHERNBARRENS = "Nördliches Brachland",
	NORTHERNKALIMDOR = "Nördliches Kalimdor",
	NORTHERNSTRANGLETHORN = "Nördliches Schlingendorntal",
	NORTHREND = "Nordend",
	OLDHILLSBRADFOOTHILLS = "Vorgebirge des Alten Hügellands",
	ONYXIASLAIR = "Onyxias Hort",
	OPTIONS = "Optionen",
	ORGRIMMAR = "Orgrimmar",
	OUTLAND = "Scherbenwelt",
	PALACEOFTHEHEAVENS = "Himmelspalast",
	PALADIN = "Paladin",
	PANDARENBREWMASTERS = "Pandaren Brewmasters", -- Requires localization
	PANDARENCAMPAIGN = "Pandarenkampagne",
	PANDARIA = "Pandaria",
	PEAKOFSERENITY = "Peak of Serenity", -- Requires localization
	PERFORMSERVERQUERY = "Server-Abfrage durchführen...",
	PILGRIMSBOUNTY = "Pilgerfreudenfest",
	PITOFSARON = "Grube von Saron",
	PRIEST = "Priester",
	PROFESSIONS = "Berufe",
	PROVINGGROUNDS = "Die Feuerprobe",
	QUERYREQUESTED = "Eine Serverabfrage wird durchgeführt...",
	QUESTLISTFILTERS = "Questlisten-Filter",
	QUESTSFOUND = "%d gefundene Quests",
	RAGEFIRECHASM = "Der Flammenschlund",
	RAIDS = "Schlachtzüge",
	RAZORFENDOWNS = "Hügel der Klingenhauer",
	RAZORFENKRAUL = "Kral der Klingenhauer",
	REDRIDGEMOUNTAINS = "Rotkammgebirge",
	REGIONS = "Gebiete",
	RIDING = "Riding", -- Requires localization
	ROGUE = "Schurke",
	RUINSOFAHNQIRAJ = "Ruinen von Ahn'Qiraj",
	RUINSOFGILNEAS = "Ruinen von Gilneas",
	RUINSOFGILNEASCITY = "Ruinen der Stadt Gilneas",
	SCARLETHALLS = "Scarlet Halls", -- Requires localization
	SCARLETMONASTERY = "Das Scharlachrote Kloster",
	SCENARIO = "Scenario", -- Requires localization
	SCHOLOMANCE = "Scholomance",
	SEARINGGORGE = "Sengende Schlucht",
	SEASONAL = "Saisonal",
	SERPENTSHRINECAVERN = "Höhle des Schlangenschreins",
	SETHEKKHALLS = "Sethekk Hallen",
	SHADOPANMONASTERY = "Kloster Shado-pan",
	SHADOWFANGKEEP = "Burg Schattenfang",
	SHADOWLABYRINTH = "Das Schattenlabyrinth",
	SHADOWMOONBURIALGROUNDS = "Shadowmoon Burial Grounds", -- Requires localization
	SHADOWMOONVALLEY = "Schattenmondtal",
	SHAMAN = "Schamane",
	SHATTRATHCITY = "Shattrath",
	SHIMMERINGEXPANSE = "Schimmernde Weiten",
	SHOLAZARBASIN = "Sholazarbecken",
	SHOWMAPICONS = "Zeige Kartensymbole",
	SIEGEOFNIUZAOTEMPLE = "Die Belagerung des Niuzao-Tempels",
	SIEGEOFORGRIMMAR = "Siege of Orgrimmar", -- Requires localization
	SILITHUS = "Silithus",
	SILVERMOONCITY = "Silbermond",
	SILVERPINEFOREST = "Silberwald",
	SILVERSHARDMINES = "Silbersplitter Mine",
	SKETTIS = "Skettis", -- Requires localization
	SKINNING = "Kürschnerei",
	SKYREACH = "Skyreach", -- Requires localization
	SORTALPHA = "Sortierung: Alphabetisch",
	SORTLEVEL = "Sortierung: Stufe",
	SOUTHERNBARRENS = "Südliches Brachland",
	SOUTHERNKALIMDOR = "Südliches Kalimdor",
	SPECIAL = "Besonderes",
	SPECIALS = "Specials",
	SPIREOFLIGHT = "Spire of Light", -- Requires localization
	SPIRESOFARAK = "Spitzen von Arak",
	STONETALONMOUNTAINS = "Steinkrallengebirge",
	STORMSHIELD = "Stormshield", -- Requires localization
	STORMSHIELDSTRONGHOLD = "Stormshield Stronghold", -- Requires localization
	STORMSTOUTBREWERY = "Brauerei Sturmbräu",
	STORMWINDCITY = "Sturmwind",
	STRANDOFTHEANCIENTS = "Strand der Uralten",
	STRANGLETHORNVALE = "Schlingendorntal",
	STRATHOLME = "Stratholme",
	SUNKENTEMPLE = "Der Versunkene Tempel",
	SUNSTRIDERISLE = "Sunstrider Isle", -- Requires localization
	SUNWELLPLATEAU = "Sonnenbrunnenplateau",
	SWAMPOFSORROWS = "Sümpfe des Elends",
	TAILORING = "Schneiderei",
	TALADOR = "Talador",
	TANAANJUNGLE = "Tanaandschungel",
	TANARIS = "Tanaris",
	TELDRASSIL = "Teldrassil",
	TEMPESTKEEP = "Festung der Stürme",
	TEMPLEOFAHNQIRAJ = "Tempel von Ahn'Qiraj",
	TEMPLEOFKOTMOGU = "Tempel der Jadeschlange",
	TEMPLEOFTHEJADESERPENT = "Temple of the Jade Serpent", -- Requires localization
	TEMPLEOFTHEREDCRANE = "Temple des Roten Kranichs",
	TEROKKARFOREST = "Wälder von Terokkar",
	THEARBORETUM = "The Arboretum", -- Requires localization
	THEARCATRAZ = "Die Arkatraz",
	THEBASTIONOFTWILIGHT = "Die Bastion des Zwielichts",
	THEBATTLEFORGILNEAS = "Die Schlacht um Gilneas",
	THEBLACKMORASS = "Der Schwarze Morast",
	THEBLOODFURNACE = "Der Blutkessel",
	THEBOTANICA = "Die Botanika",
	THECAPEOFSTRANGLETHORN = "Das Schlingendornkap",
	THECULLINGOFSTRATHOLME = "Das Ausmerzen von Stratholme",
	THEDEADMINES = "Die Todesminen",
	THEEVERBLOOM = "The Everbloom", -- Requires localization
	THEEXODAR = "Die Exodar",
	THEEYE = "Auge des Sturms",
	THEEYEOFETERNITY = "Auge der Ewigkeit",
	THEFORGEOFSOULS = "Die Seelenschmiede",
	THEGATEOFTHESETTINGSUN = "Das Tor der untergehenden Sonne",
	THEHALFHILLMARKET = "Der Halbhügel Markt",
	THEHINTERLANDS = "Das Hinterland",
	THEJADEFOREST = "Der Jadewald",
	THELOSTISLES = "Die Verlorenen Inseln",
	THEMAELSTROM = "Der Mahlstrom",
	THEMECHANAR = "Die Mechanar",
	THENEXUS = "Der Nexus",
	THEOBSIDIANSANCTUM = "Das Obsidiansanktum",
	THEOCULUS = "Das Oculus",
	THERUBYSANCTUM = "Das Rubinsanktum",
	THESHATTEREDHALLS = "Die Zerschmetterten Hallen",
	THESLAVEPENS = "Die Sklavenunterkünfte",
	THESTEAMVAULT = "Die Dampfkammer",
	THESTOCKADE = "Das Verlies",
	THESTONECORE = "Der Steinerne Kern",
	THESTORMPEAKS = "Die Sturmgipfel",
	THETEMPLEOFTHEJADESERPENT = "Der Tempel der Jadeschlange",
	THEUNDERBOG = "Der Tiefensumpf",
	THEVEILEDSTAIR = "Die verschleierte Treppe",
	THEVIOLETHOLD = "Die Violette Festung",
	THEVORTEXPINNACLE = "Der Vortexgipfel",
	THEWANDERINGISLE = "Die Wandernde Insel",
	THEZANDALARI = "Die Zandalari",
	THOUSANDNEEDLES = "Tausend Nadeln",
	THRONEOFTHEFOURWINDS = "Thron der vier Winde",
	THRONEOFTHETIDES = "Thron der Gezeiten",
	THRONEOFTHUNDER = "Throne of Thunder", -- Requires localization
	THUNDERBLUFF = "Donnerfels",
	TIMELESSISLE = "Zeitlose Insel",
	TIRISFALGLADES = "Tirisfal",
	TOLBARAD = "Tol Barad",
	TOLBARADPENINSULA = "Halbinsel von Tol Barad",
	TOURNAMENT = "Turnier",
	TOWNLONGSTEPPES = "Tanglong-Ödnis",
	TRIALOFTHECHAMPION = "Prüfung des Champions",
	TRIALOFTHECRUSADER = "Prüfung des Kreuzfahrers",
	TWILIGHTHIGHLANDS = "Schattenhochland",
	TWINPEAKS = "Zwillingsgipfel",
	ULDAMAN = "Uldaman",
	ULDUAR = "Ulduar",
	ULDUM = "Uldum",
	UNDERCITY = "Unterstadt",
	UNGAINGOO = "Unga Ingoo", -- Requires localization
	UNGOROCRATER = "Krater von Un'Goro",
	UPPERBLACKROCKSPIRE = "Upper Blackrock Spire", -- Requires localization
	UTGARDEKEEP = "Burg Utgarde",
	UTGARDEPINNACLE = "Turm Utgarde",
	VALEOFETERNALBLOSSOMS = "Tal der Ewigen Blüten",
	VALLEYOFTHEFOURWINDS = "Tal der Vier Winde",
	VASHJIR = "Vashj'ir",
	VAULTOFARCHAVON = "Archavons Kammer",
	WAILINGCAVERNS = "Die Höhlen des Wehklagens",
	WARLOCK = "Hexenmeister",
	WARRIOR = "Krieger",
	WARSONGGULCH = "Kriegshymnenschlucht",
	WARSPEAR = "Warspear", -- Requires localization
	WARSPEAROUTPOST = "Warspear Outpost", -- Requires localization
	WELLOFETERNITY = "Brunnen der Ewigkeit",
	WESTERNPLAGUELANDS = "Westliche Pestländer",
	WESTFALL = "Westfall",
	WETLANDS = "Sumpfland",
	WINTERGRASP = "Tausendwintersee",
	WINTERSPRING = "Winterquell",
	WINTERVEIL = "Winterhauchfest",
	WORLDEVENTS = "Weltereignisse",
	ZANGARMARSH = "Zangarmarschen",
	ZULAMAN = "Zul'Aman",
	ZULDRAK = "Zul'Drak",
	ZULFARRAK = "Zul'Farrak",
	ZULGURUB = "Zul'Gurub",
	THEBROKENISLES = "The Broken Isles",	
	THEDREAMGROVE = "The Dreamgrove",
	AZSUNA = "Azsuna",
	HIGHMOUNTAIN = "Highmountain",
	STORMHEIM = "Stormheim",
	SURAMAR = "Suramar",
	VALSHARAH = "Val'sharah",
	DEMONHUNTER = "Demon Hunter",
	CONTESTCOMMING = "Contest comming shows wrong zone",
	HALLOFTHEGUARDIAN = "Hall of the Guardian",
	MARDUMTHESHATTEREDABYSS = "Mardum, the Shattered Abyss",
	NETHERLIGHTTEMPLE = "Netherlight Temple",
	SKYHOLD = "Skyhold",
	THEHEARTOFAZERTH = "The Heart of Azeroth",
	THEWANDERINGISLE = "The Wandering Isle Monk",
	TRUESHOTLODGE = "Trueshot Lodge Hunter",
	ACHERUSTHEEBONHOLD = "Acherus: The Ebon Hold",
	BLACKOOKHOLD = "Black Rook Hold",
	COURTOFSTARS = "Court of Stars",
	DARKHEARTTHICKET	 = "Darkheart Thicket",
	EYEOFAZSHARA = "	Eye of Azshara",
	HALLSOFVALOR = "Halls of Valor",
	MAWOFSOULS = "Maw of Souls",
	NELTHARIONSLAIR = "Neltharion's Lair",
	THEARCWAY = "The Arcway", 
	VAULTOFTHEWARDENS = "Vault of the Wardens",
	VIOLETHOLD = "Violet Hold",
	THEEMERALDNIGHTMARE = "The Emerald Nightmare",
	TRIALOFVALOR = "Trial of Valor",
	THENIGHTHOLD = "	The Nighthold",
	BROKENSHORE = "Broken Shore",
	LEGIONUNCATEQUEST = "Legion Uncategorized Quests",
	CATHEDRALOFETERNALNIGHT = "Cathedral of Eternal Night", 
	RETURNTOKARAZHAN = "Return to Karazhan",
 	TOMBOFSARGERAS = "Tomb of Sargeras",
	KROKUUN = "Krokuun",
	ANTORANWASTES = "Antoran Wastes",
	ARGUS = "Argus",
	MACAREE = "Mac'Aree",
	DREADSCARRIFT = "Dreadscar Rift",
	ANTORUSTHEBURNINGTHRONE = "Antorus, the Burning Throne",
	HELHEIM = "Helheim",
	THESEATOFTHETRIUMVIRATE = "The Seat Of The Triumvirate",
	EMERALDDREAMWAY = "Emerald Dreamway",
	BFA = "Battle For Azeroth",
	BFAUNCATEQUEST = "BFA Uncategorized Quests",
	ZANDALAR = "Zandalar",
	KULTIRAS = "Kul Tiras",
	THUNDERTOTEM = "Thunder Totem",
	DRUSTVAR = "Drustvar",
	STORMSONGVALLEY = "Stormsong Valley",
	TIRAGARDESOUND = "Tiragarde Sound",
	NAZMIR = "Nazmir",
	VOLDUN = "Vol`dun",
	ZULDAZAR = "Zuldazar",
	ATALDAZAR = "Atal'Dazar",	 	
	CRUCIBLEOFSTORMS = "Crucible of Storms",	
	FREEHOLD = "Freehold",		
	KINGSREST = "Kings' Rest",
	SHRINEOFTHESTORM = "Shrine of the Storm",
	SIEGEOFBORAUS = "Siege Of Boralus",
	SIEGEOFZULDAZAR = "Siege of Zuldazar",	
	TEMPLEOFSETHRALISS = "Temple of Sethraliss",
	THRUNDERROT = "The Underrot",
	TOLDAGOR = "Tol Dagor",
	ULDIR = "Uldir",
	WAYCRESTMANOR = "Waycrest Manor",
	THEDEATHOFCHROMIE = "The Deaths Of Chromie",
	THEMOTHERLOAD = "The Motherload!!",
	BATTLEOFDAZARALOR = "Battle of Dazar`alor",
    ALLIANCEWARCAMPAIGN = "Alliance War Campaign",
	HORDEWARCAMPAIGN = "Horde War Campaign",
	CHAMBEROFHEART = "Chamber Of Heart",
	THEDRAGONSSPINE = "The Dragon`s Spine",
	MECHAGONISLAND = "Mechagon Island",
	NAZJATAR = "Nazjatar",
	WARFRONTCONTRIBUTION = "Warfront Contribution",
	ISLANDEXPEDITIONS = "Island Expeditions",
	CLASSCAMPAINS = "Class Campains",
	TERRACEOFENLESSSPRINGS = "Terrace Of Endless Spring",
	TEMP = "Temp",
	PLAYERVSPLAYER = "Player Vs Player",
	HERITAGE = "Heritage",
	RATEDPVP = "Rated Pvp",
}

end