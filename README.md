# Video of the script:

* click - https://streamable.com/msejyp
* If you have any further questions, you can open ticket in discord - https://discord.gg/cKt4Mpd2PQ

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
* [qb-menu](https://github.com/qbcore-framework/qb-menu)

# Put this line on shared.lua in your core.

```
["rentalpapers"]				 = {["name"] = "rentalpapers", 					["label"] = "Rental Papers", 			["weight"] = 50, 		["type"] = "item", 		["image"] = "rentalpapers.png", 		["unique"] = true, 		["useable"] = false, 	["shouldClose"] = false, 	["combinable"] = nil, 	["description"] = "This car was taken out through car rental."},
```

# Inventory image
![rentalpapers](https://i.ibb.co/sgG5Hk6/rentalpapers.png)

- Add the rentalpapers.png to your - inventory -> html -> images

# Adding the RentalPapers to qb-inventory

* Go to qb-inventory -> html -> js -> app.js and between lines 500-600 add the following code

```lua

          } else if (itemData.name == "rentalpapers") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p><strong>Plate: </strong><span>'+ itemData.info.label + '</span></p>');

```
