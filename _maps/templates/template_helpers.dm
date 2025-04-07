//Roofing helpers
//These should be placed on every tile which an open space resides over in a map template, assuming you don't want a giant hole there
/obj/effect/roofing_helper
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "hardceiling"
	name = "Normal Roof Builder"
	var/roof_tile = /turf/open/floor/rogue/rooftop

/obj/effect/roofing_helper/stone
	name = "Stone Roof Builder"
	roof_tile = /turf/open/floor/rogue/naturalstone

/obj/effect/roofing_helper/snow
	name = "Snow Roof Builder"
	roof_tile = /turf/open/floor/rogue/snow

/obj/effect/roofing_helper/twig
	name = "Twig Roof Builder"
	roof_tile = /turf/open/floor/rogue/twig

/obj/effect/roofing_helper/proc/build_roof()
	var/turf/target = get_step_multiz(src, UP)
	new roof_tile(target)

/obj/effect/roofing_helper/proc/complete_roof()
	qdel(src)

/obj/effect/roofing_helper/Initialize()
	. = ..()
	build_roof()
	complete_roof()

/obj/effect/landmark/map_load_mark/testing_tower
	name = "Testing Tower Template"
	templates = list("testing_tower")

/datum/map_template/testing_tower
	name = "Testing Tower"
	id = "testing_tower"
	mappath = "_maps/map_files/templates/testing/testing_tower.dmm"
