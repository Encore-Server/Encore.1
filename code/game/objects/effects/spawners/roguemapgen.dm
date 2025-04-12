/obj/effect/spawner/roguemap/Initialize(mapload)
	START_PROCESSING(SSmapgen, src)

/obj/effect/spawner/roguemap
	icon = 'icons/obj/structures_spawners.dmi'
	var/probby = 100
	var/list/spawned

/obj/effect/spawner/roguemap/process()
	if(prob(probby))
		var/obj/new_type = pick(spawned)
		new new_type(get_turf(src))

	STOP_PROCESSING(SSmapgen, src)
	qdel(src)

/obj/effect/spawner/roguemap/pit
	icon_state = "pit"

/obj/effect/spawner/roguemap/pit/process()
	var/turf/T = get_turf(src)
	var/turf/below = get_step_multiz(src, DOWN)
	if(below)
		T.ChangeTurf(/turf/open/transparent/openspace)
		below.ChangeTurf(/turf/open/floor/rogue/dirt/road)

	STOP_PROCESSING(SSmapgen, src)
	qdel(src)


/obj/effect/spawner/roguemap/tree
	icon_state = "tree"
	name = "Tree spawner"
	probby = 80
	spawned = list(/obj/structure/flora/roguetree)

/obj/effect/spawner/roguemap/treeorbush
	icon_state = "Treeorbush"
	name = "Tree or bush spawner"
	probby = 50
	spawned = list(/obj/structure/flora/roguetree, /obj/structure/flora/roguegrass/bush)

/obj/effect/spawner/roguemap/treeorstump
	icon_state = "treeorstump"
	name = "Tree or stump spawner"
	probby = 50
	spawned = list(/obj/structure/flora/roguetree, /obj/structure/flora/roguetree/stump)

/obj/effect/spawner/roguemap/stump
	icon_state = "stump"
	name = "stump spawner"
	probby = 75
	spawned = list(/obj/structure/flora/roguetree/stump)

/obj/effect/spawner/roguemap/shroud
	icon_state = "shroud"
	name = "shroud sp"
	probby = 30
	spawned = list(/turf/closed/wall/shroud)

/obj/effect/spawner/roguemap/hauntpile
	icon_state = "hauntpile"
	name = "hauntpile"
	probby = 23
	spawned = list(/obj/structure/bonepile)

/obj/effect/spawner/roguemap/beartrap
	icon_state = "beartrap"
	name = "beartrap"
	probby = 50
	spawned = list(/obj/item/restraints/legcuffs/beartrap/armed/camouflage)

/obj/effect/spawner/mobspawner
	name = "mob spawner"
	icon = 'icons/obj/hand_of_god_structures.dmi'
	icon_state = "trap-cult"

/obj/effect/spawner/mobspawner/Initialize(mapload)
	..()
	var/new_type = pick(list(
		/mob/living/simple_animal/hostile/retaliate/rogue/chicken,
		/mob/living/simple_animal/hostile/retaliate/rogue/goat,
		/mob/living/simple_animal/hostile/retaliate/rogue/mudcrab,
		/mob/living/simple_animal/hostile/retaliate/rogue/saiga,
		/obj/effect/decal/remains/saiga))
	new new_type(get_turf(src))
	return INITIALIZE_HINT_QDEL

/obj/effect/spawner/mobspawner/troll/Initialize(mapload)
	..()
	var/new_type = pick(list(
		/mob/living/simple_animal/hostile/retaliate/rogue/bogtroll,
		/mob/living/simple_animal/hostile/retaliate/rogue/cavetroll,
		/obj/effect/decal/remains/saiga))
	new new_type(get_turf(src))
	return INITIALIZE_HINT_QDEL

/obj/effect/spawner/mobspawner/skeleton/Initialize(mapload)
	..()
	var/new_type = pick(list(
		/mob/living/simple_animal/hostile/rogue/skeleton/guard,
		/mob/living/simple_animal/hostile/rogue/skeleton/spear,
		/mob/living/simple_animal/hostile/rogue/skeleton/axe,
		/mob/living/simple_animal/hostile/rogue/skeleton,
		/obj/effect/decal/remains/human))
	new new_type(get_turf(src))
	return INITIALIZE_HINT_QDEL

/obj/effect/spawner/mobspawner/wolf/Initialize(mapload)
	..()
	var/new_type = pick(list(
		/mob/living/simple_animal/hostile/retaliate/rogue/wolf,
		/obj/effect/decal/remains/saiga))
	new new_type(get_turf(src))
	return INITIALIZE_HINT_QDEL

