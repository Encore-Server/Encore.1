
GLOBAL_LIST_EMPTY(parasites) //all currently existing/living guardians

#define GUARDIAN_HANDS_LAYER 1
#define GUARDIAN_TOTAL_LAYERS 1

/mob/living/simple_animal/hostile/guardian
	name = "Guardian Spirit"
	real_name = "Guardian Spirit"
	desc = ""
	speak_emote = list("hisses")
	gender = NEUTER
	mob_biotypes = NONE
	bubble_icon = "guardian"
	response_help_continuous = "passes through"
	response_help_simple = "pass through"
	response_disarm_continuous = "flails at"
	response_disarm_simple = "flail at"
	response_harm_continuous = "punches"
	response_harm_simple = "punch"
	icon = 'icons/mob/guardian.dmi'
	icon_state = "magicOrange"
	icon_living = "magicOrange"
	icon_dead = "magicOrange"
	speed = 0
	a_intent = INTENT_HARM
	stop_automated_movement = 1
	movement_type = FLYING // Immunity to chasms and landmines, etc.
	attack_sound = 'sound/blank.ogg'
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	maxbodytemp = INFINITY
	attack_verb_continuous = "punches"
	attack_verb_simple = "punch"
	maxHealth = INFINITY //The spirit itself is invincible
	health = INFINITY
	healable = FALSE //don't brusepack the guardian
	damage_coeff = list(BRUTE = 0.5, BURN = 0.5, TOX = 0.5, CLONE = 0.5, STAMINA = 0, OXY = 0.5) //how much damage from each damage type we transfer to the owner
	environment_smash = ENVIRONMENT_SMASH_STRUCTURES
	obj_damage = 40
	melee_damage_lower = 15
	melee_damage_upper = 15
	butcher_results = list(/obj/item/ectoplasm = 1)
	AIStatus = AI_OFF
	hud_type = /datum/hud/guardian
	dextrous_hud_type = /datum/hud/dextrous/guardian //if we're set to dextrous, account for it.
	var/list/guardian_overlays[GUARDIAN_TOTAL_LAYERS]
	var/reset = 0 //if the summoner has reset the guardian already
	var/cooldown = 0
	var/mob/living/summoner
	var/range = 10 //how far from the user the spirit can be
	var/toggle_button_type = /atom/movable/screen/guardian/ToggleMode/Inactive //what sort of toggle button the hud uses
	var/datum/guardianname/namedatum = new/datum/guardianname()
	var/playstyle_string = span_holoparasitebold("I am a standard Guardian. You shouldn't exist!")
	var/magic_fluff_string = span_holoparasite("I draw the Coder, symbolizing bugs and errors. This shouldn't happen! Submit a bug report!")
	var/tech_fluff_string = span_holoparasite("BOOT SEQUENCE COMPLETE. ERROR MODULE LOADED. THIS SHOULDN'T HAPPEN. Submit a bug report!")
	var/carp_fluff_string = span_holoparasite("CARP CARP CARP SOME SORT OF HORRIFIC BUG BLAME THE CODERS CARP CARP CARP")

/mob/living/simple_animal/hostile/guardian/Initialize(mapload, theme)
	GLOB.parasites += src
	setthemename(theme)

	. = ..()

/mob/living/simple_animal/hostile/guardian/med_hud_set_health()
	if(summoner)
		var/image/holder = hud_list[HEALTH_HUD]
		holder.icon_state = "hud[RoundHealth(summoner)]"

/mob/living/simple_animal/hostile/guardian/med_hud_set_status()
	if(summoner)
		var/image/holder = hud_list[STATUS_HUD]
		var/icon/I = icon(icon, icon_state, dir)
		holder.pixel_y = I.Height() - world.icon_size
		if(summoner.stat == DEAD)
			holder.icon_state = "huddead"
		else
			holder.icon_state = "hudhealthy"

/mob/living/simple_animal/hostile/guardian/Destroy()
	GLOB.parasites -= src
	return ..()

