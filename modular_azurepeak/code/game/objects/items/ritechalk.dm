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
		"level" = 6
	),
	"Rune of Moon" = list(
		"path" = /obj/structure/ritualcircle/noc,
		"level" = 1
	),
	"Rune of Beasts" = list(
		"path" = /obj/structure/ritualcircle/dendor,
		"level" = 2
	),
	"Rune of Forge" = list(
		"path" = /obj/structure/ritualcircle/malum,
		"level" = 2
	),
	"Rune of Trickery" = list(
		"path" = /obj/structure/ritualcircle/xylix,
		"level" = 3
	),
	"Rune of Death" = list(
		"path" = /obj/structure/ritualcircle/death,
		"level" = 3
	),
	"Rune of Plague" = list(
		"path" = /obj/structure/ritualcircle/pestra,
		"level" = 4
	),
	"Rune of Love" = list(
		"path" = /obj/structure/ritualcircle/eora,
		"level" = 4
	),
/*	"Rune of War" = list(
		"path" = /obj/structure/ritualcircle/war,
		"level" = 5
	),
	"Rune of Storm" = list(
		"path" = /obj/structure/ritualcircle/abyssor,
		"level" = 6
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
			to_chat(user,span_cultsmall("I begin inscribing the rune of cold Radiance..."))
			if(do_after(user, 30, src))
				playsound(src, 'sound/foley/scribble.ogg', 40, TRUE)
				new /obj/structure/ritualcircle/astrata(step_turf)
		if("Rune of Moon")
			to_chat(user, span_cultsmall("I begin inscribing the rune of bitter Wisdom"))
			if(do_after(user, 30, src))
				playsound(src, 'sound/foley/scribble.ogg', 40, TRUE)
				new /obj/structure/ritualcircle/noc(step_turf)
		if("Rune of Beasts")
			to_chat(user,span_cultsmall("I begin inscribing the rune of feral Madness"))
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
				new /obj/structure/ritualcircle/xylix(step_turf)
		if("Rune of Death")
			to_chat(user,span_cultsmall("I begin inscribing the rune of Her Embrace..."))
			if(do_after(user, 30, src))
				playsound(src, 'sound/foley/scribble.ogg', 40, TRUE)
				new /obj/structure/ritualcircle/death(step_turf)
		if("Rune of Plague")
			to_chat(user,span_cultsmall("I begin inscribing the rune of Her Plague..."))
			if(do_after(user, 30, src))
				playsound(src, 'sound/foley/scribble.ogg', 40, TRUE)
				new /obj/structure/ritualcircle/pestra(step_turf)
		if("Rune of Love")
			to_chat(user,span_cultsmall("I begin inscribing the rune of Her Love..."))
			if(do_after(user, 30, src))
				playsound(src, 'sound/foley/scribble.ogg', 40, TRUE)
				new /obj/structure/ritualcircle/eora(step_turf)
/*		if("Rune of War")
			to_chat(user,span_cultsmall("I begin inscribing the rune of His Prowess..."))
			if(do_after(user, 30, src))
				playsound(src, 'sound/foley/scribble.ogg', 40, TRUE)
				new /obj/structure/ritualcircle/war(step_turf) */
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
