//Basic dungeon templates
//15x15
//Located underground
/obj/effect/landmark/map_load_mark/underground
	name = "Medium Cave Template"
	templates = list("med_cave_shack")

/datum/map_template/med_cave_shack
	name = "Cave Shack Medium"
	id = "med_cave_shack"
	mappath = "_maps/map_files/templates/underground/med_cave_shack.dmm"

//10x10
/obj/effect/landmark/map_load_mark/underground/small
	name = "Small Cave Template"
	templates = list("small_cave_shack")

/datum/map_template/small_cave_shack
	name = "Cave Shack Small"
	id = "small_cave_shack"
	mappath = "_maps/map_files/templates/underground/small_cave_shack.dmm"
