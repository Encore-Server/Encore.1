/mob/living/simple_animal/hostile/retaliate/rogue/creacher/werewolf
	name = "werewolf"
	desc = ""
	icon = 'icons/roguetown/mob/monster/werewolf.dmi'
	icon_state = "wwolf_m"
	icon_living = "wwolf_m"
	icon_dead = "wwolf_m"
	emote_hear = null
	speak_emote = null
	emote_see = null
	gender = MALE
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	speak_chance = 80
	move_to_delay = 3
	turns_per_move = 5
	vision_range = 5
	aggro_vision_range = 3
	see_in_dark = 10
	maxHealth = 255
	health = 255
	aggressive = 1
	melee_damage_lower = 60
	melee_damage_upper = 80
	footstep_type = FOOTSTEP_MOB_HEAVY
	pooptype = null
	STASTR = 20
	STAEND = 20
	STASPD = 20
	obj_damage = 20
	environment_smash = ENVIRONMENT_SMASH_WALLS
	attack_sound = BLADEWOOSH_LARGE
	dextrous = TRUE
	held_items = list(null, null)
	retreat_distance = 0
	minimum_distance = 0
	defprob = 25
	deaggroprob = 0
	defdrain = 10
	food = 0
	dodgetime = 0
	food_type = list(/obj/item/reagent_containers/food/snacks/rogue/meat, /obj/item/bodypart, /obj/item/organ)
	base_intents = list(INTENT_HELP, INTENT_GRAB, /datum/intent/simple/claw)
	faction = list("wolves")
	attack_sound = list('sound/vo/mobs/vw/attack (1).ogg','sound/vo/mobs/vw/attack (2).ogg','sound/vo/mobs/vw/attack (3).ogg','sound/vo/mobs/vw/attack (4).ogg')
	robust_searching = TRUE
	footstep_type = FOOTSTEP_MOB_HEAVY
	retreat_health = 0
	//stat_attack = UNCONSCIOUS
	

/mob/living/simple_animal/hostile/retaliate/rogue/creacher/werewolf/Initialize()
	. = ..()
	regenerate_icons()
	ADD_TRAIT(src, TRAIT_SIMPLE_WOUNDS, TRAIT_GENERIC)*/

/mob/living/simple_animal/hostile/retaliate/rogue/creacher/werewolf/death(gibbed)
	..()
	update_icon()

/mob/living/simple_animal/hostile/retaliate/rogue/creacher/werewolf/taunted(mob/user)
	emote("aggro")
	Retaliate()
	GiveTarget(user)
	return

/mob/living/simple_animal/hostile/retaliate/rogue/creacher/werewolf/Life()
	..()
	if(pulledby)
		Retaliate()
		GiveTarget(pulledby)

/mob/living/simple_animal/hostile/retaliate/rogue/creacher/werewolf/get_sound(input)
	switch(input)
		if("aggro")
			return pick('sound/vo/mobs/vw/aggro (1).ogg','sound/vo/mobs/vw/aggro (2).ogg')
		if("pain")
			return pick('sound/vo/mobs/vw/pain (1).ogg','sound/vo/mobs/vw/pain (2).ogg','sound/vo/mobs/vw/pain (3).ogg')
		if("death")
			return pick('sound/vo/mobs/vw/death (1).ogg','sound/vo/mobs/vw/death (2).ogg','sound/vo/mobs/vw/death (3).ogg','sound/vo/mobs/vw/death (4).ogg','sound/vo/mobs/vw/death (5).ogg')
		if("idle")
			return pick('sound/vo/mobs/vw/idle (1).ogg','sound/vo/mobs/vw/idle (2).ogg','sound/vo/mobs/vw/idle (3).ogg','sound/vo/mobs/vw/idle (4).ogg')
		if("cidle")
			return pick('sound/vo/mobs/vw/bark (1).ogg','sound/vo/mobs/vw/bark (2).ogg','sound/vo/mobs/vw/bark (3).ogg','sound/vo/mobs/vw/bark (4).ogg','sound/vo/mobs/vw/bark (5).ogg','sound/vo/mobs/vw/bark (6).ogg','sound/vo/mobs/vw/bark (7).ogg')


/mob/living/simple_animal/hostile/retaliate/rogue/bogtroll/simple_limb_hit(zone)
	if(!zone)
		return ""
	switch(zone)
		if(BODY_ZONE_PRECISE_R_EYE)
			return "head"
		if(BODY_ZONE_PRECISE_L_EYE)
			return "head"
		if(BODY_ZONE_PRECISE_NOSE)
			return "nose"
		if(BODY_ZONE_PRECISE_MOUTH)
			return "mouth"
		if(BODY_ZONE_PRECISE_SKULL)
			return "head"
		if(BODY_ZONE_PRECISE_EARS)
			return "head"
		if(BODY_ZONE_PRECISE_NECK)
			return "neck"
		if(BODY_ZONE_PRECISE_L_HAND)
			return "foreleg"
		if(BODY_ZONE_PRECISE_R_HAND)
			return "foreleg"
		if(BODY_ZONE_PRECISE_L_FOOT)
			return "leg"
		if(BODY_ZONE_PRECISE_R_FOOT)
			return "leg"
		if(BODY_ZONE_PRECISE_STOMACH)
			return "stomach"
		if(BODY_ZONE_PRECISE_GROIN)
			return "tail"
		if(BODY_ZONE_HEAD)
			return "head"
		if(BODY_ZONE_R_LEG)
			return "leg"
		if(BODY_ZONE_L_LEG)
			return "leg"
		if(BODY_ZONE_R_ARM)
			return "foreleg"
		if(BODY_ZONE_L_ARM)
			return "foreleg"
	return ..()
