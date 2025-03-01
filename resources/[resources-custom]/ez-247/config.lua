Framework = exports['qb-core']
Manager = exports['ez-manager']
Keybinds = exports['jay-interactions']

Config = {}

Config.ShowBlips = false -- show blips of every storeclerk.

Config.WeaponTable = {
    "weapon_sawnoffshotgun",
    "weapon_snspistol",
    "weapon_musket",
    "weapon_pumpshotgun",
}

Config.ClerkData = {
    ["model"] = GetHashKey("mp_m_shopkeep_01"), -- this is the model of the clerk that you rob.
    ["cash"] = { -- random reward between value 1 -> value 2
        500,
        800
    }
}

Config.StoreClerks = { -- this is where you want all store clerks. if you want to add more = vector4(x, y, z, heading)
    ["247 Clinton"] = vector4(372.29217529297, 326.39370727539, 103.56636047363, 246.00857543945),
    ["247 Strawberry"] = vector4(24.215274810791, -1347.2624511719, 29.497016906738, 248.67747497559),
    ["247 Palomino"] = vector4(2557.1748046875, 380.64489746094, 108.62294006348, 340.8776550293),
    ["247 Ineseno"] = vector4(-3038.2673339844, 584.47491455078, 7.908935546875, 23.610481262207),
    ["247 Barbareno"] = vector4(-3242.2670898438, 999.76306152344, 12.830704689026, 345.36389160156),
    ["247 Route 68"] = vector4(549.44256591797, 2671.2185058594, 42.156513214111, 75.037734985352),
    ["247 Alhambra"] = vector4(1959.9187011719, 3740.0014648438, 32.343738555908, 293.646484375),
    ["247 Senora"] = vector4(1727.7840576172, 6415.3408203125, 35.037250518799, 226.98921203613),
    ["247 Route 13"] = vector4(2677.9306640625, 3279.3017578125, 55.241123199463, 317.35440063477),
    ["RobsLiquor Great Ocean"] = vector4(-2966.3012695313, 391.58193969727, 15.043300628662, 86.15234375),
    ["RobsLiquor Prosperity"] = vector4(-1487.2850341797, -376.92288208008, 40.163436889648, 153.55458068848),
    ["RobsLiquor San Andreas"] = vector4(-1221.3229980469, -908.12780761719, 12.326356887817, 37.299858093262),
    ["RobsLiquor El Rancho"] = vector4(1134.0545654297, -983.3251953125, 46.415802001953, 282.5920715332),
    ["RobsLiquor Route 68"] = vector4(1165.2305908203, 2710.9692382813, 38.157665252686, 188.72573852539),
    ["LTD Vespucci"] = vector4(-705.91625976563, -913.41326904297, 19.215585708618, 89.320465087891),
    ["LTD Davis"] = vector4(-46.958980560303, -1758.9643554688, 29.420999526978, 48.277374267578),
    ["LTD Mirror Park"] = vector4(1165.1630859375, -323.87414550781, 69.205047607422, 101.4720993042),
    ["LTD Banham Canyon"] = vector4(-1819.5125732422, 793.64141845703, 138.08486938477, 132.9716796875),
    ["LTD Grapeseed"] = vector4(1697.1395263672, 4923.4130859375, 42.063632965088, 325.30218505859)
}