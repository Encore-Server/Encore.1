/datum/advclass/mercenary/cudaomarksman
	name = "Cudao Marksman"
	tutorial = "Well-trained and disciplined, these musketeers are reputed around the Goblet for the crushing blows and thunderous roars that their gunpowder-fuelled weapons emit. Any would-be assailant of a fort or keep would think twice when seeing firearms being mounted on the battlements by these mercenaries."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/mercenary/cudaomarksman
	category_tags = list(CTAG_MERCENARY)
	cmode_music = 'sound/music/combat_cudaomarksman.ogg'

/datum/outfit/job/roguetown/mercenary/cudaomarksman/pre_equip(mob/living/carbon/human/H)
	..()

	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/firearms, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.change_stat("perception", 3)
	H.change_stat("endurance", 1)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	head = /obj/item/clothing/head/roguetown/bardhat
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	belt = /obj/item/storage/belt/rogue/leather
	armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron
	backl = /obj/item/storage/backpack/rogue/satchel
	beltl = /obj/item/rogueweapon/sword/iron/messer
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/powdergun/advanced
	beltr = /obj/item/quiver/shotpouch/ironshots
	neck = /obj/item/gunpowderhorn
	gloves = /obj/item/clothing/gloves/roguetown/leather
	backpack_contents = list(/obj/item/flashlight/flare/torch/lantern = 1, /obj/item/storage/belt/rogue/pouch/coins/poor = 1)
