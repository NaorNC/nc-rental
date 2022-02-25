NCCore = nil
TriggerEvent('NCCore:GetObject', function(obj) NCCore = obj end)

RegisterNetEvent("nc-rental:vehiclelist")
AddEventHandler("nc-rental:vehiclelist", function()
  for i = 1, #Config.vehicleList do
    TriggerEvent('nh-context:sendMenu', {
      {
        id = Config.vehicleList[i].model,
        header = Config.vehicleList[i].name,
        txt = "$"..Config.vehicleList[i].price..".00",
        params = {
          event = "nc-rental:attemptvehiclespawn",
          args = {
            id = Config.vehicleList[i].model,
            price = Config.vehicleList[i].price,
          }
        }
      },
    })
  end
end)

RegisterNetEvent("nc-rental:attemptvehiclespawn")
AddEventHandler("nc-rental:attemptvehiclespawn", function(vehicle)
    TriggerServerEvent("nc-rental:attemptPurchase",vehicle.id, vehicle.price)
end)

RegisterNetEvent("nc-rental:attemptvehiclespawnfail")
AddEventHandler("nc-rental:attemptvehiclespawnfail", function()
  NCCore.Functions.Notify("Not enough money.", "error")
end)

local PlayerName = nil

RegisterNetEvent("nc-rental:giverentalpaperClient")
AddEventHandler("nc-rental:giverentalpaperClient", function(model, plate, name)

  local info = {
    data = "Model : "..tostring(model).." | Plate : "..tostring(plate)..""
  }
  TriggerServerEvent('NCCore:Server:AddItem', "rentalpapers", 1, info)
end)

RegisterNetEvent("nc-rental:returnvehicle")
AddEventHandler("nc-rental:returnvehicle", function()
  local car = GetVehiclePedIsIn(PlayerPedId(),true)

  if car ~= 0 then
    local plate = GetVehicleNumberPlateText(car)
    local vehname = string.lower(GetDisplayNameFromVehicleModel(GetEntityModel(car)))
    if string.find(tostring(plate), "NC") then
      NCCore.Functions.TriggerCallback('nc-rental:server:hasrentalpapers', function(HasItem)
        if HasItem then
          TriggerServerEvent("NCCore:Server:RemoveItem", "rentalpapers", 1)
          TriggerServerEvent('nc-rental:server:payreturn',vehname)
          DeleteVehicle(car)
          DeleteEntity(car)
        else
          NCCore.Functions.Notify("I cannot take a vehicle without its papers.", "error")
        end
      end)
    else
      NCCore.Functions.Notify("This is not a rented vehicle.", "error")
    end

  else
    NCCore.Functions.Notify("I don't see any rented vehicle, make sure its nearby.", "error")
  end
end)

RegisterNetEvent("nc-rental:vehiclespawn")
AddEventHandler("nc-rental:vehiclespawn", function(data, cb)
  local model = data

  RequestModel(model)
  while not HasModelLoaded(model) do
      Citizen.Wait(0)
  end
  SetModelAsNoLongerNeeded(model)

  local veh = CreateVehicle(model, vector4(-1235.327, -180.5932, 38.784908, 261.06628), true, false)
  Citizen.Wait(100)
  SetEntityAsMissionEntity(veh, true, true)
  SetModelAsNoLongerNeeded(model)
  SetVehicleOnGroundProperly(veh)
  SetVehicleNumberPlateText(veh, "NC"..tostring(math.random(1000, 9999)))
  local plate = GetVehicleNumberPlateText(veh)
  TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh), veh)

  local plateText = GetVehicleNumberPlateText(veh)
  TriggerServerEvent("nc-rental:giverentalpaperServer",model ,plateText)

  local timeout = 10
  while not NetworkDoesEntityExistWithNetworkId(veh) and timeout > 0 do
      timeout = timeout - 1
      Wait(1000)
  end
end)

AddEventHandler("nc-inventory:itemUsed", function(item, info)
  if item == "rentalpapers" then

    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
      data = json.decode(info)
      local vin = GetVehicleNumberPlateText(plyVeh)
      local isRental = vin ~= nil and string.sub(vin, 2, 3) == "NC"
      if isRental then
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(plyVeh))
        NCCore.Functions.Notify("You received the vehicle keys.", "success")
      else
        NCCore.Functions.Notify("This rental does not exist.", "success")
      end
  end
end)