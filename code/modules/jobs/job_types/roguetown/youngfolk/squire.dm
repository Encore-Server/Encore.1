/datum/job/roguetown/squire
	title = "Squire"
	flag = SQUIRE
	department_flag = YOUNGFOLK
	faction = "Station"
	total_positions = 4
	spawn_positions = 4
	allowed_races = RACES_ALL_KINDS
	allowed_sexes = list(MALE, FEMALE)
	allowed_ages = list(AGE_ADULT)
	advclass_cat_rolls = list(CTAG_SQUIRE = 20)

	tutorial = "Your folks said you were going to be something, they had better aspirations for you than the life of a peasant. You practiced the basics \
		in the field alongside your friends, swordfighting with sticks, chasing rabbits with grain flail, and helping around the house lifting heavy \
		bags of grain. The Knight took notice of your potential and brought you on as his personal ward. You're going to be something someday."
	outfit = /datum/outfit/job/roguetown/squire
	display_order = JDO_SQUIRE
	give_bank_account = TRUE
	min_pq = -5 //squires aren't great but they can do some damage
	max_pq = null

/datum/outfit/job/roguetown/squire
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/guard
	shoes = /obj/item/clothing/shoes/roguetown/boots
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/storage/keyring/guardcastle

/datum/job/roguetown/squire/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

/datum/advclass/squire/lancer
	name = "Lancer"
	tutorial = "A hopeful for the next generation of knightly mounted lancers and infantry pike specialists, \
	your training with polearms sets you apart from other squires."
	outfit = /datum/outfit/job/roguetown/squire/lancer
		
	category_tags = list(CTAG_SQUIRE)

/datum/outfit/job/roguetown/squire/lancer/pre_equip(mob/living/carbon/human/H)
	r_hand = /obj/item/rogueweapon/spear/billhook
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail
	head = /obj/item/clothing/head/roguetown/helmet/bascinet
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	pants = /obj/item/clothing/under/roguetown/chainlegs/iron
	gloves = /obj/item/clothing/gloves/roguetown/leather
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
		/obj/item/storage/belt/rogue/pouch,
	)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("perception", 1)
		H.change_stat("constitution", 1)
		H.change_stat("speed", 1)
	ADD_TRAIT(H, TRAIT_SQUIRE_REPAIR, TRAIT_GENERIC)

/datum/advclass/squire/blade_speciaist
	name = "Blade Specialist"
	tutorial = "Your training has been singularly focused on the intricacies of sword, a weapon whose versatility \
	belies the difficulty of its use."
	outfit = /datum/outfit/job/roguetown/squire/blade_specialist
		
	category_tags = list(CTAG_SQUIRE)

/datum/outfit/job/roguetown/squire/blade_specialist/pre_equip(mob/living/carbon/human/H)
	beltr = /obj/item/rogueweapon/sword
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail
	head = /obj/item/clothing/head/roguetown/helmet/bascinet
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	pants = /obj/item/clothing/under/roguetown/chainlegs/iron
	gloves = /obj/item/clothing/gloves/roguetown/leather
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
		/obj/item/storage/belt/rogue/pouch,
	)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("perception", 1)
		H.change_stat("constitution", 1)
		H.change_stat("speed", 1)
	ADD_TRAIT(H, TRAIT_SQUIRE_REPAIR, TRAIT_GENERIC)

/datum/advclass/squire/skirmisher
	name = "Skirmisher"
	tutorial = "As militaries become more flexible and tactics more moderne the importance of irregular troops \
	has become more apparent, and hopefuls such as yourself have been trained into the future of elite skirmisher \
	troops."
	outfit = /datum/outfit/job/roguetown/squire/skirmisher
		
	category_tags = list(CTAG_SQUIRE)

/datum/outfit/job/roguetown/squire/skirmisher/pre_equip(mob/living/carbon/human/H)
	beltr = /obj/item/quiver/arrows
	armor = /obj/item/clothing/suit/roguetown/armor/leather/studded
	backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
	head = /obj/item/clothing/head/roguetown/helmet/bascinet
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	pants = /obj/item/clothing/under/roguetown/chainlegs/iron
	gloves = /obj/item/clothing/gloves/roguetown/leather
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
		/obj/item/rogueweapon/huntingknife/idagger/steel,
		/obj/item/storage/belt/rogue/pouch,
		)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE)
		H.change_stat("perception", 1)
		H.change_stat("constitution", 1)
		H.change_stat("speed", 2)
	ADD_TRAIT(H, TRAIT_SQUIRE_REPAIR, TRAIT_GENERIC)

/datum/advclass/squire/deprived
	name = "Derpived"
	tutorial = "Many squires are lucky enough to receive specialized training and equipment \
	from their doting knights. You are not one of them. Good luck."
	outfit = /datum/outfit/job/roguetown/squire/deprived
		
	category_tags = list(CTAG_SQUIRE)

/datum/outfit/job/roguetown/squire/deprived/pre_equip(mob/living/carbon/human/H)
	beltr = /obj/item/rogueweapon/mace/wsword
	armor = /obj/item/clothing/suit/roguetown/armor/gambeson
	head = /obj/item/clothing/head/roguetown/paddedcap
	pants = /obj/item/clothing/under/roguetown/tights/vagrant
	backr = /obj/item/storage/backpack/rogue/satchel
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("constitution", 1)
		H.change_stat("speed", 1)
	ADD_TRAIT(H, TRAIT_SQUIRE_REPAIR, TRAIT_GENERIC)




/*/datum/outfit/job/roguetown/squire/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.pronouns == SHE_HER)
		pants = /obj/item/clothing/under/roguetown/tights
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/guard
		armor = /obj/item/clothing/suit/roguetown/armor/chainmail
		shoes = /obj/item/clothing/shoes/roguetown/boots
		belt = /obj/item/storage/belt/rogue/leather
		beltr = /obj/item/storage/belt/rogue/pouch
		beltl = /obj/item/storage/keyring/guardcastle
		backr = /obj/item/storage/backpack/rogue/satchel
		if(H.mind)
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
			H.change_stat("strength", 1)
			H.change_stat("perception", 1)
			H.change_stat("constitution", 1)
			H.change_stat("speed", 1)
	else
		pants = /obj/item/clothing/under/roguetown/tights
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/guard
		armor = /obj/item/clothing/suit/roguetown/armor/chainmail
		shoes = /obj/item/clothing/shoes/roguetown/boots
		belt = /obj/item/storage/belt/rogue/leather
		beltr = /obj/item/storage/belt/rogue/pouch
		beltl = /obj/item/storage/keyring/guardcastle
		backr = /obj/item/storage/backpack/rogue/satchel
		if(H.mind)
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
			H.change_stat("strength", 1)
			H.change_stat("perception", 1)
			H.change_stat("constitution", 1)
			H.change_stat("speed", 1)
	ADD_TRAIT(H, TRAIT_SQUIRE_REPAIR, TRAIT_GENERIC)
*/
