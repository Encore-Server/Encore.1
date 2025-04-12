/obj/structure/trap
	name = "IT'S A TRAP"
	desc = ""
	icon = 'icons/obj/hand_of_god_structures.dmi'
	icon_state = "trap"
	density = FALSE
	layer = BELOW_OPEN_DOOR_LAYER
	anchored = TRUE
	alpha = 30 //initially quite hidden when not "recharging"
	var/flare_message = span_warning("the trap f appears more visible!")
	var/last_trigger = 0
	var/time_between_triggers = 600 //takes a minute to recharge
	var/charges = INFINITY
	var/checks_antimagic = TRUE

	var/list/static/ignore_typecache
	var/list/mob/immune_minds = list()

	var/sparks = TRUE
	var/datum/effect_system/spark_spread/spark_system

/obj/structure/trap/Initialize(mapload)
	. = ..()
	flare_message = span_warning("[src] appears more visible!")
	spark_system = new
	spark_system.set_up(4,1,src)
	spark_system.attach(src)

	if(!ignore_typecache)
		ignore_typecache = typecacheof(list(
			/obj/effect,
			/mob/dead))

/obj/structure/trap/Destroy()
	qdel(spark_system)
	spark_system = null
	. = ..()

/obj/structure/trap/examine(mob/user)
	. = ..()
	if(!isliving(user))
		return
	if(user.mind && (user.mind in immune_minds))
		return
	if(get_dist(user, src) <= 1)
		. += span_notice("I reveal [src]!")
		flare()

/obj/structure/trap/proc/flare()
	// Makes the trap visible, and starts the cooldown until it's
	// able to be triggered again.
	visible_message(flare_message)
	if(sparks)
		spark_system.start()
	alpha = 200
	last_trigger = world.time
	charges--
	if(charges <= 0)
		animate(src, alpha = 0, time = 10)
		QDEL_IN(src, 10)
	else
		animate(src, alpha = initial(alpha), time = time_between_triggers)

/obj/structure/trap/Crossed(atom/movable/AM)
	if(last_trigger + time_between_triggers > world.time)
		return
	// Don't want the traps triggered by sparks, ghosts or projectiles.
	if(is_type_in_typecache(AM, ignore_typecache))
		return
	if(ismob(AM))
		var/mob/M = AM
		if(M.mind in immune_minds)
			return
		if(checks_antimagic && M.anti_magic_check())
			flare()
			return
	if(charges <= 0)
		return
	flare()
	if(isliving(AM))
		trap_effect(AM)

/obj/structure/trap/proc/trap_effect(mob/living/L)
	return

/obj/structure/trap/stun
	name = "shock trap"
	desc = ""
	icon = 'icons/roguetown/items/traps.dmi'
	icon_state = "shocker1"
	alpha = 255
	var/stun_time = 100

/obj/structure/trap/stun/Initialize()
	update_icon()
	. = ..()

/obj/structure/trap/stun/update_icon()
	icon_state = "shocker[rand(1, 3)]"

/obj/structure/trap/stun/trap_effect(mob/living/L)
	L.electrocute_act(30, src, flags = SHOCK_NOGLOVES) // electrocute act does a message.
	L.Paralyze(stun_time)

/obj/structure/trap/stun/hunter
	name = "bounty trap"
	desc = ""
	icon = 'icons/obj/objects.dmi'
	icon_state = "bounty_trap_on"
	stun_time = 200
	sparks = FALSE //the item version gives them off to prevent runtimes (see Destroy())
	checks_antimagic  = FALSE
	var/obj/item/bountytrap/stored_item
	var/caught = FALSE

/obj/structure/trap/stun/hunter/Initialize(mapload)
	. = ..()
	time_between_triggers = 10
	flare_message = span_warning("[src] snaps shut!")

