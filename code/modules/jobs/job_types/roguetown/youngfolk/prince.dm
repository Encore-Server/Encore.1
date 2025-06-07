/datum/job/roguetown/prince
	title = "Prince"
	f_title = "Princess"
	flag = PRINCE
	department_flag = YOUNGFOLK
	faction = "Station"
	total_positions = 99
	spawn_positions = 99
	allowed_races = list(/datum/species/human/halfelf) //Not sure why this was previously set to all_kinds
	allowed_sexes = list(MALE, FEMALE)
	allowed_ages = list(AGE_ADULT)
	advclass_cat_rolls = list(CTAG_HEIR = 20)

	tutorial = "You’ve never felt the gnawing of the winter, never known the bite of hunger and certainly have never known an honest day's work. You are as free as any bird in the sky, and you may revel in your debauchery for as long as your parents remain upon the throne: But someday you’ll have to grow up, and that will be the day your carelessness will cost you more than a few mammons."

	display_order = JDO_PRINCE
	give_bank_account = 30
	noble_income = 20
	min_pq = null
	max_pq = null
	round_contrib_points = 3
	cmode_music = 'sound/music/combat_fancy.ogg'

/datum/outfit/job/roguetown/prince
	has_loadout = TRUE
	jobtype = /datum/job/roguetown/prince
	allowed_patrons = list(/datum/patron/heretic/jealous_god)
	beltl = /obj/item/storage/belt/rogue/pouch/coins/rich

/datum/job/roguetown/prince/after_spawn(mob/living/H, mob/M, latejoin)
	. = ..()
	if(ishuman(H))
		var/mob/living/carbon/human/Q = H
		Q.advsetup = 1
		Q.invisibility = INVISIBILITY_MAXIMUM
		Q.become_blind("advsetup")

/datum/advclass/heir/daring
	name = "Prideful Heir"
	tutorial = "You're a somebody, someone important. You were always able to harness the powers of the One Envy well, and have some semblance of control over a sword, at least."
	outfit = /datum/outfit/job/roguetown/heir/daring
	category_tags = list(CTAG_HEIR)

/datum/outfit/job/roguetown/heir/daring/pre_equip(mob/living/carbon/human/H)
	..()
	pants = /obj/item/clothing/under/roguetown/tights
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/guard
	armor = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
	shoes = /obj/item/clothing/shoes/roguetown/nobleboot
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/storage/keyring/heir
	backr = /obj/item/storage/backpack/rogue/satchel
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/arcane, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 4, TRUE)//No access to the regent's lichdom
		H.change_stat("strength", 1)
		H.change_stat("perception", 1)
		H.change_stat("constitution", 1)
		H.change_stat("speed", 1)
		H.change_stat("fortune", 1)
		// Integrating the weapon selection into the pre_equip instead of choose_loadout is not my first choice, but for some reason, I simply cannot get choose_loadout to work for this fucking job. It still works like this, you're just naked in-game until you've picked your weapon, after which you get all of your stuff at the same time. This should be fine.
		var/weapons = list("Recurve Bow", "Crossbow", "Sword & Shield (Heavy Proficiency)", "Axe & Buckler (Medium Proficiency)", "Shamshir & Buckler (Medium Proficiency)", "Rapier & Parrying Dagger (Dodge Proficiency)", "Twin Daggers (Dodge Proficiency)")
		var/weaponchoice = input(H, "Choose your combat playstyle. (DON'T CHOOSE TOO QUICKLY OR THE ITEMS MAY NOT SPAWN)", "TAKE UP ARMS") as anything in weapons
		switch(weaponchoice)
			if("Recurve Bow")
				H.put_in_hands(new /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve(H), TRUE)
				H.put_in_hands(new /obj/item/quiver/arrows(H), TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
			if("Crossbow")
				H.put_in_hands(new /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow(H), TRUE)
				H.put_in_hands(new /obj/item/quiver/bolts(H), TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 1, TRUE)
			if("Sword & Shield (Heavy Proficiency)")
				H.put_in_hands(new /obj/item/rogueweapon/sword/decorated, TRUE)
				H.put_in_hands(new /obj/item/rogueweapon/shield/tower/metal, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
				ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
			if("Axe & Buckler (Medium Proficiency)")
				H.put_in_hands(new /obj/item/rogueweapon/stoneaxe/woodcut/steel, TRUE)
				H.put_in_hands(new /obj/item/rogueweapon/shield/buckler, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/axes, 1, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/shields, 1, TRUE)
				ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			if("Shamshir & Buckler (Medium Proficiency)")
				H.put_in_hands(new /obj/item/rogueweapon/sword/long/rider, TRUE)
				H.put_in_hands(new /obj/item/rogueweapon/shield/buckler, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/shields, 1, TRUE)
				ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			if("Rapier & Parrying Dagger (Dodge Proficiency)")
				H.put_in_hands(new /obj/item/rogueweapon/sword/rapier/dec, TRUE)
				H.put_in_hands(new /obj/item/rogueweapon/huntingknife/idagger/steel/parrying(H), TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
				ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			if("Twin Daggers (Dodge Proficiency)")
				H.put_in_hands(new /obj/item/rogueweapon/huntingknife/idagger/steel/special(H), TRUE)
				H.put_in_hands(new /obj/item/rogueweapon/huntingknife/idagger/steel/parrying(H), TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
				ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)

		ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	var/datum/devotion/C = new /datum/devotion(H, H.patron) // This creates the cleric holder used for devotion spells
	C.grant_spells_priest(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/eyebite)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/bonechill)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/profane/miracle)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/raise_undead)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/rituos/miracle)
	if(H.mind)
		H.mind.adjust_spellpoints(-4)//You already have like 10 spells lmao

