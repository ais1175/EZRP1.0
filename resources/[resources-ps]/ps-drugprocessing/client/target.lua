local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    -- exports['qb-target']:SpawnPed({
    --     model = 'a_m_m_hillbilly_02',
    --     coords = vector4(1754.04, -1648.61, 112.65, 257.68), 
    --     spawnNow = true,
    --     minusOne = true, 
    --     freeze = true, 
    --     invincible = true, 
    --     blockevents = true,
    --     target = { 
    --         options = {
    --             {
	-- 				type = "client",
	-- 				event = "ps-drugprocessing:EnterLab",
	-- 				icon = "fas fa-atom",
    --                 label = "Enter Lab",
    --             }
    --         },
    --       distance = 2.5,
    --     },
    -- })

    exports['qb-target']:AddBoxZone("methlab", vector3(1753.59, -1649.267, 112.951), 1.7, 0.7, {
        name = "methlab",
        heading = 10.0,
        debugPoly = false,
        minZ = 111.651,
        maxZ = 114.251,
    }, {
        options = {
            {
                type = "client",
                event = "ps-drugprocessing:EnterLab",
                icon = "fas fa-atom",
                label = "Enter Lab",
            }
        },
        distance = 2.5,
    })

    exports['qb-target']:AddBoxZone("cokelab", vector3(5000.09, -5213.24, 2.508), 1.7, 0.4, {
        name = "cokelab",
        heading = 310.0,
        debugPoly = false,
        minZ = 1.208,
        maxZ = 3.808,
    }, {
        options = {
            {
                type = "client",
                event = "ps-drugprocessing:EnterCWarehouse",
                icon = "fas fa-key",
                label = "Enter Lab",
            },
        },
        distance = 2.5
    })

    -- exports['qb-target']:SpawnPed({
    --     model = 'a_m_m_mlcrisis_01',
    --     coords = vector4(5001.01, -5213.07, 2.5, 185.78), 
    --     minusOne = true, 
    --     spawnNow = true,
    --     freeze = true, 
    --     invincible = true, 
    --     blockevents = true,
    --     target = { 
    --         options = {
    --             {
	-- 				type = "client",
	-- 				event = "ps-drugprocessing:EnterCWarehouse",
	-- 				icon = "fas fa-key",
	-- 				label = Lang:t("target.talk_to_draco"),
    --             }
    --         },
    --       distance = 2.5,
    --     },
    -- })
    -- exports['qb-target']:SpawnPed({
    --     model = 'mp_f_weed_01',
    --     coords = vector4(102.07, 175.08, 104.59, 159.91),
    --     minusOne = true, 
    --     freeze = true, 
    --     invincible = true, 
    --     blockevents = true,
    --     target = { 
    --         options = {
    --             {
	-- 				type = "client",
	-- 				event = "ps-drugprocessing:EnterWWarehouse",
	-- 				icon = "fas fa-key",
	-- 				label = Lang:t("target.talk_to_charlotte"),
    --             }
    --         },
    --       distance = 2.5,
    --     },
    -- })
end)