/obj/structure/trap/stun/hunter/Crossed(atom/movable/AM)
	if(isliving(AM))
		var/mob/living/L = AM
		if(!L.mind?.has_antag_datum(/datum/antagonist/fugitive))
			return
	caught = TRUE
	. = ..()

/obj/structure/trap/stun/hunter/flare()
	..()
	stored_item.forceMove(get_turf(src))
	forceMove(stored_item)
	if(caught)
		stored_item.announce_fugitive()
		caught = FALSE

/obj/item/bountytrap
	name = "bounty trap"
	desc = ""
	icon = 'icons/obj/objects.dmi'
	icon_state = "bounty_trap_off"
	var/obj/structure/trap/stun/hunter/stored_trap
	var/obj/item/radio/radio
	var/datum/effect_system/spark_spread/spark_system

/obj/item/bountytrap/Initialize(mapload)
	. = ..()
	radio = new(src)
	radio.subspace_transmission = TRUE
	radio.canhear_range = 0
	radio.recalculateChannels()
	spark_system = new
	spark_system.set_up(4,1,src)
	spark_system.attach(src)
	name = "[name] #[rand(1, 999)]"
	stored_trap = new(src)
	stored_trap.name = name
	stored_trap.stored_item = src

/obj/item/bountytrap/proc/announce_fugitive()
	spark_system.start()
	playsound(src, 'sound/blank.ogg', 50, TRUE)
	radio.talk_into(src, "Fugitive has triggered this trap in the [get_area_name(src)]!", RADIO_CHANNEL_COMMON)

/obj/item/bountytrap/attack_self(mob/living/user)
	var/turf/T = get_turf(src)
	if(!user || !user.transferItemToLoc(src, T))//visibly unequips
		return
	to_chat(user, "<span class=notice>I set up [src]. Examine while close to disarm it.</span>")
	stored_trap.forceMove(T)//moves trap to ground
	forceMove(stored_trap)//moves item into trap

/obj/item/bountytrap/Destroy()
	qdel(stored_trap)
	QDEL_NULL(radio)
	QDEL_NULL(spark_system)
	. = ..()

/obj/structure/trap/fire
	name = "flame trap"
	desc = ""
	icon_state = "trap-fire"

/obj/structure/trap/fire/trap_effect(mob/living/L)
	to_chat(L, span_danger("<B>Spontaneous combustion!</B>"))
	L.Paralyze(20)
	new /obj/effect/hotspot(get_turf(src))

/obj/structure/trap/chill
	name = "frost trap"
	desc = ""
	icon_state = "trap-frost"

/obj/structure/trap/chill/trap_effect(mob/living/L)
	to_chat(L, span_danger("<B>You're frozen solid!</B>"))
	L.Paralyze(20)
	L.adjust_bodytemperature(-300)
	L.apply_status_effect(/datum/status_effect/freon)

/obj/structure/trap/ward
	name = "divine ward"
	desc = ""
	icon_state = "ward"
	density = TRUE
	time_between_triggers = 1200 //Exists for 2 minutes

/obj/structure/trap/ward/Initialize()
	. = ..()
	QDEL_IN(src, time_between_triggers)

/obj/structure/trap/cult
	name = "unholy trap"
	desc = ""
	icon_state = "trap-cult"

/obj/structure/trap/cult/trap_effect(mob/living/L)
	to_chat(L, span_danger("<B>With a crack, the hostile constructs come out of hiding, stunning you!</B>"))
	L.electrocute_act(10, src, flags = SHOCK_NOGLOVES) // electrocute act does a message.
	L.Paralyze(20)
	QDEL_IN(src, 30)

/obj/structure/trap/damage
	name = "uneasy earth"
	desc = "This patch of earth seems particularly weak. Traversing it is probably very dangerous."
	icon = 'icons/roguetown/items/traps.dmi'
	icon_state = "cracks1"
	sparks = FALSE
	alpha = 165

/obj/structure/trap/damage/Initialize()
	update_icon()
	. = ..()

