local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("qb-rental:vehiclelist", function()
  for i = 1, #Config.vehicleList do
      if Config.setupMenu == 'nh-context' then
        TriggerEvent('nh-context:sendMenu', {
          {
            id = Config.vehicleList[i].model,
            header = Config.vehicleList[i].name,
            txt = "$"..Config.vehicleList[i].price..".00",
            params = {
              event = "qb-rental:attemptvehiclespawn",
              args = {
                id = Config.vehicleList[i].model,
                price = Config.vehicleList[i].price,
              }
            }
          },
        })
      elseif Config.setupMenu == 'qb-menu' then
        	local MenuOptions = {
        		{
        			header = "Vehicle Rental",
        			isMenuHeader = true
        		},
        	}
        	for k, v in pairs(Config.vehicleList) do
          
          
        		MenuOptions[#MenuOptions+1] = {
        			header = "<h8>"..v.name.."</h>",
              txt = "$"..v.price..".00",
        			params = {
                event = "qb-rental:attemptvehiclespawn",
                args = {
                  id = v.model,
                  price = v.price
                }
        			}
        		}
        	end
        	exports['qb-menu']:openMenu(MenuOptions)
      end
    end
end)

RegisterNetEvent("qb-rental:attemptvehiclespawn", function(vehicle)
    TriggerServerEvent("qb-rental:attemptPurchase",vehicle.id, vehicle.price)
end)

RegisterNetEvent("qb-rental:attemptvehiclespawnfail", function()
  QBCore.Functions.Notify("Not enough money.", "error")
end)

local PlayerName = nil

RegisterNetEvent("qb-rental:giverentalpaperClient", function(model, plate, name)

  local info = {
    data = "Model : "..tostring(model).." | Plate : "..tostring(plate)..""
  }
  TriggerServerEvent('QBCore:Server:AddItem', "rentalpapers", 1, info)
end)

RegisterNetEvent("qb-rental:returnvehicle", function()
  local car = GetVehiclePedIsIn(PlayerPedId(),true)

  if car ~= 0 then
    local plate = GetVehicleNumberPlateText(car)
    local vehname = string.lower(GetDisplayNameFromVehicleModel(GetEntityModel(car)))
    if string.find(tostring(plate), "NC") then
      QBCore.Functions.TriggerCallback('qb-rental:server:hasrentalpapers', function(HasItem)
        if HasItem then
          TriggerServerEvent("QBCore:Server:RemoveItem", "rentalpapers", 1)
          TriggerServerEvent('qb-rental:server:payreturn',vehname)
          QBCore.Functions.DeleteVehicle(car)
        else
          QBCore.Functions.Notify("I cannot take a vehicle without its papers.", "error")
        end
      end)
    else
      QBCore.Functions.Notify("This is not a rented vehicle.", "error")
    end

  else
    QBCore.Functions.Notify("I don't see any rented vehicle, make sure its nearby.", "error")
  end
end)

RegisterNetEvent("qb-rental:vehiclespawn", function(data, cb)
  local model = data

  local closestDist = 10000
  local closestSpawn = nil
  local pcoords = GetEntityCoords(PlayerPedId())
  
  for i, v in ipairs(Config.vehicleSpawn) do
      local dist = #(v.workSpawn.coords - pcoords)
  
      if dist < closestDist then
          closestDist = dist
          closestSpawn = v.workSpawn
      end
  end

  RequestModel(model)
  while not HasModelLoaded(model) do
      Citizen.Wait(0)
  end
  SetModelAsNoLongerNeeded(model)

  QBCore.Functions.SpawnVehicle(model, function(veh)
    SetVehicleNumberPlateText(veh, "RENT"..tostring(math.random(1000, 9999)))
    SetEntityHeading(veh, closestSpawn.heading)
    exports['LegacyFuel']:SetFuel(veh, 100.0)
    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
    SetEntityAsMissionEntity(veh, true, true)
    TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
    SetVehicleEngineOn(veh, true, true)
    CurrentPlate = QBCore.Functions.GetPlate(veh)
  end, closestSpawn.coords, true)
    

  local plateText = GetVehicleNumberPlateText(veh)
  TriggerServerEvent("qb-rental:giverentalpaperServer",model ,plateText)

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
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
        QBCore.Functions.Notify("You received the vehicle keys.", "success")
      else
        QBCore.Functions.Notify("This rental does not exist.", "success")
      end
  end
end)


-- Adding Blips in config folder # MoneSuper
CreateThread(function()
  for _, rental in pairs(Config.Locations["rentalstations"]) do
      local blip = AddBlipForCoord(rental.coords.x, rental.coords.y, rental.coords.z)
      SetBlipSprite(blip, 326)
      SetBlipAsShortRange(blip, true)
      SetBlipScale(blip, 0.5)
      SetBlipColour(blip, 5)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(rental.label)
      EndTextCommandSetBlipName(blip)
  end
end)



-- Exports to Polyzone Box # Config could also work # MoneSuper
exports['qb-target']:AddBoxZone("NewRentalMenu4", vector3(1152.78, -373.01, 67.14), 1.4, 1.4, {
  name="NewRentalMenu4",
  heading=8,
  debugPoly=false,
  minZ = 64.34,
  maxZ = 68.34,
  }, {
      options = {
          {
              event = "qb-rental:vehiclelist",
              icon = "fas fa-circle",
              label = "Rent vehicle",
          },
          {
              event = "qb-rental:returnvehicle",
              icon = "fas fa-circle",
              label = "Return Vehicle (Receive Back 50% of original price)",
          },
      },
     distance = 3.5
})

exports['qb-target']:AddBoxZone("NewRentalMenu5", vector3(463.51, -1676.57, 29.29), 2, 2, {
  name="NewRentalMenu5",
  heading=0,
  debugPoly=false,
  minZ = 26.89,
  maxZ = 30.89,
  }, {
      options = {
          {
              event = "qb-rental:vehiclelist",
              icon = "fas fa-circle",
              label = "Rent vehicle",
          },
          {
              event = "qb-rental:returnvehicle",
              icon = "fas fa-circle",
              label = "Return Vehicle (Receive Back 50% of original price)",
          },
      },
      distance = 3.5
})

exports['qb-target']:AddBoxZone("NewRentalMenu6", vector3(-1442.28, -674.07, 26.48), 2, 2, {
  name="NewRentalMenu6",
  heading=305,
  debugPoly=false,
  minZ = 24.48,
  maxZ = 28.48,
  }, {
      options = {
          {
              event = "qb-rental:vehiclelist",
              icon = "fas fa-circle",
              label = "Rent vehicle",
          },
          {
              event = "qb-rental:returnvehicle",
              icon = "fas fa-circle",
              label = "Return Vehicle (Receive Back 50% of original price)",
          },
      },
      job = {"all"},
      distance = 3.5
})