/mob/living/simple_animal/hostile/guardian/proc/setthemename(pickedtheme) //set the guardian's theme to something cool!
	if(!pickedtheme)
		pickedtheme = pick("magic", "tech", "carp")
	var/list/possible_names = list()
	switch(pickedtheme)
		if("magic")
			for(var/type in (subtypesof(/datum/guardianname/magic) - namedatum.type))
				possible_names += new type
		if("tech")
			for(var/type in (subtypesof(/datum/guardianname/tech) - namedatum.type))
				possible_names += new type
		if("carp")
			for(var/type in (subtypesof(/datum/guardianname/carp) - namedatum.type))
				possible_names += new type
	namedatum = pick(possible_names)
	updatetheme(pickedtheme)

/mob/living/simple_animal/hostile/guardian/proc/updatetheme(theme) //update the guardian's theme to whatever its datum is; proc for adminfuckery
	name = "[namedatum.prefixname] [namedatum.suffixcolour]"
	real_name = "[name]"
	icon_living = "[namedatum.parasiteicon]"
	icon_state = "[namedatum.parasiteicon]"
	icon_dead = "[namedatum.parasiteicon]"
	bubble_icon = "[namedatum.bubbleicon]"

	if (namedatum.stainself)
		add_atom_colour(namedatum.colour, FIXED_COLOUR_PRIORITY)

	//Special case holocarp, because #snowflake code
	if(theme == "carp")
		speak_emote = list("gnashes")
		desc = ""

		attack_verb_continuous = "bites"
		attack_verb_simple = "bite"
		attack_sound = 'sound/blank.ogg'


/mob/living/simple_animal/hostile/guardian/Login() //if we have a mind, set its name to ours when it logs in
	..()
	if(mind)
		mind.name = "[real_name]"
	if(!summoner)
		to_chat(src, span_holoparasitebold("For some reason, somehow, you have no summoner. Please report this bug immediately."))
		return
	to_chat(src, span_holoparasite("I am <font color=\"[namedatum.colour]\"><b>[real_name]</b></font>, bound to serve [summoner.real_name]."))
	to_chat(src, span_holoparasite("I am capable of manifesting or recalling to my master with the buttons on my HUD. You will also find a button to communicate with [summoner.p_them()] privately there."))
	to_chat(src, span_holoparasite("While personally invincible, you will die if [summoner.real_name] does, and any damage dealt to you will have a portion passed on to [summoner.p_them()] as you feed upon [summoner.p_them()] to sustain myself."))
	to_chat(src, playstyle_string)

/mob/living/simple_animal/hostile/guardian/Life() //Dies if the summoner dies
	. = ..()
	update_health_hud() //we need to update all of our health displays to match our summoner and we can't practically give the summoner a hook to do it
	med_hud_set_health()
	med_hud_set_status()
	if(!QDELETED(summoner))
		if(summoner.stat == DEAD)
			forceMove(summoner.loc)
			to_chat(src, span_danger("My summoner has died!"))
			visible_message(span_danger("<B>\The [src] dies along with its user!</B>"))
			summoner.visible_message(span_danger("<B>[summoner]'s body is completely consumed by the strain of sustaining [src]!</B>"))
			for(var/obj/item/W in summoner)
				if(!summoner.dropItemToGround(W))
					qdel(W)
			summoner.dust()
			death(TRUE)
			qdel(src)
	else
		to_chat(src, span_danger("My summoner has died!"))
		visible_message(span_danger("<B>[src] dies along with its user!</B>"))
		death(TRUE)
		qdel(src)
	snapback()

/mob/living/simple_animal/hostile/guardian/Stat()
	..()
	if(statpanel("Status"))
		if(summoner)
			var/resulthealth
			if(iscarbon(summoner))
				resulthealth = round((abs(HEALTH_THRESHOLD_DEAD - summoner.health) / abs(HEALTH_THRESHOLD_DEAD - summoner.maxHealth)) * 100)
			else
				resulthealth = round((summoner.health / summoner.maxHealth) * 100, 0.5)
			stat(null, "Summoner Health: [resulthealth]%")
		if(cooldown >= world.time)
			stat(null, "Manifest/Recall Cooldown Remaining: [DisplayTimeText(cooldown - world.time)]")

