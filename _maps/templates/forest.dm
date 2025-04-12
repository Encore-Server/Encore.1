//Medium 15x15 templates first
//Located in all 4 map sectors
/obj/effect/landmark/map_load_mark/forest
	name = "Medium Forest Template"
	templates = list("med_forest_fishing_pond", "med_forest_hunting_shack", "med_forest_caveshelter", "med_forest_wolfden")

/datum/map_template/med_forest_fishing_pond
	name = "Verdant Fishing Pond"
	id = "med_forest_fishing_pond"
	mappath = "_maps/map_files/templates/forest/med_forest_fishing_pond.dmm"

/datum/map_template/med_forest_hunting_shack
	name = "Verdant Hunting Shack"
	id = "med_forest_hunting_shack"
	mappath = "_maps/map_files/templates/forest/med_forest_huntingshack.dmm"

/datum/map_template/med_forest_caveshelter
	name = "Verdant Cave Shelter"
	id = "med_forest_caveshelter"
	mappath = "_maps/map_files/templates/forest/med_forest_caveshelter.dmm"

/datum/map_template/med_forest_wolfden
	name = "Verdant Wolf Den Medium"
	id = "med_forest_wolfden"
	mappath = "_maps/map_files/templates/forest/med_forest_wolfden.dmm"

////Small 10x10 templates
/obj/effect/landmark/map_load_mark/forest/small
	name = "Small Forest Template"
	templates = list("small_forest_goblin_camp", "small_forest_outhouse", "small_forest_pond", "small_forest_shack", "small_forest_bog", "small_forest_camp", "small_forest_crabs", "small_forest_farm", "small_forest_quarry", "small_forest_stream", "small_forest_wolfden")

/datum/map_template/small_forest_goblin_camp
	name = "Verdant Goblin Camp"
	id = "small_forest_goblin_camp"
	mappath = "_maps/map_files/templates/forest/small_forest_goblin_camp.dmm"

/datum/map_template/small_forest_outhouse
	name = "Verdant Outhouse"
	id = "small_forest_outhouse"
	mappath = "_maps/map_files/templates/forest/small_forest_outhouse.dmm"

/datum/map_template/small_forest_pond
	name = "Verdant Pond"
	id = "small_forest_pond"
	mappath = "_maps/map_files/templates/forest/small_forest_pond.dmm"

/datum/map_template/small_forest_shack
	name = "Verdant Shack"
	id = "small_forest_shack"
	mappath = "_maps/map_files/templates/forest/small_forest_shack.dmm"

/datum/map_template/small_forest_bog
	name = "Verdant Bog Small"
	id = "small_forest_bog"
	mappath = "_maps/map_files/templates/forest/small_forest_bog.dmm"

/datum/map_template/small_forest_camp
	name = "Verdant Camp Small"
	id = "small_forest_camp"
	mappath = "_maps/map_files/templates/forest/small_forest_camp.dmm"

/datum/map_template/small_forest_crabs
	name = "Verdant Crabs Small"
	id = "small_forest_crabs"
	mappath = "_maps/map_files/templates/forest/small_forest_crabs.dmm"

/datum/map_template/small_forest_farm
	name = "Verdant Farm Small"
	id = "small_forest_farm"
	mappath = "_maps/map_files/templates/forest/small_forest_farm.dmm"

/datum/map_template/small_forest_quarry
	name = "Verdant Quarry Small"
	id = "small_forest_quarry"
	mappath = "_maps/map_files/templates/forest/small_forest_quarry.dmm"

/datum/map_template/small_forest_stream
	name = "Verdant Stream Small"
	id = "small_forest_stream"
	mappath = "_maps/map_files/templates/forest/small_forest_stream.dmm"

/datum/map_template/small_forest_wolfden
	name = "Verdant Wolf Den Small"
	id = "small_forest_wolfden"
	mappath = "_maps/map_files/templates/forest/small_forest_wolfden.dmm"

//Multi-Z exclusive templates below
//FOUR ZLEVELS MAXIMUM with any effect/roofing_helper
//if you use 5zlevels, do not use roof generators!!! Shit will explode
//These should only exist on z-level 1 of domotan_north.dmm, or domotan_east.dmm
//15x15
/obj/effect/landmark/map_load_mark/Forest/multiz
	name = "Tall Forest Template"
	templates = list("tall_forest_crags")

/datum/map_template/tall_forest_crags
	name = "Tall Verdant Rock Formation"
	id = "tall_forest_crags"
	mappath = "_maps/map_files/templates/forest/tall_forest_crags.dmm"
