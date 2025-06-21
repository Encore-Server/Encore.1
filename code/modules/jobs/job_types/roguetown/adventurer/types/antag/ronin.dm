/datum/advclass/ronin
	name = "Ronin"
	tutorial = "A disgraced Samurai of Cudao, fallen from grace. Perhaps you took too many contracts for unscrupulous buyers, perhaps you disgraced yourself thoroughly on a previous job, or perhaps you even killed your own master. Whatever led you down this path, the shame was too great to return to your old life."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_SHUNNED_UP
	outfit = /datum/outfit/job/roguetown/bandit/ronin
	category_tags = list(CTAG_BANDIT)
	cmode_music = 'sound/music/combat_yinbladesmen.ogg'

/datum/outfit/job/roguetown/bandit/ronin/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
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
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	belt = /obj/item/storage/belt/rogue/leather/black
	beltr = /obj/item/quiver/arrows
	id = /obj/item/mattcoin
	neck = /obj/item/clothing/neck/roguetown/chaincoif/iron/blk
	cloak = /obj/item/clothing/cloak/straw
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/blk
	head = /obj/item/clothing/head/roguetown/helmet/heavy/samurai/iron/blk
	armor = /obj/item/clothing/suit/roguetown/armor/brigandine/coatplates/iron/blk
	pants = /obj/item/clothing/under/roguetown/platelegs/iron/blk
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor/iron/blk
	gloves = /obj/item/clothing/gloves/roguetown/plate/iron/blk
	backl = /obj/item/storage/backpack/rogue/satchel/black
	backpack_contents = list(/obj/item/flashlight/flare/torch/lantern = 1, /obj/item/storage/belt/rogue/pouch/coins/poor = 1)

	var/weapons = list("Katana & Recurve Bow","Tachi & Buckler","Odachi","Naginata")
	var/weapon_choice = input(H,"Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	switch(weapon_choice)
		if("Katana & Recurve Bow")
			H.put_in_hands(new /obj/item/rogueweapon/sword/katana(H), TRUE)
			H.put_in_hands(new /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
		if("Tachi & Buckler")
			H.put_in_hands(new /obj/item/rogueweapon/sword/tachi(H), TRUE)
			H.put_in_hands(new /obj/item/rogueweapon/shield/buckler(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/shields, 1, TRUE)
		if("Odachi")
			H.put_in_hands(new /obj/item/rogueweapon/greatsword/odachi(H), TRUE)
			H.put_in_hands(new /obj/item/gwstrap(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		if("Naginata")
			H.put_in_hands(new /obj/item/rogueweapon/halberd/naginata(H), TRUE)
			H.put_in_hands(new /obj/item/gwstrap(H), TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)

//Funny dye stuff
/obj/item/clothing/neck/roguetown/chaincoif/iron/blk
		color = CLOTHING_GREY

/obj/item/clothing/head/roguetown/helmet/heavy/samurai/iron/blk
		color = CLOTHING_GREY

/obj/item/clothing/suit/roguetown/armor/brigandine/coatplates/iron/blk
		color = CLOTHING_GREY

/obj/item/clothing/under/roguetown/platelegs/iron/blk
		color = CLOTHING_GREY

/obj/item/clothing/gloves/roguetown/plate/iron/blk
		color = CLOTHING_GREY
