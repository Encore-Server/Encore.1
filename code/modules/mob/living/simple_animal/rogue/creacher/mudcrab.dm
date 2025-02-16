//Look Sir, free crabs!
/mob/living/simple_animal/hostile/retaliate/rogue/mudcrab
	name = "mudcrab"
	desc = ""
	icon_state = "mudcrab"
	icon_living = "mudcrab"
	icon_dead = "mudcrab_dead"
	speak_emote = list("clicks")
	emote_hear = list("clicks.")
	emote_see = list("clacks.")
	speak_chance = 1
	turns_per_move = 5
	butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/crab = 2)
	faction = list("crabs")
	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently pushes aside"
	response_disarm_simple = "gently push aside"
	response_harm_continuous = "stomps"
	response_harm_simple = "stomp"
	stop_automated_movement = 1
	friendly_verb_continuous = "pinches"
	friendly_verb_simple = "pinch"
	ventcrawler = VENTCRAWLER_ALWAYS
	melee_damage_lower = 1
	melee_damage_upper = 5
	stop_automated_movement_when_pulled = TRUE //It is really not hard to stop a crab
	var/obj/item/inventory_head
	var/obj/item/inventory_mask
	gold_core_spawnable = FRIENDLY_SPAWN

/mob/living/simple_animal/hostile/retaliate/rogue/mudcrab/Life()
	..()
	//CRAB movement
	if(!ckey && !stat)
		if(pulledby)
			return
		if(isturf(loc) && !resting && !buckled)		//This is so it only moves if it's not inside a closet, gentics machine, etc.
			turns_since_move++
			if(turns_since_move >= turns_per_move)
				var/east_vs_west = pick(4,8)
				if(Process_Spacemove(east_vs_west))
					Move(get_step(src,east_vs_west), east_vs_west)

/mob/living/simple_animal/hostile/retaliate/rogue/mudcrab/get_sound(input)
	switch(input)
		if("idle")
			return pick('sound/vo/mobs/crab/crab noise (1).ogg','sound/vo/mobs/crab/crab noise (2).ogg','sound/vo/mobs/crab/crab noise (3).ogg')
		if("death")
			return pick('sound/vo/mobs/crab/crab death.ogg')

/mob/living/simple_animal/hostile/retaliate/rogue/mudcrab/muckcrab
	name = "muckcrab"
	desc = "A small, muck-burrowing crab. Not dangerous like its larger cousin, but just as delicious."
	icon_state = "muckcrab"
	icon_living = "muckcrab"
	icon_dead = "muckcrab_dead"
	health = 5
	maxHealth = 5
	melee_damage_upper = 3
	butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/crab = 1)

/mob/living/simple_animal/hostile/retaliate/rogue/mudcrab/attackby(obj/item/W, mob/living/user)
	//Handle easily killing the crab. Less violent than just swinging at it, guaranteed kill. But it might pinch ya.
	if(stat == DEAD)
		..()
	else
		if(ishuman(user)) //We have to be holding it
			var/mob/living/carbon/human/H = user
			if(pulledby && pulledby == H)
				var/sl = 0 //fishing skill level
				if(H.mind)
					sl = user.mind.get_skill_level(/datum/skill/labor/fishing) //We've done this before, it will help
				var/canstab = FALSE
				for(var/X in W.possible_item_intents)
					var/datum/intent/D = new X
					if(D.blade_class == BCLASS_STAB) //Weapon needs to be able to stab
						canstab = TRUE
				if(canstab) //Tool checks out, let's start
					to_chat(H, span_notice("I start to work the [W] under the shell of [src]..."))
					if(do_after(H, 70 - (sl * 5), target = src)) //Easier if you're experienced with shellfish
						if(prob(max(5, 40 - (sl*10)))) //Get pinched, idiot
							var/pinched_hand = H.l_grab ? BODY_ZONE_PRECISE_L_HAND : BODY_ZONE_PRECISE_R_HAND
							H.visible_message(span_warning("\The [src] pinches [user]!"), \
												span_danger("Ow! \The [src] pinched me!"))
							H.apply_damage(rand(melee_damage_lower, melee_damage_upper), def_zone = pinched_hand)
							pulledby.stop_pulling()
							step_away(src, H, 2)
							H.mind.add_sleep_experience(/datum/skill/labor/fishing, H.STAINT/2) //Well, you tried
						else
							death() //Get killed, idiot
							update_icon()
							H.visible_message(span_notice("[H] slips their knife under \the [src]'s shell, putting it down quickly."),
											span_notice("I swiftly end \the [src] with my [W]."))
							H.mind.add_sleep_experience(/datum/skill/labor/fishing, H.STAINT)
					return
		..()


/obj/structure/crabnest
	name = "Mudcrab Burrow"
	icon = 'icons/roguetown/misc/structure.dmi'
	icon_state = "crabnest"
	max_integrity = 200
	anchored = TRUE
	density = FALSE
	layer = BELOW_OBJ_LAYER
	var/crabs = 0
	var/maxcrabs = 3
	var/spawning = FALSE
	attacked_sound = null

/obj/structure/crabnest/Initialize()
	. = ..()
	spawn_crab()

/obj/structure/crabnest/proc/createcrab()
	if(QDELETED(src))
		return
	if(!spawning)
		return
	spawning = FALSE
	new /mob/living/simple_animal/hostile/retaliate/rogue/mudcrab(get_turf(src))
	crabs++
	update_icon()
	if(crabs < maxcrabs)
		spawn_crab()

/obj/structure/crabnest/proc/spawn_crab()
	if(QDELETED(src))
		return
	if(spawning)
		return
	spawning = TRUE
	update_icon()
	spawn(2 SECONDS)
		createcrab()
	//addtimer(CALLBACK(src, PROC_REF(creategob)), 4 SECONDS)