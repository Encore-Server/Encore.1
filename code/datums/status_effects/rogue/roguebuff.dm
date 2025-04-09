/datum/status_effect/buff
	status_type = STATUS_EFFECT_REFRESH


/datum/status_effect/buff/drunk
	id = "drunk"
	alert_type = /atom/movable/screen/alert/status_effect/buff/drunk
	effectedstats = list("intelligence" = -2, "endurance" = 1)
	duration = 5 MINUTES

/atom/movable/screen/alert/status_effect/buff/drunk
	name = "Drunk"
	desc = ""
	icon_state = "drunk"


/datum/status_effect/buff/foodbuff
	id = "foodbuff"
	alert_type = /atom/movable/screen/alert/status_effect/buff/foodbuff
	effectedstats = list("constitution" = 1,"endurance" = 1)
	duration = 10 MINUTES

/atom/movable/screen/alert/status_effect/buff/foodbuff
	name = "Great Meal"
	desc = ""
	icon_state = "foodbuff"

/datum/status_effect/buff/druqks
	id = "druqks"
	alert_type = /atom/movable/screen/alert/status_effect/buff/druqks
	effectedstats = list("intelligence" = 5,"speed" = 3,"fortune" = -5)
	duration = 10 SECONDS

/datum/status_effect/buff/druqks/on_apply()
	. = ..()
	owner.add_stress(/datum/stressevent/high)
	if(owner?.client)
		if(owner.client.screen && owner.client.screen.len)
			var/atom/movable/screen/plane_master/game_world/PM = locate(/atom/movable/screen/plane_master/game_world) in owner.client.screen
			PM.backdrop(owner)
			PM = locate(/atom/movable/screen/plane_master/game_world_fov_hidden) in owner.client.screen
			PM.backdrop(owner)
			PM = locate(/atom/movable/screen/plane_master/game_world_above) in owner.client.screen
			PM.backdrop(owner)

/datum/status_effect/buff/druqks/on_remove()
	owner.remove_stress(/datum/stressevent/high)
	if(owner?.client)
		if(owner.client.screen && owner.client.screen.len)
			var/atom/movable/screen/plane_master/game_world/PM = locate(/atom/movable/screen/plane_master/game_world) in owner.client.screen
			PM.backdrop(owner)
			PM = locate(/atom/movable/screen/plane_master/game_world_fov_hidden) in owner.client.screen
			PM.backdrop(owner)
			PM = locate(/atom/movable/screen/plane_master/game_world_above) in owner.client.screen
			PM.backdrop(owner)

	. = ..()

/atom/movable/screen/alert/status_effect/buff/druqks
	name = "High"
	desc = ""
	icon_state = "acid"

/datum/status_effect/buff/ozium
	id = "ozium"
	alert_type = /atom/movable/screen/alert/status_effect/buff/druqks
	effectedstats = list("speed" = -5, "perception" = 2)
	duration = 30 SECONDS

/datum/status_effect/buff/ozium/on_apply()
	. = ..()
	owner.add_stress(/datum/stressevent/ozium)
	ADD_TRAIT(owner, TRAIT_NOPAIN, TRAIT_GENERIC)

/datum/status_effect/buff/ozium/on_remove()
	owner.remove_stress(/datum/stressevent/ozium)
	REMOVE_TRAIT(owner, TRAIT_NOPAIN, TRAIT_GENERIC)
	. = ..()

/datum/status_effect/buff/moondust
	id = "moondust"
	alert_type = /atom/movable/screen/alert/status_effect/buff/druqks
	effectedstats = list("speed" = 2, "endurance" = 2, "intelligence" = -2)
	duration = 30 SECONDS

/datum/status_effect/buff/moondust/nextmove_modifier()
	return 0.8

/datum/status_effect/buff/moondust/on_apply()
	. = ..()
	owner.add_stress(/datum/stressevent/moondust)

/datum/status_effect/buff/moondust_purest
	id = "purest moondust"
	alert_type = /atom/movable/screen/alert/status_effect/buff/druqks
	effectedstats = list("speed" = 3, "endurance" = 3, "intelligence" = -2)
	duration = 40 SECONDS

/datum/status_effect/buff/moondust_purest/nextmove_modifier()
	return 0.8

/datum/status_effect/buff/moondust_purest/on_apply()
	. = ..()
	owner.add_stress(/datum/stressevent/moondust_purest)

