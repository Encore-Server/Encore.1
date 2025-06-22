#define UNLOADED 0 // nothing in the barrel
#define DRY_LOADED 1 // there's a round in the barrel, but no gunpowder
#define SEMI_LOADED 2 // a round is in the barrel but it hasn't been packed into the powder yet
#define LOADED 3 // the round is ready to go

#define EMPTY 0 // no gunpowder
#define FILLED 1 // the powder is in the flash pan or barrel
#define PACKED 2 // the musket shot has been packed into the powder

/obj/item/gun/ballistic/revolver/grenadelauncher/powdergun // this is going to become a proper handcannon later on, but for now i want to focus on getting muskets implemented - Hocka
	name = "hand cannon"
	desc = "A basic, primordial iteration of a firearm."
	possible_item_intents = list(/datum/intent/mace/smash/wood, /datum/intent/shoot/powdergun, /datum/intent/arc/powdergun)
	mag_type = /obj/item/ammo_box/magazine/internal/shot/powdergun // pretty much every handheld powder gun i can think of will use these, thank god
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	experimental_inhand = TRUE
	experimental_onback = TRUE
	randomspread = 1
	spread = 0
	can_parry = TRUE
	pin = /obj/item/firing_pin
	force = 10
	cartridge_wording = "bullet"
	fire_sound = 'sound/combat/Ranged/musket-shot.ogg'
	dry_fire_sound = 'sound/combat/Ranged/musket-shot-unpowdered.ogg'
	anvilrepair = /datum/skill/craft/engineering
	var/two_handed = FALSE //does the gun require both hands to fire it
	var/powder = FALSE
	var/damfactor = 1 //lets one gun do more damage than another gun with the same projectile
	var/reload_status = 0

/obj/item/ammo_box/magazine/internal/shot/powdergun
	ammo_type = /obj/item/ammo_casing/caseless/rogue/bullet
	caliber = "musketball"
	max_ammo = 1
	start_empty = TRUE

/datum/intent/shoot/powdergun
	chargedrain = 0

/datum/intent/shoot/powdergun/can_charge()
	if(mastermob)
		if(mastermob.get_num_arms(FALSE) < 2)
			return FALSE
	return TRUE // we aren't checking for an empty second hand here because manually-lit firearms literally require that you're holding a fire source in your other hand

/datum/intent/shoot/powdergun/get_chargetime() // i should probably rewrite this and take advantage of it for when hand cannons and their changeable fuses are added
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
			return 5
	return chargetime

/datum/intent/arc/powdergun
	chargedrain = 0

/datum/intent/arc/powdergun/can_charge()
	if(mastermob)
		if(mastermob.get_num_arms(FALSE) < 2)
			return FALSE
	return TRUE

/datum/intent/shoot/powdergun/get_chargetime()
	if(mastermob && chargetime)
		var/newtime = chargetime

		newtime = newtime + 80
		newtime = newtime - (mastermob.mind.get_skill_level(/datum/skill/combat/firearms) * 20)

		newtime = newtime + 20
		newtime = newtime - ((mastermob.STAPER)*1.5)
		if(newtime > 0)
			return newtime
		else
			return 5
	return chargetime

/obj/item/gun/ballistic/revolver/grenadelauncher/powdergun/proc/update_reload_status()
	if(chambered)
		switch(powder) //we already know there's a ball in the barrel at this point, so the rest of the context is entirely dependant on what state the gunpowder is in
			if(EMPTY)
				reload_status = DRY_LOADED
			if(FILLED)
				reload_status = SEMI_LOADED
			if(PACKED)
				reload_status = LOADED
	else
		reload_status = UNLOADED
		if(powder == PACKED)
			powder = FILLED // the bullet got removed, so the powder isn't packed anymore and it has to be redone

/obj/item/gun/ballistic/revolver/grenadelauncher/powdergun/examine(mob/user)
	. = ..()
	switch(reload_status)
		if(UNLOADED)
			. += span_info("Barrel is " + FONT_BRIGHTRED("empty"))
		if(DRY_LOADED)
			. += span_info("Barrel is " + FONT_BRIGHTRED("dry-loaded"))
		if(SEMI_LOADED)
			. += span_info("Barrel is " + FONT_YELLOW("partially loaded"))
		if(LOADED)
			. += span_info("Barrel is " + FONT_GREEN("loaded"))

/obj/item/gun/ballistic/revolver/grenadelauncher/powdergun/attack_self()
	..()
	update_reload_status()

/obj/item/gun/ballistic/revolver/grenadelauncher/powdergun/MiddleClick(mob/living/user)
	user.changeNext_move(user.used_intent.clickcd)
	if(reload_status == SEMI_LOADED)
		var/pack_timer = 30 - (user.mind.get_skill_level(/datum/skill/combat/firearms) * 3) // people who are better with guns can pack the powder faster
		user.visible_message("[user] starts packing \the [src]'s gunpowder.")
		playsound(src.loc, 'sound/combat/Ranged/gunpowder-packing.ogg', 100, FALSE)
		if(do_after(user, pack_timer, FALSE))
			powder = PACKED
			update_reload_status()
	else
		to_chat(user, "You need to add ball and powder first!")

/obj/item/gun/ballistic/revolver/grenadelauncher/powdergun/attackby(obj/item/A, mob/user, params)
	..()

	if(istype(A, /obj/item/gunpowderhorn))
		if(chambered)
			to_chat(user, span_warn("The ammunition is in the way, remove it first!"))
			return
		if(!powder)
			user.visible_message("[user] starts powdering \the [src].")
			playsound(src.loc, 'sound/combat/Ranged/gunpowder-pouring.ogg', 100, FALSE)
			if(do_after(user, 10, FALSE))
				powder = FILLED

	update_reload_status()

