// Stuff Currently Unsorted

/obj/effect/proc_holder/spell/invoked/vigorousexchange
	name = "Vigorous Exchange"
	overlay_state = "vigorousexchange"
	releasedrain = 0
	chargedrain = 0
	chargetime = 0
	range = 1
	warnie = "sydwarning"
	movement_interrupt = FALSE
	no_early_release = TRUE
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	sound = 'sound/items/bsmithfail.ogg'
	invocation = "Guide my hand, Goler Kanh!"
	invocation_type = "shout"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = FALSE
	charge_max = 3 MINUTES
	chargetime = 2 SECONDS
	miracle = TRUE
	charging_slowdown = 3
	chargedloop = /datum/looping_sound/invokegen
	devotion_cost = 30

/obj/effect/proc_holder/spell/invoked/heatmetal
	name = "Heat Metal"
	overlay_state = "heatmetal"
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	range = 15
	warnie = "sydwarning"
	movement_interrupt = FALSE
	no_early_release = TRUE
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	sound = 'sound/items/bsmithfail.ogg'
	invocation = "Through faith, heat manifest!"
	invocation_type = "shout"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = FALSE
	charge_max = 2 MINUTES
	chargetime = 2 SECONDS
	miracle = TRUE
	charging_slowdown = 3
	chargedloop = /datum/looping_sound/invokegen
	devotion_cost = 40

/obj/effect/proc_holder/spell/invoked/hammerfall
	name = "Hammerfall"
	overlay_state = "Hammerfall"
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	range = 15
	warnie = "sydwarning"
	movement_interrupt = FALSE
	no_early_release = TRUE
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	sound = 'sound/items/bsmithfail.ogg'
	invocation = "By molten might and hammer's weight, in Goler Kanh's palm, the earth shall quake!"
	invocation_type = "shout"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 5 MINUTES
	chargetime = 2 SECONDS
	miracle = TRUE
	charging_slowdown = 3
	chargedloop = /datum/looping_sound/invokegen
	devotion_cost = 80

/obj/effect/proc_holder/spell/invoked/craftercovenant
	name = "The Crafter’s Covenant"
	overlay_state = "craftercovenant"
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	range = 1
	warnie = "sydwarning"
	movement_interrupt = TRUE
	no_early_release = TRUE
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	sound = 'sound/items/bsmithfail.ogg'
	invocation = "Goler Kanh, grant your servant your riches!"
	invocation_type = "shout"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = FALSE
	charge_max = 25 MINUTES
	chargetime = 10 SECONDS
	miracle = TRUE
	charging_slowdown = 3
	chargedloop = /datum/looping_sound/invokegen
	devotion_cost = 100

/obj/effect/proc_holder/spell/invoked/heatmetal/cast(list/targets, mob/user = usr)
	. = ..()
	var/list/nosmeltore = list(/obj/item/rogueore/coal)
	var/datum/effect_system/spark_spread/sparks = new()
	var/target
	for(var/i in targets)
		target = i
	if (!target)
		return
	if(target in nosmeltore)
		return
	if (istype(target, /obj/item))
		handle_item_smelting(target, user, sparks, nosmeltore)
	else if (iscarbon(target))
		handle_living_entity(target, user, nosmeltore)

/proc/show_visible_message(mob/user, text, selftext)
	var/text_to_send = addtext("<font color='yellow'>", text, "</font>")
	var/selftext_to_send = addtext("<font color='yellow'>", selftext, "</font>")
	user.visible_message(text_to_send, selftext_to_send)

/proc/handle_item_smelting(obj/item/target, mob/user, datum/effect_system/spark_spread/sparks, list/nosmeltore)
	if (!target.smeltresult) return
	var/obj/item/itemtospawn = target.smeltresult
	show_visible_message(user, "After [user]'s incantation, [target] glows brightly and melts into an ingot.", null)
	new itemtospawn(target.loc)
	sparks.set_up(1, 1, target.loc)
	sparks.start()
	qdel(target)

/proc/handle_living_entity(mob/target, mob/user, list/nosmeltore)
	var/obj/item/targeteditem = get_targeted_item(user, target)
	if (!targeteditem || targeteditem.smeltresult == /obj/item/ash || target.anti_magic_check(TRUE,TRUE)) 
		show_visible_message(user, "After their incantation, [user] points at [target] but it seems to have no effect.", "After your incantation, you point at [target] but it seems to have no effect.")
		return
	if (istype(targeteditem, /obj/item/rogueweapon/tongs))
		handle_tongs(targeteditem, user)
	else if (should_heat_in_hand(user, target, targeteditem, nosmeltore))
		handle_heating_in_hand(target, targeteditem, user)
	else
		handle_heating_equipped(target, targeteditem, user)

