RegisterServerEvent("ez:sync:player:ready")
AddEventHandler("ez:sync:player:ready", function()
    
end)

RegisterServerEvent("sync:request")
AddEventHandler("sync:request", function(native, netID, ...)
    TriggerClientEvent("sync:execute", -1, native, netID, ...)
end)

RegisterServerEvent("sync:execute:aborted")
AddEventHandler("sync:execute:aborted", function(native, netID)
end)

RegisterServerEvent("sync:executeSyncNative")
AddEventHandler("sync:executeSyncNative", function(native, netEntity, options, args)
    TriggerClientEvent("sync:clientExecuteSyncNative", -1, native, netEntity, options, args)
end)