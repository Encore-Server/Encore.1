/datum/anvil_recipe/engineering
	i_type = "Engineering"
	appro_skill = /datum/skill/craft/engineering
	craftdiff = 1

// --------- BRONZE RECIPES -----------

/datum/anvil_recipe/engineering/bronze/locks
	name = "Lock"
	req_bar = /obj/item/ingot/bronze
	created_item = /obj/item/customlock
	craftdiff = 1

/datum/anvil_recipe/engineering/bronze/keys
	name = "Keys 2x"
	req_bar = /obj/item/ingot/bronze
	created_item = /obj/item/customblank
	createditem_num = 2
	craftdiff = 1

/datum/anvil_recipe/engineering/bronze/cog
	name = "Cog"
	req_bar = /obj/item/ingot/bronze
	created_item = /obj/item/roguegear
	craftdiff = 0

/datum/anvil_recipe/engineering/bronze/lamptern
	name = "Bronze Lamptern"
	req_bar = /obj/item/ingot/bronze
	created_item = /obj/item/flashlight/flare/torch/lantern/bronzelamptern
	craftdiff = 3

/datum/anvil_recipe/engineering/bronze/waterpurifier
	name = "Self-Purifying Waterskin"
	req_bar = /obj/item/ingot/bronze
	created_item = /obj/item/reagent_containers/glass/bottle/waterskin/purifier
	additional_items = list(/obj/item/reagent_containers/glass/bottle/waterskin)
	craftdiff = 3

// ------------ PROSTHETICS ----------------

/datum/anvil_recipe/engineering/bronze/prosthetic/bronzeleft
	name = "Bronze Left Arm"
	req_bar = /obj/item/ingot/bronze
	additional_items = list(/obj/item/ingot/bronze, /obj/item/roguegear, /obj/item/roguegear)
	created_item = /obj/item/bodypart/l_arm/prosthetic/bronzeleft
	craftdiff = 4

/datum/anvil_recipe/engineering/bronze/prosthetic/bronzeright
	name = "Bronze Right Arm"
	req_bar = /obj/item/ingot/bronze
	additional_items = list(/obj/item/ingot/bronze, /obj/item/roguegear, /obj/item/roguegear)
	created_item = /obj/item/bodypart/r_arm/prosthetic/bronzeright
	craftdiff = 4

/datum/anvil_recipe/engineering/bronze/prosthetic/bronzeleftleg
	name = "Bronze Left Leg"
	req_bar = /obj/item/ingot/bronze
	additional_items = list(/obj/item/ingot/bronze, /obj/item/roguegear, /obj/item/roguegear)
	created_item = /obj/item/bodypart/l_leg/prosthetic/bronze
	craftdiff = 4

/datum/anvil_recipe/engineering/bronze/prosthetic/bronzerightleg
	name = "Bronze Right Leg"
	req_bar = /obj/item/ingot/bronze
	additional_items = list(/obj/item/ingot/bronze, /obj/item/roguegear, /obj/item/roguegear)
	created_item = /obj/item/bodypart/r_leg/prosthetic/bronze
	craftdiff = 4

// ------------ FIREARMS ----------------

/datum/crafting_recipe/roguetown/gunpowderhorn
	name = "Gunpowder Horn"
	result = list(/obj/item/gunpowderhorn)
	reqs = list(/obj/item/reagent_containers/glass/bottle/waterskin = 1,
				/obj/item/roguegear = 1,
				/obj/item/ash = 2,
				/obj/item/rogueore/coal = 1
				)
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 4

/datum/anvil_recipe/engineering/steel/firearms/powdergun_advanced
	name = "Musket"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/grown/log/tree/small)
	created_item = /obj/item/gun/ballistic/revolver/grenadelauncher/powdergun/advanced
	craftdiff = 4