/datum/status_effect/buff/weed
	id = "weed"
	alert_type = /atom/movable/screen/alert/status_effect/buff/weed
	effectedstats = list("intelligence" = 2,"speed" = -2,"fortune" = 2)
	duration = 10 SECONDS

/datum/status_effect/buff/weed/on_apply()
	. = ..()
	owner.add_stress(/datum/stressevent/weed)
	if(owner?.client)
		if(owner.client.screen && owner.client.screen.len)
			var/atom/movable/screen/plane_master/game_world/PM = locate(/atom/movable/screen/plane_master/game_world) in owner.client.screen
			PM.backdrop(owner)
			PM = locate(/atom/movable/screen/plane_master/game_world_fov_hidden) in owner.client.screen
			PM.backdrop(owner)
			PM = locate(/atom/movable/screen/plane_master/game_world_above) in owner.client.screen
			PM.backdrop(owner)

/datum/status_effect/buff/weed/on_remove()
	if(owner?.client)
		if(owner.client.screen && owner.client.screen.len)
			var/atom/movable/screen/plane_master/game_world/PM = locate(/atom/movable/screen/plane_master/game_world) in owner.client.screen
			PM.backdrop(owner)
			PM = locate(/atom/movable/screen/plane_master/game_world_fov_hidden) in owner.client.screen
			PM.backdrop(owner)
			PM = locate(/atom/movable/screen/plane_master/game_world_above) in owner.client.screen
			PM.backdrop(owner)

	. = ..()

/atom/movable/screen/alert/status_effect/buff/weed
	name = "Dazed"
	desc = ""
	icon_state = "weed"

/datum/status_effect/buff/vitae
	id = "druqks"
	alert_type = /atom/movable/screen/alert/status_effect/buff/vitae
	effectedstats = list("fortune" = 2)
	duration = 10 SECONDS

/datum/status_effect/buff/vitae/on_apply()
	. = ..()
	owner.add_stress(/datum/stressevent/high)

/datum/status_effect/buff/vitae/on_remove()
	owner.remove_stress(/datum/stressevent/high)

	. = ..()

/atom/movable/screen/alert/status_effect/buff/vitae
	name = "Invigorated"
	desc = "I have supped on the finest of delicacies: life!"

/atom/movable/screen/alert/status_effect/buff/featherfall
	name = "Featherfall"
	desc = "I am somewhat protected against falling from heights."
	icon_state = "buff"

/datum/status_effect/buff/featherfall
	id = "featherfall"
	alert_type = /atom/movable/screen/alert/status_effect/buff/featherfall
	duration = 1 MINUTES

/datum/status_effect/buff/featherfall/on_apply()
	. = ..()
	to_chat(owner, span_warning("I feel lighter."))
	ADD_TRAIT(owner, TRAIT_NOFALLDAMAGE2, MAGIC_TRAIT)

/datum/status_effect/buff/featherfall/on_remove()
	. = ..()
	to_chat(owner, span_warning("The feeling of lightness fades."))
	REMOVE_TRAIT(owner, TRAIT_NOFALLDAMAGE2, MAGIC_TRAIT)

/atom/movable/screen/alert/status_effect/buff/darkvision
	name = "Darkvision"
	desc = "I can see in the dark somewhat."
	icon_state = "buff"

/datum/status_effect/buff/darkvision
	id = "darkvision"
	alert_type = /atom/movable/screen/alert/status_effect/buff/darkvision
	duration = 15 MINUTES

/datum/status_effect/buff/darkvision/on_apply()
	. = ..()
	to_chat(owner, span_warning("The darkness fades somewhat."))
	ADD_TRAIT(owner, TRAIT_DARKVISION, MAGIC_TRAIT)

/datum/status_effect/buff/darkvision/on_remove()
	. = ..()
	to_chat(owner, span_warning("The darkness returns to normal."))
	REMOVE_TRAIT(owner, TRAIT_DARKVISION, MAGIC_TRAIT)

/atom/movable/screen/alert/status_effect/buff/longstrider
	name = "Longstrider"
	desc = "I can easily walk through rough terrain."
	icon_state = "buff"

/datum/status_effect/buff/longstrider
	id = "longstrider"
	alert_type = /atom/movable/screen/alert/status_effect/buff/longstrider
	duration = 15 MINUTES

