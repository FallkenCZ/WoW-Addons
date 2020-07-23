local addon, ATTdefault = ...

 dbImport = {
     ["DEATHKNIGHT"] = { 
        { spellID = 47528,  duration = 15},
        { spellID = 47482,  duration = 30},
        { spellID = 47481,  duration = 90},
        { spellID = 108194, duration = 45},
        { spellID = 221562, duration = 45},
        { spellID = 47476,  duration = 60},
        { spellID = 207167, duration = 60},
        { spellID = 49576,  duration = 25},
        { spellID = 108199, duration = 120},
        { spellID = 48707,  duration = 60},
        { spellID = 51052,  duration = 120},
        { spellID = 48792,  duration = 180},
        { spellID = 49028,  duration = 120},
        { spellID = 274156, duration = 45},
        { spellID = 219809, duration = 60},
        { spellID = 194844, duration = 60},
        { spellID = 55233,  duration = 90},
        { spellID = 287081, duration = 60},
        { spellID = 48743,  duration = 120},
        { spellID = 114556, duration = 240},
        { spellID = 51271,  duration = 45},
        { spellID = 279302, duration = 180},
        { spellID = 152279, duration = 120},
        { spellID = 130736, duration = 45},
        { spellID = 207289, duration = 75},
        { spellID = 275699, duration = 90},
        { spellID = 47568,  duration = 120},
        { spellID = 49206,  duration = 180},
        { spellID = 63560,  duration = 60},
        { spellID = 42650,  duration = 480},
        { spellID = 288853, duration = 90},
        { spellID = 196770, duration = 20},
        { spellID = 48265,  duration = 45},
        { spellID = 212552, duration = 60},
        { spellID = 77606,  duration = 20}
    },
    ["DEMONHUNTER"] = { 
        { spellID = 183752, duration = 15},
        { spellID = 217832, duration = 45},
        { spellID = 221527, duration = 60},
        { spellID = 179057, duration = 60},
        { spellID = 205630, duration = 60},
        { spellID = 211881, duration = 30},
        { spellID = 207684, duration = 90},
        { spellID = 202137, duration = 60},
        { spellID = 202138, duration = 90},
        { spellID = 196555, duration = 120},
        { spellID = 209258, duration = 480},
        { spellID = 198589, duration = 60},
        { spellID = 196718, duration = 180},
     -- { spellID = 227635, duration = 180},
        { spellID = 204021, duration = 60},
        { spellID = 187827, duration = 180},
        { spellID = 200166, duration = 240},
        { spellID = 206491, duration = 120},
        { spellID = 258925, duration = 60},
        { spellID = 203704, duration = 60},
        { spellID = 206649, duration = 45},
        { spellID = 205604, duration = 60},
        { spellID = 205629, duration = 20},
    },
    
    ["DRUID"] = { 
        { spellID = 106839, duration = 15},
        { spellID = 78675,  duration = 60},
        { spellID = 88423,  duration = 8},
        { spellID = 5211,   duration = 50},
        { spellID = 202246, duration = 25},
        { spellID = 99,     duration = 30},
        { spellID = 102359, duration = 30},
        { spellID = 132469, duration = 30},
        { spellID = 102793, duration = 60},
        { spellID = 22812,  duration = 60},
        { spellID = 102342, duration = 60},
        { spellID = 61336,  duration = 120},
        { spellID = 108238, duration = 90},
        { spellID = 209749, duration = 30},
        { spellID = 305497, duration = 45},
        { spellID = 201664, duration = 30},
        { spellID = 22842,  duration = 34},
        { spellID = 740,    duration = 180},
        { spellID = 203651, duration = 45},
        { spellID = 106951, duration = 180},
        { spellID = 194223, duration = 180},
        { spellID = 102543, duration = 180},
        { spellID = 102560, duration = 180},
        { spellID = 33891,  duration = 180},
        { spellID = 102558, duration = 180},
        { spellID = 5217,   duration = 30},
        { spellID = 202425, duration = 45},
        { spellID = 202770, duration = 60},
        { spellID = 77761,  duration = 120},
        { spellID = 1850,   duration = 120},
        { spellID = 252216, duration = 45},
        { spellID = 29166,  duration = 180},
        { spellID = 205636, duration = 60},
    },
    ["HUNTER"] = { 
        { spellID = 147362, duration = 24},
        { spellID = 187707, duration = 15},
        { spellID = 187650, duration = 30},
        { spellID = 19577,  duration = 60},
        { spellID = 213691, duration = 30},
        { spellID = 186387, duration = 30},
        { spellID = 109248, duration = 45},
        { spellID = 236776, duration = 40},
        { spellID = 202914, duration = 45},
        { spellID = 186265, duration = 180},
        { spellID = 109304, duration = 120},
        { spellID = 212640, duration = 25},
        { spellID = 53480,  duration = 60},
        { spellID = 288613, duration = 120},
        { spellID = 260402, duration = 60},
        { spellID = 266779, duration = 120},
        { spellID = 186289, duration = 90},
        { spellID = 193530, duration = 120},
        { spellID = 205691, duration = 120},
        { spellID = 19574,  duration = 90},
        { spellID = 194407, duration = 90},
        { spellID = 131894, duration = 60},
        { spellID = 199483, duration = 60},
        { spellID = 272651, duration = 45},
        { spellID = 186257, duration = 180},
        { spellID = 248518, duration = 45},
    },
    ["MAGE"] = {
        { spellID = 2139,   duration = 24},
        { spellID = 113724, duration = 45},
        { spellID = 31661,  duration = 20},
        { spellID = 45438,  duration = 240},
        { spellID = 235219, duration = 300},
        { spellID = 198111, duration = 45},
        { spellID = 110960, duration = 120},
        { spellID = 198158, duration = 60},
        { spellID = 12042,  duration = 90},
        { spellID = 190319, duration = 120},
        { spellID = 153561, duration = 45},
        { spellID = 12472,  duration = 180},
        { spellID = 198144, duration = 60},
        { spellID = 205021, duration = 75},
        { spellID = 84714,  duration = 60},
        { spellID = 257537, duration = 45},
        { spellID = 153595, duration = 30},
        { spellID = 205025, duration = 60},
        { spellID = 205032, duration = 40},
        { spellID = 153626, duration = 20},
        { spellID = 55342,  duration = 120},
        { spellID = 80353,  duration = 300},
        { spellID = 108839, duration = 20},
        { spellID = 198100, duration = 30},
        { spellID = 33395,  duration = 25},
        { spellID = 122,    duration = 30},
        { spellID = 1953,   duration = 15},
        { spellID = 212653, duration = 20},
    },
    ["MONK"] = { 
        { spellID = 116705, duration = 15},
        { spellID = 115450, duration = 8},
        { spellID = 119381, duration = 60},
        { spellID = 115078, duration = 45},
        { spellID = 198898, duration = 30},
        { spellID = 116844, duration = 45},
        { spellID = 202370, duration = 30},
        { spellID = 202335, duration = 45},
        { spellID = 122470, duration = 90},
        { spellID = 116849, duration = 120},
        { spellID = 115203, duration = 420},
        { spellID = 243435, duration = 90},
        { spellID = 201318, duration = 90},
        { spellID = 115399, duration = 120},
        { spellID = 233759, duration = 45},
        { spellID = 119996, duration = 45},
        { spellID = 122278, duration = 120},
        { spellID = 122783, duration = 90},
        { spellID = 115176, duration = 300},
        { spellID = 202162, duration = 45},
        { spellID = 132578, duration = 180},
        { spellID = 216113, duration = 60},
        { spellID = 115310, duration = 180},
        { spellID = 198664, duration = 180},
        { spellID = 115080, duration = 120},
        { spellID = 137639, duration = 90},
        { spellID = 152173, duration = 90},
        { spellID = 209584, duration = 45},
        { spellID = 116841, duration = 30},
        { spellID = 101545, duration = 25},
        { spellID = 109132, duration = 20},
        { spellID = 115008, duration = 20},
    },
    ["PALADIN"] = { 
        { spellID = 96231,  duration = 15},
        { spellID = 215652, duration = 45},
        { spellID = 4987,   duration = 8},
        { spellID = 853,    duration = 60},
        { spellID = 115750, duration = 90},
        { spellID = 20066,  duration = 15},
        { spellID = 642,    duration = 300},
        { spellID = 1022,   duration = 300},
        { spellID = 204018, duration = 180},
        { spellID = 6940,   duration = 120},
        { spellID = 199452, duration = 120},
        { spellID = 86659,  duration = 300},
        { spellID = 228049, duration = 180},
        { spellID = 31821,  duration = 180},
        { spellID = 498,    duration = 60},
        { spellID = 184662, duration = 120},
        { spellID = 205191, duration = 60},
        { spellID = 31850,  duration = 85},
        { spellID = 204150, duration = 180},
        { spellID = 31884,  duration = 120},
        { spellID = 216331, duration = 120},
        { spellID = 231895, duration = 120},
        { spellID = 105809, duration = 90},
        { spellID = 255937, duration = 45},
        { spellID = 210256, duration = 45},
        { spellID = 210294, duration = 25},
        { spellID = 1044,   duration = 25},
        { spellID = 190784, duration = 45},
    },
    ["PRIEST"] = { 
        { spellID = 527,    duration = 8},
        { spellID = 88625,  duration = 60},
        { spellID = 64044,  duration = 45},
        { spellID = 8122,   duration = 60},
        { spellID = 205369, duration = 30},
        { spellID = 15487,  duration = 45},
        { spellID = 204263, duration = 45},
        { spellID = 197268, duration = 60},
        { spellID = 213602, duration = 45},
        { spellID = 47585,  duration = 120},
        { spellID = 108968, duration = 300},
        { spellID = 15286,  duration = 120},
        { spellID = 33206,  duration = 180},
        { spellID = 62618,  duration = 180},
        { spellID = 271466, duration = 180},
        { spellID = 47788,  duration = 180},
        { spellID = 197862, duration = 60},
        { spellID = 197871, duration = 60},
        { spellID = 215769, duration = 180},
        { spellID = 265202, duration = 720},
        { spellID = 64843,  duration = 180},
        { spellID = 200183, duration = 120},
        { spellID = 19236,  duration = 90},
        { spellID = 193223, duration = 180},
        { spellID = 280711, duration = 60},
        { spellID = 211522, duration = 45},
        { spellID = 263165, duration = 45},
        { spellID = 73325,  duration = 90},
        { spellID = 305498, duration = 12},
        { spellID = 213610, duration = 30},
        { spellID = 32375,  duration = 45},
        { spellID = 289657, duration = 44},
    },
    ["ROGUE"] = { 
        { spellID = 1766,   duration = 15},
        { spellID = 2094,   duration = 120},
        { spellID = 212182, duration = 180},
        { spellID = 207736, duration = 120},
        { spellID = 408,    duration = 20},
        { spellID = 199804, duration = 30},
        { spellID = 31224,  duration = 120},
        { spellID = 5277,   duration = 120},
        { spellID = 199754, duration = 120},
        { spellID = 1856,   duration = 120},
        { spellID = 207777, duration = 45},
        { spellID = 79140,  duration = 120},
        { spellID = 121471, duration = 180},
        { spellID = 185313, duration = 60},
        { spellID = 213981, duration = 60},
        { spellID = 13750,  duration = 180},
        { spellID = 200806, duration = 45},
        { spellID = 51690,  duration = 120},
        { spellID = 198529, duration = 120},
        { spellID = 221622, duration = 30},
        { spellID = 114018, duration = 360},
        { spellID = 195457, duration = 60},
        { spellID = 2983,   duration = 60},
        { spellID = 36554,  duration = 30},
    },
    ["SHAMAN"] = { 
        { spellID = 77130,  duration = 8},
        { spellID = 57994,  duration = 12},
        { spellID = 51514,  duration = 30},
        { spellID = 192058, duration = 60},
        { spellID = 197214, duration = 40},
        { spellID = 305483, duration = 30},
        { spellID = 51490,  duration = 45},
        { spellID = 108271, duration = 90},
        { spellID = 210918, duration = 60},
        { spellID = 98008,  duration = 180},
        { spellID = 198838, duration = 60},
        { spellID = 207399, duration = 300},
        { spellID = 108281, duration = 120},
        { spellID = 108280, duration = 180},
        { spellID = 114050, duration = 180},
        { spellID = 114051, duration = 180},
        { spellID = 114052, duration = 180},     
        { spellID = 204361, duration = 300},
        { spellID = 32182, duration = 300},
        { spellID = 51533,  duration = 120},
        { spellID = 210714, duration = 30},
        { spellID = 191634, duration = 60},
        { spellID = 204330, duration = 40},
        { spellID = 204336, duration = 30},
        { spellID = 8143,   duration = 60},
        { spellID = 2484,   duration = 30},
        { spellID = 51485,  duration = 30},
        { spellID = 192077, duration = 120},
        { spellID = 204331, duration = 45},
        { spellID = 198067, duration = 150},
        { spellID = 198103, duration = 300},
        { spellID = 79206,  duration = 120},
        { spellID = 58875,  duration = 60},
        { spellID = 196884, duration = 30},
    },
    ["WARLOCK"] = {
        { spellID = 119898, duration = 24},
        { spellID = 212619, duration = 24},
        { spellID = 111898, duration = 90},
        { spellID = 30283,  duration = 60},
        { spellID = 6789,   duration = 45},
        { spellID = 104773, duration = 180},
        { spellID = 108416, duration = 60},
        { spellID = 48020,  duration = 30},
        { spellID = 1122,   duration = 180},
        { spellID = 113860, duration = 120},
        { spellID = 113858, duration = 120},
        { spellID = 265187, duration = 90},
        { spellID = 267217, duration = 180},
        { spellID = 201996, duration = 90},
        { spellID = 212459, duration = 90},
        { spellID = 264119, duration = 45},
        { spellID = 205180, duration = 180},
        { spellID = 267171, duration = 60},
        { spellID = 212295, duration = 45},
        { spellID = 221703, duration = 60},
        { spellID = 199954, duration = 45},
        { spellID = 80240,  duration = 30},
        { spellID = 200546, duration = 45},
    },
    ["WARRIOR"] = { 
        { spellID = 6552,   duration = 15},
        { spellID = 107570, duration = 30},
        { spellID = 46968,  duration = 40},
        { spellID = 5246,   duration = 90},
        { spellID = 118038, duration = 180},
        { spellID = 184364, duration = 120},
        { spellID = 97462,  duration = 180},
        { spellID = 871,    duration = 240},
        { spellID = 12975,  duration = 120},
        { spellID = 1160,   duration = 45},
        { spellID = 236077, duration = 45},
        { spellID = 107574, duration = 90},
        { spellID = 1719,   duration = 90},
        { spellID = 227847, duration = 90},
        { spellID = 46924,  duration = 60},
        { spellID = 152277, duration = 60},
        { spellID = 228920, duration = 60},
        { spellID = 118000, duration = 35},
        { spellID = 167105, duration = 45},
        { spellID = 262161, duration = 45},
        { spellID = 280772, duration = 30},
        { spellID = 198817, duration = 25},
        { spellID = 236273, duration = 60},
        { spellID = 236320, duration = 90},
        { spellID = 216890, duration = 25},
        { spellID = 23920,  duration = 25},
        { spellID = 213915, duration = 30},
        { spellID = 6544,   duration = 45},
        { spellID = 18499,  duration = 60},
    }
    }