//genstuff
/obj/effect/landmark/mapGenerator/rogue/forest
	mapGeneratorType = /datum/mapGenerator/forest
	endTurfX = 255
	endTurfY = 255
	startTurfX = 1
	startTurfY = 1


/datum/mapGenerator/forest
	modules = list(/datum/mapGeneratorModule/ambushing,/datum/mapGeneratorModule/forestgrassturf,/datum/mapGeneratorModule/forest,/datum/mapGeneratorModule/forestroad,/datum/mapGeneratorModule/forestgrass)


/datum/mapGeneratorModule/forest
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/dirt, /turf/open/floor/rogue/grass)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableAtoms = list(/obj/structure/flora/newtree = 30,
							/obj/structure/flora/roguegrass/bush = 25,
							/obj/structure/flora/roguegrass = 26,
							/obj/structure/flora/roguegrass/swampweed = 15,
							/obj/structure/flora/roguegrass/pyroclasticflowers = 1,
							/obj/item/natural/stone = 23,
							/obj/item/natural/rock = 6,
							/obj/item/grown/log/tree/stick = 16,
							/obj/structure/flora/roguetree/stump/log = 3,
							/obj/structure/flora/roguetree/stump = 4,
							/obj/structure/closet/dirthole/closed/loot=3,)
	spawnableTurfs = list(/turf/open/floor/rogue/dirt/road=2,
						/turf/open/water/swamp=1)
	allowed_areas = list(/area/rogue/outdoors/woods, /area/rogue/outdoors/rtfield, /area/rogue/outdoors/beach/forest, /area/rogue/outdoors/woods/berkleigh)

/datum/mapGeneratorModule/forestroad
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableAtoms = list(/obj/item/natural/stone = 9,/obj/item/grown/log/tree/stick = 6)

/datum/mapGeneratorModule/forestgrassturf
	clusterCheckFlags = CLUSTER_CHECK_NONE
	allowed_turfs = list(/turf/open/floor/rogue/dirt)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road)
	spawnableTurfs = list(/turf/open/floor/rogue/grass = 23)
	allowed_areas = list(/area/rogue/outdoors/woods)

/datum/mapGeneratorModule/forestgrass
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/grass, /turf/open/floor/rogue/grassred, /turf/open/floor/rogue/grassyel, /turf/open/floor/rogue/grasscold)
	excluded_turfs = list()
	allowed_areas = list(/area/rogue/outdoors/woods)
	spawnableAtoms = list(/obj/structure/flora/roguetree = 30,
							/obj/structure/flora/roguetree/wise=1,
							/obj/structure/flora/roguegrass/bush = 25,
							/obj/structure/flora/roguegrass = 44,
							/obj/structure/flora/roguegrass/swampweed = 15,
							/obj/item/natural/stone = 6,
							/obj/item/natural/rock = 1,
							/obj/item/grown/log/tree/stick = 3,
							/obj/structure/flora/roguetree/stump/log = 3)

/obj/effect/landmark/mapGenerator/rogue/west_domotan
	mapGeneratorType = /datum/mapGenerator/west_domotan
	endTurfX = 155
	endTurfY = 255
	startTurfX = 1
	startTurfY = 1

/datum/mapGenerator/west_domotan
	modules = list(/datum/mapGeneratorModule/forest/west,
					/datum/mapGeneratorModule/forest/west/crags,
					/datum/mapGeneratorModule/forest/west/thornbed,
					/datum/mapGeneratorModule/forest/west/lonelyeerie,
					/datum/mapGeneratorModule/forest/west/caves)

//WESTERN DOMOTAN ONLY
//Weeping Wood zlevel 1-3
//extremely tight and hard to navigate forest wetlands
/datum/mapGeneratorModule/forest/west
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/dirt, /turf/open/floor/rogue/grass)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road, /turf/open/lava/acid)
	spawnableAtoms = list(/obj/structure/flora/roguegrass/bush = 25,
							/obj/structure/flora/roguegrass = 38,
							/obj/structure/flora/ausbushes/brflowers = 38,
							/obj/structure/flora/ausbushes/grassybush = 38,
							/obj/structure/flora/ausbushes/fernybush = 38,
							/obj/structure/flora/roguegrass/pyroclasticflowers = 5,
							/obj/item/natural/stone = 23,
							/obj/item/natural/rock = 6,
							/obj/item/grown/log/tree/stick = 25,
							/obj/structure/flora/roguetree = 15,
							/obj/structure/flora/roguetree/stump/log = 11,
							/obj/structure/flora/roguetree/stump = 4,
							/obj/structure/closet/dirthole/closed/loot = 3)
	spawnableTurfs = list()
	allowed_areas = list(/area/rogue/outdoors/woods, /area/rogue/outdoors/woods/west, /area/rogue/outdoors/beach/forest)

