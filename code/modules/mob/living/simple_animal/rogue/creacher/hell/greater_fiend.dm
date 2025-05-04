//Flying imp
//Fetch spell shooter. Pretty harmless otherwise.
//more than likely going to fetch you into lava
/mob/living/simple_animal/hostile/retaliate/rogue/fiend_greater
	icon = 'icons/roguetown/mob/monster/hell/48x48.dmi'
	name = "impish fiend"
	icon_state = "flapper"
	icon_living = "flapper"
	icon_dead = "flapper"
	pixel_x = -9
	emote_hear = list("cackles obnoxiously!")
	turns_per_move = 2
	move_to_delay = 2
	base_intents = list(/datum/intent/simple/bite)
	faction = list("hell")
	emote_hear = list("laughs to itself!")
	emote_see = list("coughs wetly.", "fumes at nothing.")
	health = 155
	maxHealth = 155
	melee_damage_lower = 15
	melee_damage_upper = 25
	armor_penetration = 95
	ranged = 1
	projectiletype = /obj/projectile/magic/fetch//God's most annoying demon
	projectilesound = 'sound/magic/magnet.ogg'
	ranged_cooldown_time = 50
	see_in_dark = 25
	vision_range = 35
	aggro_vision_range = 35
	mob_biotypes = MOB_SPIRIT
	environment_smash = ENVIRONMENT_SMASH_NONE
	movement_type = FLYING
	resistance_flags = LAVA_PROOF
	pass_flags = PASSTABLE|PASSGRILLE
	retreat_distance = 6
	minimum_distance = 4
	food_type = list(/obj/item/organ)
	footstep_type = null
	pooptype = null
	STACON = 14
	STASTR = 15
	STASPD = 11
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

/mob/living/simple_animal/hostile/retaliate/rogue/fiend_greater/Initialize()
	. = ..()
	set_light(2, 2, "#c0523f")
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

/mob/living/simple_animal/hostile/retaliate/rogue/fiend_greater/get_sound(input)
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

/mob/living/simple_animal/hostile/retaliate/rogue/fiend_greater/taunted(mob/user)
	Retaliate()
	GiveTarget(user)
	return

/mob/living/simple_animal/hostile/retaliate/rogue/fiend_greater/Life()
	..()
	if(pulledby)
		Retaliate()
		GiveTarget(pulledby)

/mob/living/simple_animal/hostile/retaliate/rogue/fiend_greater/electrocute_act(shock_damage, source, siemens_coeff = 1, flags = NONE)
	return FALSE

//Fire dancer
//Absolutely brutal rapidfire arrows
/mob/living/simple_animal/hostile/retaliate/rogue/fiend_greater/fire_dancer
	name = "infernal dancer"
	icon_state = "dancer"
	icon_living = "dancer"
	icon_dead = "dancer"
	emote_hear = list("twirls!")
	gender = FEMALE
	speed = 0.5
	turns_per_move = 5
	move_to_delay = 1
	base_intents = list(/datum/intent/unarmed/claw)
	emote_hear = list("whips its wiry tail.")
	emote_see = list("bobs upon its feet.", "hisses.")
	health = 255
	maxHealth = 255
	melee_damage_lower = 35
	melee_damage_upper = 55
	ranged = 1
	projectiletype = /obj/projectile/bullet/reusable/bolt//for armor piercing effect
	projectilesound = 'sound/combat/wooshes/whip_crack3.ogg'
	ranged_cooldown_time = 7
	movement_type = GROUND
	resistance_flags = LAVA_PROOF
	pass_flags = 0
	retreat_distance = 6
	minimum_distance = 3
	STACON = 16
	STASTR = 16
	STASPD = 15
	deaggroprob = 0
	defprob = 35
	defdrain = 13
	retreat_health = 254
	food = 0
	attack_sound = list('sound/combat/hits/bladed/largeslash (1).ogg','sound/combat/hits/bladed/largeslash (2).ogg','sound/combat/hits/bladed/largeslash (3).ogg')

//Fire dancer
//With more spice
/mob/living/simple_animal/hostile/retaliate/rogue/fiend_greater/fire_dancer/pyro
	name = "crazed infernal dancer"
	health = 125//These things are extremely brutal. May as well cut people some slack
	maxHealth = 125
	projectiletype = /obj/item/ammo_casing/caseless/rogue/bolt/pyro//lmao
