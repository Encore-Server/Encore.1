
/datum/charflaw/limbloss
	var/lost_zone

/datum/charflaw/limbloss/on_mob_creation(mob/user)
	return

/datum/charflaw/limbloss/arm_r
	name = "Wood Arm (R)"
	desc = "I lost my right arm long ago, but the wooden arm doesn't bleed as much... but it is flammable."
	lost_zone = BODY_ZONE_R_ARM

/datum/charflaw/limbloss/arm_r/on_mob_creation(mob/user)
	..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	var/obj/item/bodypart/r_arm/prosthetic/woodright/L = new()
	L.replace_limb(H, TRUE)

/datum/charflaw/limbloss/arm_l
	name = "Wood Arm (L)"
	desc = "I lost my left arm long ago, but the wooden arm doesn't bleed as much... but it is flammable."
	lost_zone = BODY_ZONE_L_ARM

/datum/charflaw/limbloss/arm_l/on_mob_creation(mob/user)
	..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	var/obj/item/bodypart/l_arm/prosthetic/woodleft/L = new()
	L.replace_limb(H, TRUE)

/datum/charflaw/limbloss/leg_r
	name = "Peg Leg (R)"
	desc = "I lost my right leg long ago, but the peg leg doesn't bleed as much... but it is flammable."
	lost_zone = BODY_ZONE_R_LEG

/datum/charflaw/limbloss/leg_r/on_mob_creation(mob/user)
	..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	var/obj/item/bodypart/r_leg/prosthetic/wood/L = new()
	L.replace_limb(H, TRUE)

/datum/charflaw/limbloss/leg_l
	name = "Peg Leg (L)"
	desc = "I lost my left leg long ago, but the peg leg doesn't bleed as much... but it is flammable."
	lost_zone = BODY_ZONE_L_LEG

/datum/charflaw/limbloss/leg_l/on_mob_creation(mob/user)
	..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	var/obj/item/bodypart/l_leg/prosthetic/wood/L = new()
	L.replace_limb(H, TRUE)

/datum/charflaw/limbloss/arm_r_bronze
	name = "Bronze Arm (R)"
	desc = "I lost my right arm long ago, but the bronze arm is a technological marvel!"
	lost_zone = BODY_ZONE_R_ARM

/datum/charflaw/limbloss/arm_r_bronze/on_mob_creation(mob/user)
	..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	var/obj/item/bodypart/r_arm/prosthetic/bronzeright/L = new()
	L.replace_limb(H, TRUE)

/datum/charflaw/limbloss/arm_l_bronze
	name = "Bronze Arm (L)"
	desc = "I lost my left arm long ago, but the bronze arm is a technological marvel!"
	lost_zone = BODY_ZONE_L_ARM

/datum/charflaw/limbloss/arm_l_bronze/on_mob_creation(mob/user)
	..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	var/obj/item/bodypart/l_arm/prosthetic/bronzeleft/L = new()
	L.replace_limb(H, TRUE)

/datum/charflaw/limbloss/leg_r_bronze
	name = "Bronze Leg (R)"
	desc = "I lost my right leg long ago, but the bronze leg is a technological marvel!"
	lost_zone = BODY_ZONE_R_LEG

/datum/charflaw/limbloss/leg_r_bronze/on_mob_creation(mob/user)
	..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	var/obj/item/bodypart/r_leg/prosthetic/bronze/L = new()
	L.replace_limb(H, TRUE)

/datum/charflaw/limbloss/leg_l_bronze
	name = "Bronze Leg (L)"
	desc = "I lost my left leg long ago, but the bronze leg is a technological marvel!"
	lost_zone = BODY_ZONE_L_LEG

/datum/charflaw/limbloss/leg_l_bronze/on_mob_creation(mob/user)
	..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	var/obj/item/bodypart/l_leg/prosthetic/bronze/L = new()
	L.replace_limb(H, TRUE)
