/mob/living/simple_animal/hostile/retaliate/rogue/fiend_lesser
	icon = 'icons/roguetown/mob/monster/hell/fiends.dmi'
	name = "errant thauma"
	icon_state = "soul"
	icon_living = "soul"
	icon_dead = "soul"
	emote_hear = null
	emote_see = null
	speak_chance = 0
	turns_per_move = 2
	see_in_dark = 10
	move_to_delay = 3
	base_intents = list(/datum/intent/simple/bite)
	faction = list("hell")
	emote_hear = list("sobs.")
	emote_see = list("gives out a pained noise.", "whispers to itself.")
	health = 65
	maxHealth = 65
	melee_damage_lower = 25
	melee_damage_upper = 70
	armor_penetration = 65
	see_in_dark = 20
	vision_range = 20
	aggro_vision_range = 20
	resistance_flags = LAVA_PROOF
	mob_biotypes = MOB_SPIRIT
	environment_smash = ENVIRONMENT_SMASH_STRUCTURES
	movement_type = FLYING
	pass_flags = PASSTABLE|PASSGRILLE
	retreat_distance = 0
	minimum_distance = 0
	food_type = list(/obj/item/organ)
	footstep_type = null
	pooptype = null
	STACON = 15
	STASTR = 15
	STASPD = 5
	deaggroprob = 0
	defprob = 35
	defdrain = 13
	del_on_deaggro = 44 SECONDS
	retreat_health = 0
	food = 0
	attack_sound = list('sound/combat/fracture/fracturewet (1).ogg','sound/combat/fracture/fracturewet (2).ogg','sound/combat/fracture/fracturewet (3).ogg')
	dodgetime = 15
	aggressive = 1
	stat_attack = UNCONSCIOUS
	del_on_death = TRUE//drops blood and guts
	loot = list(/obj/effect/decal/cleanable/blood/gibs/body, /obj/effect/decal/cleanable/blood/gibs/up, /obj/effect/decal/cleanable/blood/splatter,	/obj/effect/decal/cleanable/blood/gibs/down)

/mob/living/simple_animal/hostile/retaliate/rogue/fiend_lesser/Initialize()
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
	ADD_TRAIT(src, TRAIT_NOFIRE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_RESISTHEAT, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NIGHT_VISION, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_BASHDOORS, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_ORGAN_EATER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NASTY_EATER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOSTINK, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOFALLDAMAGE1, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_BREADY, TRAIT_GENERIC)

/mob/living/simple_animal/hostile/retaliate/rogue/fiend_lesser/get_sound(input)
	switch(input)
		if("aggro")
			return pick('sound/vo/mobs/demon/demon_laughter.ogg','sound/vo/mobs/demon/demon_roar.ogg')
		if("pain")
			return pick('sound/vo/mobs/demon/demon_roar.ogg','sound/vo/mobs/wwolf/pain (1).ogg','sound/vo/mobs/demon/demon_hiss.ogg','sound/vo/mobs/demon/demon_growl.ogg')
		if("death")
			return pick('sound/vo/mobs/demon/demon_hiss.ogg')
		if("idle")
			return pick('sound/vo/mobs/demon/demon_laughter.ogg',)
		if("cidle")
			return pick('sound/vo/mobs/demon/demon_growl.ogg')

/mob/living/simple_animal/hostile/retaliate/rogue/fiend_lesser/taunted(mob/user)
	Retaliate()
	GiveTarget(user)
	return

/mob/living/simple_animal/hostile/retaliate/rogue/fiend_lesser/Life()
	..()
	if(pulledby)
		Retaliate()
		GiveTarget(pulledby)

/mob/living/simple_animal/hostile/retaliate/rogue/fiend_lesser/electrocute_act(shock_damage, source, siemens_coeff = 1, flags = NONE)
	return FALSE

/mob/living/simple_animal/hostile/retaliate/rogue/fiend_lesser/simple_limb_hit(zone)
	if(!zone)
		return ""
	switch(zone)
		if(BODY_ZONE_PRECISE_R_EYE)
			return "rotting head"
		if(BODY_ZONE_PRECISE_L_EYE)
			return "rotting head"
		if(BODY_ZONE_PRECISE_NOSE)
			return "rotted nasal septum"
		if(BODY_ZONE_PRECISE_MOUTH)
			return "screaming mouth"
		if(BODY_ZONE_PRECISE_SKULL)
			return "rotting head"
		if(BODY_ZONE_PRECISE_EARS)
			return "rotting head"
		if(BODY_ZONE_PRECISE_NECK)
			return "rotting head"
		if(BODY_ZONE_PRECISE_L_HAND)
			return "dangling thauma"
		if(BODY_ZONE_PRECISE_R_HAND)
			return "dangling thauma"
		if(BODY_ZONE_PRECISE_L_FOOT)
			return "lower miasma"
		if(BODY_ZONE_PRECISE_R_FOOT)
			return "lower miasma"
		if(BODY_ZONE_PRECISE_STOMACH)
			return "guts"
		if(BODY_ZONE_PRECISE_GROIN)
			return "guts"
		if(BODY_ZONE_HEAD)
			return "rotting head"
		if(BODY_ZONE_R_LEG)
			return "guts"
		if(BODY_ZONE_L_LEG)
			return "guts"
		if(BODY_ZONE_R_ARM)
			return "guts"
		if(BODY_ZONE_L_ARM)
			return "guts"
	return ..()

//cacophony
/mob/living/simple_animal/hostile/retaliate/rogue/fiend_lesser/cacophony
	name = "cacophony of thauma"
	icon_state = "cacophony"
	icon_living = "cacophony"
	icon_dead = "cacophony"
	turns_per_move = 5
	health = 195
	maxHealth = 195
	melee_damage_lower = 55
	melee_damage_upper = 80
	movement_type = GROUND
	pass_flags = null
	STACON = 16
	STASTR = 17
	STASPD = 8
	defprob = 45
	defdrain = 18

