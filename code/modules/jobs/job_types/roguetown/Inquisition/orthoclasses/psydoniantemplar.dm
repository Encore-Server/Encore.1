/datum/advclass/katholikostemplar // A templar, but for the Inquisition
	name = "Adjudicator"
	tutorial = "You are the strong arm of the Inquisition. You serve as a Templar under the local Inquisitor to forward the goals of the Katholikos."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/katholikostemplar
	category_tags = list(CTAG_INQUISITION)
	cmode_music = 'sound/music/combat_templar.ogg'

/datum/outfit/job/roguetown/katholikostemplar/pre_equip(mob/living/carbon/human/H)
	..()
	has_loadout = TRUE
	wrists = /obj/item/clothing/neck/roguetown/psicross/silver
	cloak = /obj/item/clothing/cloak/all_aspect
	backr = /obj/item/rogueweapon/shield/tower/metal
	gloves = /obj/item/clothing/gloves/roguetown/chain/all_aspect
	neck = /obj/item/clothing/neck/roguetown/chaincoif/silver
	pants = /obj/item/clothing/under/roguetown/chainlegs/silver
	backl = /obj/item/storage/backpack/rogue/satchel/black
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
	shoes = /obj/item/clothing/shoes/roguetown/psydonboots
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/fluted/silver
	head = /obj/item/clothing/head/roguetown/helmet/heavy/all_aspect/silver
	belt = /obj/item/storage/belt/rogue/leather/black
	beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
	id = /obj/item/clothing/ring/silver
	backpack_contents = list(/obj/item/storage/keyring/puritan = 1)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("constitution", 2)
		H.change_stat("endurance", 3)
		
		ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)

		H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
		var/datum/devotion/C = new /datum/devotion(H, H.patron)
		C.passive_devotion_gain += 0.1
		C.grant_spells_templar(H)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/call_to_arms) // All-Aspect Templar equivalent role, automatically get this.
		H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)


/datum/outfit/job/roguetown/katholikostemplar/choose_loadout(mob/living/carbon/human/H)
	. = ..()
	var/weapons = list("Axe","Longsword","Billhook","Flail","Mace","Claymore")
	var/weapon_choice = input(H,"Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	switch(weapon_choice)
		if("Axe")
			H.put_in_hands(new /obj/item/rogueweapon/stoneaxe/silver(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/axes, 1, TRUE)
		if("Longsword")
			H.put_in_hands(new /obj/item/rogueweapon/sword/long/silver(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		if("Billhook")
			H.put_in_hands(new /obj/item/rogueweapon/spear/billhook/silver(H), TRUE)
			H.put_in_hands(new /obj/item/gwstrap(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
		if("Flail")
			H.put_in_hands(new /obj/item/rogueweapon/flail/silver(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
		if("Mace")
			H.put_in_hands(new /obj/item/rogueweapon/mace/silver(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
		if("Claymore")
			H.put_in_hands(new /obj/item/rogueweapon/greatsword/silver(H), TRUE)
			H.put_in_hands(new /obj/item/gwstrap(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
