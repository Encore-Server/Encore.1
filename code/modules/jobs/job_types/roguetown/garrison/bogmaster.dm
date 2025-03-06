/datum/job/roguetown/bogmaster
	title = "Warden Sergeant"
	flag = BOGMASTER
	department_flag = GARRISON
	faction = "Station"
	total_positions = 1//It's kinda like a head of staff. Or at least a sub-head-of-staff. Probably don't want 10 thousand of them
	spawn_positions = 99
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	tutorial = "You are the senior officer among the Wardens, the stewards that hold vigil over the Domotan Wilds. You answer to the Marshall. Shape your ranger levy into a force to be reckoned with, or simply make sure they manage to survive an ambush from the wildlife."
	display_order = JDO_BOGMASTER
	whitelist_req = TRUE

	spells = list(/obj/effect/proc_holder/spell/self/convertrole/bog)
	outfit = /datum/outfit/job/roguetown/bogmaster

	give_bank_account = 35
	min_pq = -999
	max_pq = null
	cmode_music = 'sound/music/combat_bog.ogg'

/datum/outfit/job/roguetown/bogmaster/pre_equip(mob/living/carbon/human/H)
	. = ..()
	head = /obj/item/clothing/head/roguetown/helmet/kettle
	pants = /obj/item/clothing/under/roguetown/chainlegs
	mask = /obj/item/clothing/mask/rogue/wildguard
	cloak = /obj/item/clothing/cloak/raincloak/furcloak/woad
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	gloves = /obj/item/clothing/gloves/roguetown/chain
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	beltr = /obj/item/rogueweapon/stoneaxe/woodcut/wardenpick
	belt = /obj/item/storage/belt/rogue/leather
	id = /obj/item/scomstone/bad
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/rogueweapon/huntingknife = 1, /obj/item/signal_horn = 1, /obj/item/flashlight/flare/torch/lantern = 1, /obj/item/storage/keyring/guard = 1)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axes, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/shields, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/tracking, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)	//Peasent levy, so some skill
		H.mind.adjust_skillrank(/datum/skill/labor/farming, 2, TRUE)		//Peasent levy, so some skill
		H.mind.adjust_skillrank(/datum/skill/craft/tanning, 2, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("perception", 2)
		H.change_stat("constitution", 1)
		H.change_stat("endurance", 2)
		H.change_stat("speed", 1)
	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
	H.verbs |= /mob/proc/haltyell
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)

/obj/effect/proc_holder/spell/self/convertrole/bog
	name = "Recruit Warden"
	new_role = "Warden"
	overlay_state = "recruit_bog"
	recruitment_faction = "Warden"
	recruitment_message = "Serve the wilds, %RECRUIT!"
	accept_message = "FOR THE WARDENS!"
	refuse_message = "I refuse."

/obj/effect/proc_holder/spell/self/convertrole/bog/convert(mob/living/carbon/human/recruit, mob/living/carbon/human/recruiter)
	. = ..()
	if(!.)
		return
	recruit.verbs |= /mob/proc/haltyell

/datum/outfit/job/roguetown/bogmaster/choose_loadout(mob/living/carbon/human/H)
	. = ..()
	var/weapons = list("Crossbow", "Longbow", "Tower Shield")
	var/weapon_choice = input(H,"Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	switch(weapon_choice)
		if("Crossbow")
			H.put_in_hands(new /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow(H), FALSE)
			H.put_in_hands(new /obj/item/quiver/bolts(H), FALSE)
			H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 1, TRUE)
		if("Longbow")
			H.put_in_hands(new /obj/item/gun/ballistic/revolver/grenadelauncher/bow/longbow(H), FALSE)
			H.put_in_hands(new /obj/item/quiver/arrows(H), FALSE)
			H.mind.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
		if("Tower Shield")
			H.put_in_hands(new /obj/item/rogueweapon/shield/tower(H), FALSE)
			H.mind.adjust_skillrank(/datum/skill/combat/shields, 1, TRUE)
