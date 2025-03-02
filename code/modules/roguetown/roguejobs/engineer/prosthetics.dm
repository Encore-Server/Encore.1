/obj/item/bodypart/l_arm/prosthetic/woodleft
	name = "Wooden left arm"
	desc = "A left arm of wood."
	icon = 'icons/roguetown/items/misc.dmi'
	icon_state = "prarm"
	resistance_flags = FLAMMABLE
	obj_flags = CAN_BE_HIT
	status = BODYPART_ROBOTIC
	brute_reduction = 0
	burn_reduction = 0
	max_damage = 20
	w_class = WEIGHT_CLASS_NORMAL
	max_integrity = 300
	sellprice = 30
	fingers = FALSE //can't swing weapons but can pick stuff up and punch

/obj/item/bodypart/l_arm/prosthetic/attack(mob/living/M, mob/user)
	if(!ishuman(M))
		return
	var/mob/living/carbon/human/H = M
	var/obj/item/bodypart/affecting = H.get_bodypart(check_zone(user.zone_selected))
	if(affecting)
		return
	if(user.zone_selected != body_zone) //so we can't replace a leg with an arm, or a human arm with a monkey arm.
		to_chat(user, span_warning("[src] isn't the right type for [parse_zone(user.zone_selected)]."))
		return -1
	if(user.temporarilyRemoveItemFromInventory(src))
		attach_limb(H)
		user.visible_message(span_notice("[user] attaches [src] to [H]."))
		return 1

/obj/item/bodypart/l_arm/prosthetic/bronzeleft
	name = "Bronze left arm"
	desc = "A replacement left arm, engineered out of bronze."
	icon = 'icons/roguetown/items/misc.dmi' //CHANGE THIS
	icon_state = "prarm" //THIS TOO
	resistance_flags = FIRE_PROOF
	obj_flags = CAN_BE_HIT
	status = BODYPART_ROBOTIC
	brute_reduction = 0
	burn_reduction = 0
	max_damage = 20
	w_class = WEIGHT_CLASS_NORMAL
	max_integrity = 350
	sellprice = 30
	fingers = TRUE // it acts like a normal arm

/obj/item/bodypart/r_arm/prosthetic/woodright
	name = "Wooden right arm"
	desc = "A right arm of wood."
	icon = 'icons/roguetown/items/misc.dmi'
	icon_state = "prarm"
	resistance_flags = FLAMMABLE
	obj_flags = CAN_BE_HIT
	status = BODYPART_ROBOTIC
	brute_reduction = 0
	burn_reduction = 0
	max_damage = 20
	w_class = WEIGHT_CLASS_NORMAL
	max_integrity = 300
	sellprice = 30
	fingers = FALSE //can't swing weapons but can pick stuff up and punch

/obj/item/bodypart/r_arm/prosthetic/attack(mob/living/M, mob/user)
	if(!ishuman(M))
		return
	var/mob/living/carbon/human/H = M
	var/obj/item/bodypart/affecting = H.get_bodypart(check_zone(user.zone_selected))
	if(affecting)
		return
	if(user.zone_selected != body_zone) //so we can't replace a leg with an arm, or a human arm with a monkey arm.
		to_chat(user, span_warning("[src] isn't the right type for [parse_zone(user.zone_selected)]."))
		return -1
	if(user.temporarilyRemoveItemFromInventory(src))
		attach_limb(H)
		user.visible_message(span_notice("[user] attaches [src] to [H]."))
		return 1

/obj/item/bodypart/r_arm/prosthetic/bronzeright
	name = "Bronze right arm"
	desc = "A replacement right arm, engineered out of bronze."
	icon = 'icons/roguetown/items/misc.dmi'
	icon_state = "prarm" //UPDATE THIS WITH SPRITE SOON
	resistance_flags = FIRE_PROOF
	obj_flags = CAN_BE_HIT
	status = BODYPART_ROBOTIC
	brute_reduction = 0
	burn_reduction = 0
	max_damage = 110
	w_class = WEIGHT_CLASS_NORMAL
	max_integrity = 350
	sellprice = 30
	fingers = TRUE // it acts like a normal arm