/proc/get_targeted_item(mob/user, mob/target)
    var/target_item
    switch(user.zone_selected)
        if (BODY_ZONE_PRECISE_R_HAND)
            target_item = target.held_items[2]
        if (BODY_ZONE_PRECISE_L_HAND)
            target_item = target.held_items[1]
        if (BODY_ZONE_HEAD)
            target_item = target.get_item_by_slot(SLOT_HEAD)
        if (BODY_ZONE_PRECISE_EARS)
            target_item = target.get_item_by_slot(SLOT_HEAD)
        if (BODY_ZONE_CHEST)
            if(target.get_item_by_slot(SLOT_ARMOR))
                target_item = target.get_item_by_slot(SLOT_ARMOR)
            else if (target.get_item_by_slot(SLOT_SHIRT))
                target_item = target.get_item_by_slot(SLOT_SHIRT)    
        if (BODY_ZONE_PRECISE_NECK)
            target_item = target.get_item_by_slot(SLOT_NECK)
        if (BODY_ZONE_PRECISE_R_EYE)
            target_item = target.get_item_by_slot(ITEM_SLOT_MASK)
        if ( BODY_ZONE_PRECISE_L_EYE)
            target_item = target.get_item_by_slot(ITEM_SLOT_MASK)
        if (BODY_ZONE_PRECISE_NOSE)
            target_item = target.get_item_by_slot(ITEM_SLOT_MASK)
        if (BODY_ZONE_PRECISE_MOUTH)
            target_item = target.get_item_by_slot(ITEM_SLOT_MOUTH)
        if (BODY_ZONE_L_ARM)
            target_item = target.get_item_by_slot(ITEM_SLOT_WRISTS)
        if (BODY_ZONE_R_ARM)
            target_item = target.get_item_by_slot(ITEM_SLOT_WRISTS)
        if (BODY_ZONE_L_LEG)
            target_item = target.get_item_by_slot(ITEM_SLOT_PANTS)
        if (BODY_ZONE_R_LEG)
            target_item = target.get_item_by_slot(ITEM_SLOT_PANTS)
        if (BODY_ZONE_PRECISE_GROIN)
            target_item = target.get_item_by_slot(ITEM_SLOT_PANTS)
        if (BODY_ZONE_PRECISE_R_FOOT)
            target_item = target.get_item_by_slot(ITEM_SLOT_SHOES)
        if (BODY_ZONE_PRECISE_L_FOOT)
            target_item = target.get_item_by_slot(ITEM_SLOT_SHOES)
    return target_item

/proc/handle_tongs(obj/item/rogueweapon/tongs/T, mob/user) //Stole the code from smithing.
	if (!T.hingot) return
	var/tyme = world.time
	T.hott = tyme
	addtimer(CALLBACK(T, TYPE_PROC_REF(/obj/item/rogueweapon/tongs, make_unhot), tyme), 100)
	T.update_icon()
	show_visible_message(user, "After [user]'s incantation, the ingot inside [T] starts glowing.", "After your incantation, the ingot inside [T] starts glowing.")

/proc/handle_heating_in_hand(mob/living/carbon/target, obj/item/targeteditem, mob/user)
	var/datum/effect_system/spark_spread/sparks = new()
	apply_damage_to_hands(target, user)
	target.dropItemToGround(targeteditem)
	show_visible_message(target, "[target]'s [targeteditem.name] glows brightly, searing their flesh.", "Your [targeteditem.name] glows brightly, It burns!")
	target.emote("painscream")
	playsound(target.loc, 'sound/misc/frying.ogg', 100, FALSE, -1)
	sparks.set_up(1, 1, target.loc)
	sparks.start()

/proc/should_heat_in_hand(mob/user, mob/target, obj/item/targeteditem, list/nosmeltore)
	return ((user.zone_selected == BODY_ZONE_PRECISE_L_HAND && target.held_items[1]) || (user.zone_selected == BODY_ZONE_PRECISE_R_HAND && target.held_items[2])) && !(targeteditem in nosmeltore) && targeteditem.smeltresult

/proc/apply_damage_to_hands(mob/living/carbon/target, mob/user)
	var/obj/item/bodypart/affecting
	var/const/adth_damage_to_apply = 10 //How much damage should burning your hand before dropping the item do.
	if (user.zone_selected == BODY_ZONE_PRECISE_R_HAND)
		affecting = target.get_bodypart(BODY_ZONE_R_ARM)
	else if (user.zone_selected == BODY_ZONE_PRECISE_L_HAND)
		affecting = target.get_bodypart(BODY_ZONE_L_ARM)
	affecting.receive_damage(0, adth_damage_to_apply)