/datum/status_effect/buff/longstrider/on_apply()
	. = ..()
	to_chat(owner, span_warning("I am unburdened by the terrain."))
	ADD_TRAIT(owner, TRAIT_LONGSTRIDER, MAGIC_TRAIT)

/datum/status_effect/buff/longstrider/on_remove()
	. = ..()
	to_chat(owner, span_warning("The rough floors slow my travels once again."))
	REMOVE_TRAIT(owner, TRAIT_LONGSTRIDER, MAGIC_TRAIT)


/atom/movable/screen/alert/status_effect/buff/guardbuffone
	name = "Vigilant Guardsman"
	desc = "My home. I watch vigilantly and respond swiftly."
	icon_state = "buff"

/atom/movable/screen/alert/status_effect/buff/knightbuff
	name = "Sworn Defender"
	desc = "I've sworn an oath to defend this castle. My resolve will not waver."
	icon_state = "buff"

/datum/status_effect/buff/guardbuffone
	id = "guardbuffone"
	alert_type = /atom/movable/screen/alert/status_effect/buff/guardbuffone
	effectedstats = list("constitution" = 1,"endurance" = 1, "speed" = 1, "perception" = 2) 

/datum/status_effect/buff/knightbuff
	id = "knightbuff"
	alert_type = /atom/movable/screen/alert/status_effect/buff/knightbuff
	effectedstats = list("constitution" = 1,"endurance" = 1, "speed" = 1, "perception" = 2)
	duration = 50000 //essentially permanent, removes when we're out of the area

/datum/status_effect/buff/guardbuffone/process()

	.=..()
	var/area/rogue/our_area = get_area(owner)
	if(!(our_area.town_area))
		owner.remove_status_effect(/datum/status_effect/buff/guardbuffone)

/datum/status_effect/buff/knightbuff/process()

	.=..()
	var/area/rogue/our_area = get_area(owner)
	if(!(our_area.keep_area))
		owner.remove_status_effect(/datum/status_effect/buff/knightbuff)

/atom/movable/screen/alert/status_effect/buff/healing
	name = "Healing Miracle"
	desc = "Divine intervention relieves me of my ailments."
	icon_state = "buff"

#define MIRACLE_HEALING_FILTER "miracle_heal_glow"

/datum/status_effect/buff/healing
	id = "healing"
	alert_type = /atom/movable/screen/alert/status_effect/buff/healing
	duration = 10 SECONDS
	examine_text = "SUBJECTPRONOUN is bathed in a restorative aura!"
	var/healing_on_tick = 1
	var/outline_colour = "#c42424"

/datum/status_effect/buff/healing/on_creation(mob/living/new_owner, new_healing_on_tick)
	healing_on_tick = new_healing_on_tick
	return ..()

/datum/status_effect/buff/healing/on_apply()
	var/filter = owner.get_filter(MIRACLE_HEALING_FILTER)
	if (!filter)
		owner.add_filter(MIRACLE_HEALING_FILTER, 2, list("type" = "outline", "color" = outline_colour, "alpha" = 60, "size" = 1))
	return TRUE

/datum/status_effect/buff/healing/tick()
	var/obj/effect/temp_visual/heal/H = new /obj/effect/temp_visual/heal_rogue(get_turf(owner))
	H.color = "#FF0000"
	var/list/wCount = owner.get_wounds()
	if(owner.blood_volume < BLOOD_VOLUME_NORMAL)
		owner.blood_volume = min(owner.blood_volume+10, BLOOD_VOLUME_NORMAL)
	if(wCount.len > 0)
		owner.heal_wounds(healing_on_tick)
		owner.update_damage_overlays()
	owner.adjustBruteLoss(-healing_on_tick, 0)
	owner.adjustFireLoss(-healing_on_tick, 0)
	owner.adjustOxyLoss(-healing_on_tick, 0)
	owner.adjustToxLoss(-healing_on_tick, 0)
	owner.adjustOrganLoss(ORGAN_SLOT_BRAIN, -healing_on_tick)
	owner.adjustCloneLoss(-healing_on_tick, 0)

/datum/status_effect/buff/healing/on_remove()
	owner.remove_filter(MIRACLE_HEALING_FILTER)