/datum/advclass/heir/aristocrat
	name = "Unawakened Blood"
	tutorial = "The One Envy's power in your blood is mostly dormant. Life has been kind to you; you've an entire keep at your disposal, servants to wait on you, and a whole retinue of guards to guard you. You've nothing to prove; just live the good life and you'll be a lord someday, too. A lack of ambition translates into a lacking skillset beyond schooling, though, and your breaks from boredom consist of being a damsel or court gossip."
	outfit = /datum/outfit/job/roguetown/heir/aristocrat
	category_tags = list(CTAG_HEIR)

/datum/outfit/job/roguetown/heir/aristocrat/pre_equip(mob/living/carbon/human/H)
	..()
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SEEPRICES_SHITTY, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC) // Pillow princesses (gender neutral)
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/storage/keyring/heir
	if(H.gender == MALE)
		pants = /obj/item/clothing/under/roguetown/tights
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/guard
		belt = /obj/item/storage/belt/rogue/leather
		shoes = /obj/item/clothing/shoes/roguetown/nobleboot
	if(H.gender == FEMALE)
		belt = /obj/item/storage/belt/rogue/leather/cloth/lady
		head = /obj/item/clothing/head/roguetown/hennin
		armor = /obj/item/clothing/suit/roguetown/armor/silkcoat
		shirt = /obj/item/clothing/suit/roguetown/shirt/dress/silkdress/princess
		shoes = /obj/item/clothing/shoes/roguetown/shortboots
		pants = /obj/item/clothing/under/roguetown/tights/stockings/silk/random
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, pick(0,1), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, pick(0,1), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/arcane, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
		H.change_stat("perception", 2)
		H.change_stat("strength", -1)
		H.change_stat("intelligence", 2)
		H.change_stat("fortune", 1)
		H.change_stat("speed", 1)
		
		var/weapons = list("Selfbow", "Dagger")
		var/weaponchoice = input(H, "Choose your combat playstyle. (DON'T CHOOSE TOO QUICKLY OR THE ITEMS MAY NOT SPAWN)", "TAKE UP ARMS") as anything in weapons
		switch(weaponchoice)
			if("Selfbow")
				H.put_in_hands(new /obj/item/gun/ballistic/revolver/grenadelauncher/bow(H), TRUE)
				H.put_in_hands(new /obj/item/quiver/arrows(H), TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
			if("Dagger")
				H.put_in_hands(new /obj/item/rogueweapon/huntingknife/idagger/steel(H), TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
	
	var/datum/devotion/C = new /datum/devotion(H, H.patron) // This creates the cleric holder used for devotion spells
	C.grant_spells_priest(H)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/eyebite)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/bonechill)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/profane/miracle)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
	if(H.mind)
		H.mind.adjust_spellpoints(-4)//You already have like 10 spells lmao
