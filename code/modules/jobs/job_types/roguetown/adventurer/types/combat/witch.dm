/datum/advclass/witch // All have decent magic but pretty much zero combat stats. Support role. 
	name = "Witch"
	tutorial = "Witches are experts in alchemy and the occult, often serving their preferred area through non-traditional ways."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_TOLERATED_UP
	vampcompat = FALSE
	outfit = /datum/outfit/job/roguetown/adventurer/witch
	category_tags = list(CTAG_ADVENTURER)

/datum/outfit/job/roguetown/adventurer/witch
	allowed_patrons = ALL_PATRONS

/datum/outfit/job/roguetown/adventurer/witch/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.patron?.amulet)
		neck = H.patron.amulet
	if(istype(H.patron, /datum/patron/heretic/devil))
		H.cmode_music = 'sound/music/combat_cult.ogg'
		neck = /obj/item/roguekey/inhumen
	
	// CLASS ARCHETYPES
	H.adjust_blindness(-3)
	var/classes = list("Wise Woman","Ritualist", "Heretic")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes
	switch(classchoice)
		if("Wise Woman") // Healing subclass. Better alchemy/cooking/medicine, worse magic stats.
			H.set_blindness(0)
			to_chat(H, span_warning("You are a self-taught healer, tending to the sick who are unable to afford better."))
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/alchemy, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/cooking, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/ritual, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/arcane, 2, TRUE)
			H.change_stat("intelligence", 2) // Higher intelligence but poor combat stats.
			H.change_stat("perception", 1)
			H.change_stat("strength", -1)
			H.change_stat("constitution", 2)
			H.change_stat("endurance", -1)
		if("Ritualist")
			H.set_blindness(0)
			to_chat(H, span_warning("You are a witch specialising in rituals. Unfortunately arduous study has left you weak in other areas."))
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/alchemy, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/ritual, 5, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/arcane, 3, TRUE)
			H.change_stat("intelligence", 2)
			H.change_stat("strength", -1)
			H.change_stat("endurance", 2)
			H.mind.adjust_spellpoints(1)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation) 
		if("Heretic") // Religous adjacent character. Better magic, worse everything else
			H.set_blindness(0)
			to_chat(H, span_warning("Whether it be through unsanctioned magic or following a forbidden god, you have been cast out from the church and hunted."))
			H.mind.adjust_skillrank(/datum/skill/magic/ritual, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/arcane, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/alchemy, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/arcane, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/arcane, 3, TRUE)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation) 
			H.change_stat("intelligence", 2)
			H.change_stat("strength", -1)
			H.change_stat("perception", 2)
			H.change_stat("speed", 1) // Lol you're still fucked if attacked
		// HEARTHSTONE ADDITION END


	// HEARTHSTONE ADD: cloistered devout custom outfits
	if (classchoice == "Heretic")
		var/datum/devotion/C = new /datum/devotion(H, H.patron)
		C.passive_devotion_gain += 0.5
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/lesser_heal) //All clerics get miracle
		C.grant_spells(H) // don't give churn as an extra spell to cloistered since they get their patron's full spell list (up to t3)
		START_PROCESSING(SSobj, C)
	else
// HEARTHSTONE ADDITION END
		var/datum/devotion/C = new /datum/devotion(H, H.patron)
		C.passive_devotion_gain += 0.25
		C.grant_spells(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
