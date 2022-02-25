NCCore = nil
TriggerEvent('NCCore:GetObject', function(obj) NCCore = obj end)

RegisterServerEvent('nc-rental:attemptPurchase')
AddEventHandler('nc-rental:attemptPurchase', function(car,price)
	local src = source
	local Player = NCCore.Functions.GetPlayer(src)
    local cash = Player.PlayerData.money.cash
    if cash >= price then
        Player.Functions.RemoveMoney("cash",price,"rentals")
        TriggerClientEvent('nc-rental:vehiclespawn', source, car)
        TriggerClientEvent('NCCore:Notify', src, car .. " has been rented for $" .. price .. ", return it in order to receive 50% of the total costs.", "success")
    else
        TriggerClientEvent('nc-rental:attemptvehiclespawnfail', source)
    end
end)

RegisterServerEvent('nc-rental:giverentalpaperServer')
AddEventHandler('nc-rental:giverentalpaperServer', function(model, plateText)
    local src = source
    local PlayerData = NCCore.Functions.GetPlayer(src)
    local info = {
        label = plateText
    }
    PlayerData.Functions.AddItem('rentalpapers', 1, false, info)
    TriggerClientEvent('inventory:client:ItemBox', src, NCCore.Shared.Items['rentalpapers'], "add")
end)

RegisterServerEvent('nc-rental:server:payreturn')
AddEventHandler('nc-rental:server:payreturn', function(model)
    local src = source
    local Player = NCCore.Functions.GetPlayer(source)
    for k,v in pairs(Config.vehicleList) do 
        if string.lower(v.model) == model then
            local payment = v.price / 2
            Player.Functions.AddMoney("cash",payment,"rental-return")
            TriggerClientEvent('NCCore:Notify', src, "You have returned your rented vehicle and received $" .. payment .. " in return.", "success")
        end
    end
end)

NCCore.Functions.CreateCallback('nc-rental:server:hasrentalpapers', function(source, cb)
    local Player = NCCore.Functions.GetPlayer(source)
    local Item = Player.Functions.GetItemByName("rentalpapers")
    if Item ~= nil then
        cb(true)
    else
        cb(false)
    end
end)