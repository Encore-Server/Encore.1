//Multi-Z exclusive templates go here
//FOUR ZLEVELS MAXIMUM with any effect/roofing_helper
//if you use 5zlevels, do not use roof generators! It will not generate correctly because no ZLEVEL will be above it.
//15x15 size
//
//Starting with forest templates
//These should only exist on z-level 1 of domotan_north.dmm, or domotan_east.dmm
/obj/effect/landmark/map_load_mark/forest/multiz
	name = "Tall Forest Template"
	templates = list("tall_forest_crags")

/datum/map_template/tall_forest_crags
	name = "Tall Verdant Rock Formation"
	id = "tall_forest_crags"
	mappath = "_maps/map_files/templates/forest/tall_forest_crags.dmm"

//Beach templates
//These can spawn on any zlevel on zlevel 1
//TWO ZLEVELS MAXIMUM with any effect/roofing_helper
//if you use 3zlevels, do not use roof generators! It will not generate correctly because no ZLEVEL will be above it.
//15x15
/obj/effect/landmark/map_load_mark/beach/multiz
	name = "Tall Beach Template"
	templates = list("tall_beach_crags")

/datum/map_template/tall_beach_crags
	name = "Tall Arid Rock Formation"
	id = "tall_beach_crags"
	mappath = "_maps/map_files/templates/beach/tall_beach_crags.dmm"
