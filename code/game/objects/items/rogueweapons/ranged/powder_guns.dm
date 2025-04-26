#define UNLOADED 0 // nothing in the barrel
#define SEMI_LOADED 1 // a round is in the barrel but it hasn't been packed into the powder yet
#define LOADED 2 // the round is ready to go

#define EMPTY 0 // no gunpowder
#define FILLED 1 // the powder is in the flash pan
#define PACKED 2 // the musket shot has been packed into the powder

/obj/item/gun/ballistic/revolver/grenadelauncher/musket
	name = "musket"
	desc = "A simple firearm developed by cutting edge minds."
	icon = 'icons/roguetown/weapons/guns.dmi'
	icon_state = "arquebus"
	possible_item_intents = list(/datum/intent/mace/smash/wood, /datum/intent/shoot/musket)
	mag_type = /obj/item/ammo_box/magazine/internal/shot/musketball
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	experimental_inhand = TRUE
	experimental_onback = TRUE
	randomspread = 1
	spread = 0
	can_parry = TRUE
	pin = /obj/item/firing_pin
	force = 10
	cartridge_wording = "ball"
	fire_sound = 'sound/combat/Ranged/musket-shot.ogg'
	anvilrepair = /datum/skill/craft/engineering
	var/powder = FALSE
	var/pan_open = FALSE

/obj/item/gun/ballistic/revolver/grenadelauncher/musket/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list(
				"shrink" = 0.7,
				"sx" = 2,
				"sy" = -4,
				"nx" = 2,
				"ny" = -4,
				"wx" = -2,
				"wy" = -4,
				"ex" = 3,
				"ey" = -4,
				"northabove" = 0,
				"southabove" = 1,
				"eastabove" = 0,
				"westabove" = 1,
				"nturn" = 90,
				"sturn" = 90,
				"wturn" = 90,
				"eturn" = 90,
				"nflip" = 1,
				"sflip" = 1,
				"wflip" = 1,
				"eflip" = 0)
			if("onback")
				return list(
				"shrink" = 0.7,
				"sx" = 0,
				"sy" = 0,
				"nx" = 0,
				"ny" = 0,
				"wx" = 5,
				"wy" = 0,
				"ex" = -5,
				"ey" = 0,
				"northabove" = 1,
				"southabove" = 0,
				"eastabove" = 1,
				"westabove" = 0,
				"nturn" = 90,
				"sturn" = 90,
				"wturn" = 135,
				"eturn" = 45,
				"nflip" = 0,
				"sflip" = 1,
				"wflip" = 0,
				"eflip" = 1)

/datum/intent/shoot/musket
	chargedrain = 0

/obj/item/gun/ballistic/revolver/grenadelauncher/musket/proc/barrel_status()
	if(chambered)
		if(powder == PACKED)
			return LOADED
		else
			return SEMI_LOADED
	else
		return UNLOADED

/obj/item/gun/ballistic/revolver/grenadelauncher/musket/examine(mob/user)
	. = ..()
	var/pan_status
	if(pan_open)
		pan_status = "<font color='#CC3730'>open</font>."
	else
		pan_status = "<font color='#80B077'>closed</font>."

	switch(barrel_status())
		if(UNLOADED)
			. += span_info("Barrel is <font color='#CC3730'>unloaded</font>.")
		if(SEMI_LOADED)
			. += span_info("Barrel is <font color='#F1D669'>partially loaded</font>.")
		if(LOADED)
			. += span_info("Barrel is <font color='#80B077'>loaded</font>.")

	if(powder)
		. += span_info("Flash pan is <font color='#80B077'>full</font> and " + pan_status)
	else
		. += span_info("Flash pan is <font color='#CC3730'>empty</font> and " + pan_status)

/datum/intent/shoot/musket/can_charge()
	if(mastermob)
		if(mastermob.get_num_arms(FALSE) < 2)
			return FALSE
		if(mastermob.get_inactive_held_item())
			return FALSE
	return TRUE

/datum/intent/shoot/musket/get_chargetime()
	if(mastermob && chargetime)
		var/newtime = chargetime
		//skill block
		newtime = newtime + 80
		newtime = newtime - (mastermob.mind.get_skill_level(/datum/skill/combat/firearms) * 20)
		//stat block
		newtime = newtime + 20
		newtime = newtime - ((mastermob.STAPER)*1.5)
		if(newtime > 0)
			return newtime
		else
			return 10
	return chargetime

/obj/item/gun/ballistic/revolver/grenadelauncher/musket/MiddleClick(mob/living/user)
	if(!pan_open)
		to_chat(user, "You flick open \the [src]'s flash pan.")
		pan_open = TRUE
	else
		to_chat(user, "You close \the [src]'s flash pan.")
		pan_open = FALSE

