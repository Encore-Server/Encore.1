
/obj/item/quiver
	name = "quiver"
	desc = ""
	icon_state = "quiver0"
	item_state = "quiver"
	icon = 'icons/roguetown/weapons/ammo.dmi'
	lefthand_file = 'icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/backpack_righthand.dmi'
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_BACK
	resistance_flags = FIRE_PROOF
	max_integrity = 0
	equip_sound = 'sound/blank.ogg'
	bloody_icon_state = "bodyblood"
	alternate_worn_layer = UNDER_CLOAK_LAYER
	strip_delay = 20
	var/max_storage = 20
	var/list/ammo = list()
	var/list/allowed_ammo = list(/obj/item/ammo_casing/caseless/rogue/arrow, /obj/item/ammo_casing/caseless/rogue/bolt)
	sewrepair = TRUE

/obj/item/quiver/attack_turf(turf/T, mob/living/user)
	if(ammo.len >= max_storage)
		to_chat(user, span_warning("Your [src.name] is full!"))
		return
	to_chat(user, span_notice("You begin to gather the ammunition..."))
	for(var/obj/item/ammo_casing/caseless/rogue/arrow in T.contents)
		if(do_after(user, 5))
			if(!eatammo(arrow))
				break

/obj/item/quiver/proc/check_ammo(obj/A)
	for(var/i in allowed_ammo)
		if(istype(A, i))
			return TRUE

/obj/item/quiver/proc/eatammo(obj/A)
	if(check_ammo(A) && ammo.len < max_storage)
		A.forceMove(src)
		ammo += A
		update_icon()
		return TRUE
	else
		return FALSE

/obj/item/quiver/attackby(obj/A, loc, params)
	if(istype(A, /obj/item/gun/ballistic/revolver/grenadelauncher/bow))
		var/obj/item/gun/ballistic/revolver/grenadelauncher/bow/B = A
		if(ammo.len && !B.chambered)
			for(var/AR in ammo)
				if(istype(AR, /obj/item/ammo_casing/caseless/rogue/arrow))
					ammo -= AR
					B.attackby(AR, loc, params)
					break
		return

	if(ammo.len < max_storage)
		if(check_ammo(A))
			if(ismob(loc))
				var/mob/M = loc
				M.doUnEquip(A, TRUE, src, TRUE, silent = TRUE)
			else
				A.forceMove(src)
			ammo += A
			update_icon()

	..()

/obj/item/quiver/attack_right(mob/user)
	if(ammo.len)
		var/obj/O = ammo[ammo.len]
		ammo -= O
		O.forceMove(user.loc)
		user.put_in_hands(O)
		update_icon()
		return TRUE

/obj/item/quiver/examine(mob/user)
	. = ..()
	if(ammo.len)
		. += span_notice("[ammo.len] inside.")

/obj/item/quiver/update_icon()
	if(ammo.len)
		icon_state = "quiver1"
	else
		icon_state = "quiver0"

/obj/item/quiver/arrows/Initialize()
	. = ..()
	for(var/i in 1 to max_storage)
		var/obj/item/ammo_casing/caseless/rogue/arrow/iron/A = new()
		ammo += A
	update_icon()

/obj/item/quiver/bolts/Initialize()
	. = ..()
	for(var/i in 1 to max_storage)
		var/obj/item/ammo_casing/caseless/rogue/bolt/A = new()
		ammo += A
	update_icon()
/*
/obj/item/quiver/Parrows/Initialize()
	. = ..()
	for(var/i in 1 to max_storage)
		var/obj/item/ammo_casing/caseless/rogue/arrow/poison/A = new()
		arrows += A
	update_icon()

/obj/item/quiver/Pbolts/Initialize()
	. = ..()
	for(var/i in 1 to max_storage)
		var/obj/item/ammo_casing/caseless/rogue/bolt/poison/A = new()
		arrows += A
	update_icon()
*/
/obj/item/quiver/silver_arrows/Initialize()
	. = ..()
	for(var/i in 1 to max_storage)
		var/obj/item/ammo_casing/caseless/rogue/arrow/silver/A = new()
		ammo += A
	update_icon()

/obj/item/quiver/silver_bolts/Initialize()
	. = ..()
	for(var/i in 1 to max_storage)
		var/obj/item/ammo_casing/caseless/rogue/bolt/silver/A = new()
		ammo += A
	update_icon()

/obj/item/quiver/shotpouch
	name = "shot pouch"
	desc = "a bag used for carrying musket shots."
	icon = 'icons/roguetown/weapons/guns.dmi'
	icon_state = "shotpouch"
	w_class = WEIGHT_CLASS_SMALL
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_NECK
	max_integrity = 0
	bloody_icon_state = "bodyblood"
	alternate_worn_layer = UNDER_CLOAK_LAYER
	strip_delay = 10
	max_storage = 20
	allowed_ammo = list(/obj/item/ammo_casing/caseless/rogue/bullet/ironshot)
	sewrepair = TRUE

/obj/item/quiver/shotpouch/update_icon()
	return

/obj/item/quiver/shotpouch/ironshots/Initialize()
	. = ..()
	for(var/i in 1 to max_storage)
		var/obj/item/ammo_casing/caseless/rogue/bullet/ironshot/B = new()
		ammo += B
