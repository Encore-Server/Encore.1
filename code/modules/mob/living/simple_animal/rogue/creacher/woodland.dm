/mob/living/simple_animal/hostile/retaliate/rogue/ent
//cosmetic vars
	name = "ancient ent"
	icon = 'icons/mob/simple/ent.dmi'
	icon_state = "ent"
	icon_living = "ent"
	icon_dead = "ent"
	pixel_x = -9
	faction = list("gani")
	emote_hear = list("rustles.")
	emote_see = list("creaks.", "lists lazily.")
	attack_sound = list('sound/combat/wooshes/blunt/wooshhuge (1).ogg','sound/combat/wooshes/blunt/wooshhuge (2).ogg','sound/combat/wooshes/blunt/wooshhuge (3).ogg')
	mob_biotypes = MOB_MINERAL
	footstep_type = FOOTSTEP_MOB_HEAVY
	pooptype = null

//vision and aggro vars
	aggressive = 1
	deaggroprob = 20
	see_in_dark = 15
	vision_range = 15
	aggro_vision_range = 2
	retreat_distance = 6
	minimum_distance = 2

//combat statistic vars
	health = 550
	maxHealth = 550
	base_intents = list(/datum/intent/unarmed/punch)
	melee_damage_lower = 45
	melee_damage_upper = 85
	armor_penetration = 95
	STACON = 17
	STASTR = 21
	STASPD = 3
	defprob = 35
	defdrain = 13
	del_on_deaggro = 44 SECONDS
	retreat_health = 110
	dodgetime = 15
	stat_attack = UNCONSCIOUS
	del_on_death = TRUE//drops a fucking tree
	loot = list(/obj/structure/flora/roguetree/stump/log, /obj/item/grown/log/tree/stick)
	environment_smash = ENVIRONMENT_SMASH_STRUCTURES

//movement vars
	turns_per_move = 2
	move_to_delay = 25
	inertia_move_delay = 5
	wander = 0

/mob/living/simple_animal/hostile/retaliate/rogue/ent/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_IGNOREDAMAGESLOWDOWN, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOPAINSTUN, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_PIERCEIMMUNE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOROGSTAM, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOBREATH, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOPAIN, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_TOXIMMUNE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_BLOODLOSS_IMMUNE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NIGHT_VISION, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_BASHDOORS, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOFALLDAMAGE1, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_BREADY, TRAIT_GENERIC)

/mob/living/simple_animal/hostile/retaliate/rogue/ent/get_sound(input)
	switch(input)
		if("aggro")
			return pick('sound/foley/doors/shittyopen.ogg')
		if("pain")
			return pick('sound/foley/doors/shittyopen.ogg')
		if("death")
			return pick('sound/misc/treefall.ogg')
		if("idle")
			return pick('sound/foley/doors/shittyopen.ogg')
		if("cidle")
			return pick('sound/foley/doors/shittyopen.ogg')

/mob/living/simple_animal/hostile/retaliate/rogue/ent/taunted(mob/user)
	Retaliate()
	GiveTarget(user)
	return

/mob/living/simple_animal/hostile/retaliate/rogue/ent/Life()
	..()
	if(pulledby)
		Retaliate()
		GiveTarget(pulledby)

/mob/living/simple_animal/hostile/retaliate/rogue/ent/electrocute_act(shock_damage, source, siemens_coeff = 1, flags = NONE)
	return FALSE