/atom/movable/screen/alert/status_effect/buff/convergence
	name = "Convergence Miracle"
	desc = "My body converges to whence it found strength and health."
	icon_state = "buff"

/atom/movable/screen/alert/status_effect/buff/stasis
	name = "Stasis Miracle"
	desc = "A part of me has been put in stasis."
	icon_state = "buff"
	
/atom/movable/screen/alert/status_effect/buff/fortify
	name = "Fortifying Miracle"
	desc = "Divine intervention bolsters me and aids my recovery."
	icon_state = "buff"

/datum/status_effect/buff/convergence //Increases all healing while it lasts.
	id = "convergence"
	alert_type = /atom/movable/screen/alert/status_effect/buff/convergence
	duration = 1 MINUTES

/datum/status_effect/buff/stasis //Increases all healing while it lasts.
	id = "stasis"
	alert_type = /atom/movable/screen/alert/status_effect/buff/stasis
	duration = 10 SECONDS


/datum/status_effect/buff/fortify //Increases all healing while it lasts.
	id = "fortify"
	alert_type = /atom/movable/screen/alert/status_effect/buff/fortify
	duration = 1 MINUTES

#undef MIRACLE_HEALING_FILTER

// Mage Armor
/atom/movable/screen/alert/status_effect/buff/magearmor
	name = "Weakened Barrier"
	desc = "My magical barrier is weakened."
	icon_state = "stressvg"

/datum/status_effect/buff/magearmor
	id = "magearmor"
	alert_type = /atom/movable/screen/alert/status_effect/buff/magearmor

/datum/status_effect/buff/magearmor/on_apply()
	. = ..()
	playsound(owner, 'sound/magic/magearmordown.ogg', 75, FALSE)
	duration = (7-owner.mind.get_skill_level(/datum/skill/magic/arcane)) MINUTES

/datum/status_effect/buff/magearmor/on_remove()
	. = ..()
	to_chat(owner, span_warning("My magical barrier reforms."))
	playsound(owner, 'sound/magic/magearmorup.ogg', 75, FALSE)
	owner.magearmor = 0

/datum/status_effect/buff/call_to_arms
	id = "call_to_arms"
	alert_type = /atom/movable/screen/alert/status_effect/buff/call_to_arms
	duration = 2.5 MINUTES
	effectedstats = list("strength" = 1, "endurance" = 2, "constitution" = 1)

/atom/movable/screen/alert/status_effect/buff/call_to_arms
	name = "Call to Arms"
	desc = span_bloody("FOR GLORY AND HONOR!")
	icon_state = "call_to_arms"

/datum/status_effect/buff/call_to_slaughter
	id = "call_to_slaughter"
	alert_type = /atom/movable/screen/alert/status_effect/buff/call_to_slaughter
	duration = 2.5 MINUTES
	effectedstats = list("strength" = 1, "endurance" = 2, "constitution" = 1)

/atom/movable/screen/alert/status_effect/buff/call_to_slaughter
	name = "Call to Slaughter"
	desc = span_bloody("LAMBS TO THE SLAUGHTER!")
	icon_state = "call_to_slaughter"

/datum/status_effect/buff/enlarge
	id = "enlarge_buff"
	alert_type = /atom/movable/screen/alert/status_effect/buff/enlarge
	duration = 2.5 MINUTES
	effectedstats = list("strength" = 3, "endurance" = -2, "constitution" = 1, "speed" = -2)

/atom/movable/screen/alert/status_effect/buff/enlarge
	name = "Enlarge Buff"
	icon_state = "muscle"

#define BLESSINGOFSUN_FILTER "sun_glow"
/atom/movable/screen/alert/status_effect/buff/guidinglight
	name = "Guiding Light"
	desc = "A warm gaze follows me, lighting the path!"
	icon_state = "stressvg"

/datum/status_effect/buff/guidinglight // Hey did u follow us from ritualcircles? Cool, okay this stuff is pretty simple yeah? Most ritual circles use some sort of status effects to get their effects ez.
	id = "guidinglight"
	alert_type = /atom/movable/screen/alert/status_effect/buff/guidinglight
	duration = 30 MINUTES // Lasts for 30 minutes, roughly an ingame day. This should be the gold standard for rituals, unless its some particularly powerul effect or one-time effect(Flylord's triage)
	status_type = STATUS_EFFECT_REFRESH
	effectedstats = list("perception" = 2) // This is for basic stat effects, I would consider these a 'little topping' and not what you should rlly aim for for rituals. Ideally we have cool flavor boons, rather than combat stims.
	examine_text = "SUBJECTPRONOUN walks with Her Light!"
	var/list/mobs_affected
	var/obj/effect/dummy/lighting_obj/moblight/mob_light_obj
	var/outline_colour = "#ffffff"

