RegisterCommand("mask", function()
    TriggerEvent("ez-usables:client:ToggleMask")
end, false)

RegisterNetEvent('ez-usables:client:ToggleMask', function()
    local ped = PlayerPedId()
    local mask = GetPedDrawableVariation(ped, 1)
    local tex = GetPedTextureVariation(ped, 1)

    if mask == 0 then
        TriggerServerEvent("ez-usables:server:MaskOnByCommand")
    else
        TriggerEvent("ez-usables:client:MaskOff", mask, tex)
    end
end)

RegisterNetEvent('ez-usables:client:MaskOn', function(item)
    local ped = PlayerPedId()
    if item.info.drawableId == nil then print("This mask has no data. Do not spawn it in. Instead go to a clothing store then remove the mask") end
    if GetPedDrawableVariation(ped, 1) ~= 0 then Framework:Notify("You are already wearing a mask", "error") return end

    Framework:Progressbar("maskon", "Putting Mask On..", 600, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    }, {
        animDict = "mp_masks@standard_car@ds@",
        anim = "put_on_mask",
        flags = 49,
    }, {}, {}, function() -- Done
        SetPedComponentVariation(ped, 1, item.info.drawableId, item.info.textureId)
        print(item.name)
        TriggerServerEvent("ez-usables:server:RemoveMaskItem", item)
    end, function() -- Cancel

    end)
end)

RegisterNetEvent('ez-usables:client:MaskOff', function(mask, tex)
    local ped = PlayerPedId()
    if GetPedDrawableVariation(ped, 1) == 0 then Framework:Notify("You are not wearing a mask", "error") return end

    Framework:Progressbar("maskoff", "Taking Mask Off..", 600, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    }, {
        animDict = "missfbi4",
        anim = "takeoff_mask",
        flags = 49,
    }, {}, {}, function() -- Done
        SetPedComponentVariation(ped, 1, 0)
        TriggerServerEvent("ez-usables:server:GiveMaskItem", mask, tex)
    end, function() -- Cancel

    end)
end)