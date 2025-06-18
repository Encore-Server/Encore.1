/datum/advclass/necrolyte
	name = "Necrolyte"
	tutorial = "Ostracized by society for their dark magic, Necrolytes are heretical, secretive magicians whose curiosity has led them down darker avenues in pursuit of immortality, into the realm of Necromancy. Ware the living, but especially the forces of the Katholikos - and their Inquisition most of all - for you are HERETIC. Nothing will save you from Judgement, for you defy the very design of the Elementals. IMPORTANT NOTE: By playing this class, you must accept that you are overtly an ANTAGONIST. Other Bandit classes have a lot of leeway, but by learning Necromancy, you have made a conscious choice to overtly be an Evil Dude. Expect that people will (and should) try to straight-up kill you. Try to make it fun for everyone in your time alive."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_SHUNNED_UP
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	traits_applied = list(TRAIT_ZOMBIE_IMMUNE, TRAIT_NOSTINK, TRAIT_NECROMANCER, TRAIT_RITUALIST, TRAIT_MEDIUMARMOR)
	category_tags = list(CTAG_BANDIT)
	outfit = /datum/outfit/job/roguetown/bandit/necrolyte
	cmode_music = 'sound/music/combat_cult.ogg'

/datum/outfit/job/roguetown/bandit/necrolyte/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	var/classes = list("Infernal Necrolyte","Eldritch Necrolyte", "Godless Necrolyte")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)

		if("Infernal Necrolyte")
			H.set_blindness(0)
			to_chat(H, span_warning("You are a Necrolyte and cultist who has sworn fealty to the Hells and its Archdevils. Revel in blood and gore, and let the disquiet dead be the vanguard for the inevitable coming of Hell and its legions."))
			H.set_patron(/datum/patron/heretic/devil)
			head = /obj/item/clothing/head/roguetown/necromhood
			pants = /obj/item/clothing/under/roguetown/chainlegs/iron
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather
			cloak = /obj/item/clothing/suit/roguetown/shirt/robe/necromancer
			neck = /obj/item/clothing/neck/roguetown/chaincoif/iron
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
			wrists = /obj/item/clothing/wrists/roguetown/bracers/iron
			belt = /obj/item/storage/belt/rogue/leather/black
			backl = /obj/item/storage/backpack/rogue/satchel
			backr = /obj/item/rogueweapon/sword/long/blackflamb
			beltr = /obj/item/flashlight/flare/torch/lantern/bronzelamptern
			beltl = /obj/item/storage/belt/rogue/pouch/coins/rich
			id = /obj/item/mattcoin
			backpack_contents = list(/obj/item/ritechalk = 1, /obj/item/rogueweapon/huntingknife = 1)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/alchemy, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/arcane, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/ritual, 5, TRUE)
			H.change_stat("intelligence", 2)
			H.change_stat("perception", 1)
			H.change_stat("strength", 1)
			H.change_stat("constitution", 2)
			H.change_stat("endurance", 2)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/bonechill)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/eyebite)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/sickness)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/raise_lesser_undead)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/raise_undead)
			H.faction |= "undead"
			var/datum/devotion/C = new /datum/devotion(H, H.patron)
			C.passive_devotion_gain += 0.25
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/lesser_heal)
			C.grant_spells(H)
			H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
		if("Eldritch Necrolyte")
			H.set_blindness(0)
			to_chat(H, span_warning("You are a Necrolyte that swears fealty to one of the Secret Gods beyond counting. Carry out your patron's shadowy goals, whatever they may be, and leverage the dead to your advantage in doing such."))
			H.set_patron(/datum/patron/heretic/otherkind)
			head = /obj/item/clothing/head/roguetown/necromhood
			pants = /obj/item/clothing/under/roguetown/chainlegs/iron
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather
			cloak = /obj/item/clothing/suit/roguetown/shirt/robe/necromancer
			neck = /obj/item/clothing/neck/roguetown/chaincoif/iron
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
			wrists = /obj/item/clothing/wrists/roguetown/bracers/iron
			belt = /obj/item/storage/belt/rogue/leather/black
			backl = /obj/item/storage/backpack/rogue/satchel
			backr = /obj/item/rogueweapon/woodstaff/naledi
			beltr = /obj/item/flashlight/flare/torch/lantern/bronzelamptern
			beltl = /obj/item/storage/belt/rogue/pouch/coins/rich
			id = /obj/item/mattcoin
			backpack_contents = list(/obj/item/ritechalk = 1, /obj/item/rogueweapon/huntingknife = 1)
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/alchemy, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 5, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/arcane, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/druidic, 5, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/ritual, 5, TRUE)
			H.change_stat("intelligence", 2)
			H.change_stat("perception", 1)
			H.change_stat("strength", 1)
			H.change_stat("constitution", 2)
			H.change_stat("endurance", 2)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/bonechill)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/eyebite)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/sickness)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/raise_lesser_undead)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/raise_undead)
			H.faction |= "undead"
			var/datum/devotion/C = new /datum/devotion(H, H.patron)
			C.passive_devotion_gain += 0.25
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/lesser_heal)
			C.grant_spells(H)
			H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
		if("Godless Necrolyte")
			H.set_blindness(0)
			to_chat(H, span_warning("You are a Necrolyte that swears fealty to no god or deity, a magician fallen from grace for your heresy. Carry out your own personal goals, whatever they may be, and leverage the remains of the dead to accomplish them. The age of Gods will end, it must."))
			H.set_patron(/datum/patron/godless)
			head = /obj/item/clothing/head/roguetown/necromhood
			pants = /obj/item/clothing/under/roguetown/chainlegs/iron
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather
			cloak = /obj/item/clothing/suit/roguetown/shirt/robe/necromancer
			neck = /obj/item/clothing/neck/roguetown/chaincoif/iron
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
			wrists = /obj/item/clothing/wrists/roguetown/bracers/iron
			belt = /obj/item/storage/belt/rogue/leather/black
			backl = /obj/item/storage/backpack/rogue/satchel
			backr = /obj/item/rogueweapon/woodstaff/wizard
			beltr = /obj/item/flashlight/flare/torch/lantern/bronzelamptern
			beltl = /obj/item/book/granter/spellbook/magician
			id = /obj/item/mattcoin
			backpack_contents = list(/obj/item/ritechalk = 1, /obj/item/rogueweapon/huntingknife = 1, /obj/item/storage/belt/rogue/pouch/coins/rich = 1, /datum/reagent/medicine/healthpotnew = 1)
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/alchemy, 5, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/ritual, 5, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/arcane, 6, TRUE)
			H.change_stat("intelligence", 2)
			H.change_stat("perception", 1)
			H.change_stat("strength", 1)
			H.change_stat("constitution", 2)
			H.change_stat("endurance", 2)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/bonechill)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/eyebite)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/sickness)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/raise_lesser_undead)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/raise_undead)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/rituos)
			H.faction |= "undead"