/datum/status_effect/buff/guidinglight/on_apply()
	. = ..()
	if (!.)
		return
	to_chat(owner, span_notice("Light blossoms into being around me!"))
	var/filter = owner.get_filter(BLESSINGOFSUN_FILTER)
	if (!filter)
		owner.add_filter(BLESSINGOFSUN_FILTER, 2, list("type" = "outline", "color" = outline_colour, "alpha" = 60, "size" = 1))
	mob_light_obj = owner.mob_light("#fdfbd3", 10, 10)
	return TRUE


/datum/status_effect/buff/guidinglight/on_remove()
	playsound(owner, 'sound/items/firesnuff.ogg', 75, FALSE)
	to_chat(owner, span_notice("The miraculous light surrounding me has fled..."))
	owner.remove_filter(BLESSINGOFSUN_FILTER)
	QDEL_NULL(mob_light_obj)

#undef BLESSINGOFSUN_FILTER
/datum/status_effect/buff/moonlightdance
	id = "Moonsight"
	alert_type = /atom/movable/screen/alert/status_effect/buff/moonlightdance
	effectedstats = list("intelligence" = 2)
	duration = 15 MINUTES

/atom/movable/screen/alert/status_effect/buff/moonlightdance
	name = "Moonlight Dance"
	desc = "Noc's stony touch lay upon my mind, bringing me wisdom."
	icon_state = "moonlightdance"


/datum/status_effect/buff/moonlightdance/on_apply()
	. = ..()
	to_chat(owner, span_warning("I see through the Moonlight. Silvery threads dance in my vision."))
	ADD_TRAIT(owner, TRAIT_DARKVISION, MAGIC_TRAIT)


/datum/status_effect/buff/moonlightdance/on_remove()
	. = ..()
	to_chat(owner, span_warning("The moon's silver leaves me"))
	REMOVE_TRAIT(owner, TRAIT_DARKVISION, MAGIC_TRAIT)




/atom/movable/screen/alert/status_effect/buff/flylordstriage
	name = "Flylord's Triage"
	desc = "Rot's servants crawl through my pores and wounds!"
	icon_state = "buff"

/datum/status_effect/buff/flylordstriage
	id = "healing"
	alert_type = /atom/movable/screen/alert/status_effect/buff/healing
	duration = 20 SECONDS
	var/healing_on_tick = 40

/datum/status_effect/buff/flylordstriage/tick()
	playsound(owner, 'sound/misc/fliesloop.ogg', 100, FALSE, -1)
	owner.flash_fullscreen("redflash3")
	owner.emote("agony")
	new /obj/effect/temp_visual/flies(get_turf(owner))
	var/list/wCount = owner.get_wounds()
	if(owner.blood_volume < BLOOD_VOLUME_NORMAL)
		owner.blood_volume = min(owner.blood_volume+100, BLOOD_VOLUME_NORMAL)
	if(wCount.len > 0)
		owner.heal_wounds(healing_on_tick)
		owner.update_damage_overlays()
	owner.adjustBruteLoss(-healing_on_tick, 0)
	owner.adjustFireLoss(-healing_on_tick, 0)
	owner.adjustOxyLoss(-healing_on_tick, 0)
	owner.adjustToxLoss(-healing_on_tick, 0)
	owner.adjustOrganLoss(ORGAN_SLOT_BRAIN, -healing_on_tick)
	owner.adjustCloneLoss(-healing_on_tick, 0)

/obj/effect/temp_visual/flies
	name = "Flylord's triage"
	icon_state = "flies"
	duration = 15
	plane = GAME_PLANE_UPPER
	layer = ABOVE_ALL_MOB_LAYER
	icon = 'icons/roguetown/mob/rotten.dmi'
	icon_state = "rotten"


/datum/status_effect/buff/flylordstriage/on_remove()
	to_chat(owner,span_userdanger("It's finally over..."))


