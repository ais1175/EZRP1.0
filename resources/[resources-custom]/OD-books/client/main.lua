local bookProp = nil

RegisterCommand("fixnui", function()
    SetNuiFocus(false, false)
    SendNUIMessage({
        show = false
    })
    ClearPedSecondaryTask(ped)
end, false)

local function PlayAnimation(dict, name, duration)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do Wait(0) end
    TaskPlayAnim(PlayerPedId(), dict, name, 1.0, -1.0, duration, 49, 1, false, false, false)
    RemoveAnimDict(dict)
end

local function HandleProp(action, ped, ped_coords, bookName, prop)
    if action == 'add' then
        propname = Config.Books
        bookprop = CreateObject(propName, ped_coords.x, ped_coords.y, ped_coords.z, true, true, true)
        AttachEntityToEntity(bookProp, ped, GetPedBoneIndex(ped, 6286), 0.15, 0.03, -0.065, 0.0, 180.0, 90.0, true, true, false, true, 1, true)
        SetModelAsNoLongerNeeded(propName)
        PlayAnimation('cellphone@', 'cellphone_text_read_base', 10000)
    elseif action == 'remove' then
        ClearPedSecondaryTask(ped)
        Wait(1000)
        SetEntityAsMissionEntity(prop)
        DeleteObject(prop)
        bookProp = nil
    end
end

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        SetNuiFocus(false,false)
        SendNUIMessage({
            show = false
        })
        ClearPedSecondaryTask(PlayerPedId())
        SetEntityAsMissionEntity(bookProp)
        DeleteObject(bookProp)
    end
end)

RegisterNetEvent('qb-books:client:OpenBook', function(bookName)
    local ped = PlayerPedId()
    local ped_coords = GetEntityCoords(ped)
    HandleProp('add', ped, ped_coords, bookName)
    DisableControlAction(0, 263, true) -- disable melee
    DisableControlAction(0, 264, true) -- disable melee
    DisableControlAction(0, 257, true) -- disable melee
    DisableControlAction(0, 140, true) -- disable melee
    DisableControlAction(0, 141, true) -- disable melee
    DisableControlAction(0, 142, true) -- disable melee
    DisableControlAction(0, 143, true) -- disable melee
    DisableControlAction(0, 245, true) -- disable chat
    DisableControlAction(0,25,true) -- disable aim
    DisableControlAction(0,47,true) -- disable weapon
    DisableControlAction(0,58,true) -- disable weapon
    RemoveAllPedWeapons(ped, true) -- Puts gun away
    DisableControlAction(0, 245, true) -- disable chat
    SetNuiFocus(true,true)
    SendNUIMessage({
        show = true,
        book = bookName,
        pages = Config.Books[bookName]["pages"],
        size = Config.Books[bookName]["size"],
    })
end)

RegisterNUICallback('escape', function(data, cb)
    local ped = PlayerPedId()
    HandleProp('remove', ped, false, nil, bookProp)
    SetNuiFocus(false, false)
    cb('ok')
end)