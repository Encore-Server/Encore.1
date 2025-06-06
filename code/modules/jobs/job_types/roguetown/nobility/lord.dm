GLOBAL_VAR(lordsurname)
GLOBAL_LIST_EMPTY(lord_titles)

/datum/job/roguetown/lord
	title = "Prince Regent"
	f_title = "Princess Regent"
	flag = LORD
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	selection_color = JCOLOR_NOBLE
	allowed_races = list(/datum/species/human/halfelf)
	allowed_patrons = list(/datum/patron/heretic/jealous_god)
	allowed_sexes = list(MALE, FEMALE)

	spells = list(
		/obj/effect/proc_holder/spell/self/grant_title,
		/obj/effect/proc_holder/spell/self/convertrole/servant,
		/obj/effect/proc_holder/spell/self/convertrole/guard,
		/obj/effect/proc_holder/spell/self/convertrole/bog,
	)
	outfit = /datum/outfit/job/roguetown/lord
	visuals_only_outfit = /datum/outfit/job/roguetown/lord/visuals

	display_order = JDO_LORD
	tutorial = "You were appointed your throne by King Malryck whose seat you occupy in their absence. You are the absolute authority of this island, and are at the center of every plot within it. Don't disappoint your mother, Queen Alyssandrine herself."
	whitelist_req = FALSE
	min_pq = -999
	max_pq = null
	round_contrib_points = 4
	give_bank_account = 1000
	required = TRUE
	cmode_music = 'sound/music/combat_fancy.ogg'

/datum/outfit/job/roguetown/lord
	has_loadout = TRUE
	jobtype = /datum/job/roguetown/lord
	allowed_patrons = list(/datum/patron/heretic/jealous_god)
	neck = /obj/item/storage/belt/rogue/pouch/coins/rich

/datum/job/roguetown/exlord //just used to change the lords title
	title = "Prince Emeritus"
	f_title = "Princess Emeritus"
	flag = LORD
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 0
	spawn_positions = 0
	display_order = JDO_LADY
	give_bank_account = TRUE


/datum/job/roguetown/lord/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(L)
		var/list/chopped_name = splittext(L.real_name, " ")
		if(length(chopped_name) > 1)
			chopped_name -= chopped_name[1]
			GLOB.lordsurname = jointext(chopped_name, " ")
		else
			GLOB.lordsurname = "of [L.real_name]"
		SSticker.rulermob = L
		switch(L.pronouns)
			if(SHE_HER)
				SSticker.rulertype = "Princess Regent"
			if(THEY_THEM_F)
				SSticker.rulertype = "Heir Regent"
			else
				SSticker.rulertype = "Prince Regent"
		to_chat(world, "<b><span class='notice'><span class='big'>[L.real_name] is [SSticker.rulertype] of Domotan Island.</span></span></b>")
		if(STATION_TIME_PASSED() <= 10 MINUTES) //Late to the party? Stuck with default colors, sorry!
			addtimer(CALLBACK(L, TYPE_PROC_REF(/mob, lord_color_choice)), 50)

/datum/outfit/job/roguetown/lord/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/crown/serpcrown
	cloak = /obj/item/clothing/cloak/lordcloak
	belt = /obj/item/storage/belt/rogue/leather/plaquegold
	beltl = /obj/item/storage/keyring/lord
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1)
	id = /obj/item/clothing/ring/active/nomag
	pants = /obj/item/clothing/under/roguetown/tights/black
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/black
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/arcane, 4, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("intelligence", 3)
		H.change_stat("endurance", 3)
		H.change_stat("speed", 1)
		H.change_stat("perception", 2)
		H.change_stat("fortune", 5)
	if(H.pronouns == SHE_HER || H.pronouns == THEY_THEM_F)
		shoes = /obj/item/clothing/shoes/roguetown/shortboots
		H.dna.species.soundpack_m = new /datum/voicepack/male/evil()
	else
		shoes = /obj/item/clothing/shoes/roguetown/boots

	if(H.wear_mask)
		if(istype(H.wear_mask, /obj/item/clothing/mask/rogue/eyepatch))
			qdel(H.wear_mask)
			mask = /obj/item/clothing/mask/rogue/lordmask
		if(istype(H.wear_mask, /obj/item/clothing/mask/rogue/eyepatch/left))
			qdel(H.wear_mask)
			mask = /obj/item/clothing/mask/rogue/lordmask/l

	var/datum/devotion/C = new /datum/devotion(H, H.patron) // This creates the cleric holder used for devotion spells
	C.grant_spells_priest(H)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/eyebite)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/bonechill)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/profane/miracle)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/raise_undead)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/rituos/miracle)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
	if(H.mind)
		H.mind.adjust_spellpoints(-4)//You already have like 10 spells lmao
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOSEGRAB, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
//	SSticker.rulermob = H