/mob/living/simple_animal/hostile/guardian/Move() //Returns to summoner if they move out of range
	. = ..()
	snapback()

/mob/living/simple_animal/hostile/guardian/proc/snapback()
	if(summoner)
		if(get_dist(get_turf(summoner),get_turf(src)) <= range)
			return
		else
			to_chat(src, span_holoparasite("I moved out of range, and were pulled back! You can only move [range] meters from [summoner.real_name]!"))
			visible_message(span_danger("\The [src] jumps back to its user."))
			if(istype(summoner.loc, /obj/effect))
				Recall(TRUE)
			else
				new /obj/effect/temp_visual/guardian/phase/out(loc)
				forceMove(summoner.loc)
				new /obj/effect/temp_visual/guardian/phase(loc)

/mob/living/simple_animal/hostile/guardian/canSuicide()
	return FALSE

/mob/living/simple_animal/hostile/guardian/proc/is_deployed()
	return loc != summoner

/mob/living/simple_animal/hostile/guardian/AttackingTarget()
	if(!is_deployed())
		to_chat(src, "<span class='danger'><B>I must be manifested to attack!</span></B>")
		return FALSE
	else
		return ..()

/mob/living/simple_animal/hostile/guardian/death()
	drop_all_held_items()
	..()
	if(summoner)
		to_chat(summoner, "<span class='danger'><B>My [name] died somehow!</span></B>")
		summoner.dust()

/mob/living/simple_animal/hostile/guardian/update_health_hud()
	if(summoner && hud_used && hud_used.healths)
		var/resulthealth
		if(iscarbon(summoner))
			resulthealth = round((abs(HEALTH_THRESHOLD_DEAD - summoner.health) / abs(HEALTH_THRESHOLD_DEAD - summoner.maxHealth)) * 100)
		else
			resulthealth = round((summoner.health / summoner.maxHealth) * 100, 0.5)
		hud_used.healths.maptext = "<div align='center' valign='middle' style='position:relative; top:0px; left:6px'><font color='#efeeef'>[resulthealth]%</font></div>"

/mob/living/simple_animal/hostile/guardian/adjustHealth(amount, updating_health = TRUE, forced = FALSE) //The spirit is invincible, but passes on damage to the summoner
	. = amount
	if(summoner)
		if(loc == summoner)
			return FALSE
		summoner.adjustBruteLoss(amount)
		if(amount > 0)
			to_chat(summoner, "<span class='danger'><B>My [name] is under attack! You take damage!</span></B>")
			summoner.visible_message(span_danger("<B>Blood sprays from [summoner] as [src] takes damage!</B>"))
			if(summoner.stat == UNCONSCIOUS)
				to_chat(summoner, "<span class='danger'><B>My body can't take the strain of sustaining [src] in this condition, it begins to fall apart!</span></B>")
				summoner.adjustCloneLoss(amount * 0.5) //dying hosts take 50% bonus damage as cloneloss
		update_health_hud()

/mob/living/simple_animal/hostile/guardian/ex_act(severity, target)
	switch(severity)
		if(1)
			gib()
			return
		if(2)
			adjustBruteLoss(60)
		if(3)
			adjustBruteLoss(30)

/mob/living/simple_animal/hostile/guardian/gib()
	if(summoner)
		to_chat(summoner, "<span class='danger'><B>My [src] was blown up!</span></B>")
		summoner.gib()
	ghostize()
	qdel(src)

//HAND HANDLING

/mob/living/simple_animal/hostile/guardian/equip_to_slot(obj/item/I, slot)
	if(!slot)
		return FALSE
	if(!istype(I))
		return FALSE

	. = TRUE
	var/index = get_held_index_of_item(I)
	if(index)
		held_items[index] = null
		update_inv_hands()

	if(I.pulledby)
		I.pulledby.stop_pulling()

	I.screen_loc = null // will get moved if inventory is visible
	I.forceMove(src)
	I.equipped(src, slot)
	I.layer = ABOVE_HUD_LAYER
	I.plane = ABOVE_HUD_PLANE

/mob/living/simple_animal/hostile/guardian/apply_overlay(cache_index)
	if((. = guardian_overlays[cache_index]))
		add_overlay(.)