/obj/structure/trap/damage/update_icon()
	icon_state = "cracks[rand(1, 3)]"

/obj/structure/trap/damage/trap_effect(mob/living/L)
	to_chat(L, span_danger("<B>The uneasy ground trembles, shaking free a boulder from above!</B>"))
	L.Paralyze(50)
	L.adjustBruteLoss(95)//oopsies
	L.emote("scream")
	var/obj/structure/flora/rock/giant_rock = new(get_turf(src))
	playsound(src, 'sound/combat/hits/onstone/wallhit3.ogg', 100, TRUE)
	QDEL_IN(giant_rock, 200)

/obj/structure/trap/inert//For the random trap spawner, gives a chance to just not even spawn a trap for extra unpredictability

/obj/structure/trap/inert/Initialize()
	qdel(src)

/obj/structure/trap/lava
	name = "magmatic mantle"
	desc = "This rock and dirt looks like it's moments away from crumbling. A gentle heat radiates from below..."
	icon = 'icons/roguetown/items/traps.dmi'
	icon_state = "lava1"//hehe
	sparks = FALSE
	alpha = 175
	var/new_turf = /turf/open/lava

/obj/structure/trap/lava/Initialize()
	update_icon()
	. = ..()

/obj/structure/trap/lava/update_icon()
	icon_state = "lava[rand(1, 3)]"

/obj/structure/trap/lava/trap_effect(mob/living/L)
	to_chat(L, span_danger("<B>The floor crumbles, slowly uncovering blazing magma below.</B>"))
	playsound(src, 'sound/combat/hits/onstone/stonedeath.ogg', 100, TRUE)
	sleep(3 SECONDS)
	new new_turf(get_turf(src))
	qdel(src)

//Mob traps
/obj/structure/trap/skeleton
	name = "eerie remains"
	desc = ""
	icon = 'icons/roguetown/items/traps.dmi'
	icon_state = "boner1"//hehe
	sparks = FALSE
	alpha = 255
	var/ambush_mob = null

/obj/structure/trap/skeleton/Initialize()
	ambush_mob = pick(list(
		/mob/living/simple_animal/hostile/rogue/skeleton/guard,
		/mob/living/simple_animal/hostile/rogue/skeleton/spear,
		/mob/living/simple_animal/hostile/rogue/skeleton/axe,
		/mob/living/simple_animal/hostile/rogue/skeleton))
	update_icon()
	. = ..()

/obj/structure/trap/skeleton/update_icon()
	icon_state = "boner[rand(1, 3)]"

/obj/structure/trap/skeleton/trap_effect(mob/living/L)
	to_chat(L, span_danger("<B>The soft ground below the remains crumble, and denizens of undeath rise to face you!</B>"))
	new ambush_mob(get_turf(src))
	playsound(src, 'sound/combat/hits/onstone/stonedeath.ogg', 100, TRUE)
	qdel(src)

/obj/structure/trap/spider
	name = "suspicious webs"
	desc = "Something is tugging ever so gently at these mesmerizing silken weaves..."
	icon = 'icons/effects/effects.dmi'
	icon_state = "stickyweb1"//hehe
	sparks = FALSE
	alpha = 255
	var/ambush_mob = null

/obj/structure/trap/spider/Initialize()
	ambush_mob = pick(list(
		/mob/living/simple_animal/hostile/retaliate/rogue/spider,
		/mob/living/simple_animal/hostile/retaliate/rogue/spider/mutated))
	update_icon()
	. = ..()

/obj/structure/trap/spider/update_icon()
	icon_state = "stickyweb[rand(1, 2)]"

/obj/structure/trap/spider/trap_effect(mob/living/L)
	to_chat(L, span_danger("<B>Skittering! Hissing! A grotesque arachnid reveals itself!</B>"))
	new ambush_mob(get_turf(src))
	playsound(src, 'sound/vo/mobs/spider/pain.ogg', 100, TRUE)
	qdel(src)
