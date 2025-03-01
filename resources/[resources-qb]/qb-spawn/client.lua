local QBCore = exports['qb-core']:GetCoreObject()
local camZPlus1 = 1500
local camZPlus2 = 50
local pointCamCoords = 75
local pointCamCoords2 = 0
local cam1Time = 500
local cam2Time = 1000
local choosingSpawn = false
local Houses = {}
local cam = nil
local cam2 = nil

-- Functions

local function SetDisplay(bool)
    choosingSpawn = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool
    })
end

-- Events

RegisterNetEvent('qb-spawn:client:openUI', function(value)
    SetEntityVisible(PlayerPedId(), false)
    DoScreenFadeOut(250)
    Wait(1000)
    DoScreenFadeIn(250)
    QBCore.Functions.GetPlayerData(function(PlayerData)
        cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", PlayerData.position.x, PlayerData.position.y, PlayerData.position.z + camZPlus1, -85.00, 0.00, 0.00, 100.00, false, 0)
        SetCamActive(cam, true)
        RenderScriptCams(true, false, 1, true, true)
    end)
    Wait(500)
    SetDisplay(value)
end)

RegisterNetEvent('qb-houses:client:setHouseConfig', function(houseConfig)
    Houses = houseConfig
end)

RegisterNetEvent('qb-spawn:client:setupSpawns', function(cData, new, apps)
    if not new then
        if QB.Housing["qb-houses"] then
            QBCore.Functions.TriggerCallback('qb-spawn:server:getOwnedHouses', function(houses)
                local myHouses = {}
                if houses ~= nil then
                    for i = 1, (#houses), 1 do
                            myHouses[#myHouses+1] = {
                                house = houses[i].house,
                                label = Houses[houses[i].house].adress,
                            }
                    end
                end
                Wait(500)

                local Apartment = nil
                local ApartmentName = nil
                
                QBCore.Functions.TriggerCallback('apartments:GetOwnedApartment', function(result)
                    Apartment = Apartments.Locations[result.type]  
                    ApartmentName = result.name
                end)
                while Apartment == nil and ApartmentName == nil do
                    Wait(0)
                end

                SendNUIMessage({
                    action = "setupLocations",
                    locations = QB.Spawns,
                    houses = myHouses,
                    Apartment = Apartment,
                    ApartmentNames = ApartmentName,
                    Access = QB.SpawnAccess,
                })
            end, cData.citizenid)
        elseif QB.Housing["ps-housing"] then
            QBCore.Functions.TriggerCallback('qb-spawn:server:getOwnedHouses', function(houses)
                while houses == nil do
                    Wait(0)
                end
                local myHouses = {}
                local Apartments = {}
                if houses ~= nil then
                    for i = 1, (#houses), 1 do
                        local house = houses[i]

                        myHouses[#myHouses+1] = {
                            house = house,
                            label = (house.apartment or house.street) .. " " .. house.property_id,
                        }
                        if house.apartment ~= nil then
                            Apartments[#Apartments+1] = {
                                pos = Config.Apartments[house.apartment],
                                key = house.property_id
                            }
                        end
                    end

                end
                Wait(500)
                SendNUIMessage({
                    action = "setupLocations",
                    locations = QB.Spawns,
                    houses = myHouses,
                    Apartment = Apartments,
                    Access = QB.SpawnAccess,
                })
            end, cData.citizenid)
            

        end

    elseif new then
        local PsSetting = false 
        if QB.Housing["ps-housing"] then
            PsSetting = true
        elseif QB.Housing["qb-houses"] then
            PsSetting = false
        end
        SendNUIMessage({
            action = "setupAppartements",
            locations = apps,
            qbps = PsSetting
        })
    end
end)

-- NUI Callbacks

local cam = nil
local cam2 = nil

local function SetCam(campos)
    cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus1, 300.00,0.00,0.00, 110.00, false, 0)
    PointCamAtCoord(cam2, campos.x, campos.y, campos.z + pointCamCoords)
    SetCamActiveWithInterp(cam2, cam, cam1Time, true, true)
    if DoesCamExist(cam) then
        DestroyCam(cam, true)
    end
    Wait(cam1Time)

    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", campos.x, campos.y, campos.z + camZPlus2, 300.00,0.00,0.00, 110.00, false, 0)
    PointCamAtCoord(cam, campos.x, campos.y, campos.z + pointCamCoords2)
    SetCamActiveWithInterp(cam, cam2, cam2Time, true, true)
    SetEntityCoords(PlayerPedId(), campos.x, campos.y, campos.z)
end

RegisterNUICallback('setCam', function(data, cb)
    local location = tostring(data.posname)
    local type = tostring(data.type)

    DoScreenFadeOut(200)
    Wait(500)
    DoScreenFadeIn(200)

    if DoesCamExist(cam) then DestroyCam(cam, true) end
    if DoesCamExist(cam2) then DestroyCam(cam2, true) end

    if type == "current" then
        QBCore.Functions.GetPlayerData(function(PlayerData)
            SetCam(PlayerData.position)
        end)
    elseif type == "house" then
        SetCam(Houses[location].coords.enter)
    elseif type == "normal" then
        SetCam(QB.Spawns[location].coords)
    elseif type == "appartment" then
        if QB.Housing['qb-houses'] then
            SetCam(Apartments.Locations[location].coords.enter)
        end
    end
    cb('ok')
end)

RegisterNUICallback('chooseAppa', function(data, cb)
    local ped = PlayerPedId()
    local appaYeet = data.appType
    SetDisplay(false)
    DoScreenFadeOut(500)
    Wait(5000)
    if QB.Housing["ps-housing"] then
        TriggerServerEvent("ps-housing:server:createNewApartment", appaYeet)
    elseif QB.Housing["qb-houses"] then
        TriggerServerEvent("apartments:server:CreateApartment", appaYeet, Apartments.Locations[appaYeet].label)
    end
    TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
    TriggerEvent('QBCore:Client:OnPlayerLoaded')
    FreezeEntityPosition(ped, false)
    RenderScriptCams(false, true, 500, true, true)
    SetCamActive(cam, false)
    DestroyCam(cam, true)
    SetCamActive(cam2, false)
    DestroyCam(cam2, true)
    SetEntityVisible(ped, true)
    cb('ok')
end)

local function PreSpawnPlayer()
    SetDisplay(false)
    DoScreenFadeOut(500)
    Wait(2000)
end

local function PostSpawnPlayer(ped)
    FreezeEntityPosition(ped, false)
    RenderScriptCams(false, true, 500, true, true)
    SetCamActive(cam, false)
    DestroyCam(cam, true)
    SetCamActive(cam2, false)
    DestroyCam(cam2, true)
    SetEntityVisible(PlayerPedId(), true)
    Wait(500)
    DoScreenFadeIn(250)
end

RegisterNUICallback('spawnplayerappartment2', function(data, cb)
    PreSpawnPlayer()
    local Data = data.spawnloc
    local Data2 = data.apartName
    if QB.Housing["ps-housing"] then
        -- PreSpawnPlayer()
        TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
        TriggerEvent('QBCore:Client:OnPlayerLoaded')
        local property_id = Data2
        TriggerServerEvent('ps-housing:server:enterProperty', tostring(property_id))
        PostSpawnPlayer()
        cb('ok')
    elseif QB.Housing["qb-houses"] then
        -- PreSpawnPlayer()
        TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
        TriggerEvent('QBCore:Client:OnPlayerLoaded')
        TriggerServerEvent('qb-houses:server:SetInsideMeta', 0, false)
        TriggerServerEvent('qb-apartments:server:SetInsideMeta', 0, 0, false)
        TriggerEvent('qb-apartments:client:LastLocationHouse', Data, Data2)
        PostSpawnPlayer()
        cb('ok')
    end

end)

RegisterNUICallback('spawnplayer', function(data, cb)
    local location = tostring(data.spawnloc)
    local type = tostring(data.typeLoc)
    local ped = PlayerPedId()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local insideMeta = PlayerData.metadata["inside"]

    if type == "current" then
        PreSpawnPlayer()
        QBCore.Functions.GetPlayerData(function(pd)
            ped = PlayerPedId()
            SetEntityCoords(ped, pd.position.x, pd.position.y, pd.position.z)
            SetEntityHeading(ped, pd.position.a)
            FreezeEntityPosition(ped, false)
        end)
        if QB.Housing["qb-houses"] then
            if insideMeta.house ~= nil then
                local houseId = insideMeta.house
                TriggerEvent('qb-houses:client:LastLocationHouse', houseId)
            elseif insideMeta.apartment.apartmentType ~= nil or insideMeta.apartment.apartmentId ~= nil then
                local apartmentType = insideMeta.apartment.apartmentType
                local apartmentId = insideMeta.apartment.apartmentId
                TriggerEvent('qb-apartments:client:LastLocationHouse', apartmentType, apartmentId)
            end
        elseif QB.Housing["ps-housing"] then
            if insideMeta.property_id ~= nil then
                local property_id = insideMeta.property_id
                TriggerServerEvent('ps-housing:server:enterProperty', tostring(property_id))
            end
        end
        TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
        TriggerEvent('QBCore:Client:OnPlayerLoaded')
        PostSpawnPlayer()
    elseif type == "house" then
        PreSpawnPlayer()
        TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
        TriggerEvent('QBCore:Client:OnPlayerLoaded')
        if QB.Housing["qb-houses"] then
            TriggerEvent('qb-houses:client:enterOwnedHouse', location)
            TriggerServerEvent('qb-houses:server:SetInsideMeta', 0, false)
            TriggerServerEvent('qb-apartments:server:SetInsideMeta', 0, 0, false)
        elseif QB.Housing["ps-housing"] then
            local property_id = data.spawnloc
            TriggerServerEvent('ps-housing:server:enterProperty', tostring(property_id))
        end

        PostSpawnPlayer()
    elseif type == "normal" then
        local pos = QB.Spawns[location].coords
        PreSpawnPlayer()
        SetEntityCoords(ped, pos.x, pos.y, pos.z)
        TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
        TriggerEvent('QBCore:Client:OnPlayerLoaded')
        TriggerServerEvent('qb-houses:server:SetInsideMeta', 0, false)
        TriggerServerEvent('qb-apartments:server:SetInsideMeta', 0, 0, false)
        if QB.Housing["ps-housing"] then
            TriggerServerEvent('ps-housing:server:resetMetaData')
        end
        Wait(500)
        SetEntityCoords(ped, pos.x, pos.y, pos.z)
        SetEntityHeading(ped, pos.w)
        PostSpawnPlayer()
    end
    cb('ok')
end)

RegisterNetEvent('qb-spawn:client:OpenUIForSelectCoord', function()
    local PlayerCoord = GetEntityCoords(PlayerPedId(), 1)
    local PlayerHeading = GetEntityHeading(PlayerPedId())
    SendNUIMessage({
        action = "AddCoord",
        Coord = {x = PlayerCoord[1], y = PlayerCoord[2], z = PlayerCoord[3], h = PlayerHeading},
            
    })
    SetNuiFocus(true, true)
end)

RegisterNUICallback('CloseAddCoord', function(_, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)

-- Threads

CreateThread(function()
    while true do
        Wait(0)
        if choosingSpawn then
            DisableAllControlActions(0)
        else
            Wait(1000)
        end
    end
end)