/proc/handle_heating_equipped(mob/living/carbon/target, obj/item/clothing/targeteditem, mob/user)
	var/obj/item/armor = target.get_item_by_slot(SLOT_ARMOR)
	var/obj/item/shirt = target.get_item_by_slot(SLOT_SHIRT)
	var/armor_can_heat = armor && armor.smeltresult && armor.smeltresult != /obj/item/ash
	var/shirt_can_heat = shirt && shirt.smeltresult && shirt.smeltresult != /obj/item/ash // Full damage if no shirt 
	var/damage_to_apply = 20 // How much damage should your armor burning you should do.
	if (user.zone_selected == BODY_ZONE_CHEST)
		if (armor_can_heat && (!shirt_can_heat && shirt))
			damage_to_apply = damage_to_apply / 2 // Halve the damage if only armor can heat but shirt can't.
		if (targeteditem == shirt & armor_can_heat) //this looks redundant but it serves to make sure the damage is doubled if both shirt and armor are metallic.
			apply_damage_if_covered(target, list(BODY_ZONE_CHEST), armor, CHEST, damage_to_apply)
		else if (targeteditem == armor & shirt_can_heat)
			apply_damage_if_covered(target, list(BODY_ZONE_CHEST), shirt, CHEST, damage_to_apply)
	apply_damage_if_covered(target, list(BODY_ZONE_CHEST), targeteditem, CHEST, damage_to_apply)
	apply_damage_if_covered(target, list(BODY_ZONE_L_ARM, BODY_ZONE_R_ARM), targeteditem, ARMS|HANDS, damage_to_apply)
	apply_damage_if_covered(target, list(BODY_ZONE_L_LEG, BODY_ZONE_R_LEG), targeteditem, GROIN|LEGS|FEET, damage_to_apply)
	apply_damage_if_covered(target, list(BODY_ZONE_HEAD), targeteditem, HEAD|HAIR|NECK|NOSE|MOUTH|EARS|EYES, damage_to_apply)
	show_visible_message(target, "[target]'s [targeteditem.name] glows brightly, searing their flesh.", "My [targeteditem.name] glows brightly, It burns!")
	playsound(target.loc, 'sound/misc/frying.ogg', 100, FALSE, -1)

/proc/apply_damage_if_covered(mob/living/carbon/target, list/body_zones, obj/item/clothing/targeteditem, mask, damage)
	var/datum/effect_system/spark_spread/sparks = new()
	var/obj/item/bodypart/affecting = null
	for (var/zone in body_zones)
	{
		if (targeteditem.body_parts_covered & mask)
			affecting = target.get_bodypart(zone)
		if (affecting)
			affecting.receive_damage(0, damage)
			sparks.set_up(1, 1, target.loc)
			sparks.start()
	}

/obj/effect/proc_holder/spell/invoked/vigorousexchange/cast(list/targets, mob/living/carbon/user = usr)
	. = ..()
	var/const/starminatoregen = 500 // How much stamina should the spell give back to the caster.
	var/mob/target = targets[1]
	if (!iscarbon(target)) 
		return
	if (target == user)
		target.rogstam_add(starminatoregen)
		show_visible_message(usr, "As [user] intones the incantation, vibrant flames swirl around them.", "As you intones the incantation, vibrant flames swirl around you, You feel refreshed.")
	else if (user.rogstam > (starminatoregen * 2))
		user.rogstam_add(-(starminatoregen * 2))
		target.rogstam_add(starminatoregen * 2)
		show_visible_message(target, "As [user] intones the incantation, vibrant flames swirl around them, a dance of energy flowing towards [target].", "As [user] intones the incantation, vibrant flames swirl around them, a dance of energy flowing towards you. You feel refreshed")

