**This resource I will not been take any credits**
Its been Edited for XYZ Roleplay

# Video of the script:

* click - https://streamable.com/msejyp
* If you have any further questions, you can add me to Discord - NaorNC#8998

# Installation

* Download the script and put it in the [resource] folder.
* Download nh-context and put it in the [resource] or [standalone] folder. (it doesn't really matter)
Add the following code to your server.cfg/resouces.cfg
```
ensure nh-context
ensure nc-rental
```

# Dependencies
* [nh-context](https://github.com/nighmares/nh-context)

# Use via Eye Target

```lua
AddBoxZone("NewRentalMenu4", vector3(-1230.054, -176.4136, 39.327087), 2, 3.2, {
        name="NewRentalMenu4",
        heading=0,
        debugPoly=false,
        minZ=38.301415,
        maxZ=40.301415
        }, {
            options = {
                {
                    event = "nc-rental:vehiclelist",
                    icon = "fas fa-circle",
                    label = "Rent vehicle",
                },
                {
                    event = "nc-rental:returnvehicle",
                    icon = "fas fa-circle",
                    label = "Return Vehicle (Receive Back 50% of original price)",
                },
            },
            job = {"all"},
            distance = 3.5
    })
```
# Put this line on shared.lua in your core.

```
["rentalpapers"]				 = {["name"] = "rentalpapers", 					["label"] = "Rental Papers", 			["weight"] = 50, 		["type"] = "item", 		["image"] = "rentalpapers.png", 		["unique"] = true, 		["useable"] = false, 	["shouldClose"] = false, 	["combinable"] = nil, 	["description"] = "This car was taken out through car rental."},
```
# Adding the RentalPapers to qb-inventory

* Go to qb-inventory -> html -> js -> app.js and between lines 500-600 add the following code

```lua

          } else if (itemData.name == "rentalpapers") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p><strong>Plate: </strong><span>'+ itemData.info.label + '</span></p>');

```


#Added Blips in Config Folder
