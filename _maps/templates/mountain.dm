//Medium 15x15 templates first
//Located in east, north and south map sectors at high elevations but not snowy
/obj/effect/landmark/map_load_mark/mountain
	name = "Medium Highlands Template"
	templates = list("med_mountain_fishing_pond", "med_mountain_goblin_outpost", "med_mountain_huntingshack")

/datum/map_template/med_mountain_fishing_pond
	name = "Highlands Fishing Pond"
	id = "med_mountain_fishing_pond"
	mappath = "_maps/map_files/templates/mountain/med_mountain_fishing_pond.dmm"

/datum/map_template/med_mountain_goblin_outpost
	name = "Highlands Goblin Outpost"
	id = "med_mountain_goblin_outpost"
	mappath = "_maps/map_files/templates/mountain/med_mountain_goblin_outpost.dmm"

/datum/map_template/med_mountain_huntingshack
	name = "Highlands Hunting Shack"
	id = "med_mountain_huntingshack"
	mappath = "_maps/map_files/templates/mountain/med_mountain_huntingshack.dmm"

////Small 10x10 templates
/obj/effect/landmark/map_load_mark/mountain/small
	name = "Small Highlands Template"
	templates = list("small_mountain_outhouse", "small_mountain_pond", "small_mountain_shack")

/datum/map_template/small_mountain_outhouse
	name = "Highlands Outhouse"
	id = "small_mountain_outhouse"
	mappath = "_maps/map_files/templates/mountain/small_mountain_outhouse.dmm"

/datum/map_template/small_mountain_pond
	name = "Highlands Pond"
	id = "small_mountain_pond"
	mappath = "_maps/map_files/templates/mountain/small_mountain_pond.dmm"

/datum/map_template/small_mountain_shack
	name = "Highlands Shack"
	id = "small_mountain_shack"
	mappath = "_maps/map_files/templates/mountain/small_mountain_shack.dmm"