/obj/effect/proc_holder/spell/invoked/craftercovenant/cast(list/targets, mob/user = usr)
	. = ..()
	var/tithe = 0
	var/list/doable[][] = list()
	var/const/divine_tax = 2 // Multiplier used to adjust the price that should be paid.
	var/buyprice = 0
	var/turf/altar
	var/datum/effect_system/spark_spread/sparks = new()
	altar = get_turf(targets[1])
	if(!altar)
		return
	for (var/obj/item/sacrifice in altar.contents)
	{
		if (istype(sacrifice, /obj/item/roguecoin/))
			var/obj/item/roguecoin/coincrifice = sacrifice
			tithe += (coincrifice.quantity * coincrifice.sellprice)
		else if (istype(sacrifice, /obj/item/roguestatue/) || istype(sacrifice, /obj/item/clothing/ring/) || istype(sacrifice, /obj/item/roguegem/))
			tithe += sacrifice.sellprice
		qdel(sacrifice)
	}
	buyprice = tithe / divine_tax
	for (var/list/entry in anvil_recipe_prices)
	{
		var/obj/item/tentative_item = entry[1] // The recipe
		var/total_sellprice = entry[2] // The precompiled material price
		if (total_sellprice <= buyprice)
			var/obj/itemtorecord = tentative_item
			doable += list(list(itemtorecord.name, itemtorecord))
	}
	if (!doable.len)
		show_visible_message(usr, "A wave of heat washes over the pile as [user] speaks Goler Kanh's name. The pile of valuables crumble into dust.", "A wave of heat washes over the pile as you speak Goler Kanh's name. The pile of valuables crumble into dust. Goler Kanh accepted your sacrifice. Yet it seems it wasn't enough.")
		return
	var/list/doablename = list()
	var/list/item_map = list()
	for (var/list/doableextract in doable)
	{
		doablename += list(doableextract[1])
		item_map[doableextract[1]] = doableextract[2]
	}
	var/itemchoice = input(user, "Choose your boon", "Available boons") in (doablename)
	if (itemchoice)
		var/obj/item/itemtospawn = item_map[itemchoice]
		if (itemtospawn)
			new itemtospawn.type(altar)
			sparks.set_up(1, 1, altar)
			sparks.start()
			show_visible_message(usr, "A wave of heat washes over the pile as [user] speaks Goler Kanh's name. The pile of valuables crumble into dust, only for the dust to reform into an item as if reborn from the flames. Goler Kanh has accepted the offering.", "A wave of heat washes over the pile as you speak Goler Kanh's name. The pile of valuables crumble into dust, only for the dust to reform into an item as if reborn from the flames. Goler Kanh has accepted the offering.")

var/global/list/anvil_recipe_prices[][]
/proc/add_recipe_to_global(var/datum/anvil_recipe/recipe)
	var/total_sellprice = 0
	var/obj/item/ingot/bar = recipe.req_bar
	var/obj/item/itemtosend = null
	if (bar)
		total_sellprice += bar.sellprice
		itemtosend = recipe.created_item
	if (recipe.additional_items)
		for (var/obj/additional_item in recipe.additional_items)
			total_sellprice += additional_item.sellprice
	if (istype(recipe.created_item, /list))
		var/list/itemlist = recipe.created_item
		total_sellprice = total_sellprice/itemlist.len
		itemtosend = recipe.created_item[1]
	if (!istype(recipe.created_item, /list))
		itemtosend = recipe.created_item
	if (total_sellprice > 0)
		global.anvil_recipe_prices += list(list(itemtosend, total_sellprice))

/proc/initialize_anvil_recipe_prices()
	for (var/datum/anvil_recipe/armor/recipe)
	{
		add_recipe_to_global(recipe)
	}
	for (var/datum/anvil_recipe/tools/recipe)
	{
		add_recipe_to_global(recipe)
	}
	for (var/datum/anvil_recipe/weapons/recipe)
	{
		add_recipe_to_global(recipe)
	}
	global.anvil_recipe_prices += list(list(new /obj/item/rogue/instrument/flute, 10))
	global.anvil_recipe_prices += list(list(new /obj/item/rogue/instrument/drum, 10))
	global.anvil_recipe_prices += list(list(new /obj/item/rogue/instrument/harp, 20))
	global.anvil_recipe_prices += list(list(new /obj/item/rogue/instrument/lute, 20))
	global.anvil_recipe_prices += list(list(new /obj/item/rogue/instrument/guitar, 30))
	global.anvil_recipe_prices += list(list(new /obj/item/rogue/instrument/accord, 30))
	global.anvil_recipe_prices += list(list(new /obj/item/riddleofsteel, 400))
	global.anvil_recipe_prices += list(list(new /obj/item/dmusicbox, 500))
	// Add any other recipe types if needed

/world/New()
	..()
	initialize_anvil_recipe_prices() // Precompute recipe prices on startup