CreateThread(function()
    -- NEED TO DO THIS
    exports["qb-target"]:AddBoxZone("chemmenu", vector3(1004.52, -1211.83, 25.29), 1.65, 2.4, {
        name = "chemmenu",
        heading = 180.0,
        debugPoly = false,
        minZ = 25.29-1,
        maxZ = 25.29+1,
    }, {
        options = {
            {
                type = "client",
                event = "ps-drugprocessing:chemicalmenu",
                icon = "fas fa-vials",
                label = Lang:t("target.chemmenu"),
                --job = "pawnshop", -- Remove this line if you do not want a job check.
            },
        },
    distance = 2.5
    })
    exports["qb-target"]:AddBoxZone("methprocess", vector3(978.22, -147.1, -48.53), 1.6, 1.8, {
        name = "methprocess",
        heading = 0,
        debugPoly = false,
        minZ = -50.33,
        maxZ = -45.53,
    }, {
        options = {
            {
                type = "client",
                event = "ps-drugprocessing:ProcessChemicals",
                icon = "fas fa-vials",
                label = Lang:t("target.methprocess"),
                --job = "methcook", -- Remove this line if you do not want a job check.
            },
        },
    distance = 3.5
    })
    exports["qb-target"]:AddBoxZone("methtempup", vector3(982.56, -145.59, -49.0), 1.2, 1.4, {
        name = "methtempup",
        heading = 0,
        debugPoly = false,
        minZ = -50.3,
        maxZ = -47.3,
    }, {
        options = {
            {
                type = "client",
                event = "ps-drugprocessing:ChangeTemp",
                icon = "fas fa-temperature-empty",
                label = Lang:t("target.methtempup"),
                --job = "methcook", -- Remove this line if you do not want a job check.
            },
        },
    distance = 3.5
    })
    exports["qb-target"]:AddBoxZone("methtempdown", vector3(979.59, -144.14, -49.0), 1.2, 0.5, {
        name = "methtempdown",
        heading = 354,
        debugPoly = false,
        minZ = -49.2,
        maxZ = -47.9,
    }, {
        options = {
            {
                type = "client",
                event = "ps-drugprocessing:ChangeTemp2",
                icon = "fas fa-temperature-full",
                label = Lang:t("target.methtempdown"),
                --job = "methcook", -- Remove this line if you do not want a job check.
            },
        },
    distance = 3.5
    })
    exports["qb-target"]:AddBoxZone("methbagging", vector3(987.44, -140.5, -49.0), 0.5, 0.7, {
        name = "methbagging",
        heading = 1,
        debugPoly = false,
        minZ = -49.35,
        maxZ = -48.65,
    }, {
        options = {
            {
                type = "client",
                event = "ps-drugprocessing:ProcessProduct",
                icon = "fas fa-box",
                label = Lang:t("target.bagging"),
                --job = "methcook", -- Remove this line if you do not want a job check.
            },
        },
    distance = 3.5
    })
    exports["qb-target"]:AddBoxZone("methkeypad", vector3(969.04, -146.17, -46.4), 0.4, 0.2, {
        name = "methkeypad",
        heading = 0,
        debugPoly = false,
        minZ = -46.2,
        maxZ = -45.8,
    }, {
        options = {
            {
                type = "client",
                event = "ps-drugprocessing:ExitLab",
                icon = "fas fa-lock",
                label = Lang:t("target.keypad"),
                --job = "methcook", -- Remove this line if you do not want a job check.
            },
        },
    distance = 3.5
    })
    exports["qb-target"]:AddBoxZone("cokeleave", vector3(1088.56, -3187.02, -38.67), 1, 1, {
        name = "cokeleave",
        heading = 0,
        debugPoly = false,
        minZ = -38.74,
        maxZ = -38.54,
    }, {
        options = {
            {
                type = "client",
                event = "ps-drugprocessing:ExitCWarehouse",
                icon = "fas fa-lock",
                label = Lang:t("target.keypad"),
                --job = "cokecutter", -- Remove this line if you do not want a job check.
            },
        },
    distance = 3.5
    })
    exports["qb-target"]:AddBoxZone("cokeleafproc", vector3(1086.2, -3194.9, -38.99), 2.5, 1.4, {
        name = "cokeleafproc",
        heading = 0,
        debugPoly = false,
        minZ = -39.39,
        maxZ = -38.39,
    }, {
        options = {
            {
                type = "client",
                event = "ps-drugprocessing:ProcessCocaFarm",
                icon = "fas fa-scissors",
                label = Lang:t("target.cokeleafproc"),
                --job = "cokecutter", -- Remove this line if you do not want a job check.
            },
        },
    distance = 3.5
    })
    exports["qb-target"]:AddBoxZone("cokepowdercut", vector3(1092.89, -3195.78, -38.99), 7.65, 1.2, {
        name = "cokepowdercut",
        heading = 90,
        debugPoly = false,
        minZ = -39.39,
        maxZ = -38.44,
    }, {
        options = {
            {
                type = "client",
                event = "ps-drugprocessing:ProcessCocaPowder",
                icon = "fas fa-weight-scale",
                label = Lang:t("target.cokepowdercut"),
                --job = "cokecutter", -- Remove this line if you do not want a job check.
            },
        },
    distance = 3.5
    })
    exports["qb-target"]:AddBoxZone("cokebricked", vector3(1100.51, -3199.46, -38.93), 2.6, 1.0, {
        name = "cokebricked",
        heading = 90,
        debugPoly = false,
        minZ = -39.99,
        maxZ = -38.59,
    }, {
        options = {
            {
                type = "client",
                event = "ps-drugprocessing:ProcessBricks",
                icon = "fas fa-weight-scale",
                label = Lang:t("target.bagging"),
                --job = "cokecutter", -- Remove this line if you do not want a job check.
            },
        },
    distance = 3.5
    })
    -- exports["qb-target"]:AddBoxZone("weedproces", vector3(1038.37, -3206.06, -38.17), 2.6, 1.0, {
    --     name = "weedproces",
    --     heading = 0,
    --     debugPoly = false,
    --     minZ = -38.37,
    --     maxZ = -37.57,
    -- }, {
    --     options = {
    --         {
    --             type = "client",
    --             event = "ps-drugprocessing:processWeed",
    --             icon = "fas fa-envira",
    --             label = Lang:t("target.weedproces"),
    --         },
    --     },
    -- distance = 3.5
    -- })
    -- exports["qb-target"]:AddBoxZone("weedkeypad", vector3(1066.51, -3183.44, -39.16), 1.6, 0.4, {
    --     name = "weedkeypad",
    --     heading = 0,
    --     debugPoly = false,
    --     minZ = -40.16,
    --     maxZ = -37.76,
    -- }, {
    --     options = {
    --         {
    --             type = "client",
    --             event = "ps-drugprocessing:ExitWWarehouse",
    --             icon = "fas fa-lock",
    --             label = Lang:t("target.keypad"),
    --             --job = "weedcutter", -- Remove this line if you do not want a job check.
    --         },
    --     },
    -- distance = 3.5
    -- })
    --[[
        exports['qb-target']:AddBoxZone(??, vector3(1665.439, -49.688, 167.912), 2.3, 1.1, {
        name = ??,
        heading = 355.0,
        debugPoly = false,
        MinZ = 167.312,
        MaxZ = 168.512,
    ]]
    -- exports["qb-target"]:AddBoxZone("heroinproces", vector3(1665.439, -49.688, 167.912), 2.3, 1.1, {
    --     name = "heroinproces",
    --     heading = 355.0,
    --     debugPoly = false,
    --     minZ = 167.312,
    --     maxZ = 168.512,
    -- }, {
    --     options = {
    --         {
    --             type = "client",
    --             event = "ps-drugprocessing:processHeroin",
    --             icon = "fas fa-envira",
    --             label = Lang:t("target.heroinproces"),
    --         },
    --     },
    --     distance = 3.5
    -- })
    exports['qb-target']:AddBoxZone("thychloride", vector3(1532.11, 1728.06, 109.92), 1, 1, {
		name="thychloride",
		heading=280.0,
		debugPoly=false,
		minZ = 109.33-2,
		maxZ = 109.33+2,
	},{
	   options = {
			{
				type = "client",
				event = "ps-drugprocessing:processingThiChlo",
				icon = "fas fa-biohazard",
				label = Lang:t("target.process_thionyl_chloride"),
			},
		},
	distance = 2.5
	})
    exports['qb-target']:AddBoxZone("heroinproc", vector3(1665.439, -49.688, 167.912), 2.3, 1.1, {
		name="heroinproc",
		heading = 355.0,
		debugPoly = false,
		minZ = 167.312,
		maxZ = 169.512,
	},{
	    options = {
			{
				type = "client",
				event = "ps-drugprocessing:ProcessPoppy",
				icon = "fas fa-leaf",
				label = Lang:t("target.heroinproc"),
			},
			},
	distance = 2.5
	})
end)

CreateThread(function()
    exports['qb-target']:AddTargetModel("h4_prop_bush_cocaplant_01", {
        options = {
            {
                type = "client",
                event = "ps-drugprocessing:pickCocaLeaves",
                icon = "fas fa-leaf",
                label = Lang:t("target.pickCocaLeaves"),
            },
        },
        distance = 4.0
    })
    exports['qb-target']:AddTargetModel("prop_plant_01b", {
        options = {
            {
                type = "client",
                event = "ps-drugprocessing:pickHeroin",
                icon = "fas fa-leaf",
                label = Lang:t("target.pickHeroin"),
            },
        },
        distance = 4.0
    })
    -- exports['qb-target']:AddTargetModel("mw_weed_plant", {
    --     options = {
    --         {
    --             type = "client",
    --             event = "ps-drugprocessing:pickWeed",
    --             icon = "fas fa-envira",
    --             label = Lang:t("target.pickWeed"),
    --         },
    --     },
    --     distance = 4.0
    -- })
    exports['qb-target']:AddTargetModel("mw_sodium_barrel", {
        options = {
            {
                type = "client",
                event = "ps-drugprocessing:pickSodium",
                icon = "fas fa-dna",
                label = Lang:t("target.pickSodium"),
            },
        },
        distance = 4.0
    })
    exports['qb-target']:AddTargetModel("mw_sulfuric_barrel", {
        options = {
            {
                type = "client",
                event = "ps-drugprocessing:pickSulfuric",
                icon = "fas fa-shield-virus",
                label = Lang:t("target.pickSulfuric"),
            },
        },
        distance = 4.0
    })
    exports['qb-target']:AddTargetModel("mw_chemical_barrel", {
        options = {
            {
                type = "client",
                event = "ps-drugprocessing:pickChemicals",
                icon = "fas fa-radiation",
                label = Lang:t("target.pickChemicals"),
            },
        },
        distance = 4.0
    })
    exports['qb-target']:AddTargetModel("mw_hydro_barrel", {
        options = {
            {
                type = "client",
                event = "ps-drugprocessing:client:hydrochloricacid",
                icon = "fas fa-radiation",
                label = Lang:t("target.hydrochloricacid"),
            },
        },
        distance = 4.0
    })
end)
