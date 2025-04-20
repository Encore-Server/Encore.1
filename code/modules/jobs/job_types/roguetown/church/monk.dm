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
	has_loadout = TRUE
	allowed_patrons = list(/datum/patron/elemental/gani, /datum/patron/elemental/akan, /datum/patron/elemental/mjallidhorn, /datum/patron/elemental/visires, /datum/patron/elemental/iliope, /datum/patron/elemental/golerkanh)


/datum/outfit/job/roguetown/monk/pre_equip(mob/living/carbon/human/H)
	..()
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltl = /obj/item/storage/keyring/churchie
	shoes = /obj/item/clothing/shoes/roguetown/sandals
	pants = /obj/item/clothing/under/roguetown/tights/black
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/storage/belt/rogue/pouch/coins/poor)
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
			beltr = /obj/item/roguekey/blacksmith
		if(/datum/patron/elemental/iliope)
			head = /obj/item/clothing/head/roguetown/roguehood/iliopehood
			armor = /obj/item/clothing/suit/roguetown/shirt/robe/akan
			wrists = /obj/item/clothing/wrists/roguetown/wrappings
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
			backpack_contents = list(/obj/item/lockpickring/mundane)
		
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/alchemy, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/farming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/fishing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 4, TRUE)
		if(H.patron?.type == /datum/patron/elemental/akan)
			H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/alchemy, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
			ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)
		if(istype(H.patron, /datum/patron/elemental/gani))
			H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/alchemy, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/druidic, 3, TRUE)
			ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)
		if(H.patron?.type == /datum/patron/elemental/mjallidhorn)
			H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/labor/fishing, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_SOUL_EXAMINE, TRAIT_GENERIC)
		if(H.patron?.type == /datum/patron/elemental/visires)
			H.mind.adjust_skillrank(/datum/skill/labor/butchering, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/tanning, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/labor/fishing, 1, TRUE)
		if(H.patron?.type == /datum/patron/elemental/iliope)
			H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/stealing, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/music, 2, TRUE)
		if(H.patron?.type == /datum/patron/elemental/golerkanh)
			H.mind.adjust_skillrank(/datum/skill/craft/blacksmithing, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/armorsmithing, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/weaponsmithing, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/smelting, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/engineering, 2, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)
		H.change_stat("intelligence", 3)
		H.change_stat("endurance", 2)
		H.change_stat("speed", 1)

	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.passive_devotion_gain += 0.25
	C.grant_spells_monk(H)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/lesser_heal) //All non-combat church roles get Miracle, plus Inquisitor
	if(H.patron?.type in list(/datum/patron/elemental/akan, /datum/patron/elemental/gani)) // Non-militant Akan and Gani clergy are supposed to have Fortify too
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/heal)
	if(H.patron?.type == /datum/patron/elemental/gani) //Gani grants fervent clergy the ability to cure someone of any ailment by taking it on in their stead, dismemberment and death included
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/affliction_transfer)
	if(H.patron?.type == /datum/patron/elemental/mjallidhorn) //Mjallidhorn grants fervent clergy the ability to suffer wounds that would be sustained by someone else in their stead
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/damage_transfer)
	if(H.patron?.type == /datum/patron/elemental/akan) //Akan grants fervent clergy the ability to teleport and swap places with another, relieving them of their burdens by taking them on instead, not including dismemberment and death
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/burden_exchange)
	if(H.patron?.type == /datum/patron/elemental/visires) //Visires grants fervent clergy the ability to transfer their own suffering and wounds onto someone else
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/damage_link)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)

/datum/outfit/job/roguetown/monk/choose_loadout(mob/living/carbon/human/H)
	. = ..()
	var/weapons = list("Cudgel", "Selfbow", "Dagger")
	var/weapon_choice = input(H,"Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	switch(weapon_choice)
		if("Cudgel")
			H.put_in_hands(new /obj/item/rogueweapon/mace/cudgel(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
		if("Selfbow")
			H.put_in_hands(new /obj/item/gun/ballistic/revolver/grenadelauncher/bow(H), TRUE)
			H.put_in_hands(new /obj/item/quiver/arrows(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
		if("Dagger")
			H.put_in_hands(new /obj/item/rogueweapon/huntingknife/idagger(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