/mob/living/simple_animal/hostile/guardian/remove_overlay(cache_index)
	var/I = guardian_overlays[cache_index]
	if(I)
		cut_overlay(I)
		guardian_overlays[cache_index] = null

/mob/living/simple_animal/hostile/guardian/update_inv_hands()
	remove_overlay(GUARDIAN_HANDS_LAYER)
	var/list/hands_overlays = list()
	var/obj/item/l_hand = get_item_for_held_index(1)
	var/obj/item/r_hand = get_item_for_held_index(2)

	if(r_hand)
		hands_overlays += r_hand.build_worn_icon(default_layer = GUARDIAN_HANDS_LAYER, default_icon_file = r_hand.righthand_file, isinhands = TRUE)

		if(client && hud_used && hud_used.hud_version != HUD_STYLE_NOHUD)
			r_hand.layer = ABOVE_HUD_LAYER
			r_hand.plane = ABOVE_HUD_PLANE
			r_hand.screen_loc = ui_hand_position(get_held_index_of_item(r_hand))
			client.screen |= r_hand

	if(l_hand)
		hands_overlays +=  l_hand.build_worn_icon(default_layer = GUARDIAN_HANDS_LAYER, default_icon_file = l_hand.lefthand_file, isinhands = TRUE)

		if(client && hud_used && hud_used.hud_version != HUD_STYLE_NOHUD)
			l_hand.layer = ABOVE_HUD_LAYER
			l_hand.plane = ABOVE_HUD_PLANE
			l_hand.screen_loc = ui_hand_position(get_held_index_of_item(l_hand))
			client.screen |= l_hand

	if(hands_overlays.len)
		guardian_overlays[GUARDIAN_HANDS_LAYER] = hands_overlays
	apply_overlay(GUARDIAN_HANDS_LAYER)

/mob/living/simple_animal/hostile/guardian/regenerate_icons()
	update_inv_hands()

//MANIFEST, RECALL, TOGGLE MODE/LIGHT, SHOW TYPE

/mob/living/simple_animal/hostile/guardian/proc/Manifest(forced)
	if(istype(summoner.loc, /obj/effect) || (cooldown > world.time && !forced))
		return FALSE
	if(loc == summoner)
		forceMove(summoner.loc)
		new /obj/effect/temp_visual/guardian/phase(loc)
		cooldown = world.time + 10
		reset_perspective()
		return TRUE
	return FALSE

/mob/living/simple_animal/hostile/guardian/proc/Recall(forced)
	if(!summoner || loc == summoner || (cooldown > world.time && !forced))
		return FALSE
	new /obj/effect/temp_visual/guardian/phase/out(loc)

	forceMove(summoner)
	cooldown = world.time + 10
	return TRUE

/mob/living/simple_animal/hostile/guardian/proc/ToggleMode()
	to_chat(src, "<span class='danger'><B>I don't have another mode!</span></B>")

/mob/living/simple_animal/hostile/guardian/proc/ToggleLight()
	if(light_range<3)
		to_chat(src, span_notice("I activate my light."))
		set_light(3)
	else
		to_chat(src, span_notice("I deactivate my light."))
		set_light(0)

/mob/living/simple_animal/hostile/guardian/verb/ShowType()
	set name = "Check Guardian Type"
	set category = "Guardian"
	set desc = ""
	to_chat(src, playstyle_string)

//COMMUNICATION

/mob/living/simple_animal/hostile/guardian/proc/Communicate()
	if(summoner)
		var/sender_key = key
		var/input = stripped_input(src, "Please enter a message to tell my summoner.", "Guardian", "")
		if(sender_key != key || !input) //guardian got reset, or did not enter anything
			return

		var/preliminary_message = span_holoparasitebold("[input]") //apply basic color/bolding
		var/my_message = "<font color=\"[namedatum.colour]\"><b><i>[src]:</i></b></font> [preliminary_message]" //add source, color source with the guardian's color

		to_chat(summoner, my_message)
		var/list/guardians = summoner.hasparasites()
		for(var/para in guardians)
			to_chat(para, my_message)
		for(var/M in GLOB.dead_mob_list)
			var/link = FOLLOW_LINK(M, src)
			to_chat(M, "[link] [my_message]")

		src.log_talk(input, LOG_SAY, tag="guardian")