/atom/movable/screen/alert/status_effect/buff/undermaidenbargain
	name = "Undermaiden's Bargain"
	desc = "A horrible deal was struck in my name..."
	icon_state = "buff"

/datum/status_effect/buff/undermaidenbargain
	id = "undermaidenbargain"
	alert_type = /atom/movable/screen/alert/status_effect/buff/undermaidenbargain
	duration = 30 MINUTES



/datum/status_effect/buff/undermaidenbargain/on_apply()
    . = ..()
    to_chat(owner, span_danger("You feel as though some horrible deal has been prepared in your name. May you never see it fulfilled and may the Gods forgive you..."))
    playsound(owner, 'sound/misc/bell.ogg', 100, FALSE, -1)
    ADD_TRAIT(owner, TRAIT_DEATHBARGAIN, TRAIT_GENERIC)
    // There has to be a neater way of doing this?
    start_deal_phases(owner)

/proc/start_deal_phases(mob/living/owner)
    var/pactline = rand(1,9)

    if (do_after(owner, 480))  // 8 minutes
        if (owner.has_status_effect(/datum/status_effect/buff/undermaidenbargain))
            pactline = rand(1, 3)
            switch(pactline)
                if (1)
                    to_chat(owner, span_cultsmall("You hear a whisper at the back of your mind. What did she say?"))
                if (2)
                    to_chat(owner, span_cultsmall("Was that laughter, or the wind?"))
                if (3)
                    to_chat(owner, span_cultsmall("You feel eyes crawling over the back of your neck"))

    if (do_after(owner, 800))
        if (owner.has_status_effect(/datum/status_effect/buff/undermaidenbargain))
            pactline = rand(4, 6)
            switch(pactline)
                if (4)
                    to_chat(owner, span_cultsmall("For a moment you look out from behind eyes that are not yours. You see nothing but shadows."))
                if (5)
                    to_chat(owner, span_cultsmall("For a moment you see a gravestone. You are not sure if it's yours."))
                if (6)
                    to_chat(owner, span_cultsmall("You hear a voice. You miss the words, but it is familiar."))

    if (do_after(owner, 1000))
        if (owner.has_status_effect(/datum/status_effect/buff/undermaidenbargain))
            pactline = rand(7, 9)
            switch(pactline)
                if (7)
                    to_chat(owner, span_cultsmall("You hear the chanting of a dirge."))
                if (8)
                    to_chat(owner, span_cultsmall("You feel unclean. Your soul has started to itch."))
                if (9)
                    to_chat(owner, span_cultsmall("Even if your pact goes unfulfilled, what happens to the one destined to take your place?"))

/proc/phase_message(mob/living/owner, message, sound_path)
    to_chat(owner, span_warning(message))
    playsound(owner, sound_path, 100, FALSE, -1)

/datum/status_effect/buff/undermaidenbargain/on_remove()
	. = ..()
	REMOVE_TRAIT(owner, TRAIT_DEATHBARGAIN, TRAIT_GENERIC)


/datum/status_effect/buff/undermaidenbargainheal/on_apply()
	. = ..()
	owner.remove_status_effect(/datum/status_effect/buff/undermaidenbargain)
	to_chat(owner, span_warning("You feel the deal struck in your name is being fulfilled..."))
	playsound(owner, 'sound/misc/deadbell.ogg', 100, FALSE, -1)
	ADD_TRAIT(owner, TRAIT_NODEATH, TRAIT_GENERIC)
	var/dirgeline = rand(1,9)
	spawn(15)
		switch(dirgeline)
			if(1)
				to_chat(owner, span_cultsmall("She watches the city skyline as her crimson pours into the drain."))
			if(2)
				to_chat(owner, span_cultsmall("He only wanted more for his family. He feels comfort on the pavement, the Watchman's blade having met its mark."))
			if(3)
				to_chat(owner, span_cultsmall("A sailor's leg is caught in naval rope. Their last thoughts are of home."))
			if(4)
				to_chat(owner, span_cultsmall("She sobbed over her husband's corpse. The Brigand's mace stemmed her tears."))
			if(5)
				to_chat(owner, span_cultsmall("A farm son chokes up his last. At his bedside, a sister and mother weep."))
			if(6)
				to_chat(owner, span_cultsmall("A woman begs at a Headstone. It is your fault."))
			if(7)
				to_chat(owner, span_cultsmall("It was nothing more than a dare, but the rocks gave way. She barely had time to scream."))
			if(8)
				to_chat(owner, span_cultsmall("He pushed for confession slightly too hard. No matter. Bring in the next."))
			if(9)
				to_chat(owner, span_cultsmall("The last of their supplies are rotten. How did the pests get in?"))