/mob/living/simple_animal/hostile/retaliate/rogue/fiend_lesser/cacophony/simple_limb_hit(zone)
	if(!zone)
		return ""
	switch(zone)
		if(BODY_ZONE_PRECISE_R_EYE)
			return "first face"
		if(BODY_ZONE_PRECISE_L_EYE)
			return "fifth face"
		if(BODY_ZONE_PRECISE_NOSE)
			return "eighth face"
		if(BODY_ZONE_PRECISE_MOUTH)
			return "one of many screaming mouths"
		if(BODY_ZONE_PRECISE_SKULL)
			return "one of many faces"
		if(BODY_ZONE_PRECISE_EARS)
			return "third face"
		if(BODY_ZONE_PRECISE_NECK)
			return "ninth face"
		if(BODY_ZONE_PRECISE_L_HAND)
			return "dangling thauma"
		if(BODY_ZONE_PRECISE_R_HAND)
			return "dangling thauma"
		if(BODY_ZONE_PRECISE_L_FOOT)
			return "one of many crying mouths"
		if(BODY_ZONE_PRECISE_R_FOOT)
			return "lower miasma"
		if(BODY_ZONE_PRECISE_STOMACH)
			return "guts"
		if(BODY_ZONE_PRECISE_GROIN)
			return "guts"
		if(BODY_ZONE_HEAD)
			return "one of weeping mouths"
		if(BODY_ZONE_R_LEG)
			return "guts"
		if(BODY_ZONE_L_LEG)
			return "guts"
		if(BODY_ZONE_R_ARM)
			return "guts"
		if(BODY_ZONE_L_ARM)
			return "guts"
	return ..()

//elder
/mob/living/simple_animal/hostile/retaliate/rogue/fiend_lesser/elder
	name = "false sage"
	icon_state = "elder"
	icon_living = "elder"
	icon_dead = "elder"
	turns_per_move = 5
	health = 100
	maxHealth = 100
	ranged = 1
	projectiletype = /obj/projectile/magic/aoe/fireball/rogue2
	projectilesound = 'sound/magic/whiteflame.ogg'
	ranged_cooldown_time = 20
	melee_damage_lower = 45
	melee_damage_upper = 70
	movement_type = FLYING
	pass_flags = PASSTABLE|PASSGRILLE
	STACON = 13
	STASTR = 15
	STASPD = 3
	defprob = 45
	defdrain = 18

//charger
/mob/living/simple_animal/hostile/retaliate/rogue/fiend_lesser/charger
	name = "feigned cerbilat"
	icon_state = "charger"
	icon_living = "charger"
	icon_dead = "charger"
	turns_per_move = 5
	health = 300
	maxHealth = 300
	melee_damage_lower = 55
	melee_damage_upper = 80
	armor_penetration = 85
	canparry = TRUE
	d_intent = INTENT_PARRY
	movement_type = GROUND
	environment_smash = ENVIRONMENT_SMASH_WALLS
	pass_flags = null
	speed = 0.5
	STACON = 18
	STASTR = 18
	STASPD = 18
	STALUC = 12//Uh oh
	defprob = 15
	defdrain = 30
	limb_destroyer = 1
	attack_sound = 'sound/combat/wooshes/bladed/wooshmed (1).ogg'
	dodge_sound = 'sound/combat/dodge.ogg'
	parry_sound = "bladedmedium"

//shambler
/mob/living/simple_animal/hostile/retaliate/rogue/fiend_lesser/shambler
	name = "broken memory"
	icon_state = "shambler"
	icon_living = "shambler"
	icon_dead = "shambler"
	turns_per_move = 5
	health = 120
	maxHealth = 120
	canparry = TRUE
	d_intent = INTENT_PARRY
	movement_type = GROUND
	pass_flags = null
	speed = 3//sloooowww
	STACON = 18
	STASTR = 18
	STASPD = 18
	defprob = 50
	defdrain = 30

//totem
/mob/living/simple_animal/hostile/retaliate/rogue/fiend_lesser/totem
	name = "pillar of bodies"
	icon_state = "totem"
	icon_living = "totem"
	icon_dead = "totem"
	turns_per_move = 5
	health = 50
	maxHealth = 50
	ranged = 1
	projectiletype = /obj/projectile/magic/aoe/fireball/rogue2
	projectilesound = 'sound/magic/whiteflame.ogg'
	ranged_cooldown_time = 5
	movement_type = GROUND
	STASTR = 20
	STASPD = 0
	defprob = 25
//Totems can't move, just a turret basically
	anchored = TRUE
	turns_per_move = 0
	stop_automated_movement = 1
	wander = 0

//dragon
/mob/living/simple_animal/hostile/retaliate/rogue/fiend_lesser/dragon
	name = "forgotten beast"
	icon_state = "dragon"
	icon_living = "dragon"
	icon_dead = "dragon"
	health = 620
	maxHealth = 620
	melee_damage_lower = 55
	melee_damage_upper = 80
	armor_penetration = 95
	canparry = TRUE
	d_intent = INTENT_PARRY
	movement_type = GROUND
	pass_flags = null
	speed = 2//sloooowww
	STACON = 18
	STASTR = 19
	STASPD = 18
	STALUC = 12//Uh oh
	defprob = 5
	defdrain = 30
	limb_destroyer = 1
	attack_sound = 'sound/combat/wooshes/bladed/wooshmed (1).ogg'
	dodge_sound = 'sound/combat/dodge.ogg'
	parry_sound = "bladedmedium"
