GLOBAL_LIST_INIT(demon_quotes, world.file2list("strings/rt/npc/demonlines.txt"))
GLOBAL_LIST_INIT(demon_aggro, world.file2list("strings/rt/npc/demonaggro.txt"))

/mob/living/carbon/human/species/tieberian/demon
	name = "lesser daemon"
	race = /datum/species/tieberian/demon
	aggressive=1
	mode = AI_IDLE
	faction = list("hell")
	ambushable = FALSE
	dodgetime = 10
	possible_rmb_intents = list()

/mob/living/carbon/human/species/tieberian/demon/ambush
	aggressive=1
	wander = TRUE

/mob/living/carbon/human/species/tieberian/demon/retaliate(mob/living/L)
	var/newtarg = target
	.=..()
	if(target)
		aggressive=1
		wander = TRUE
		if(target != newtarg)
			say(pick(GLOB.demon_aggro))
			linepoint(target)

/mob/living/carbon/human/species/tieberian/demon/should_target(mob/living/L)
	if(L.stat != CONSCIOUS)
		return FALSE
	. = ..()

/mob/living/carbon/human/species/tieberian/demon/Initialize()
	. = ..()
	// set_species(/mob/living/carbon/human/species/tieberian)
	spawn(10)
		after_creation()
	//addtimer(CALLBACK(src, PROC_REF(after_creation)), 10)


/mob/living/carbon/human/species/tieberian/demon/after_creation()
	..()
	job = "Demonkin"
	real_name = "lesser daemon"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOROGSTAM, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	equipOutfit(new /datum/outfit/job/roguetown/human/species/tieberian/demon)

	if(src.dna && src.dna.species)
		src.dna.species.soundpack_m = new /datum/voicepack/male/demon()
		src.dna.species.soundpack_f = new /datum/voicepack/male/demon()

	var/obj/item/organ/eyes/organ_eyes = getorgan(/obj/item/organ/eyes)
	if(organ_eyes)
		organ_eyes.eye_color = pick("27becc", "35cc27", "000000")

	var/obj/item/organ/horns/horns = src.getorganslot(ORGAN_SLOT_HORNS)
	horns = new /obj/item/organ/horns
	horns.Insert(src)

	src.grant_language(/datum/language/hellspeak)

	if(src.charflaw)
		QDEL_NULL(src.charflaw)
	update_hair()
	update_body()

/mob/living/carbon/human/species/tieberian/demon/npc_idle()
	if(m_intent == MOVE_INTENT_SNEAK)
		return
	if(world.time < next_idle)
		return
	next_idle = world.time + rand(30, 70)
	if((mobility_flags & MOBILITY_MOVE) && isturf(loc) && wander)
		if(prob(20))
			var/turf/T = get_step(loc,pick(GLOB.cardinals))
			if(!istype(T, /turf/open/transparent/openspace))
				Move(T)
		else
			face_atom(get_step(src,pick(GLOB.cardinals)))
	if(!wander && prob(10))
		face_atom(get_step(src,pick(GLOB.cardinals)))
	if(prob(5))
		say(pick(GLOB.demon_quotes))

/mob/living/carbon/human/species/tieberian/demon/handle_combat()
	if(mode == AI_HUNT)
		if(prob(50))
			emote("rage")
	. = ..()

/datum/outfit/job/roguetown/human/species/tieberian/demon/pre_equip(mob/living/carbon/human/H)
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	if(prob(50))
		wrists = /obj/item/clothing/wrists/roguetown/bracers
	armor = /obj/item/clothing/suit/roguetown/armor/plate/red
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
	if(prob(50))
		shirt = /obj/item/clothing/suit/roguetown/shirt/tunic
	if(prob(50))
		shirt = /obj/item/clothing/suit/roguetown/shirt/tunic
	pants = /obj/item/clothing/under/roguetown/chainlegs/iron/red
	head = /obj/item/clothing/head/roguetown/helmet/sallet/red
	if(prob(50))
		head = null
	if(prob(50))
		neck = /obj/item/clothing/neck/roguetown/gorget
	if(prob(50))
		gloves = /obj/item/clothing/gloves/roguetown/chain
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor/iron/red
	H.STASPD = 17
	H.STACON = rand(13,15)
	H.STAEND = 15
	H.STAPER = 10
	H.STAINT = 11
	H.STASTR = 19
	if(prob(50))
		r_hand = /obj/item/rogueweapon/sword/short
	else
		r_hand = /obj/item/rogueweapon/halberd/bardiche
	l_hand = /obj/item/rogueweapon/shield/wood
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	if(prob(30))
		neck = /obj/item/clothing/neck/roguetown/chaincoif
		H.eye_color = pick("27becc", "35cc27")
	H.hair_color = pick ("4f4f4f", "61310f")
	H.facial_hair_color = H.hair_color
	// H.horns = pick("Big Curly Horns","Knight", "Unihorn", "Bunny horns")
	H.facial_hairstyle = pick("Beard (Viking)", "Beard (Long)", "Beard (Manly)")
	H.color = pick(SKIN_COLOR_LOVELOST, SKIN_COLOR_MALEVOLEKET, SKIN_COLOR_GARGANT, SKIN_COLOR_LOSTURGE, SKIN_COLOR_PROTOMOS, SKIN_COLOR_AGATROS, SKIN_COLOR_VISTAMATRA, SKIN_COLOR_HEAVEN)
	if(H.gender == FEMALE)
		H.STASTR = rand(16,20) //GENDER EQUALITY!!
		H.hairstyle = pick("Ponytail (Country)","Braid (Low)", "Thick Curly", "Messy (Rogue)")
	else
		H.STASTR = rand(16,20)
		H.hairstyle = pick("Mohawk","Braid (Low)", "Braid (Short)", "Messy")
