/datum/job/roguetown/bogguardsman
	title = "Warden"
	flag = BOGGUARD
	department_flag = GARRISON
	faction = "Station"
	total_positions = 99//Uncapped basically
	spawn_positions = 99
	selection_color = JCOLOR_SOLDIER
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	tutorial = "Typically a denizen of the sparsely populated Domotan wilds, you volunteered up with the wardens--a group of ranger types who keep a vigil over the untamed wilds."
	advclass_cat_rolls = list(CTAG_WARDEN = 20)
	display_order = JDO_TOWNGUARD
	whitelist_req = TRUE
	outfit = /datum/outfit/job/roguetown/bogguardsman
	give_bank_account = 16
	min_pq = -999
	max_pq = null
	round_contrib_points = 2

	cmode_music = 'sound/music/combat_bog.ogg'

/datum/outfit/job/roguetown/bogguardsman
	has_loadout = TRUE

/datum/job/roguetown/bogguardsman/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

/datum/advclass/bogguardsman/hawk
	name = "Hawk Warden"
	tutorial = "You are a Hawk Warden, a sharpshooter who excells with ranged weaponry. Where your comrades prefer to fight up close and personal or toy with the idea of being marksmans, you have dedicated yourself to ranged combat. Though trained in all the various weapons offered to you by the Wardens to some extent, a Ranged weapon of some kind feels most comfortable in your hands."
	outfit = /datum/outfit/job/roguetown/bogguardsman/hawk

	category_tags = list(CTAG_WARDEN)

