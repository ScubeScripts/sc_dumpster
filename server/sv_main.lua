ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterUsableItem('wallet', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local cash = math.random(20, 120)
    local chance = math.random(1, 2)

    TriggerClientEvent("sc_progress:showNUI", source, 5000, "Wird durchsucht...")
    Wait(5000)

    if chance == 2 then
        notify(source, Translation[Config.Locale]['success'], Translation[Config.Locale]['cash'] .. cash .. Translation[Config.Locale]['cash_1'], 'success')
        xPlayer.addMoney(cash)
    else
        notify(source, Translation[Config.Locale]['error'], Translation[Config.Locale]['empty'], 'error')
    end

    xPlayer.removeInventoryItem('wallet', 1)
end)

RegisterServerEvent('sc_dumpster:startDumpsterTimer')
AddEventHandler('sc_dumpster:startDumpsterTimer', function(dumpster)
    startTimer(source, dumpster)
end)

RegisterServerEvent('sc_dumpster:giveDumpsterReward')
AddEventHandler('sc_dumpster:giveDumpsterReward', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local gotID = {}
    local rolls = math.random(1, 2)
    local foundItem = false

    for i = 1, rolls do
        local item = Config.dumpsterItems[math.random(1, #Config.dumpsterItems)]
        if math.random(1, 10) >= item.chance and not gotID[item.id] then
            gotID[item.id] = true
            
            if item.isWeapon then
                if item.limit > 0 and xPlayer.getInventoryItem(item.id).count >= item.limit then
                    notify(source, Translation[Config.Locale]['error'], Translation[Config.Locale]['find_1'] .. item.name .. Translation[Config.Locale]['error'], 'error')
                else
                    notify(source, Translation[Config.Locale]['success'], Translation[Config.Locale]['find_1'] .. item.name, 'success')
                    xPlayer.addWeapon(item.id, 50)
                    foundItem = true
                end
            else
                if item.limit > 0 and xPlayer.getInventoryItem(item.id).count >= item.limit then
                    notify(source, Translation[Config.Locale]['error'], Translation[Config.Locale]['find'] .. item.quantity .. 'x ' .. item.name .. Translation[Config.Locale]['error'], 'error')
                else
                    notify(source, Translation[Config.Locale]['success'], Translation[Config.Locale]['find'] .. item.quantity .. 'x ' .. item.name, 'success')
                    xPlayer.addInventoryItem(item.id, item.quantity)
                    foundItem = true
                end
            end
        end
    end

    if not foundItem then
        notify(source, Translation[Config.Locale]['info'], Translation[Config.Locale]['find_2'], 'info')
    end
end)

function startTimer(id, object)
    local timer = Config.Timer
    while timer > 0 do
        Wait(1000)
        timer = timer - 1000
    end
    TriggerClientEvent('sc_dumpster:removeDumpster', id, object)
end

function notify(source, title, description, type)
    if Config.ox_libEnable then
        TriggerClientEvent('ox_lib:notify', source, {title = title, description = description, showDuration = 3000, type = type})
    else
        TriggerClientEvent('esx:showNotification', source, description, 3000, true, type)
    end
end