/obj/item/bodypart/r_leg/prosthetic/wood
	name = "right peg leg"
	desc = "A simple peg, meant to replace a missing right leg."
	icon = 'icons/roguetown/items/misc.dmi'
	icon_state = "prleg"
	max_damage = 20
	resistance_flags = FLAMMABLE
	status = BODYPART_ROBOTIC
	max_integrity = 300
	w_class = WEIGHT_CLASS_NORMAL
	sellprice = 15
	toes = FALSE
	pr_slowdown = 0.25 //Harder to move on a peg leg, even if you're used to it. Very minor slow

/obj/item/bodypart/r_leg/prosthetic/attack(mob/living/M, mob/user)
	if(!ishuman(M))
		return
	var/mob/living/carbon/human/H = M
	var/obj/item/bodypart/affecting = H.get_bodypart(check_zone(user.zone_selected))
	if(affecting)
		return
	if(user.zone_selected != body_zone) //so we can't replace a leg with an arm, or a human arm with a monkey arm.
		to_chat(user, span_warning("[src] isn't the right type for [parse_zone(user.zone_selected)]."))
		return -1
	if(user.temporarilyRemoveItemFromInventory(src))
		attach_limb(H)
		user.visible_message(span_notice("[user] attaches [src] to [H]."))
		return TRUE

/obj/item/bodypart/r_leg/prosthetic/bronze
	name = "bronze right leg"
	desc = "A prosthetic right leg, crafted of bronze."
	icon = 'icons/roguetown/items/misc.dmi'
	icon_state = "prleg"
	prosthetic_icon = "br" //different icon than wood peg leg
	max_damage = 110
	resistance_flags = FIRE_PROOF
	status = BODYPART_ROBOTIC
	max_integrity = 350
	w_class = WEIGHT_CLASS_NORMAL
	sellprice = 30
	heavy_steps = TRUE

/obj/item/bodypart/l_leg/prosthetic/wood
	name = "left peg leg"
	desc = "A simple peg, meant to replace a missing left leg."
	icon = 'icons/roguetown/items/misc.dmi'
	icon_state = "prleg"
	max_damage = 20
	resistance_flags = FLAMMABLE
	status = BODYPART_ROBOTIC
	max_integrity = 300
	w_class = WEIGHT_CLASS_NORMAL
	sellprice = 15
	toes = FALSE
	pr_slowdown = 0.25 //Harder to move on a peg leg, even if you're used to it. Very minor slow

/obj/item/bodypart/l_leg/prosthetic/attack(mob/living/M, mob/user)
	if(!ishuman(M))
		return
	var/mob/living/carbon/human/H = M
	var/obj/item/bodypart/affecting = H.get_bodypart(check_zone(user.zone_selected))
	if(affecting)
		return
	if(user.zone_selected != body_zone) //so we can't replace a leg with an arm, or a human arm with a monkey arm.
		to_chat(user, span_warning("[src] isn't the right type for [parse_zone(user.zone_selected)]."))
		return -1
	if(user.temporarilyRemoveItemFromInventory(src))
		attach_limb(H)
		user.visible_message(span_notice("[user] attaches [src] to [H]."))
		return TRUE

/obj/item/bodypart/l_leg/prosthetic/bronze
	name = "bronze left leg"
	desc = "A prosthetic left leg, crafted of bronze."
	icon = 'icons/roguetown/items/misc.dmi'
	icon_state = "prleg"
	prosthetic_icon = "br" //different icon than wood peg leg
	max_damage = 110
	resistance_flags = FIRE_PROOF
	status = BODYPART_ROBOTIC
	max_integrity = 350
	w_class = WEIGHT_CLASS_NORMAL
	sellprice = 30
	heavy_steps = TRUE