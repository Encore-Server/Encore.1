GLOBAL_LIST_EMPTY(TodUpdate)

SUBSYSTEM_DEF(nightshift)
	name = "Night Shift"
	wait = 10 SECONDS
	flags = SS_NO_TICK_CHECK
	priority = 1
	var/current_tod = null


	var/nightshift_active = FALSE

	var/nightshift_dawn_start = 0		
	var/nightshift_day_start = 108000
	var/nightshift_dusk_start = 432000
	var/nightshift_start_time = 540000	
	var/nightshift_end_time = 864000
	//1hr = 36000
	//30m = 18000

	var/nightshift_first_check = 2 SECONDS

	var/high_security_mode = FALSE

/datum/controller/subsystem/nightshift/Initialize()
	if(!CONFIG_GET(flag/enable_night_shifts))		
		can_fire = FALSE
	current_tod = settod()
	return ..()

/datum/controller/subsystem/nightshift/fire(resumed = FALSE)	
	if(world.time - SSticker.round_start_time < nightshift_first_check)
		return	
	check_nightshift()

/datum/controller/subsystem/nightshift/proc/announce(message)
	priority_announce(message, sound='sound/misc/bell.ogg', sender_override="Automated Lighting System Announcement")

/datum/controller/subsystem/nightshift/proc/check_nightshift()
	var/curtod = settod()
	if(current_tod != curtod)
		testing("curtod [curtod] current_tod [current_tod] globtod [GLOB.tod]")
		current_tod = GLOB.tod
		update_nightshift()

/datum/controller/subsystem/nightshift/proc/update_nightshift()
	set waitfor = FALSE
	for(var/obj/effect/sunlight/L in GLOB.sunlights)
		START_PROCESSING(SStodchange, L)
	for(var/obj/A in GLOB.TodUpdate)
		A.update_tod(GLOB.tod)
	for(var/mob/living/M in GLOB.mob_list)
		M.update_tod(GLOB.tod)

/obj/proc/update_tod(todd)
	return

/mob/living/proc/update_tod(todd)
	return

/mob/living/carbon/human/update_tod(todd)
	if(client)
		var/area/areal = get_area(src)
		if(!cmode)
			SSdroning.play_area_sound(areal, src.client)
		SSdroning.play_loop(areal, src.client)
	if(todd == "dawn")
		if(HAS_TRAIT(src, TRAIT_VAMP_DREAMS))
			apply_status_effect(/datum/status_effect/debuff/vamp_dreams)
	if(todd == "night")
		if(HAS_TRAIT(src, TRAIT_NOROGSTAM))
			return ..()
		if(HAS_TRAIT(src, TRAIT_NOSLEEP))
			return ..()
		apply_status_effect(/datum/status_effect/debuff/sleepytime)
		if(HAS_TRAIT(src, TRAIT_NIGHT_OWL))
			add_stress(/datum/stressevent/night_owl)
		else
			add_stress(/datum/stressevent/sleepytime)