/mob/living/proc/guardian_comm()
	set name = "Communicate"
	set category = "Guardian"
	set desc = ""
	var/input = stripped_input(src, "Please enter a message to tell my guardian.", "Message", "")
	if(!input)
		return

	var/preliminary_message = span_holoparasitebold("[input]") //apply basic color/bolding
	var/my_message = span_holoparasitebold("<i>[src]:</i> [preliminary_message]") //add source, color source with default grey...

	to_chat(src, my_message)
	var/list/guardians = hasparasites()
	for(var/para in guardians)
		var/mob/living/simple_animal/hostile/guardian/G = para
		to_chat(G, "<font color=\"[G.namedatum.colour]\"><b><i>[src]:</i></b></font> [preliminary_message]" )
	for(var/M in GLOB.dead_mob_list)
		var/link = FOLLOW_LINK(M, src)
		to_chat(M, "[link] [my_message]")

	src.log_talk(input, LOG_SAY, tag="guardian")

//FORCE RECALL/RESET

/mob/living/proc/guardian_recall()
	set name = "Recall Guardian"
	set category = "Guardian"
	set desc = ""
	var/list/guardians = hasparasites()
	for(var/para in guardians)
		var/mob/living/simple_animal/hostile/guardian/G = para
		G.Recall()

/mob/living/proc/guardian_reset()
	set name = "Reset Guardian Player (One Use)"
	set category = "Guardian"
	set desc = ""

	var/list/guardians = hasparasites()
	for(var/para in guardians)
		var/mob/living/simple_animal/hostile/guardian/P = para
		if(P.reset)
			guardians -= P //clear out guardians that are already reset
	if(guardians.len)
		var/mob/living/simple_animal/hostile/guardian/G = input(src, "Pick the guardian you wish to reset", "Guardian Reset") as null|anything in sortNames(guardians)
		if(G)
			to_chat(src, span_holoparasite("I attempt to reset <font color=\"[G.namedatum.colour]\"><b>[G.real_name]</b></font>'s personality..."))
			var/list/mob/candidates = pollGhostCandidates("Do you want to play as [src.real_name]'s [G.real_name]?", ROLE_PAI, null, FALSE, 100)
			if(LAZYLEN(candidates))
				var/mob/C = pick(candidates)
				to_chat(G, span_holoparasite("My user reset you, and my body was taken over by a ghost. Looks like they weren't happy with my performance."))
				to_chat(src, span_holoparasitebold("My <font color=\"[G.namedatum.colour]\">[G.real_name]</font> has been successfully reset."))
				message_admins("[key_name_admin(C)] has taken control of ([ADMIN_LOOKUPFLW(G)])")
				G.ghostize(0)
				G.setthemename(G.namedatum.theme) //give it a new color, to show it's a new person
				G.key = C.key
				G.reset = 1
				switch(G.namedatum.theme)
					if("tech")
						to_chat(src, span_holoparasite("<font color=\"[G.namedatum.colour]\"><b>[G.real_name]</b></font> is now online!"))
					if("magic")
						to_chat(src, span_holoparasite("<font color=\"[G.namedatum.colour]\"><b>[G.real_name]</b></font> has been summoned!"))
				guardians -= G
				if(!guardians.len)
					verbs -= /mob/living/proc/guardian_reset
			else
				to_chat(src, span_holoparasite("There were no ghosts willing to take control of <font color=\"[G.namedatum.colour]\"><b>[G.real_name]</b></font>. Looks like you're stuck with it for now."))
		else
			to_chat(src, span_holoparasite("I decide not to reset [guardians.len > 1 ? "any of my guardians":"your guardian"]."))
	else
		verbs -= /mob/living/proc/guardian_reset

////////parasite tracking/finding procs

/mob/living/proc/hasparasites() //returns a list of guardians the mob is a summoner for
	. = list()
	for(var/P in GLOB.parasites)
		var/mob/living/simple_animal/hostile/guardian/G = P
		if(G.summoner == src)
			. += G

