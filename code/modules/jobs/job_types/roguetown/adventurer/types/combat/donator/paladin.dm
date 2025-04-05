//shield flail or longsword, tief can be this with red cross

/datum/advclass/paladin
	name = "Paladin"
	tutorial = "Paladins are holy warriors who have taken sacred vows to uphold justice and righteousness. Often, they were promised redemption for past sins if they crusaded in the name of the gods."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_TOLERATED_UP
	outfit = /datum/outfit/job/roguetown/adventurer/paladin
	traits_applied = list(TRAIT_HEAVYARMOR)
	category_tags = list(CTAG_ADVENTURER)

/datum/outfit/job/roguetown/adventurer/paladin
	allowed_patrons = ALL_PATRONS

/datum/outfit/job/roguetown/adventurer/paladin/pre_equip(mob/living/carbon/human/H)
	..()
	cloak = /obj/item/clothing/cloak/tabard/crusader
	if(H.patron?.amulet)
		neck = H.patron.amulet
	switch(H.patron?.type)
		if(/datum/patron/elemental/visires)
			cloak = /obj/item/clothing/cloak/tabard/crusader/visires
		if(/datum/patron/elemental/gani)
			cloak = /obj/item/clothing/cloak/tabard/crusader/gani
		if(/datum/patron/elemental/mjallidhorn)
			cloak = /obj/item/clothing/cloak/tabard/crusader/mjallidhorn
		if(/datum/patron/elemental/akan)
			cloak = /obj/item/clothing/cloak/tabard/crusader/akan
		if(/datum/patron/all_aspect)
			cloak = /obj/item/clothing/cloak/tabard/crusader/all_aspect
		if(/datum/patron/heretic/devil) 
			H.cmode_music = 'sound/music/combat_cult.ogg'
			neck = /obj/item/roguekey/inhumen

	H.adjust_blindness(-3)
	var/classes = list("Paladin","Battle Master",)
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)

		if("Paladin")
			to_chat(src, span_warning("Paladins are holy warriors who have taken sacred vows to uphold justice and righteousness. Often, they were promised redemption for past sins if they crusaded in the name of the gods."))
			H.set_blindness(0) // No introduction text due to there being no real difference in Paladin archetypes for now.
			to_chat(H, span_warning("You are a paladin."))
			H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
			H.change_stat("perception", 1)
			H.change_stat("strength", 2)
			H.change_stat("constitution", 2) // Classic paladin is faster then the battle master.
			H.change_stat("endurance", 1)
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/iron
			pants = /obj/item/clothing/under/roguetown/chainlegs/iron
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather
			belt = /obj/item/storage/belt/rogue/leather/steel
			beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
			beltr = /obj/item/rogueweapon/huntingknife
			id = /obj/item/clothing/ring/silver
			backr = /obj/item/rogueweapon/sword/iron
			backl = /obj/item/storage/backpack/rogue/satchel
		if("Battle Master")
			H.set_blindness(0)
			to_chat(H, span_warning("You are a battle-master."))
			H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
			H.change_stat("perception", 1)
			H.change_stat("strength", 2)
			H.change_stat("constitution", 2)
			H.change_stat("endurance", 1)
			H.change_stat("speed", -1)
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/iron
			pants = /obj/item/clothing/under/roguetown/chainlegs/iron
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather
			belt = /obj/item/storage/belt/rogue/leather/steel
			beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
			beltr = /obj/item/rogueweapon/huntingknife
			id = /obj/item/clothing/ring/silver
			backr = /obj/item/rogueweapon/flail
			l_hand = /obj/item/rogueweapon/shield/tower/metal
			backl = /obj/item/storage/backpack/rogue/satchel

	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.passive_devotion_gain += 0.1
	C.grant_spells_templar(H) //Max devotion limit - Paladins are stronger but cannot pray to gain all abilities beyond t1
	if(H.patron?.type == /datum/patron/elemental/gani) // Gani gets two spells, because they're missing out on two extra spells compared to the others
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/slowdown_spell_aoe)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/acidsplash5e)
	if(H.patron?.type == /datum/patron/elemental/mjallidhorn)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/snap_freeze)
	if(H.patron?.type == /datum/patron/elemental/akan) // Akan gets two spells, because they're missing out on two extra spells compared to the others
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/featherfall)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/lightningbolt)
	if(H.patron?.type == /datum/patron/elemental/visires)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/heatmetal)
	if(H.patron?.type == /datum/patron/elemental/iliope)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/mockery)
	if(H.patron?.type == /datum/patron/elemental/golerkanh)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/hammerfall)
	if(H.patron?.type == /datum/patron/all_aspect)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/call_to_arms)
	if(H.patron?.type == /datum/patron/heretic/jealous_god)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/damage_link)
	if(H.patron?.type == /datum/patron/heretic/devil)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/call_to_slaughter)
	if(H.patron?.type == /datum/patron/heretic/otherkind)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/fetch)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