/obj/effect/proc_holder/spell/invoked/hammerfall/cast(list/targets, mob/user = usr)
	var/turf/fallzone = null
	var/const/damage = 1000 //Structural damage the spell does. At 250, it would take 4 casts (8 minutes and 320 devotion) to destroy a normal door.
	var/const/radius = 1 //Radius of the spell
	var/const/shakeradius = 14 //Radius of the quake
	var/diceroll = 0
	var/const/dc = 42 //Code will roll 2d20 and add target's perception and Speed then compare to this to see if they fall down or not. 42 Means they need to roll 2x 20 with Speed and Perception at I
	var/const/delay = 2 SECONDS // Delay between the ground marking appearing and the effect playing.
	fallzone = get_turf(targets[1])
	if(!fallzone)
		return
	else
		show_visible_message(usr, "[usr] raises their arm, conjuring a hammer wreathed in molten fire. As they hurl it toward the ground, the earth trembles under its impact, shaking its very foundations!", "You raise your arm, conjuring a hammer wreathed in molten fire. As you hurl it toward the ground, the earth trembles under its impact, shaking its very foundations!")
	for (var/turf/open/visual in view(radius, fallzone))
		var/obj/effect/temp_visual/lavastaff/Lava = new /obj/effect/temp_visual/lavastaff(visual)
		animate(Lava, alpha = 255, time = 5)
	sleep(delay)
	for (var/mob/living/carbon/screenshaken in view(shakeradius, fallzone))
		shake_camera(screenshaken, 5, 5)
	for (var/mob/living/carbon/shaken in view(radius, fallzone))
		diceroll = roll(2,20) + shaken.STAPER + shaken.STASPD
		if (diceroll > dc)
			shaken.apply_effect(1 SECONDS, EFFECT_IMMOBILIZE, 0)
			show_visible_message(shaken, null, "The ground quakes but I manage to keep my footing.")
		else
			shaken.apply_effect(1 SECONDS, EFFECT_KNOCKDOWN, 0)		
			show_visible_message(shaken, null, "The ground quakes, making me fall over.")
	for (var/obj/structure/damaged in view(radius, fallzone))
		if(!istype(damaged, /obj/structure/flora/newbranch))
			damaged.take_damage(damage,BRUTE,"blunt",1)
	for (var/turf/closed/wall/damagedwalls in view(radius, fallzone))
		damagedwalls.take_damage(damage,BRUTE,"blunt",1)
	for (var/turf/closed/mineral/aoemining in view(radius, fallzone))
		aoemining.lastminer = usr
		aoemining.take_damage(damage,BRUTE,"blunt",1)

/obj/effect/proc_holder/spell/invoked/goler_Kanh_rogue
	name = "Goler Kanh's Fire"
	overlay_state = "sacredflame"
	releasedrain = 15
	chargedrain = 0
	chargetime = 0
	range = 15
	warnie = "sydwarning"
	movement_interrupt = FALSE
	chargedloop = null
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	sound = 'sound/magic/heal.ogg'
	invocation = "Flame."
	invocation_type = "whisper"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 15 SECONDS
	miracle = TRUE
	devotion_cost = 15

/obj/effect/proc_holder/spell/invoked/malum_flame_rogue/cast(list/targets, mob/user = usr)
	. = ..()
	if(isliving(targets[1]))
		var/mob/living/L = targets[1]
		user.visible_message("<font color='yellow'>[user] points at [L]!</font>")
		if(L.anti_magic_check(TRUE, TRUE))
			return FALSE
		L.adjust_fire_stacks(1)
		L.IgniteMob()
		return TRUE

	// Spell interaction with ignitable objects (burn wooden things, light torches up)
	else if(isobj(targets[1]))
		var/obj/O = targets[1]
		if(O.fire_act())
			user.visible_message("<font color='yellow'>[user] points at [O], igniting it with sacred flames!</font>")
			return TRUE
		else
			to_chat(user, span_warning("You point at [O], but it fails to catch fire."))
			return FALSE
	return FALSE


/obj/effect/temp_visual/lavastaff
	icon_state = "lavastaff_warn"
	duration = 50



/obj/effect/proc_holder/spell/invoked/mockery
	name = "Vicious Mockery"
	releasedrain = 50
	associated_skill = /datum/skill/misc/music
	charge_max = 1 
	range = 7

/obj/effect/proc_holder/spell/invoked/mockery/cast(list/targets, mob/user = usr)
	playsound(get_turf(user), 'sound/magic/mockery.ogg', 40, FALSE)
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(target.anti_magic_check(TRUE, TRUE))
			return FALSE
		if(!target.can_hear()) // Vicious mockery requires people to be able to hear you.
			revert_cast()
			return FALSE
		target.apply_status_effect(/datum/status_effect/debuff/viciousmockery)	
		return TRUE
	revert_cast()
	return FALSE

/obj/effect/proc_holder/spell/invoked/mockery/invocation(mob/user = usr)
	var/input = input(user, "What do you wish to say?")
	user.say(input)

/datum/status_effect/debuff/viciousmockery
	id = "viciousmockery"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/viciousmockery
	duration = 600 // One minute
	effectedstats = list("strength" = -1, "speed" = -1,"endurance" = -1, "intelligence" = -3)

/atom/movable/screen/alert/status_effect/debuff/viciousmockery
	name = "Vicious Mockery"
	desc = "<span class='warning'>THAT ARROGANT BARD! ARGH!</span>\n"
	icon_state = "muscles"



