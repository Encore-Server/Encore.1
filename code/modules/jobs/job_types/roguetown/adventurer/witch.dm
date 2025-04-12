/datum/job/roguetown/witch
	title = "Witch"
	flag = WITCH
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 99//Uncapped basically
	spawn_positions = 99
	antag_job = FALSE
	allowed_races = RACES_SHUNNED_UP
	tutorial = "Working in the grey area between folklore and heresy, you help or harm others on your own terms without concern over how others may judge you. Whether that be through your skills in medicine, occult ritual, or tapping into the forbidden divine, you know you are on thin ice and must tread carefully around both crown and church."

	outfit = /datum/outfit/job/roguetown/witch
	outfit_female = null

	display_order = JDO_WITCH
	announce_latejoin = FALSE
	min_pq = -999
	max_pq = null
	round_contrib_points = 5

	advclass_cat_rolls = list(CTAG_WITCH = 20)
	PQ_boost_divider = 10
	always_show_on_latechoices = TRUE

/datum/outfit/job/roguetown/witch
	name = "Witch"
	jobtype = /datum/job/roguetown/witch
	gloves = /obj/item/clothing/gloves/roguetown/leather/black
	beltl = /obj/item/rogueweapon/huntingknife/idagger/silver
	backr = /obj/item/storage/backpack/rogue/satchel/black
	belt = /obj/item/storage/belt/rogue/leather
	pants = /obj/item/clothing/under/roguetown/tights
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/black
	shirt = /obj/item/clothing/suit/roguetown/shirt/tunic/black
	shoes = /obj/item/clothing/shoes/roguetown/boots
	mask = /obj/item/clothing/mask/rogue/skullmask
	head = /obj/item/clothing/head/roguetown/witchhat

	backpack_contents = list(/obj/item/ritechalk)

/datum/job/roguetown/witch/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

/datum/advclass/witch/wise_woman
	name = "Wise Woman"
	tutorial = "You are a self-taught healer, tending to the sick who are unable to afford better. Your magic ability is more limited compared to others."
	outfit = /datum/outfit/job/roguetown/witch/wise_woman

	category_tags = list(CTAG_WITCH)

/datum/outfit/job/roguetown/witch/wise_woman/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/alchemy, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/ritual, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/arcane, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 3, TRUE)
	H.change_stat("intelligence", 2) // Higher intelligence but poor combat stats.
	H.change_stat("perception", 1)
	H.change_stat("strength", -1)
	H.change_stat("constitution", 2)
	H.change_stat("endurance", -1)
	ADD_TRAIT(H, TRAIT_RITUALIST, TRAIT_GENERIC)
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_spells_priest(H)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/lesser_heal)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/lightningbolt)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
	to_chat(H, span_danger("Whilst you are weaker in these arts than other witches around you, remember that your ritual magic is frowned upon at best and hunted at worst."))

/datum/advclass/witch/ritualist
	name = "Ritualist"
	tutorial = "Delving into forbidden tomes, listening to mad gods, or self-taught by the insane. Wherever your knowledge comes from, you are an expert in occult rituals but your study has left time for little else."
	outfit = /datum/outfit/job/roguetown/witch/ritualist


	category_tags = list(CTAG_WITCH)

/datum/outfit/job/roguetown/witch/ritualist/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/alchemy, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/ritual, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/arcane, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
		H.change_stat("intelligence", 2)
		H.change_stat("strength", -1)
		H.change_stat("endurance", 2)
	ADD_TRAIT(H, TRAIT_RITUALIST, TRAIT_GENERIC)
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_spells_priest(H)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/lesser_heal)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/lightningbolt)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
	to_chat(H, span_danger("Remember that your ritual magic is frowned upon at best and hunted at worst. Be careful as to who witnesses it."))

/datum/advclass/witch/heretic
	name = "Heretic"
	tutorial = "As a follower of forbidden gods, you have been branded a heretic by the Church. Whilst dangerous, your study brings you gifts of forbidden spells and miracles both. Let us hope you do not attract the attention of the Inquisition."
	outfit = /datum/outfit/job/roguetown/witch/heretic

	category_tags = list(CTAG_WITCH)

/datum/outfit/job/roguetown/witch/heretic/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/magic/ritual, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/arcane, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/alchemy, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
	H.change_stat("intelligence", 2)
	H.change_stat("strength", -1)
	H.change_stat("perception", 2)
	H.change_stat("speed", 1) // Lol you're still fucked if attacked
	H.change_stat("endurance", -1)
	ADD_TRAIT(H, TRAIT_RITUALIST, TRAIT_GENERIC)
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_spells_priest(H)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/lesser_heal)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/bloodlightning)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
	to_chat(H, span_danger("Remember that your ritual magic is frowned upon at best and hunted at worst. Be careful as to who witnesses it."))

