/obj/effect/spawner/trap
	name = "random trap"
	icon = 'icons/obj/hand_of_god_structures.dmi'
	icon_state = "trap_rand"

/obj/effect/spawner/trap/Initialize(mapload)
	..()
	var/new_type = pick(list(
		/obj/structure/trap/fire,
		/obj/structure/trap/damage,
		/obj/structure/trap/stun,
		/obj/structure/trap/skeleton,
		/obj/structure/trap/inert))
	new new_type(get_turf(src))
	return INITIALIZE_HINT_QDEL
