ESX = exports["es_extended"]:getSharedObject()

local searched = {} 
local canSearch = true 
local dumpsters = {
    [218085040] = true,
    [666561306] = true,
    [-58485588] = true,
    [-206690185] = true,
    [1511880420] = true,
    [682791951] = true
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if canSearch then
            local ped = GetPlayerPed(-1)
            local pos = GetEntityCoords(ped)
            local objects = GetGamePool('CObject')

            for _, obj in ipairs(objects) do
                local model = GetEntityModel(obj)
                if dumpsters[model] and not searched[obj] then
                    local dumpPos = GetEntityCoords(obj)
                    local dist = #(pos - dumpPos)
                    
                    if dist < 1.8 then
                        showInfobar(Translation[Config.Locale]['input'])
                        if IsControlJustReleased(0, 38) then
                            if searched[obj] then
                                notify(Translation[Config.Locale]['error'], Translation[Config.Locale]['search_2'], 'error')
                            else
                                startSearching(Config.searchTime, 'amb@prop_human_bum_bin@base', 'base', 'sc_dumpster:giveDumpsterReward')
                                TriggerServerEvent('sc_dumpster:startDumpsterTimer', obj)
                                searched[obj] = true
                            end
                        end
                    end
                end
            end
        end
    end
end)

RegisterNetEvent('sc_dumpster:removeDumpster')
AddEventHandler('sc_dumpster:removeDumpster', function(object)
    searched[object] = nil
end)

function startSearching(time, dict, anim, cb)
    local ped = GetPlayerPed(-1)
    canSearch = false

    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(0)
    end

    exports.sc_progress:showNUI(time, Translation[Config.Locale]['search'])
    TaskPlayAnim(ped, dict, anim, 8.0, 8.0, time, 1, 1, 0, 0, 0)

    Wait(time)
    ClearPedTasks(ped)
    canSearch = true
    TriggerServerEvent(cb)
end

function showInfobar(msg)
    SetTextComponentFormat('STRING')
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function notify(title, description, type)
    if Config.ox_libEnable then
        lib.notify({title = title, description = description, showDuration = 3000, type = type})
    else
        ESX.ShowNotification(description, 3000, true, type)
    end
end