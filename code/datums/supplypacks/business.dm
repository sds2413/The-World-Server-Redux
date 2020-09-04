/*
*	Here is where any supply packs
*	related to business go
*/

/datum/supply_pack/business
	group = "Business"
	containertype = /obj/structure/closet/crate

/datum/supply_pack/business/eftpos
	contains = list(/obj/item/device/eftpos)
	name = "EFTPOS scanner"
	cost = 50
	containertype = /obj/structure/closet/crate
	containername = "EFTPOS crate"

/datum/supply_pack/business/cash_register
	contains = list(/obj/machinery/cash_register)
	name = "Cash Register"
	cost = 250
	containertype = /obj/structure/closet/crate
	containername = "Cash Register crate"

/datum/supply_pack/business/retail_scanner
	contains = list(/obj/item/device/retail_scanner)
	name = "Retail Scanner"
	cost = 160
	containertype = /obj/structure/closet/crate
	containername = "Retail Scanner crate"

/datum/supply_pack/business/price_tagger
	contains = list(/obj/item/device/price_tagger)
	name = "Price Tagger"
	cost = 70
	containertype = /obj/structure/closet/crate
	containername = "Price Tagger crate"

/datum/supply_pack/business/price_scanner
	contains = list(/obj/item/device/price_scanner)
	name = "Price Scanner"
	cost = 40
	containertype = /obj/structure/closet/crate
	containername = "Price Scanner"

/datum/supply_pack/business/business_sign
	contains = list(/obj/machinery/modular_sign/business)
	name = "Business Sign"
	cost = 1500
	containertype = /obj/structure/largecrate
	containername = "Business Sign"


/datum/supply_pack/business/mining_starter
	contains = list(
	/obj/item/weapon/storage/backpack/industrial,
	/obj/item/weapon/storage/backpack/satchel/eng,
	/obj/item/device/radio/headset/headset_mine,
	/obj/item/device/analyzer,
	/obj/item/weapon/storage/bag/ore = 2,
	/obj/item/weapon/storage/bag/sheetsnatcher = 2,
	/obj/item/device/flashlight/lantern = 2,
	/obj/item/weapon/shovel = 2,
	/obj/item/weapon/pickaxe = 2,
	/obj/item/clothing/glasses/material = 2,
	/obj/item/stack/marker_beacon/thirty
	)
	name = "Mining Starter Kit"
	cost = 200
	containertype = /obj/structure/closet/crate
	containername = "Mining Starter Kit"

/datum/supply_pack/business/business_stamps
	contains = list(/obj/item/weapon/stamp/business = 3)
	name = "Business Stamps"
	cost = 75
	containertype = /obj/structure/closet/crate
	containername = "Business Stamps"