/obj/effect/proc_holder/spell/invoked/regression
	name = "Regression"
	overlay_state = "regression"
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	range = 4
	warnie = "sydwarning"
	movement_interrupt = FALSE
	//sound = list('sound/magic/regression1.ogg','sound/magic/regression2.ogg','sound/magic/regression3.ogg','sound/magic/regression4.ogg')
	invocation_type = "none"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 10 SECONDS
	miracle = TRUE
	devotion_cost = 10

/obj/effect/proc_holder/spell/invoked/regression/cast(list/targets, mob/living/user)
	. = ..()
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		target.visible_message(span_info("Order filled magic rewind [target]'s wounds!"), span_notice("My wounds, undone!"))
		var/healing = 2.5
		if(target.has_status_effect(/datum/status_effect/buff/stasis))
			healing += 2.5
		target.apply_status_effect(/datum/status_effect/buff/healing, healing)
		return TRUE
	revert_cast()
	return FALSE

/obj/effect/proc_holder/spell/invoked/convergence
	name = "Convergence"
	overlay_state = "convergence"
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	range = 4
	warnie = "sydwarning"
	movement_interrupt = FALSE
//	chargedloop = /datum/looping_sound/invokeholy
	chargedloop = null
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	//sound = list('sound/magic/convergence1.ogg','sound/magic/convergence2.ogg','sound/magic/convergence3.ogg','sound/magic/convergence4.ogg')
	invocation_type = "none"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 20 SECONDS
	miracle = TRUE
	devotion_cost = 20

/obj/effect/proc_holder/spell/invoked/convergence/cast(list/targets, mob/living/user)
	. = ..()
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		target.visible_message(span_info("A convergence of fates surrounds [target]!"), span_notice("My past and present converge as one!"))
		if(iscarbon(target))
			var/mob/living/carbon/C = target
			C.apply_status_effect(/datum/status_effect/buff/convergence)
			C.apply_status_effect(/datum/status_effect/buff/fortify)
		else
			target.adjustBruteLoss(-50)
			target.adjustFireLoss(-50)
		return TRUE
	revert_cast()
	return FALSE


/obj/effect/proc_holder/spell/invoked/stasis
	name = "Stasis"
	desc = "You capture your target's current state in time, reverting them to such a state several seconds later."
	releasedrain = 35
	chargedrain = 1
	chargetime = 30
	charge_max = 60 SECONDS
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	charging_slowdown = 3
	//sound = 'sound/magic/timeforward.ogg'
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/holy
	overlay_state = "sands_of_time"
	var/brute = 0
	var/burn = 0
	var/oxy = 0
	var/toxin = 0
	var/turf/origin
	var/firestacks = 0
	var/blood = 0
	miracle = TRUE
	devotion_cost = 30

/obj/effect/proc_holder/spell/invoked/stasis/cast(list/targets, mob/user = usr)
	if(isliving(targets[1]))
		var/mob/living/carbon/target = targets[1]
		var/mob/living/carbon/C = target
		C.apply_status_effect(/datum/status_effect/buff/stasis)
		brute = target.getBruteLoss()
		burn = target.getFireLoss()
		oxy = target.getOxyLoss()
		toxin = target.getToxLoss()
		origin = get_turf(target)
		firestacks = target.fire_stacks
		blood = target.blood_volume
		to_chat(target, span_warning("I feel a part of me was left behind..."))
		//play_indicator(target,'icons/mob/overhead_effects.dmi', "timestop", 100, OBJ_LAYER)
		addtimer(CALLBACK(src, PROC_REF(remove_buff), target), wait = 10 SECONDS)
		return TRUE


/obj/effect/proc_holder/spell/invoked/stasis/proc/remove_buff(mob/living/carbon/target)
	do_teleport(target, origin, no_effects=TRUE)
	target.adjust_fire_stacks(target.fire_stacks*-1 + firestacks)
	var/brutenew = target.getBruteLoss()
	var/burnnew = target.getFireLoss()
	var/oxynew = target.getOxyLoss()
	var/toxinnew = target.getToxLoss()
	if(target.has_status_effect(/datum/status_effect/buff/convergence))
		if(brutenew>brute)
			target.adjustBruteLoss(brutenew*-1 + brute)
		if(burnnew>burn)
			target.adjustFireLoss(burnnew*-1 + burn)
		if(oxynew>oxy)
			target.adjustOxyLoss(oxynew*-1 + oxy)
		if(toxinnew>toxin)
			target.adjustToxLoss(target.getToxLoss()*-1 + toxin)
		if(target.blood_volume<blood)
			target.blood_volume = blood
	else
		target.adjustBruteLoss(brutenew*-1 + brute)
		target.adjustFireLoss(burnnew*-1 + burn)
		target.adjustOxyLoss(oxynew*-1 + oxy)
		target.adjustToxLoss(target.getToxLoss()*-1 + toxin)
		target.blood_volume = blood
	//playsound(target.loc, 'sound/magic/timereverse.ogg', 100, FALSE)