/mob/living/simple_animal/hostile/guardian/proc/hasmatchingsummoner(mob/living/simple_animal/hostile/guardian/G) //returns 1 if the summoner matches the target's summoner
	return (istype(G) && G.summoner == summoner)


////////Creation

/obj/item/guardiancreator
	name = "deck of tarot cards"
	desc = ""
	icon = 'icons/obj/toy.dmi'
	icon_state = "deck_syndicate_full"
	var/used = FALSE
	var/theme = "magic"
	var/mob_name = "Guardian Spirit"
	var/use_message = span_holoparasite("I shuffle the deck...")
	var/used_message = span_holoparasite("All the cards seem to be blank now.")
	var/failure_message = span_holoparasitebold("..And draw a card! It's...blank? Maybe you should try again later.")
	var/ling_failure = span_holoparasitebold("The deck refuses to respond to a souless creature such as you.")
	var/list/possible_guardians = list("Assassin", "Chaos", "Charger", "Explosive", "Lightning", "Protector", "Ranged", "Standard", "Support", "Gravitokinetic")
	var/random = TRUE
	var/allowmultiple = FALSE
	var/allowling = TRUE
	var/allowguardian = FALSE

/obj/item/guardiancreator/attack_self(mob/living/user)
	if(isguardian(user) && !allowguardian)
		to_chat(user, span_holoparasite("[mob_name] chains are not allowed."))
		return
	var/list/guardians = user.hasparasites()
	if(guardians.len && !allowmultiple)
		to_chat(user, span_holoparasite("I already have a [mob_name]!"))
		return
	if(user.mind && user.mind.has_antag_datum(/datum/antagonist/changeling) && !allowling)
		to_chat(user, "[ling_failure]")
		return
	if(used == TRUE)
		to_chat(user, "[used_message]")
		return
	used = TRUE
	to_chat(user, "[use_message]")
	var/list/mob/candidates = pollGhostCandidates("Do you want to play as the [mob_name] of [user.real_name]?", ROLE_PAI, null, FALSE, 100, POLL_IGNORE_HOLOPARASITE)

	if(LAZYLEN(candidates))
		var/mob/C = pick(candidates)
		spawn_guardian(user, C.key)
	else
		to_chat(user, "[failure_message]")
		used = FALSE


/obj/item/guardiancreator/proc/spawn_guardian(mob/living/user, key)
	var/guardiantype = "Standard"
	if(random)
		guardiantype = pick(possible_guardians)
	else
		guardiantype = input(user, "Pick the type of [mob_name]", "[mob_name] Creation") as null|anything in sortList(possible_guardians)
		if(!guardiantype)
			to_chat(user, "[failure_message]" )
			used = FALSE
			return
	var/pickedtype = /mob/living/simple_animal/hostile/guardian/punch
	switch(guardiantype)

		if("Chaos")
			pickedtype = /mob/living/simple_animal/hostile/guardian/fire

		if("Standard")
			pickedtype = /mob/living/simple_animal/hostile/guardian/punch

		if("Ranged")
			pickedtype = /mob/living/simple_animal/hostile/guardian/ranged

		if("Support")
			pickedtype = /mob/living/simple_animal/hostile/guardian/healer

		if("Explosive")
			pickedtype = /mob/living/simple_animal/hostile/guardian/bomb

		if("Lightning")
			pickedtype = /mob/living/simple_animal/hostile/guardian/beam

		if("Protector")
			pickedtype = /mob/living/simple_animal/hostile/guardian/protector

		if("Charger")
			pickedtype = /mob/living/simple_animal/hostile/guardian/charger

		if("Assassin")
			pickedtype = /mob/living/simple_animal/hostile/guardian/assassin

		if("Dextrous")
			pickedtype = /mob/living/simple_animal/hostile/guardian/dextrous

		if("Gravitokinetic")
			pickedtype = /mob/living/simple_animal/hostile/guardian/gravitokinetic

	var/list/guardians = user.hasparasites()
	if(guardians.len && !allowmultiple)
		to_chat(user, span_holoparasite("I already have a [mob_name]!") )
		used = FALSE
		return
	var/mob/living/simple_animal/hostile/guardian/G = new pickedtype(user, theme)
	G.summoner = user
	G.key = key
	G.mind.enslave_mind_to_creator(user)
	log_game("[key_name(user)] has summoned [key_name(G)], a [guardiantype] holoparasite.")
	switch(theme)
		if("tech")
			to_chat(user, "[G.tech_fluff_string]")
			to_chat(user, span_holoparasite("<font color=\"[G.namedatum.colour]\"><b>[G.real_name]</b></font> is now online!"))
		if("magic")
			to_chat(user, "[G.magic_fluff_string]")
			to_chat(user, span_holoparasite("<font color=\"[G.namedatum.colour]\"><b>[G.real_name]</b></font> has been summoned!"))
		if("carp")
			to_chat(user, "[G.carp_fluff_string]")
			to_chat(user, span_holoparasite("<font color=\"[G.namedatum.colour]\"><b>[G.real_name]</b></font> has been caught!"))
	user.verbs += /mob/living/proc/guardian_comm
	user.verbs += /mob/living/proc/guardian_recall
	user.verbs += /mob/living/proc/guardian_reset