/*Design philosophy: "Jack of all tades, master of.. few" - Peasent, so bow, axe, and polearm skill. Knows most combat skills, but other than those not great with them.
Also given some non-combat skills that a peasent would have, just to support themselves, but not anything to replace soilsons with.*/
/datum/outfit/job/roguetown/bogguardsman/hawk/pre_equip(mob/living/carbon/human/H)
	. = ..()
	head = /obj/item/clothing/head/roguetown/helmet/kettle
	armor = /obj/item/clothing/suit/roguetown/armor/leather/hide
	cloak = /obj/item/clothing/cloak/raincloak/furcloak/woad
	mask = /obj/item/clothing/mask/rogue/wildguard
	neck = /obj/item/clothing/neck/roguetown/coif
	gloves = /obj/item/clothing/gloves/roguetown/leather
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
	pants = /obj/item/clothing/under/roguetown/trou/leather
	id = /obj/item/scomstone/bad
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/rogueweapon/stoneaxe/woodcut/wardenpick
	backl = /obj/item/storage/backpack/rogue/satchel
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger = 1, /obj/item/signal_horn = 1, /obj/item/flashlight/flare/torch/lantern = 1, /obj/item/storage/keyring/guard = 1)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axes, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/shields, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/tracking, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)	//Peasent levy, so some skill
		H.mind.adjust_skillrank(/datum/skill/labor/farming, 2, TRUE)		//Peasent levy, so some skill
		H.mind.adjust_skillrank(/datum/skill/craft/tanning, 2, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("perception", 3)
		H.change_stat("constitution", 1)
		H.change_stat("endurance", 2)
		H.change_stat("speed", 2)
		H.verbs |= /mob/proc/haltyell
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

/datum/outfit/job/roguetown/bogguardsman/hawk/choose_loadout(mob/living/carbon/human/H)
	. = ..()
	var/weapons = list("Crossbow", "Longbow")
	var/weapon_choice = input(H,"Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	switch(weapon_choice)
		if("Crossbow")
			H.put_in_hands(new /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow(H), TRUE)
			H.put_in_hands(new /obj/item/quiver/bolts(H), TRUE)
		if("Longbow")
			H.put_in_hands(new /obj/item/gun/ballistic/revolver/grenadelauncher/bow/longbow(H), TRUE)
			H.put_in_hands(new /obj/item/quiver/arrows(H), TRUE)

/datum/advclass/bogguardsman/wolf
	name = "Wolf Warden"
	tutorial = "You are a Wolf Warden, a jack-of-all-trades. Versatility is your creed. You never quite could settle on a speciality when it came to the tools the Wardens offered you, and while you may not be as specialised as some of your other comrades, you prefer to think of yourself as always prepared. You find balance between Ranged and Melee fighting styles."
	outfit = /datum/outfit/job/roguetown/bogguardsman/wolf

	category_tags = list(CTAG_WARDEN)

/datum/outfit/job/roguetown/bogguardsman/wolf/pre_equip(mob/living/carbon/human/H)
	. = ..()
	head = /obj/item/clothing/head/roguetown/helmet/kettle
	armor = /obj/item/clothing/suit/roguetown/armor/leather/studded
	cloak = /obj/item/clothing/cloak/raincloak/furcloak/woad
	mask = /obj/item/clothing/mask/rogue/wildguard
	neck = /obj/item/clothing/neck/roguetown/chaincoif/iron
	gloves = /obj/item/clothing/gloves/roguetown/leather
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
	pants = /obj/item/clothing/under/roguetown/trou/leather
	id = /obj/item/scomstone/bad
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/rogueweapon/stoneaxe/woodcut/wardenpick
	backl = /obj/item/storage/backpack/rogue/satchel
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	backpack_contents = list(/obj/item/rogueweapon/huntingknife = 1, /obj/item/signal_horn = 1, /obj/item/flashlight/flare/torch/lantern = 1, /obj/item/storage/keyring/guard = 1)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axes, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/shields, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/tracking, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)	//Peasent levy, so some skill
		H.mind.adjust_skillrank(/datum/skill/labor/farming, 2, TRUE)		//Peasent levy, so some skill
		H.mind.adjust_skillrank(/datum/skill/craft/tanning, 2, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("perception", 2)
		H.change_stat("constitution", 1)
		H.change_stat("endurance", 2)
		H.change_stat("speed", 1)
		H.verbs |= /mob/proc/haltyell
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

/datum/outfit/job/roguetown/bogguardsman/wolf/choose_loadout(mob/living/carbon/human/H)
	. = ..()
	var/weapons = list("Crossbow", "Recurve Bow", "Buckler", "Spear")
	var/weapon_choice = input(H,"Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	switch(weapon_choice)
		if("Crossbow")
			H.put_in_hands(new /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow(H), TRUE)
			H.put_in_hands(new /obj/item/quiver/bolts(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 1, TRUE)
		if("Recurve Bow")
			H.put_in_hands(new /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve(H), TRUE)
			H.put_in_hands(new /obj/item/quiver/arrows(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
		if("Buckler")
			H.put_in_hands(new /obj/item/rogueweapon/shield/buckler(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/shields, 1, TRUE)
		if("Spear")
			H.put_in_hands(new /obj/item/rogueweapon/spear(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)

/datum/advclass/bogguardsman/bear
	name = "Bear Warden"
	tutorial = "You are a Bear Warden, a ferocious fighting force. Where your comrades prefer to shoot from a distance or toy with the idea of melee combat, you have dedicated yourself to fighting up-close and personal. While trained in all the weapons offered by the Wardens to an extent, you're most comfortable with a Melee weapon in your hands."
	outfit = /datum/outfit/job/roguetown/bogguardsman/bear

	category_tags = list(CTAG_WARDEN)

/datum/outfit/job/roguetown/bogguardsman/bear/pre_equip(mob/living/carbon/human/H)
	. = ..()
	head = /obj/item/clothing/head/roguetown/helmet/kettle
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
	cloak = /obj/item/clothing/cloak/raincloak/furcloak/woad
	mask = /obj/item/clothing/mask/rogue/wildguard
	neck = /obj/item/clothing/neck/roguetown/gorget
	gloves = /obj/item/clothing/gloves/roguetown/chain/iron
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
	pants = /obj/item/clothing/under/roguetown/chainlegs/iron
	id = /obj/item/scomstone/bad
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/rogueweapon/stoneaxe/woodcut/wardenpick
	backl = /obj/item/storage/backpack/rogue/satchel
	backr = /obj/item/rogueweapon/shield/buckler
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	backpack_contents = list(/obj/item/rogueweapon/huntingknife = 1, /obj/item/signal_horn = 1, /obj/item/flashlight/flare/torch/lantern = 1, /obj/item/storage/keyring/guard = 1)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axes, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/tracking, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)	//Peasent levy, so some skill
		H.mind.adjust_skillrank(/datum/skill/labor/farming, 2, TRUE)		//Peasent levy, so some skill
		H.mind.adjust_skillrank(/datum/skill/craft/tanning, 2, TRUE)
		H.change_stat("strength", 3)
		H.change_stat("perception", 1)
		H.change_stat("constitution", 1)
		H.change_stat("endurance", 2)
		H.change_stat("speed", 1)
		H.verbs |= /mob/proc/haltyell
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

/datum/outfit/job/roguetown/bogguardsman/bear/choose_loadout(mob/living/carbon/human/H)
	. = ..()
	var/weapons = list("Tower Shield", "Iron Messer", "Flail", "Cudgel", "Spear")
	var/weapon_choice = input(H,"Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	switch(weapon_choice)
		if("Tower Shield")
			H.put_in_hands(new /obj/item/rogueweapon/shield/tower(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/shields, 1, TRUE)
		if("Iron Messer")
			H.put_in_hands(new /obj/item/rogueweapon/sword/iron/messer(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		if("Flail")
			H.put_in_hands(new /obj/item/rogueweapon/flail(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
		if("Cudgel")
			H.put_in_hands(new /obj/item/rogueweapon/mace/cudgel(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
		if("Spear")
			H.put_in_hands(new /obj/item/rogueweapon/spear(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)

/datum/advclass/bogguardsman/panther
	name = "Panther Warden"
	tutorial = "You are a Panther Warden, adept at skulking and keeping to the shadows. Yours is the unit most often filled by former criminals or thieves pressed into service for their crimes, but not all Panthers are footpads. Where your comrades prefer to fight up close or from afar with a bow, you're an opportunist. Though trained in all the various weapons offered to you by the Wardens to some extent, you're best at sneaking about unseen with a blade or bow."
	outfit = /datum/outfit/job/roguetown/bogguardsman/panther

	category_tags = list(CTAG_WARDEN)

/*Design philosophy: "Jack of all tades, master of.. few" - Peasent, so bow, axe, and polearm skill. Knows most combat skills, but other than those not great with them.
Also given some non-combat skills that a peasent would have, just to support themselves, but not anything to replace soilsons with.*/
/datum/outfit/job/roguetown/bogguardsman/panther/pre_equip(mob/living/carbon/human/H)
	. = ..()
	head = /obj/item/clothing/head/roguetown/helmet/kettle
	armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy/belted
	cloak = /obj/item/clothing/cloak/raincloak/furcloak/woad
	mask = /obj/item/clothing/mask/rogue/wildguard
	neck = /obj/item/clothing/neck/roguetown/coif
	gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
	id = /obj/item/scomstone/bad
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/rogueweapon/stoneaxe/woodcut/wardenpick
	backl = /obj/item/storage/backpack/rogue/satchel
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	backpack_contents = list(/obj/item/lockpickring/mundane = 1, /obj/item/signal_horn = 1, /obj/item/flashlight/flare/torch/lantern = 1, /obj/item/storage/keyring/guard = 1)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/shields, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/tracking, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)	//Peasent levy, so some skill
		H.mind.adjust_skillrank(/datum/skill/labor/farming, 2, TRUE)		//Peasent levy, so some skill
		H.mind.adjust_skillrank(/datum/skill/craft/tanning, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/stealing, 4, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("perception", 3)
		H.change_stat("constitution", 1)
		H.change_stat("endurance", 2)
		H.change_stat("speed", 2)
		H.verbs |= /mob/proc/haltyell
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

/datum/outfit/job/roguetown/bogguardsman/panther/choose_loadout(mob/living/carbon/human/H)
	. = ..()
	var/weapons = list("Crossbow", "Recurve Bow", "Twin Daggers")
	var/weapon_choice = input(H,"Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	switch(weapon_choice)
		if("Crossbow")
			H.put_in_hands(new /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow(H), TRUE)
			H.put_in_hands(new /obj/item/quiver/bolts(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 1, TRUE)
		if("Recurve Bow")
			H.put_in_hands(new /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve(H), TRUE)
			H.put_in_hands(new /obj/item/quiver/arrows(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
		if("Twin Daggers")
			H.put_in_hands(new /obj/item/rogueweapon/huntingknife/idagger/steel/special(H), TRUE)
			H.put_in_hands(new /obj/item/rogueweapon/huntingknife/idagger/steel/parrying(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