/obj/effect/proc_holder/spell/invoked/stasis/proc/play_indicator(mob/living/carbon/target, icon_path, overlay_name, clear_time, overlay_layer)
	if(!ishuman(target))
		return
	if(target.stat != DEAD)
		var/mob/living/carbon/humie = target
		var/datum/species/species =	humie.dna.species
		var/list/offset_list
		if(humie.gender == FEMALE)
			offset_list = species.offset_features[OFFSET_HEAD_F]
		else
			offset_list = species.offset_features[OFFSET_HEAD]
			var/mutable_appearance/appearance = mutable_appearance(icon_path, overlay_name, overlay_layer)
			if(offset_list)
				appearance.pixel_x += (offset_list[1])
				appearance.pixel_y += (offset_list[2]+12)
			appearance.appearance_flags = RESET_COLOR
			target.overlays_standing[OBJ_LAYER] = appearance
			target.apply_overlay(OBJ_LAYER)
			update_icon()
			addtimer(CALLBACK(humie, PROC_REF(clear_overhead_indicator), appearance, target), clear_time)

/obj/effect/proc_holder/spell/invoked/stasis/proc/clear_overhead_indicator(appearance,mob/living/carbon/target)
	target.remove_overlay(OBJ_LAYER)
	cut_overlay(appearance, TRUE)
	qdel(appearance)
	update_icon()
	return


//Divine Strike - Enhance your held weapon to have the next strike do extra damage and slow the target. Undead debuffed more.
/obj/effect/proc_holder/spell/self/divine_strike
	name = "Divine Strike"
	overlay = "createlight"
	charge_max = 1 MINUTES
	movement_interrupt = FALSE
	chargedrain = 0
	chargetime = 1 SECONDS
	charging_slowdown = 2
	chargedloop = null
	associated_skill = /datum/skill/magic/holy
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	sound = 'sound/magic/timestop.ogg'
	invocation = "By Mjallidhorn, stand and fight!"
	invocation_type = "shout"
	antimagic_allowed = TRUE
	miracle = TRUE
	devotion_cost = 30

/obj/effect/proc_holder/spell/self/divine_strike/cast(mob/living/user)
	if(!isliving(user))
		return FALSE
	user.apply_status_effect(/datum/status_effect/divine_strike, user.get_active_held_item())
	return ..()

/datum/status_effect/divine_strike
	id = "divine_strike"
	status_type = STATUS_EFFECT_UNIQUE
	duration = 15 SECONDS
	alert_type = /atom/movable/screen/alert/status_effect/buff/divine_strike
	on_remove_on_mob_delete = TRUE
	var/datum/weakref/buffed_item

/datum/status_effect/divine_strike/on_creation(mob/living/new_owner, obj/item/I)
	. = ..()
	if(!.)
		return
	if(istype(I) && !(I.item_flags & ABSTRACT))
		// buffed_item = WEAKREF(I)
		//if(!I.light_outer_range && I.light_system == STATIC_LIGHT) We do not currently use this lighting system
		//	I.set_light(1)
		RegisterSignal(I, COMSIG_ITEM_AFTERATTACK, PROC_REF(item_afterattack))
	else
		RegisterSignal(owner, COMSIG_MOB_ATTACK_HAND, PROC_REF(hand_attack))

/datum/status_effect/divine_strike/on_remove()
	. = ..()
	UnregisterSignal(owner, COMSIG_MOB_ATTACK_HAND)
	if(buffed_item)
		var/obj/item/I = buffed_item.resolve()
		if(istype(I))
			I.set_light(0)
		UnregisterSignal(I, COMSIG_ITEM_AFTERATTACK)

/datum/status_effect/divine_strike/proc/item_afterattack(obj/item/source, atom/target, mob/user, proximity_flag, click_parameters)
	if(!proximity_flag)
		return
	if(!isliving(target))
		return
	var/mob/living/living_target = target
	living_target.apply_status_effect(/datum/status_effect/debuff/chained_burden)
	living_target.visible_message(span_warning("The strike from [user]'s weapon causes [living_target] to go stiff!"), vision_distance = COMBAT_MESSAGE_RANGE)
	qdel(src)

