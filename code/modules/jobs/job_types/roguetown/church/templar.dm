//shield flail or longsword, tief can be this with red cross	

/datum/job/roguetown/templar
	title = "Templar"
	department_flag = CHURCHMEN
	faction = "Station"
	tutorial = "Templars are warriors who have forsaken wealth and title in lieu of service to the church, due to either zealotry or a past shame. They guard the church and its priest while keeping a watchful eye against heresy and nite-creechers. Within troubled dreams, they wonder if the blood they shed makes them holy or stained."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	allowed_patrons = ALL_DIVINE_PATRONS
	outfit = /datum/outfit/job/roguetown/templar
	min_pq = -999
	max_pq = null
	round_contrib_points = 2
	total_positions = 99//Uncapped basically
	spawn_positions = 99
	advclass_cat_rolls = list(CTAG_TEMPLAR = 20)
	display_order = JDO_TEMPLAR
	cmode_music = 'sound/music/templarofpsydonia.ogg'
	
	give_bank_account = TRUE

/datum/outfit/job/roguetown/templar
	has_loadout = TRUE
	allowed_patrons = ALL_PALADIN_PATRONS
	id = /obj/item/clothing/ring/silver
	
/datum/job/roguetown/templar/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

/datum/advclass/templar/monk
	name = "Monk"
	tutorial = "You are a monk of the Church, trained in pugilism and acrobatics. You bear no armor but your faith, and your hands are lethal weapons in service to your God."
	outfit = /datum/outfit/job/roguetown/templar/monk
	
	category_tags = list(CTAG_TEMPLAR)

/datum/outfit/job/roguetown/templar/monk/pre_equip(mob/living/carbon/human/H)
	..()
	neck = /obj/item/clothing/neck/roguetown/psicross/gani
	cloak = /obj/item/clothing/cloak/tabard/crusader/tief
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
	backl = /obj/item/storage/backpack/rogue/satchel
	pants = /obj/item/clothing/under/roguetown/tights/black
	wrists = /obj/item/clothing/wrists/roguetown/wrappings
	shoes = /obj/item/clothing/shoes/roguetown/sandals
	belt = /obj/item/storage/belt/rogue/leather/black
	beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
	beltr = /obj/item/storage/keyring/puritan
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE) 
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
		H.change_stat("strength", 3)
		H.change_stat("endurance", 2)
		H.change_stat("speed", 2)
		H.change_stat("perception", -1)

		ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)


	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_spells_templar(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)

/datum/advclass/templar/crusader
	name = "Templar"
	tutorial = "You are a templar of the Church, trained in heavy weaponry and zealous warfare. You are the instrument of your God's wrath, clad in steel and faith."
	outfit = /datum/outfit/job/roguetown/templar/crusader
	
	category_tags = list(CTAG_TEMPLAR)

/datum/outfit/job/roguetown/templar/crusader/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/heavy/bucket
	wrists = /obj/item/clothing/neck/roguetown/psicross/gani
	if(H.patron?.amulet)
		wrists  = H.patron.amulet
	cloak = /obj/item/clothing/cloak/tabard/crusader/tief
	switch(H.patron?.type)
		if(/datum/patron/elemental/visires)
			head = /obj/item/clothing/head/roguetown/helmet/heavy/visires
			cloak = /obj/item/clothing/cloak/templar/visires
		if(/datum/patron/elemental/gani)
			head = /obj/item/clothing/head/roguetown/helmet/heavy/ganihelm
			cloak = /obj/item/clothing/cloak/tabard/crusader/gani
		if(/datum/patron/elemental/mjallidhorn)
			head = /obj/item/clothing/head/roguetown/helmet/heavy/mjallidhorn
			cloak = /obj/item/clothing/cloak/templar/mjallidhorn
		if(/datum/patron/elemental/akan)
			head = /obj/item/clothing/head/roguetown/helmet/heavy/akan
			cloak = /obj/item/clothing/cloak/tabard/crusader/akan
		if(/datum/patron/all_aspect)
			cloak = /obj/item/clothing/cloak/tabard/crusader/all_aspect
	backr = /obj/item/rogueweapon/shield/tower/metal
	backl = /obj/item/storage/backpack/rogue/satchel
	gloves = /obj/item/clothing/gloves/roguetown/chain
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	pants = /obj/item/clothing/under/roguetown/chainlegs
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	shoes = /obj/item/clothing/shoes/roguetown/boots
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
	belt = /obj/item/storage/belt/rogue/leather/black
	beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
	beltr = /obj/item/storage/keyring/puritan
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)	//May tone down to 2; seems OK.
		H.change_stat("strength", 2)
		H.change_stat("constitution", 2)
		H.change_stat("endurance", 3)
		
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	
	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_spells_templar(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)