/obj/item/gun/ballistic/revolver/grenadelauncher/powdergun/shoot_with_empty_chamber(mob/living/user)
	if(powder)
		playsound(src.loc, 'sound/combat/Ranged/musket-shot.ogg', 100, FALSE)
		new /obj/effect/temp_visual/small_smoke/gunpowdersmoke(get_step(user, user.dir))
		powder = EMPTY
	else
		playsound(src.loc, 'sound/combat/Ranged/musket-shot-unpowdered.ogg', 100, FALSE)

/obj/item/gun/ballistic/revolver/grenadelauncher/powdergun/shoot_live_shot(mob/living/user)
	..()
	new /obj/effect/temp_visual/small_smoke/gunpowdersmoke(get_step(user, user.dir))
	powder = EMPTY

/obj/item/gun/ballistic/revolver/grenadelauncher/powdergun/can_shoot()
	if(reload_status == LOADED)
		. = ..()
	else
		return FALSE

/obj/item/gun/ballistic/revolver/grenadelauncher/powdergun/process_fire(atom/target, mob/living/user)

	if(user.get_num_arms(FALSE) < 2)
		return FALSE
	if(two_handed && user.get_inactive_held_item())
		return FALSE
	if(user.client)
		if(user.client.chargedprog >= 100)
			spread = 0
		else
			spread = 150 - (150 * (user.client.chargedprog / 100))
	else
		spread = 75

	for(var/obj/item/ammo_casing/CB in get_ammo_list(FALSE, TRUE))
		var/obj/projectile/BB = CB.BB
		BB.damage = BB.damage * damfactor

	..()
	update_reload_status() // calling this on the shoot_live_shot proc causes it to read the chambered var before it gets updated, which results in the update proc incorrectly thinking a round is still loaded

/obj/item/gun/ballistic/revolver/grenadelauncher/powdergun/advanced // this is to separate powder guns with a complex firing mechanism from those that don't - so we don't run into conflicts where a hand cannon starts checking for a flash pan that it shouldn't have
	name = "musket"
	desc = "A simple two-handed firearm developed by cutting edge industrial minds."
	icon = 'icons/roguetown/weapons/guns.dmi'
	possible_item_intents = list(/datum/intent/mace/smash/wood, /datum/intent/shoot/powdergun/advanced, /datum/intent/arc/powdergun/advanced)
	icon_state = "arquebus"
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	experimental_inhand = TRUE
	experimental_onback = TRUE
	randomspread = 0
	spread = 0
	can_parry = TRUE
	pin = /obj/item/firing_pin
	fire_sound = 'sound/combat/Ranged/musket-shot.ogg'
	damfactor = 1.5
	two_handed = TRUE
	var/pan_open = FALSE

/obj/item/gun/ballistic/revolver/grenadelauncher/powdergun/advanced/getonmobprop(tag)
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

/datum/intent/shoot/powdergun/advanced/can_charge()
	if(mastermob)
		if(mastermob.get_num_arms(FALSE) < 2)
			return FALSE
		if(mastermob.get_inactive_held_item())
			return FALSE
	return TRUE

/datum/intent/arc/powdergun/advanced/can_charge()
	if(mastermob)
		if(mastermob.get_num_arms(FALSE) < 2)
			return FALSE
		if(mastermob.get_inactive_held_item())
			return FALSE
	return TRUE

/obj/item/gun/ballistic/revolver/grenadelauncher/powdergun/advanced/examine(mob/user)
	. = ..()
	var/pan_status
	if(pan_open)
		pan_status = FONT_BRIGHTRED("open")
	else
		pan_status = FONT_GREEN("closed")

	if(powder)
		. += span_info("Flash pan is " + FONT_GREEN("full ") + "and " + pan_status)
	else
		. += span_info("Flash pan is " + FONT_BRIGHTRED("empty ") + "and " + pan_status)

/obj/item/gun/ballistic/revolver/grenadelauncher/powdergun/advanced/attack_right(mob/living/user)
	if(!pan_open)
		to_chat(user, "You flick open \the [src]'s flash pan.")
		playsound(user, 'sound/combat/Ranged/musket-flashpan-open.ogg', 100, FALSE)
		pan_open = TRUE
	else
		to_chat(user, "You close \the [src]'s flash pan.")
		playsound(user, 'sound/combat/Ranged/musket-flashpan-close.ogg', 100, FALSE)
		pan_open = FALSE

/obj/item/gun/ballistic/revolver/grenadelauncher/powdergun/advanced/can_shoot()
	if(!pan_open)
		. = ..()
	else
		return FALSE

/obj/item/gun/ballistic/revolver/grenadelauncher/powdergun/advanced/attackby(obj/item/A, mob/user, params)
	if(istype(A, /obj/item/gunpowderhorn))
		if(pan_open)
			..()
		else
			to_chat(user, span_warning("Flash pan is closed!"))
			return
	..()

/obj/item/gunpowderhorn
	name = "gunpowder horn"
	desc = "a bag filled with gunpowder, used for priming powder-based firearms."
	icon = 'icons/roguetown/weapons/guns.dmi'
	icon_state = "powderhorn"
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_NECK

#undef UNLOADED
#undef DRY_LOADED
#undef SEMI_LOADED
#undef LOADED
#undef EMPTY
#undef FILLED
#undef PACKED