/obj/item/guardiancreator/choose
	random = FALSE

/obj/item/guardiancreator/choose/dextrous
	possible_guardians = list("Assassin", "Chaos", "Charger", "Dextrous", "Explosive", "Lightning", "Protector", "Ranged", "Standard", "Support", "Gravitokinetic")

/obj/item/guardiancreator/choose/wizard
	possible_guardians = list("Assassin", "Chaos", "Charger", "Dextrous", "Explosive", "Lightning", "Protector", "Ranged", "Standard", "Gravitokinetic")
	allowmultiple = TRUE

/obj/item/guardiancreator/tech
	name = "holoparasite injector"
	desc = ""
	icon = 'icons/obj/syringe.dmi'
	icon_state = "combat_hypo"
	theme = "tech"
	mob_name = "Holoparasite"
	use_message = span_holoparasite("I start to power on the injector...")
	used_message = span_holoparasite("The injector has already been used.")
	failure_message = span_holoparasitebold("...ERROR. BOOT SEQUENCE ABORTED. AI FAILED TO INTIALIZE. PLEASE CONTACT SUPPORT OR TRY AGAIN LATER.")
	ling_failure = span_holoparasitebold("The holoparasites recoil in horror. They want nothing to do with a creature like you.")

/obj/item/guardiancreator/tech/choose/traitor
	possible_guardians = list("Assassin", "Chaos", "Charger", "Explosive", "Lightning", "Protector", "Ranged", "Standard", "Support", "Gravitokinetic")

/obj/item/guardiancreator/tech/choose
	random = FALSE

/obj/item/guardiancreator/tech/choose/dextrous
	possible_guardians = list("Assassin", "Chaos", "Charger", "Dextrous", "Explosive", "Lightning", "Protector", "Ranged", "Standard", "Support", "Gravitokinetic")

