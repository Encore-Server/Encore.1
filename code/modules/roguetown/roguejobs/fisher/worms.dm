/obj/item
	var/baitpenalty = 100 // Using this as bait will incurr a penalty to fishing chance. 100 makes it useless as bait. Lower values are better, but Never make it past 10.
	var/isbait = FALSE	// Is the item in question bait to be used?
	var/list/fishloot = null

/obj/item/natural/worms
	name = "worm"
	desc = "The favorite bait of the courageous fishermen who venture these dark waters."
	icon_state = "worm"
	throwforce = 10
	baitpenalty = 10
	isbait = TRUE
	color = "#985544"
	w_class = WEIGHT_CLASS_TINY
	fishloot = list(/obj/item/reagent_containers/food/snacks/fish/carp = 10,
					/obj/item/reagent_containers/food/snacks/fish/eel = 5,
					/obj/item/reagent_containers/food/snacks/fish/angler = 1)
	drop_sound = 'sound/foley/dropsound/food_drop.ogg'
	var/plural_name = "worms"
	var/amt = 1
	var/max_amt = 6

/obj/item/natural/worms/grubs
	name = "grub"
	desc = "Bait for the desperate, or the daring."
	baitpenalty = 5
	isbait = TRUE
	color = null
	plural_name = "grubs"
	fishloot = list(
		/obj/item/reagent_containers/food/snacks/fish/carp = 5,
		/obj/item/reagent_containers/food/snacks/fish/angler = 1,
		/obj/item/reagent_containers/food/snacks/fish/clownfish = 1,
	)

/obj/item/natural/worms/murkminnow
	name = "murkminnow"
	desc = "A carrion-feeding fish that's only good as bait. Shellfish in particular seem to love it."
	icon_state = "minnow"
	color = null
	plural_name = "murkminnows"
	fishloot = list(
		/obj/item/reagent_containers/food/snacks/fish/carp = 2,
		/obj/item/reagent_containers/food/snacks/fish/angler = 2,
		/mob/living/simple_animal/hostile/retaliate/rogue/mudcrab/muckcrab = 10,
		/mob/living/simple_animal/hostile/retaliate/rogue/mudcrab = 2
	)

/obj/item/natural/worms/update_icon()
	icon_state = initial(icon_state)
	if(amt > 1)
		name = plural_name
		icon_state = "[icon_state][amt]" //since we reset the icon state to initial, this works fine
	else
		name = initial(name)

/obj/item/natural/worms/examine(mob/user)
	. = ..()
	if(amt > 1 && Adjacent(user))
		. += span_info("There are [amt] [plural_name] in the pile.")

/obj/item/natural/worms/attackby(obj/item, mob/user)
	if(item.type == type) //avoid subtypes, we want an exact match
		var/obj/item/natural/worms/W = item
		if(amt < max_amt)
			if(W.amt == 1) //If there's only one, this is e z
				amt++
				update_icon()
				to_chat(user, span_notice("I add another [initial(name)] to the pile. It now has [amt] [plural_name]."))
				qdel(item)
				return
			//If not... we have to calculate how much to take out of the other pile
			var/subtract_amt = max_amt - amt //How much to take from the other pile
			amt = min(amt + W.amt, max_amt)
			update_icon()
			W.amt = max(0, amt - subtract_amt)
			if(!W.amt) //We transferred all of them. 
				qdel(W)
			else
				W.update_icon()
			to_chat(user, span_notice("I consolidate some [plural_name] into one pile; it now has [amt] [plural_name]"))			
		else
			to_chat(user, span_notice("I don't think I can add any more to this pile..."))
		return
	..()

/obj/item/natural/worms/attack_hand(mob/user)
	if(ishuman(user) && loc == user) //Only split these stacks while we're holding them. 
		do_split(user)
		return
	..()

/obj/item/natural/worms/proc/do_split(mob/living/carbon/human/user)
	if(amt > 1)
		amt = max(amt-1, 0) //just in case, we don't want to somehow go negative
		var/obj/item/natural/worms/W = new type(get_turf(user))
		W.amt = 1 //just to be sure
		user.put_in_active_hand(W)
		update_icon()

/obj/item/natural/worms/attack_right(mob/living/carbon/human/user) //for splitting stacks while not in-hand
	if(amt > 1)
		do_split(user)
	else
		..()

/obj/item/natural/worms/Initialize()
	. = ..()
	dir = rand(0,8)