/datum/status_effect/buff/undermaidenbargainheal/on_remove()
	. = ..()
	to_chat(owner, span_warning("The Bargain struck in my name has been fulfilled... I am thrown from death's embrace, another in my place..."))
	playsound(owner, 'sound/misc/deadbell.ogg', 100, FALSE, -1)
	REMOVE_TRAIT(owner, TRAIT_NODEATH, TRAIT_GENERIC)

/datum/status_effect/buff/undermaidenbargainheal
	id = "undermaidenbargainheal"
	alert_type = /atom/movable/screen/alert/status_effect/buff/undermaidenbargainheal
	duration = 10 SECONDS
	var/healing_on_tick = 20

/datum/status_effect/buff/undermaidenbargainheal/tick()
	var/list/wCount = owner.get_wounds()
	if(owner.blood_volume < BLOOD_VOLUME_NORMAL)
		owner.blood_volume = min(owner.blood_volume+60, BLOOD_VOLUME_NORMAL)
	if(wCount.len > 0)
		owner.heal_wounds(100) // we're gonna try really hard to heal someone's arterials and also stabilize their blood, so they don't instantly bleed out again. Ideally they should be 'just' alive.
		owner.update_damage_overlays()
	owner.adjustBruteLoss(-healing_on_tick, 0)
	owner.adjustFireLoss(-healing_on_tick, 0)
	owner.adjustOxyLoss(-healing_on_tick, 0)
	owner.adjustToxLoss(-healing_on_tick, 0)
	owner.adjustOrganLoss(ORGAN_SLOT_BRAIN, -healing_on_tick)
	owner.adjustCloneLoss(-healing_on_tick, 0)

/atom/movable/screen/alert/status_effect/buff/undermaidenbargainheal
	name = "The Fulfillment"
	desc = "My bargain is being fulfilled..."
	icon_state = "buff"


/atom/movable/screen/alert/status_effect/buff/lesserwolf
	name = "Blessing of the Lesser Wolf"
	desc = "I swell with the embuement of a predator..."
	icon_state = "buff"



/datum/status_effect/buff/lesserwolf
	id = "lesserwolf"
	alert_type = /atom/movable/screen/alert/status_effect/buff/lesserwolf
	duration = 30 MINUTES

/datum/status_effect/buff/lesserwolf/on_apply()
	. = ..()
	to_chat(owner, span_warning("I feel my leg muscles grow taut, my teeth sharp, I am embued with the power of a predator. Branches and brush reach out for my soul..."))
	ADD_TRAIT(owner, TRAIT_LONGSTRIDER, TRAIT_GENERIC)
	ADD_TRAIT(owner, TRAIT_STRONGBITE, TRAIT_GENERIC)

/datum/status_effect/buff/lesserwolf/on_remove()
	. = ..()
	to_chat(owner, span_warning("I feel nature's blessing leave my body..."))
	REMOVE_TRAIT(owner, TRAIT_LONGSTRIDER, TRAIT_GENERIC)
	ADD_TRAIT(owner, TRAIT_STRONGBITE, TRAIT_GENERIC)

/atom/movable/screen/alert/status_effect/buff/pacify
	name = "Blessing of Pacification"
	desc = "I feel my heart as light as feathers. All my worries have washed away."
	icon_state = "buff"

/datum/status_effect/buff/pacify
	id = "pacify"
	alert_type = /atom/movable/screen/alert/status_effect/buff/pacify
	duration = 30 MINUTES

/datum/status_effect/buff/pacify/on_apply()
	. = ..()
	to_chat(owner, span_green("Everything feels great!"))
	owner.add_stress(/datum/stressevent/pacified)
	ADD_TRAIT(owner, TRAIT_PACIFISM, TRAIT_GENERIC)

/datum/status_effect/buff/pacify/on_remove()
	. = ..()
	to_chat(owner, span_warning("My mind is my own again, no longer awash with foggy peace!"))
	REMOVE_TRAIT(owner, TRAIT_PACIFISM, TRAIT_GENERIC)