/datum/outfit/job/roguetown/templar/crusader/choose_loadout(mob/living/carbon/human/H)
	. = ..()
	var/weapons = list("Bastard Sword","Flail","Mace","Zweihander","Lucerne")
	var/weapon_choice = input(H,"Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	switch(weapon_choice)
		if("Bastard Sword")
			H.put_in_hands(new /obj/item/rogueweapon/sword/long(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		if("Flail")
			H.put_in_hands(new /obj/item/rogueweapon/flail(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
		if("Mace")
			H.put_in_hands(new /obj/item/rogueweapon/mace(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
		if("Zweihander")
			H.put_in_hands(new /obj/item/rogueweapon/greatsword/grenz(H), TRUE)
			H.put_in_hands(new /obj/item/gwstrap(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		if("Lucerne")
			H.put_in_hands(new /obj/item/rogueweapon/eaglebeak/lucerne(H), TRUE)
			H.put_in_hands(new /obj/item/gwstrap(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)


/datum/advclass/templar/heavyranger
	name = "Ranger-Zealot"
	tutorial = "You are a marksman of the Church, trained in heavy equipment and zealous warfare. What you lack in swordsmanship you make up for with delivering your God's will from afar, your faith guiding your shots true."
	outfit = /datum/outfit/job/roguetown/templar/heavyranger
	
	category_tags = list(CTAG_TEMPLAR)

/datum/outfit/job/roguetown/templar/heavyranger/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/heavy/bucket
	wrists = /obj/item/clothing/neck/roguetown/psicross/gani
	if(H.patron?.amulet)
		wrists  = H.patron.amulet
	cloak = /obj/item/clothing/cloak/tabard/crusader/tief
	switch(H.patron?.type)
		if(/datum/patron/elemental/visires)
			head = /obj/item/clothing/head/roguetown/helmet/heavy/visires
			cloak = /obj/item/clothing/cloak/templar/visires
		if(/datum/patron/elemental/gani)
			head = /obj/item/clothing/head/roguetown/helmet/heavy/ganihelm
			cloak = /obj/item/clothing/cloak/tabard/crusader/gani
		if(/datum/patron/elemental/mjallidhorn)
			head = /obj/item/clothing/head/roguetown/helmet/heavy/mjallidhorn
			cloak = /obj/item/clothing/cloak/templar/mjallidhorn
		if(/datum/patron/elemental/akan)
			head = /obj/item/clothing/head/roguetown/helmet/heavy/akan
			cloak = /obj/item/clothing/cloak/tabard/crusader/akan
		if(/datum/patron/all_aspect)
			cloak = /obj/item/clothing/cloak/tabard/crusader/all_aspect
	gloves = /obj/item/clothing/gloves/roguetown/chain
	neck = /obj/item/storage/belt/rogue/pouch/coins/mid
	pants = /obj/item/clothing/under/roguetown/chainlegs
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	shoes = /obj/item/clothing/shoes/roguetown/boots
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
	belt = /obj/item/storage/belt/rogue/leather/black/puritan
	beltr = /obj/item/flashlight/flare/torch/lantern
	beltl = /obj/item/rogueweapon/sword/short

	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/shields, 1, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("constitution", 2)
		H.change_stat("endurance", 3)
		
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	
	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_spells_templar(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)

/datum/outfit/job/roguetown/templar/heavyranger/choose_loadout(mob/living/carbon/human/H)
	. = ..()
	var/weapons = list("Crossbow", "Longbow")
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

/datum/advclass/templar/lightranger
	name = "Scout-Templar"
	tutorial = "You are a scout and tracker of the church. While not as skilled with heavier equipment as your paladin brethren, you wield your faith well-enough all the same."
	outfit = /datum/outfit/job/roguetown/templar/lightranger
	
	category_tags = list(CTAG_TEMPLAR)

/datum/outfit/job/roguetown/templar/lightranger/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/heavy/bucket
	wrists = /obj/item/clothing/neck/roguetown/psicross/gani
	if(H.patron?.amulet)
		wrists  = H.patron.amulet
	cloak = /obj/item/clothing/cloak/tabard/crusader/tief
	switch(H.patron?.type)
		if(/datum/patron/elemental/visires)
			head = /obj/item/clothing/head/roguetown/helmet/heavy/visires
			cloak = /obj/item/clothing/cloak/templar/visires
		if(/datum/patron/elemental/gani)
			head = /obj/item/clothing/head/roguetown/helmet/heavy/ganihelm
			cloak = /obj/item/clothing/cloak/tabard/crusader/gani
		if(/datum/patron/elemental/mjallidhorn)
			head = /obj/item/clothing/head/roguetown/helmet/heavy/mjallidhorn
			cloak = /obj/item/clothing/cloak/templar/mjallidhorn
		if(/datum/patron/elemental/akan)
			head = /obj/item/clothing/head/roguetown/helmet/heavy/akan
			cloak = /obj/item/clothing/cloak/tabard/crusader/akan
		if(/datum/patron/all_aspect)
			cloak = /obj/item/clothing/cloak/tabard/crusader/all_aspect
	gloves = /obj/item/clothing/gloves/roguetown/leather
	neck = /obj/item/storage/belt/rogue/pouch/coins/mid
	pants= /obj/item/clothing/under/roguetown/trou/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	shoes = /obj/item/clothing/shoes/roguetown/boots
	armor = /obj/item/clothing/suit/roguetown/armor/leather/studded
	belt = /obj/item/storage/belt/rogue/leather/black/puritan
	beltl = /obj/item/flashlight/flare/torch/lantern
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/rogueweapon/huntingknife = 1)

	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.change_stat("perception", 2)
		H.change_stat("speed", 2)
		H.change_stat("endurance", 2)
		
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	
	H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_spells_templar(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)

/datum/outfit/job/roguetown/templar/lightranger/choose_loadout(mob/living/carbon/human/H)
	. = ..()
	var/weapons = list("Crossbow", "Recurve Bow")
	var/weapon_choice = input(H,"Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	switch(weapon_choice)
		if("Crossbow")
			H.put_in_hands(new /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow(H), FALSE)
			H.put_in_hands(new /obj/item/quiver/bolts(H), FALSE)
			H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		if("Recurve Bow")
			H.put_in_hands(new /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve(H), FALSE)
			H.put_in_hands(new /obj/item/quiver/arrows(H), FALSE)
			H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
