//Medium 15x15 templates first
//Located in all 4 map sectors
/obj/effect/landmark/map_load_mark/forest
	name = "Medium Forest Template"
	templates = list("med_forest_fishing_pond", "med_forest_hunting_shack")

/datum/map_template/med_forest_fishing_pond
	name = "Verdant Fishing Pond"
	id = "med_forest_fishing_pond"
	mappath = "_maps/map_files/templates/forest/med_forest_fishing_pond.dmm"

/datum/map_template/med_forest_hunting_shack
	name = "Verdant Hunting Shack"
	id = "med_forest_hunting_shack"
	mappath = "_maps/map_files/templates/forest/med_forest_huntingshack.dmm"

////Small 10x10 templates
/obj/effect/landmark/map_load_mark/forest/small
	name = "Small Forest Template"
	templates = list("small_forest_goblin_camp", "small_forest_outhouse", "small_forest_pond", "small_forest_shack")

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
