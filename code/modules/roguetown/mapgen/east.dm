//genstuff
/obj/effect/landmark/mapGenerator/rogue/east_domotan
	mapGeneratorType = /datum/mapGenerator/east
	endTurfX = 255
	endTurfY = 255
	startTurfX = 1
	startTurfY = 1


/datum/mapGenerator/east
	modules = list(/datum/mapGeneratorModule/east_highlands,/datum/mapGeneratorModule/east_snow,/datum/mapGeneratorModule/east_coast,/datum/mapGeneratorModule/east_caves,/datum/mapGeneratorModule/hell)

//highland areas for mount miracle
/datum/mapGeneratorModule/east_highlands
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/grass, /turf/open/floor/rogue/grassyel, /turf/open/floor/rogue/dirt)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableAtoms = list(/obj/structure/flora/roguetree = 30,
							/obj/structure/flora/newtree = 10,
							/obj/structure/flora/roguetree/stump/log = 11,
							/obj/structure/flora/roguetree/stump = 4,
							/obj/structure/flora/roguegrass/bush = 25,
							/obj/structure/flora/roguegrass = 53,
							/obj/structure/flora/roguegrass/maneater = 13,
							/obj/item/natural/stone = 43,
							/obj/item/natural/rock = 23,
							/obj/item/grown/log/tree/stick = 16,
							/obj/structure/closet/dirthole/closed/loot=3,
							/obj/structure/flora/roguegrass/pyroclasticflowers = 45)
	spawnableTurfs = list()
	allowed_areas = list(/area/rogue/outdoors/mountains)

//mount miracle peak
//zlevel 4 and up
/datum/mapGeneratorModule/east_snow
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/grasscold, /turf/open/floor/rogue/snow, /turf/open/floor/rogue/snowrough, /turf/open/floor/rogue/snowpatchy, /turf/open/floor/rogue/dirt)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableAtoms = list(/obj/structure/flora/roguetree/burnt = 30,
							/obj/structure/flora/newtree = 30,
							/obj/structure/flora/roguetree/stump/log = 11,
							/obj/structure/flora/roguetree/stump = 4,
							/obj/structure/flora/roguegrass/bush = 25,
							/obj/structure/flora/roguegrass = 53,
							/obj/structure/flora/roguegrass/maneater = 13,
							/obj/item/natural/stone = 43,
							/obj/item/natural/rock = 23,
							/obj/item/grown/log/tree/stick = 16,
							/obj/structure/closet/dirthole/closed/loot=3,
							/obj/structure/flora/roguegrass/pyroclasticflowers = 45)
	spawnableTurfs = list()
	allowed_areas = list(/area/rogue/outdoors/mountains)

//mount miracle coast/"foothills" on zlevel 1 of east
//scariest outdoors part is here. The Skeleton Appears
/datum/mapGeneratorModule/east_coast
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/grassred, /turf/open/floor/rogue/sand, /turf/open/floor/rogue/grassyel, /turf/open/floor/rogue/naturalstone, /turf/open/floor/rogue/dirt, /turf/open/floor/rogue/grass)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableAtoms = list(/obj/structure/flora/roguetree/burnt = 30,
							/obj/structure/flora/roguetree/stump/burnt = 11,
							/obj/structure/flora/roguegrass/bush = 25,
							/obj/structure/flora/roguegrass = 53,
							/obj/structure/flora/roguegrass/maneater = 13,
							/obj/item/natural/stone = 43,
							/obj/item/natural/rock = 23,
							/obj/item/grown/log/tree/stick = 16,
							/obj/structure/closet/dirthole/closed/loot=3,
							/obj/structure/flora/roguegrass/pyroclasticflowers = 45)
	spawnableTurfs = list()
	allowed_areas = list(/area/rogue/outdoors/mountains/decap)

//mount miracle caves
//you are digging way too close to hell and will suffer
/datum/mapGeneratorModule/east_caves
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/naturalstone, /turf/open/floor/rogue/dirt)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableAtoms = list(/obj/structure/flora/rogueshroom=20,
							/obj/structure/roguerock=25,
							/obj/structure/flora/roguegrass/maneater = 43,
							/obj/item/natural/stone = 43,
							/obj/item/natural/rock = 23,
							/obj/structure/closet/dirthole/closed/loot=15)
	spawnableTurfs = list(/turf/open/lava=5,/turf/open/floor/rogue/volcanic=5)
	allowed_areas = list(/area/rogue/under/cavelava)

//hell
//pending spooky shit
/datum/mapGeneratorModule/hell
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/naturalstone, /turf/open/floor/rogue/dirt, /turf/open/floor/rogue/volcanic)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableAtoms = list(/obj/structure/flora/rogueshroom=20,
							/obj/structure/roguerock=25,
							/obj/item/natural/stone = 43)
	spawnableTurfs = list(/turf/open/lava=35,/turf/open/floor/rogue/volcanic=25)
	allowed_areas = list(/area/rogue/outdoors/mountains/decap/hell)