//Crags
//Weeping Wood zlevel 1
//shattered rocky landscape filled with sea goblins and topped with snazzy gems. Outrageous sea goblin ambush chance
/datum/mapGeneratorModule/forest/west/crags
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/sand, /turf/open/floor/rogue/dirt, /turf/open/water/ocean, /turf/open/water/ocean/deep)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road, /turf/open/lava/acid)
	spawnableAtoms = list(/obj/structure/flora/roguegrass = 78,
							/obj/structure/flora/roguetree/burnt = 18,
							/obj/structure/flora/ausbushes/sparsegrass = 58,
							/obj/item/natural/stone = 25,
							/obj/item/natural/rock = 25,
							/obj/structure/closet/dirthole/closed/loot = 15)
	spawnableTurfs = list(/turf/open/floor/rogue/sand = 5)
	allowed_areas = list(/area/rogue/outdoors/woods/west/crags)

//Thornbed
//Weeping Wood zlevel 1
//prickly thorns EVERYWHERE AAHHHHH!!!
/datum/mapGeneratorModule/forest/west/thornbed
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/grass, /turf/open/floor/rogue/dirt, /turf/open/floor/rogue/dirt/road, /turf/open/water/swamp)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road, /turf/open/lava/acid)
	spawnableAtoms = list(/obj/structure/flora/roguegrass = 38,
							/obj/structure/flora/roguetree/burnt = 18,
							/obj/structure/flora/roguegrass/thorn_bush = 28,
							/obj/item/natural/stone = 15,
							/obj/item/natural/rock = 5,
							/obj/item/grown/log/tree/stick = 25,
							/obj/structure/flora/roguegrass/swampweed = 15,
							/obj/structure/closet/dirthole/closed/loot = 5)
	allowed_areas = list(/area/rogue/outdoors/woods/west/thornbed)

//Lonely Eerie
//Weeping Wood zlevel 1
//peaceful and colorful. no enemies here, make it pretty!
/datum/mapGeneratorModule/forest/west/lonelyeerie
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/grass, /turf/open/floor/rogue/dirt, /turf/open/floor/rogue/dirt/road, /turf/open/water/swamp)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road, /turf/open/lava/acid)
	spawnableAtoms = list(/obj/structure/flora/roguegrass = 38,
							/obj/structure/flora/ausbushes/brflowers = 38,
							/obj/structure/flora/ausbushes/ywflowers = 38,
							/obj/structure/flora/ausbushes/ppflowers = 38,
							/obj/structure/flora/ausbushes/grassybush = 38,
							/obj/structure/flora/ausbushes/fernybush = 38,
							/obj/item/grown/log/tree/stick = 25,
							/obj/item/natural/stone = 15,
							/obj/item/natural/rock = 5,
							/obj/structure/flora/roguegrass/swampweed = 35)
	allowed_areas = list(/area/rogue/outdoors/woods/west/lonelyeerie)

//Weeping Wood underground
//Weeping Wood zlevel 1
//basically, the bog is coming. hard to navigate and very danger
/datum/mapGeneratorModule/forest/west/caves
	clusterCheckFlags = CLUSTER_CHECK_DIFFERENT_ATOMS
	allowed_turfs = list(/turf/open/floor/rogue/naturalstone, /turf/open/floor/rogue/dirt, /turf/open/water/swamp)
	excluded_turfs = list(/turf/open/floor/rogue/dirt/road, /turf/open/lava/acid)
	spawnableAtoms = list(/obj/structure/flora/rogueshroom=20,
							/obj/structure/roguerock=25,
							/obj/structure/flora/roguegrass = 54,
							/obj/structure/spacevine = 23,
							/obj/structure/spider/stickyweb = 13,
							/obj/effect/decal/cleanable/dirt = 23,
							/obj/structure/closet/dirthole/closed/loot=15,
							/obj/item/natural/stone = 24,
							/obj/item/natural/rock = 8, 
							/obj/structure/glowshroom = 35)
	spawnableTurfs = list(/turf/open/floor/rogue/dirt = 2)
	allowed_areas = list(/area/rogue/under/cavewet/bogcaves)
