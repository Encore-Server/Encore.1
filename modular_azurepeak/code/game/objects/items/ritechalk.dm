/obj/item/ritechalk
	name = "Ritual Chalk"
	icon_state = "chalk"
	desc = "Simple white chalk. A useful tool for rites."
	icon = 'icons/roguetown/misc/rituals.dmi'
	w_class = WEIGHT_CLASS_TINY
	associated_skill = /datum/skill/magic/ritual

/obj/item/ritechalk/attack_self(mob/living/user)
	if(!HAS_TRAIT(user, TRAIT_RITUALIST))
		to_chat(user, span_smallred("I don't know what I'm doing with this..."))
		return

var/ritechoices = list(
	"Rune of Sun" = list(
		"path" = /obj/structure/ritualcircle/astrata,
		"level" = 3
	),
	"Rune of Moon" = list(
		"path" = /obj/structure/ritualcircle/noc,
		"level" = 1
	),
	"Rune of Beasts" = list(
		"path" = /obj/structure/ritualcircle/dendor,
		"level" = 2
	),
	"Rune of Death" = list(
		"path" = /obj/structure/ritualcircle/death,
		"level" = 5
	),
	"Rune of Plague" = list(
		"path" = /obj/structure/ritualcircle/pestra,
		"level" = 3
	),
	"Rune of Love" = list(
		"path" = /obj/structure/ritualcircle/eora,
		"level" = 5
	),
/*	"Rune of War" = list(
		"path" = /obj/structure/ritualcircle/war,
		"level" = 5
	),
	"Rune of Storm" = list(
		"path" = /obj/structure/ritualcircle/abyssor,
		"level" = 6 )

	),
	"Rune of Trickery" = list(
		"path" = /obj/structure/ritualcircle/trickery,
		"level" = 3
*/
)


/obj/item/ritechalk/attack_self(mob/living/user)
	if(!HAS_TRAIT(user, TRAIT_RITUALIST))
		to_chat(user, span_smallred("I don't know what I'm doing with this..."))
		return
	var/ritual_level = user.mind?.get_skill_level(/datum/skill/magic/ritual) || 0
	var/list/available_runes = list()
	for (var/rune_name in ritechoices)
		var/rune_data = ritechoices[rune_name]
		if (rune_data["level"] <= ritual_level)
			available_runes += rune_name

	var/runeselection = input(user, "Which rune shall I inscribe?", src) as null|anything in available_runes
	var/turf/step_turf = get_step(get_turf(user), user.dir)
	switch(runeselection)
		if("Rune of Sun")
			to_chat(user,span_cultsmall("I begin inscribing the rune of cold Radiance...light will guide them."))
			if(do_after(user, 30, src))
				playsound(src, 'sound/foley/scribble.ogg', 40, TRUE)
				new /obj/structure/ritualcircle/astrata(step_turf)
		if("Rune of Moon")
			to_chat(user, span_cultsmall("I begin inscribing the rune of bitter Wisdom"))
			if(do_after(user, 30, src))
				playsound(src, 'sound/foley/scribble.ogg', 40, TRUE)
				new /obj/structure/ritualcircle/noc(step_turf)
		if("Rune of Beasts")
			to_chat(user,span_cultsmall("I begin inscribing the rune of feral Madness...a way to transform others into beasts."))
			if(do_after(user, 30, src))
				playsound(src, 'sound/foley/scribble.ogg', 40, TRUE)
				new /obj/structure/ritualcircle/dendor(step_turf)
		if("Rune of Forge")
			to_chat(user,span_cultsmall("I begin inscribing the rune of Their Craft..."))
			if(do_after(user, 30, src))
				playsound(src, 'sound/foley/scribble.ogg', 40, TRUE)
				new /obj/structure/ritualcircle/malum(step_turf)
		if("Rune of Trickery")
			to_chat(user,span_cultsmall("I begin inscribing the rune of quiet Trickery..."))
			if(do_after(user, 30, src))
				playsound(src, 'sound/foley/scribble.ogg', 40, TRUE)
			//	new /obj/structure/ritualcircle/trickery(step_turf)
		if("Rune of Death")
			to_chat(user,span_cultsmall("I begin inscribing the rune of Her Embrace...I will keep them from death's door."))
			if(do_after(user, 30, src))
				playsound(src, 'sound/foley/scribble.ogg', 40, TRUE)
				new /obj/structure/ritualcircle/death(step_turf)
		if("Rune of Plague")
			to_chat(user,span_cultsmall("I begin inscribing the rune of Her Plague...rot brings cleansing."))
			if(do_after(user, 30, src))
				playsound(src, 'sound/foley/scribble.ogg', 40, TRUE)
				new /obj/structure/ritualcircle/pestra(step_turf)
		if("Rune of Love")
			to_chat(user,span_cultsmall("I begin inscribing the rune of Her Love...I will change those who will not change themselves"))
			if(do_after(user, 30, src))
				playsound(src, 'sound/foley/scribble.ogg', 40, TRUE)
				new /obj/structure/ritualcircle/eora(step_turf)
		if("Rune of War")
			to_chat(user,span_cultsmall("I begin inscribing the rune of His Prowess..."))
			if(do_after(user, 30, src))
				playsound(src, 'sound/foley/scribble.ogg', 40, TRUE)
	//			new /obj/structure/ritualcircle/war(step_turf)
		if("Rune of Storm")
			to_chat(user,span_cultsmall("I begin inscribing the rune of His Storm..."))
			if(do_after(user, 30, src))
				playsound(src, 'sound/foley/scribble.ogg', 40, TRUE)
				new /obj/structure/ritualcircle/abyssor(step_turf)
	/*	if("Rune of ZIZO")
			to_chat(user,span_cultsmall("I begin inscribing the rune of Her Knowledge..."))
			if(do_after(user, 30, src))
				playsound(src, 'sound/foley/scribble.ogg', 40, TRUE)
				new /obj/structure/ritualcircle/zizo(step_turf) */