/obj/item/paper/guides/antag/guardian
	name = "Holoparasite Guide"
	icon_state = "paper_words"
	info = {"<b>A list of Holoparasite Types</b><br>

 <br>
 <b>Assassin</b>: Does medium damage and takes full damage, but can enter stealth, causing its next attack to do massive damage and ignore armor. However, it becomes briefly unable to recall after attacking from stealth.<br>
 <br>
 <b>Chaos</b>: Ignites enemies on touch and causes them to hallucinate all nearby people as the parasite. Automatically extinguishes the user if they catch on fire.<br>
 <br>
 <b>Charger</b>: Moves extremely fast, does medium damage on attack, and can charge at targets, damaging the first target hit and forcing them to drop any items they are holding.<br>
 <br>
 <b>Explosive</b>: High damage resist and medium power attack that may explosively teleport targets. Can turn any object, including objects too large to pick up, into a bomb, dealing explosive damage to the next person to touch it. The object will return to normal after the trap is triggered or after a delay.<br>
 <br>
 <b>Lightning</b>: Attacks apply lightning chains to targets. Has a lightning chain to the user. Lightning chains shock everything near them, doing constant damage.<br>
 <br>
 <b>Protector</b>: Causes you to teleport to it when out of range, unlike other parasites. Has two modes; Combat, where it does and takes medium damage, and Protection, where it does and takes almost no damage but moves slightly slower.<br>
 <br>
 <b>Ranged</b>: Has two modes. Ranged; which fires a constant stream of weak, armor-ignoring projectiles. Scout; Cannot attack, but can move through walls and is quite hard to see. Can lay surveillance snares, which alert it when crossed, in either mode.<br>
 <br>
 <b>Standard</b>: Devastating close combat attacks and high damage resist. Can smash through weak walls.<br>
 <br>
 <b>Gravitokinetic</b>: Attacks will apply crushing gravity to the target. Can target the ground as well to slow targets advancing on you, but this will affect the user.<br>
 <br>
"}

/obj/item/paper/guides/antag/guardian/update_icon()
	return

/obj/item/paper/guides/antag/guardian/wizard
	name = "Guardian Guide"
	info = {"<b>A list of Guardian Types</b><br>

 <br>
 <b>Assassin</b>: Does medium damage and takes full damage, but can enter stealth, causing its next attack to do massive damage and ignore armor. However, it becomes briefly unable to recall after attacking from stealth.<br>
 <br>
 <b>Chaos</b>: Ignites enemies on touch and causes them to hallucinate all nearby people as the guardian. Automatically extinguishes the user if they catch on fire.<br>
 <br>
 <b>Charger</b>: Moves extremely fast, does medium damage on attack, and can charge at targets, damaging the first target hit and forcing them to drop any items they are holding.<br>
 <br>
 <b>Dexterous</b>: Does low damage on attack, but is capable of holding items and storing a single item within it. It will drop items held in its hands when it recalls, but it will retain the stored item.<br>
 <br>
 <b>Explosive</b>: High damage resist and medium power attack that may explosively teleport targets. Can turn any object, including objects too large to pick up, into a bomb, dealing explosive damage to the next person to touch it. The object will return to normal after the trap is triggered or after a delay.<br>
 <br>
 <b>Lightning</b>: Attacks apply lightning chains to targets. Has a lightning chain to the user. Lightning chains shock everything near them, doing constant damage.<br>
 <br>
 <b>Protector</b>: Causes you to teleport to it when out of range, unlike other parasites. Has two modes; Combat, where it does and takes medium damage, and Protection, where it does and takes almost no damage but moves slightly slower.<br>
 <br>
 <b>Ranged</b>: Has two modes. Ranged; which fires a constant stream of weak, armor-ignoring projectiles. Scout; Cannot attack, but can move through walls and is quite hard to see. Can lay surveillance snares, which alert it when crossed, in either mode.<br>
 <br>
 <b>Standard</b>: Devastating close combat attacks and high damage resist. Can smash through weak walls.<br>
 <br>
 <b>Gravitokinetic</b>: Attacks will apply crushing gravity to the target. Can target the ground as well to slow targets advancing on you, but this will affect the user.<br>
 <br>
"}


/obj/item/storage/box/syndie_kit/guardian
	name = "holoparasite injector kit"

/obj/item/storage/box/syndie_kit/guardian/PopulateContents()
	new /obj/item/guardiancreator/tech/choose/traitor(src)
	new /obj/item/paper/guides/antag/guardian(src)

/obj/item/guardiancreator/carp
	name = "holocarp fishsticks"
	desc = ""
	icon = 'icons/obj/food/food.dmi'
	icon_state = "fishfingers"
	theme = "carp"
	mob_name = "Holocarp"
	use_message = span_holoparasite("I put the fishsticks in my mouth...")
	used_message = span_holoparasite("Someone's already taken a bite out of these fishsticks! Ew.")
	failure_message = span_holoparasitebold("I couldn't catch any carp spirits from the seas of Lake Carp. Maybe there are none, maybe you fucked up.")
	ling_failure = span_holoparasitebold("Carp'sie is fine with changelings, so you shouldn't be seeing this message.")
	allowmultiple = TRUE
	allowling = TRUE
	random = TRUE

/obj/item/guardiancreator/carp/choose
	random = FALSE