/obj/item/gun/ballistic/revolver/grenadelauncher/musket/attack_right(mob/living/user)
	if(barrel_status() == SEMI_LOADED)
		if(powder == FILLED)
			user.visible_message("[user] starts packing \the [src]'s gunpowder.")
			if(do_after(user, 30, FALSE))
				playsound(src.loc, 'sound/combat/Ranged/gunpowder-packing.ogg', 100, FALSE)
				powder = PACKED
		else
			to_chat(user, "The flash pan needs to be full first!")

/obj/item/gun/ballistic/revolver/grenadelauncher/musket/shoot_with_empty_chamber(mob/living/user)
	if(powder)
		playsound(src.loc, 'sound/combat/Ranged/musket-shot.ogg', 100, FALSE)
		new /obj/effect/temp_visual/small_smoke/gunpowdersmoke(get_step(user, user.dir))
		powder = EMPTY
	else
		playsound(src.loc, 'sound/combat/Ranged/musket-shot-unpowdered.ogg', 100, FALSE)

/obj/item/gun/ballistic/revolver/grenadelauncher/musket/shoot_live_shot(mob/living/user)
	..()
	new /obj/effect/temp_visual/small_smoke(get_step(user, user.dir))
	powder = EMPTY

/obj/item/gun/ballistic/revolver/grenadelauncher/musket/attackby(obj/item/A, mob/user, params)
	..()

	if(istype(A, /obj/item/gunpowderhorn) && !powder && pan_open)
		user.visible_message("[user] starts powdering \the [src].")
		if(do_after(user, 10, FALSE))
			playsound(src.loc, 'sound/combat/Ranged/gunpowder-pouring.ogg', 100, FALSE)
			powder = FILLED

/obj/item/gun/ballistic/revolver/grenadelauncher/musket/can_shoot()
	if(!pan_open && barrel_status() == LOADED)
		return TRUE
	else
		return FALSE

/obj/item/gunpowderhorn
	name = "gunpowder horn"
	desc = "a bag filled with gunpowder, used for priming powder-based firearms."
	icon = 'icons/roguetown/weapons/guns.dmi'
	icon_state = "powderhorn"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/ammo_box/magazine/internal/shot/musketball
	ammo_type = /obj/item/ammo_casing/caseless/rogue/bullet/musketball
	caliber = "musketball"
	max_ammo = 1
	start_empty = TRUE

/obj/item/ballpouch
	name = "ball pouch"
	desc = "a bag used for carrying musket balls."
	icon = 'icons/roguetown/weapons/guns.dmi'
	icon_state = "ballpouch"
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_HIP
	max_integrity = 0
	bloody_icon_state = "bodyblood"
	alternate_worn_layer = UNDER_CLOAK_LAYER
	strip_delay = 10
	var/max_storage = 20
	var/list/bullets = list()
	sewrepair = TRUE

/obj/item/ballpouch/attack_right(mob/user)
	if(bullets.len)
		var/obj/O = bullets[bullets.len]
		bullets -= O
		O.forceMove(user.loc)
		user.put_in_hands(O)
		return TRUE

/obj/item/ballpouch/examine(mob/user)
	. = ..()
	if(bullets.len)
		. += span_notice("[bullets.len] inside.")

/obj/item/ballpouch/Initialize()
	. = ..()
	for(var/i in 1 to max_storage)
		var/obj/item/ammo_casing/caseless/rogue/bullet/musketball/B = new()
		bullets += B

/obj/item/ballpouch/proc/takebullet(obj/A)
	if(A.type in subtypesof(/obj/item/ammo_casing/caseless/rogue/bullet))
		A.forceMove(src)
		bullets += A
		return TRUE
	else
		return FALSE

/obj/item/ballpouch/attack_turf(turf/T, mob/living/user)
	if(bullets.len >= max_storage)
		to_chat(user, span_warning("Your [src.name] is full!"))
		return
	to_chat(user, span_notice("You begin to gather the bullets..."))
	for(var/obj/item/ammo_casing/caseless/rogue/bullet/musketball in T.contents)
		if(do_after(user, 5))
			if(!takebullet(musketball))
				break

/obj/item/ballpouch/attackby(obj/A, loc, params)
	if(A.type in subtypesof(/obj/item/ammo_casing/caseless/rogue/bullet))
		if(bullets.len < max_storage)
			if(ismob(loc))
				var/mob/M = loc
				M.doUnEquip(A, TRUE, src, TRUE, silent = TRUE)
			else
				A.forceMove(src)
			bullets += A
		else
			to_chat(loc, span_warning("Full!"))
		return
	..()


#undef UNLOADED
#undef SEMI_LOADED
#undef LOADED
#undef EMPTY
#undef FILLED
#undef PACKED