/datum/status_effect/divine_strike/proc/hand_attack(datum/source, mob/living/carbon/human/M, mob/living/carbon/human/H, datum/martial_art/attacker_style)
	if(!istype(M))
		return
	if(!istype(H))
		return
	if(!istype(M.used_intent, INTENT_HARM))
		return
	H.apply_status_effect(/datum/status_effect/debuff/chained_burden)
	H.visible_message(span_warning("The strike from [M]'s fist causes [H] to go stiff!"), vision_distance = COMBAT_MESSAGE_RANGE)
	qdel(src)

//Call to Arms - AoE buff for all people surrounding you.
//Call to Arms - AoE buff for all people surrounding you.
/obj/effect/proc_holder/spell/self/call_to_arms
	name = "Call to Arms"
	desc = "Grants you and all allies nearby a buff to their strength, endurance, and constitution."
	overlay_state = "call_to_arms"
	charge_max = 5 MINUTES
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	invocation = "FOR DEATH AND GLORY!"
	invocation_type = "shout"
	sound = 'sound/magic/timestop.ogg'
	releasedrain = 30
	miracle = TRUE
	devotion_cost = 40

/obj/effect/proc_holder/spell/self/call_to_arms/cast(list/targets,mob/living/user = usr)
	for(var/mob/living/carbon/target in view(3, get_turf(user)))
		if(istype(target.patron, /datum/patron/heretic))
			target.apply_status_effect(/datum/status_effect/debuff/call_to_arms)	//Debuffs heretics.
			return
		if(istype(target.patron, /datum/patron/elemental))
			to_chat(target, span_danger("You feel a hot-wave wash over you, leaving as quickly as it came.."))	//No effect on Psydonians!
			target.apply_status_effect(/datum/status_effect/buff/call_to_arms)
			return
	return ..()

/atom/movable/screen/alert/status_effect/buff/divine_strike
	name = "Divine Strike"
	desc = "Your next attack deals additional damage and slows your target."
	icon_state = "stressvg"

/obj/effect/proc_holder/spell/self/call_to_slaughter
	name = "Call to Slaughter"
	desc = "Grants you and all allies nearby a buff to their strength, endurance, and constitution."
	overlay_state = "call_to_slaughter"
	charge_max = 5 MINUTES
	invocation = "LAMBS TO THE SLAUGHTER!"
	invocation_type = "shout"
	sound = 'sound/magic/timestop.ogg'
	releasedrain = 30
	miracle = TRUE
	devotion_cost = 40

/obj/effect/proc_holder/spell/self/call_to_slaughter/cast(list/targets,mob/living/user = usr)
	for(var/mob/living/carbon/target in view(3, get_turf(user)))
		if(istype(target.patron, /datum/patron/heretic))
			target.apply_status_effect(/datum/status_effect/buff/call_to_slaughter)	//Buffs inhumens
			return
		if(!user.faction_check_mob(target))
			continue
		if(target.mob_biotypes & MOB_UNDEAD)
			continue
		target.apply_status_effect(/datum/status_effect/debuff/call_to_slaughter)	//Debuffs non-inhumens/psydonians
	return ..()

//Revel in Slaughter - Self-healing by consuming blood around you; large healing, has delay though.
/obj/effect/proc_holder/spell/invoked/revel_in_slaughter
	name = "Revel in Slaughter"
	desc = "The blood of your enemy shall boil, their skin feeling as if it's being ripped apart! Gaggar demands their blood must FLOW!!!."
	overlay_state = "bloodsteal"
	charge_max = 5 MINUTES
	invocation = "YOUR BLOOD WILL BOIL TILL IT'S SPILLED!"
	invocation_type = "shout"
	sound = 'sound/magic/antimagic.ogg'
	releasedrain = 30
	miracle = TRUE
	devotion_cost = 70

/obj/effect/proc_holder/spell/invoked/revel_in_slaughter/cast(atom/A, list/targets, mob/living/user = usr)
	. = ..()
	var/success = 0
	for(var/obj/effect/decal/cleanable/blood/B in view(3, user))
		success++
		qdel(B)
	if(!success)	//Checks if there's blood around you. It's NEEEEEDED!!!
		to_chat(user, span_warning("I need blood around me to !"))
		return FALSE
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(ishuman(target)) //BLEED AND PAIN
			var/mob/living/carbon/human/human_target = target
			var/datum/physiology/phy = human_target.physiology
			phy.bleed_mod *= 1.5
			phy.pain_mod *= 1.5
			addtimer(VARSET_CALLBACK(phy, bleed_mod, phy.bleed_mod /= 1.5), 25 SECONDS)
			addtimer(VARSET_CALLBACK(phy, pain_mod, phy.pain_mod /= 1.5), 15 SECONDS)
			human_target.visible_message(span_danger("[target]'s wounds become inflammed as their vitality is sapped away!"))
			to_chat(target, span_warning("My skins feels like pins and needles, as if something were ripping and tearing at me!"))
			return ..()
