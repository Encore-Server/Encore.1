/datum/job/roguetown/monk
	title = "Acolyte"
	flag = MONK
	department_flag = CHURCHMEN
	faction = "Station"
	total_positions = 99//Uncapped basically
	spawn_positions = 99

	allowed_races = RACES_ALL_KINDS
	allowed_patrons = list(/datum/patron/elemental/gani, /datum/patron/elemental/akan, /datum/patron/elemental/mjallidhorn, /datum/patron/elemental/visires, /datum/patron/elemental/iliope, /datum/patron/elemental/golerkanh)
	allowed_sexes = list(MALE, FEMALE)
	outfit = /datum/outfit/job/roguetown/monk
	tutorial = "Chores, some more chores- Even more chores.. Oh how the life of a humble acolyte is exhausting… You have faith, but even you know you gave up a life of adventure for that of the security in the Church. Assist the Priest in their daily tasks, maybe today will be the day something interesting happens."

	display_order = JDO_MONK
	give_bank_account = TRUE
	min_pq = -999
	max_pq = null
	round_contrib_points = 2

/datum/outfit/job/roguetown/monk
	name = "Acolyte"
	jobtype = /datum/job/roguetown/monk

	allowed_patrons = ALL_ACOLYTE_PATRONS


/datum/outfit/job/roguetown/monk/pre_equip(mob/living/carbon/human/H)
	..()
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
	beltl = /obj/item/storage/keyring/churchie
	shoes = /obj/item/clothing/shoes/roguetown/sandals
	pants = /obj/item/clothing/under/roguetown/tights/black
	if(H.patron?.amulet)
		neck = H.patron.amulet
	switch(H.patron?.type)
		if(/datum/patron/elemental/visires)
			head = /obj/item/clothing/head/roguetown/roguehood
			wrists = /obj/item/clothing/wrists/roguetown/wrappings
			armor = /obj/item/clothing/suit/roguetown/shirt/robe/visires
		if(/datum/patron/elemental/akan)
			head = /obj/item/clothing/head/roguetown/akanhood
			wrists = /obj/item/clothing/wrists/roguetown/nocwrappings
			armor = /obj/item/clothing/suit/roguetown/shirt/robe/akan
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
		if(/datum/patron/elemental/gani)
			head = /obj/item/clothing/head/roguetown/ganimask
			armor = /obj/item/clothing/suit/roguetown/shirt/robe/gani
		if(/datum/patron/elemental/mjallidhorn)
			head = /obj/item/clothing/head/roguetown/mjallidhornhood
			shoes = /obj/item/clothing/shoes/roguetown/boots
			pants = /obj/item/clothing/under/roguetown/trou/leather/mourning
			armor = /obj/item/clothing/suit/roguetown/shirt/robe/mjallidhorn
			shirt = /obj/item/clothing/suit/roguetown/armor/leather/vest/black
			cloak = /obj/item/clothing/cloak/raincloak/mortus
		if(/datum/patron/elemental/golerkanh)
			head = /obj/item/clothing/head/roguetown/roguehood/golerkanhhood
			armor = /obj/item/clothing/suit/roguetown/shirt/robe/gani
			wrists = /obj/item/clothing/wrists/roguetown/wrappings
		if(/datum/patron/elemental/iliope)
			head = /obj/item/clothing/head/roguetown/roguehood/iliopehood
			armor = /obj/item/clothing/suit/roguetown/shirt/robe/akan
			wrists = /obj/item/clothing/wrists/roguetown/wrappings
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
		
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
		if(H.patron?.type == /datum/patron/elemental/akan)
			H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
			ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/farming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/blacksmithing, 1, TRUE)//Churchlings receive basic armor repair skills since they're otherwise impossible to learn
		H.mind.adjust_skillrank(/datum/skill/craft/armorsmithing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/weaponsmithing, 1, TRUE)
		if(istype(H.patron, /datum/patron/elemental/gani))
			H.mind.adjust_skillrank(/datum/skill/magic/druidic, 3, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)
		H.change_stat("intelligence", 3)
		H.change_stat("endurance", 2)
		H.change_stat("speed", 1)
		if(H.patron?.type == /datum/patron/elemental/mjallidhorn)
			ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_SOUL_EXAMINE, TRAIT_GENERIC)
		if(H.patron?.type == /datum/patron/elemental/iliope)
			ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)

	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_spells_monk(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
