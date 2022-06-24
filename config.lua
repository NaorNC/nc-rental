Config = {}

Config.vehicleList = {
    { name = "Bison", model = "bison", price = 300 },
    { name = "Futo", model = "Futo", price = 250 },
    { name = "Coach", model = "coach", price = 400 },
    { name = "Tour bus", model = "tourbus", price = 600 },
    { name = "Taco", model = "taco", price = 420 },
    { name = "Limo", model = "stretch", price = 1250 },
    { name = "Hearse", model = "romero", price = 1300 },
    { name = "Clown Car", model = "speedo2", price = 2850 },
    { name = "Festival Bus", model = "pbus2", price = 4500 },
}


-- Blips 
Config.Locations = {
    ["rentalstations"] = {
        [1] = {label = "Rental Stations", coords = vector4(1152.44, -372.97, 67.2, 270.36)},
        [2] = {label = "Rental Stations", coords = vector4(462.75, -1676.62, 29.29, 5.02)},
        [3] = {label = "Rental Stations", coords = vector4(-1442.49, -673.65, 26.53, 288.07)},
    },
}



Config.spawn = {
    --- Mirror Park
	[1] = { 
		workSpawn = {
			coords = vector3(1144.69, -383.79, 67.05),
			heading = 344.69,
		},
	},
    --- Davis 
    [2] = { 
		workSpawn = {
			coords = vector3(460.1, -1699.62, 29.3),
			heading = 323.94,
		},
	},
 --- Marathon Avenue
    [3] = { 
		workSpawn = {
			coords = vector3(-1444.12, -680.25, 26.39),
			heading = 122.5,
		},
	},
}


-- Addding Exports to your QB-Target Can be found at client.lua