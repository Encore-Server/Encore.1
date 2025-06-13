/datum/advclass/mercenary/yinbladesman
	name = "Yin Bladesmen"
	tutorial = "Mysterious, renowned, and expensive - these traditional bladesmen carry on martial traditions passed down from the survivors of the Kui Empire. With Cudao's airships, these mercenaries can be seen far and wide in the East and West, spreading word of their tradition through their ferocity on the battlefield. Though mercenaries working for coin, these bladesmen hold their honour in highest regard and carry out their tasks with a grave sense of duty, making them popular bodyguards for the wealthy and elite, though they can be found in the employ of anyone who can afford their high price."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/mercenary/yinbladesman
	category_tags = list(CTAG_MERCENARY)
	cmode_music = 'sound/music/combat_grenzelhoft.ogg'

/datum/outfit/job/roguetown/mercenary/yinbladesman/pre_equip(mob/living/carbon/human/H)
	..()

	// CLASS ARCHETYPES
	H.adjust_blindness(-3)
	var/classes = list("Samurai","Ninja")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)
		if("Samurai")
			H.set_blindness(0)
			to_chat(H, span_warning("You are a Samurai of Cudao, an armoured swordsman experienced with katana and bow."))
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/bows, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
			H.change_stat("strength", 2)
			H.change_stat("endurance", 3)
			H.change_stat("constitution", 2)
			H.change_stat("perception", 1)
			ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
			belt = /obj/item/storage/belt/rogue/leather
			beltl = /obj/item/rogueweapon/sword/long/katana
			beltr = /obj/item/quiver/arrows
			neck = /obj/item/clothing/neck/roguetown/chaincoif/iron
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
			head = /obj/item/clothing/head/roguetown/helmet/heavy/knight/iron
			armor = /obj/item/clothing/suit/roguetown/armor/brigandine/coatplates/iron
			pants = /obj/item/clothing/under/roguetown/platelegs/iron
			shoes = /obj/item/clothing/shoes/roguetown/boots/armor/iron
			gloves = /obj/item/clothing/gloves/roguetown/plate/iron
			backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
			backl = /obj/item/storage/backpack/rogue/satchel
			backpack_contents = list(/obj/item/rogueweapon/huntingknife = 1, /obj/item/flashlight/flare/torch/lantern = 1, /obj/item/storage/belt/rogue/pouch/coins/poor = 1)
		if("Ninja")
			H.set_blindness(0)
			to_chat(H, span_warning("You are a Ninja of Cudao, a rogue or assassin that utilises a curious combination of blade and magic."))
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/bows, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/alchemy, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/arcane, 4, TRUE)
			H.change_stat("strength", 2)
			H.change_stat("endurance", 2)
			H.change_stat("constitution", 2)
			H.change_stat("perception", 1)
			H.change_stat("speed", 1)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/darkvision)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/featherfall)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/smoke)
			if(H.mind)
				H.mind.adjust_spellpoints(-4)//No ninjas with lightning bolt or fireball or blade burst or invisibility pls. I understand the fantasy but it would be far too busted. You get what you start with.
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			belt = /obj/item/storage/belt/rogue/leather/black
			beltl = /obj/item/rogueweapon/sword/long/katana
			beltr = /obj/item/quiver/arrows
			neck = /obj/item/clothing/neck/roguetown/coif
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
			head = /obj/item/clothing/head/roguetown/roguehood/black
			mask = /obj/item/clothing/mask/rogue/ragmask/blk
			armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy/belted/blk
			pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/blk
			shoes = /obj/item/clothing/shoes/roguetown/boots
			gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather/blk
			backr = /obj/item/storage/backpack/rogue/satchel/black
			backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
			backpack_contents = list(/obj/item/rogueweapon/huntingknife = 1, /obj/item/flashlight/flare/torch/lantern = 1, /obj/item/storage/belt/rogue/pouch/coins/poor = 1, /obj/item/lockpickring/mundane = 1)

// Funny recolours for the Ninja stuff.
/obj/item/clothing/mask/rogue/ragmask/blk
		color = CLOTHING_GREY

/obj/item/clothing/suit/roguetown/armor/leather/heavy/belted/blk
		color = CLOTHING_GREY

/obj/item/clothing/under/roguetown/heavy_leather_pants/blk
		color = CLOTHING_GREY

/obj/item/clothing/gloves/roguetown/fingerless_leather/blk
		color = CLOTHING_GREY