/datum/outfit/job/roguetown/lord/choose_loadout(mob/living/carbon/human/H)
	. = ..()
	var/weapons = list("Recurve Bow", "Crossbow", "Sword & Shield", "Axe & Buckler", "Shamshir & Buckler", "Rapier & Parrying Dagger", "Twin Daggers")
	var/weaponchoice = input(H, "Choose your combat playstyle", "TAKE UP ARMS") as anything in weapons
	switch(weaponchoice)
		if("Recurve Bow")
			H.put_in_hands(new /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve(H), TRUE)
			H.put_in_hands(new /obj/item/quiver/arrows(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		if("Crossbow")
			H.put_in_hands(new /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow(H), TRUE)
			H.put_in_hands(new /obj/item/quiver/bolts(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		if("Sword & Shield")
			H.put_in_hands(new /obj/item/rogueweapon/sword/decorated, TRUE)
			H.put_in_hands(new /obj/item/rogueweapon/shield/tower/metal, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/shields, 1, TRUE)
		if("Axe & Buckler")
			H.put_in_hands(new /obj/item/rogueweapon/stoneaxe/woodcut/steel, TRUE)
			H.put_in_hands(new /obj/item/rogueweapon/shield/buckler, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/shields, 1, TRUE)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
		if("Shamshir & Buckler")
			H.put_in_hands(new /obj/item/rogueweapon/sword/long/rider, TRUE)
			H.put_in_hands(new /obj/item/rogueweapon/shield/buckler, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/shields, 1, TRUE)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
		if("Rapier & Parrying Dagger")
			H.put_in_hands(new /obj/item/rogueweapon/sword/rapier/dec, TRUE)
			H.put_in_hands(new /obj/item/rogueweapon/huntingknife/idagger/steel/parrying(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
		if("Twin Daggers")
			H.put_in_hands(new /obj/item/rogueweapon/huntingknife/idagger/steel/special(H), TRUE)
			H.put_in_hands(new /obj/item/rogueweapon/huntingknife/idagger/steel/parrying(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)

/datum/outfit/job/roguetown/lord/visuals/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/crown/fakecrown //Prevents the crown of woe from happening again.

/proc/give_lord_surname(mob/living/carbon/human/family_guy, preserve_original = FALSE)
	if(!GLOB.lordsurname)
		return
	if(preserve_original)
		family_guy.fully_replace_character_name(family_guy.real_name, family_guy.real_name + " " + GLOB.lordsurname)
		return family_guy.real_name
	var/list/chopped_name = splittext(family_guy.real_name, " ")
	if(length(chopped_name) > 1)
		family_guy.fully_replace_character_name(family_guy.real_name, chopped_name[1] + " " + GLOB.lordsurname)
	else
		family_guy.fully_replace_character_name(family_guy.real_name, family_guy.real_name + " " + GLOB.lordsurname)
	return family_guy.real_name

/obj/effect/proc_holder/spell/self/grant_title
	name = "Grant Title"
	desc = "Grant someone a title of honor... Or shame."
	overlay_state = "recruit_titlegrant"
	antimagic_allowed = TRUE
	charge_max = 100
	/// Maximum range for title granting
	var/title_range = 3
	/// Maximum length for the title
	var/title_length = 42

/obj/effect/proc_holder/spell/self/grant_title/cast(list/targets, mob/user = usr)
	. = ..()
	var/granted_title = input(user, "What title do you wish to grant?", "[name]") as null|text
	granted_title = reject_bad_text(granted_title, title_length)
	if(!granted_title)
		return
	var/list/recruitment = list()
	for(var/mob/living/carbon/human/village_idiot in (get_hearers_in_view(title_range, user) - user))
		//not allowed
		if(!can_title(village_idiot))
			continue
		recruitment[village_idiot.name] = village_idiot
	if(!length(recruitment))
		to_chat(user, span_warning("There are no potential honoraries in range."))
		return
	var/inputty = input(user, "Select an honorary!", "[name]") as anything in recruitment
	if(inputty)
		var/mob/living/carbon/human/recruit = recruitment[inputty]
		if(!QDELETED(recruit) && (recruit in get_hearers_in_view(title_range, user)))
			INVOKE_ASYNC(src, PROC_REF(village_idiotify), recruit, user, granted_title)
		else
			to_chat(user, span_warning("Honorific failed!"))
	else
		to_chat(user, span_warning("Honorific cancelled."))

/obj/effect/proc_holder/spell/self/grant_title/proc/can_title(mob/living/carbon/human/recruit)
	//wtf
	if(QDELETED(recruit))
		return FALSE
	//need a mind
	if(!recruit.mind)
		return FALSE
	//need to see their damn face
	if(!recruit.get_face_name(null))
		return FALSE
	return TRUE

/obj/effect/proc_holder/spell/self/grant_title/proc/village_idiotify(mob/living/carbon/human/recruit, mob/living/carbon/human/recruiter, granted_title)
	if(QDELETED(recruit) || QDELETED(recruiter) || !granted_title)
		return FALSE
	if(GLOB.lord_titles[recruit.real_name])
		recruiter.say("I HEREBY STRIP YOU, [uppertext(recruit.name)], OF THE TITLE OF [uppertext(GLOB.lord_titles[recruit.real_name])]!")
		GLOB.lord_titles -= recruit.real_name
		return FALSE
	recruiter.say("I HEREBY GRANT YOU, [uppertext(recruit.name)], THE TITLE OF [uppertext(granted_title)]!")
	GLOB.lord_titles[recruit.real_name] = granted_title
	return TRUE
