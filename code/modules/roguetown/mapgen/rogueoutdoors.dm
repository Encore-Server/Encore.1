/obj/effect/landmark/mapGenerator/rogue/roguetownfield
	mapGeneratorType = /datum/mapGenerator/roguetownfield
	endTurfX = 155
	endTurfY = 155
	startTurfX = 1
	startTurfY = 1


/datum/mapGenerator/roguetownfield
	modules = list(/datum/mapGeneratorModule/ambushing,/datum/mapGeneratorModule/roguetownfield/grass,/datum/mapGeneratorModule/roguetowngrass,/datum/mapGeneratorModule/roguetownfield,/datum/mapGeneratorModule/roguetownfield/road)


/datum/mapGeneratorModule/roguetownfield
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/dirt)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableAtoms = list(/obj/structure/flora/newtree = 5,
							/obj/structure/flora/roguetree = 25,
							/obj/structure/flora/roguegrass/bush = 13,
							/obj/structure/flora/roguegrass = 40,
							/obj/structure/flora/ausbushes/brflowers = 38,
							/obj/structure/flora/ausbushes/ywflowers = 38,
							/obj/structure/flora/ausbushes/ppflowers = 38,
							/obj/item/natural/stone = 18,
							/obj/item/natural/rock = 2,
							/obj/item/grown/log/tree/stick = 3,
							/obj/structure/closet/dirthole/closed/loot=3,
							/obj/structure/flora/roguegrass/pyroclasticflowers = 1)
	spawnableTurfs = list(/turf/open/floor/rogue/dirt/road=5)
	allowed_areas = list(/area/rogue/outdoors/rtfield, /area/rogue/outdoors/woods/lakeside)

/datum/mapGeneratorModule/roguetownfield/road
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/dirt/road)
	excluded_turfs = list()
	spawnableAtoms = list(/obj/item/natural/stone = 18,
							/obj/item/grown/log/tree/stick = 3)
	allowed_areas = list(/area/rogue/outdoors/rtfield, /area/rogue/outdoors/woods/lakeside)

/datum/mapGeneratorModule/roguetownfield/grass
	clusterCheckFlags = CLUSTER_CHECK_NONE
	allowed_turfs = list(/turf/open/floor/rogue/dirt)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableTurfs = list(/turf/open/floor/rogue/grass = 15)
	spawnableAtoms = list()
	allowed_areas = list(/area/rogue/outdoors/rtfield, /area/rogue/outdoors/woods/lakeside)

/datum/mapGeneratorModule/roguetowngrass
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/dirt,/turf/open/floor/rogue/grass,/turf/open/floor/rogue/grassred,/turf/open/floor/rogue/grassyel,/turf/open/floor/rogue/grasscold)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableAtoms = list(/obj/structure/flora/roguegrass = 40,
						/obj/item/natural/stone = 18,
						/obj/item/grown/log/tree/stick = 3)
	allowed_areas = list(/area/rogue/outdoors/town,/area/rogue/outdoors/rtfield, /area/rogue/outdoors/woods/lakeside, /area/rogue/outdoors/woods/crossroads)
