// These are generally designed to be more creepy, but could do lighter stuff too. Please do not hand the ritual skill out to too many roles.
//Massive credit to Onutsio (🏳️‍⚧️).

/obj/structure/ritualcircle
	name = "ritual circle"
	desc = ""
	icon = 'icons/roguetown/misc/rituals.dmi'
	icon_state = "ritual_base"
	layer = BELOW_OBJ_LAYER
	density = FALSE
	anchored = TRUE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/structure/ritualcircle/attack_right(mob/living/carbon/human/user)
	user.visible_message(span_warning("[user] begins wiping away the rune"))
	if(do_after(user, 15))
		playsound(loc, 'sound/foley/cloth_wipe (1).ogg', 100, TRUE)
		qdel(src)

// This'll be our tutorial ritual for those who want to make more later, let's go into details in comments, mm? - Onutsio 
/obj/structure/ritualcircle/astrata
	name = "Rune of the Sun" // defines name of the circle itself
	icon_state = "astrata_chalky" // the icon state, so, the sprite the runes use on the floor. As of making, we have 6, each needs an active/inactive state. 
	desc = "A Sun Rune. Reading it leaves you feeling warm." // description on examine
	var/solarrites = list("Guiding Light") // This is important - This is the var which stores every ritual option available to a ritualist - Ideally, we'd have like, 3 for each God. Right now, just 1.

/obj/structure/ritualcircle/astrata/attack_hand(mob/living/user)
	if(!HAS_TRAIT(user, TRAIT_RITUALIST))
		to_chat(user, span_smallred("I don't know the proper rites for this..."))
		return

	if(user.has_status_effect(/datum/status_effect/debuff/ritesexpended))
		to_chat(user, span_smallred("I have performed enough rituals for the day... I must rest before communing more."))
		return

	var/ritual_level = user.mind?.get_skill_level(/datum/skill/magic/ritual) || 0

	// Skill check from ritechoices
	var/rune_data = ritechoices["Rune of Sun"]
	if (!rune_data)
		to_chat(user, span_warning("This rune is incomplete or unregistered."))
		return

	var/required_level = rune_data["level"]
	if (ritual_level < required_level)
		to_chat(user, span_smallred("I lack the knowledge to invoke this rite."))
		return

	var/riteselection = input(user, "Rituals of the Sun", src) as null|anything in solarrites // When you use a open hand on a rune, It'll give you a selection of all the rites available from that rune
	switch(riteselection) // rite selection goes in this section, try to do something fluffy. Presentation is most important here, truthfully.
		if("Guiding Light") // User selects Guiding Light, begins the stuff for it
			if(do_after(user, 50)) // just flavor stuff before activation
				user.say("I beseech the One Star, blazing star of fire bright!!")
				if(do_after(user, 50))
					user.say("To bring light that's wrought from the Flame's own might!!")
					if(do_after(user, 50))
						user.say("Place your gaze upon me, oh Radiant one!! And grant us the clarity of the Sun!!")
						to_chat(user,span_danger("You feel the eye of the Sun turned upon you. The One Star is oft obscured without the Worldflame's intercession. With the cloud of dark rent, its warmth dances upon your cheek. You feel yourself warming up...")) // A bunch of flavor stuff, slow incanting.
						icon_state = "astrata_active"
						loc.visible_message(span_warning("[user]'s bursts to flames! Embraced by Her flame wholly!"))
						playsound(loc, 'sound/combat/hits/burn (1).ogg', 100, FALSE, -1)
						user.adjust_fire_stacks(10)
						user.IgniteMob()
						user.flash_fullscreen("redflash3")
						user.emote("firescream")
						guidinglight(src) // Actually starts the proc for applying the buff
						user.apply_status_effect(/datum/status_effect/debuff/ritesexpended)
						spawn(120)
							icon_state = "astrata_chalky"

/obj/structure/ritualcircle/astrata/proc/guidinglight(src)
	var/ritualtargets = view(7, loc) // Range of 7 from the source, which is the rune
	for(var/mob/living/carbon/human/target in ritualtargets) // defines the target as every human in this range
		target.apply_status_effect(/datum/status_effect/buff/guidinglight) // applies the status effect
		to_chat(target,span_cultsmall("The One Star's light guides me forward, drawn to me by the Ritualist's pyre!"))
		playsound(target, 'sound/magic/holyshield.ogg', 80, FALSE, -1) // Cool sound!
// If you want to review a more complicated one, Undermaiden's Bargain is probs the most complicated of the starting set. - Have fun! - Onutsio 🏳️‍⚧️


/obj/structure/ritualcircle/noc
	name = "Rune of the Moon"
	icon_state = "noc_chalky"
	desc = "A Moon Rune. Reading it leaves you feeling a light chill."
	var/lunarrites = list("Moonlight Dance") // list for more to be added later

/obj/structure/ritualcircle/noc/attack_hand(mob/living/user)
	if(!HAS_TRAIT(user, TRAIT_RITUALIST))
		to_chat(user, span_smallred("I don't know the proper rites for this..."))
		return

	if(user.has_status_effect(/datum/status_effect/debuff/ritesexpended))
		to_chat(user, span_smallred("I have performed enough rituals for the day... I must rest before communing more."))
		return

	var/ritual_level = user.mind?.get_skill_level(/datum/skill/magic/ritual) || 0

	// Skill check from ritechoices
	var/rune_data = ritechoices["Rune of Moon"]
	if (!rune_data)
		to_chat(user, span_warning("This rune is incomplete or unregistered."))
		return

	var/required_level = rune_data["level"]
	if (ritual_level < required_level)
		to_chat(user, span_smallred("I lack the knowledge to invoke this rite."))
		return
	var/riteselection = input(user, "Rituals of the Moon", src) as null|anything in lunarrites
	switch(riteselection) // put ur rite selection here
		if("Moonlight Dance")
			if(do_after(user, 50))
				user.say("I beseech the Dark Wanderer, hidden moon of the night sky!!")
				if(do_after(user, 50))
					user.say("To bring Wisdom obscrured from the Blind God's eye!!")
					if(do_after(user, 50))
						user.say("Place your gaze upon me, o' Wanderer on high!! Draw your hidden knowledge nigh!!")
						to_chat(user,span_cultsmall("You feel the eye of the moon drawn upon you. The Dark Wanderer is oft obscured without the Worldflame's intercession. With some effort, it can be drawn upon by supplicants, even through the cloud of dark."))
						playsound(loc, 'sound/magic/holyshield.ogg', 80, FALSE, -1)
						moonlightdance(src)
						user.apply_status_effect(/datum/status_effect/debuff/ritesexpended)

/obj/structure/ritualcircle/noc/proc/moonlightdance(src)
	var/ritualtargets = view(7, loc)
	for(var/mob/living/carbon/human/target in ritualtargets)
		target.apply_status_effect(/datum/status_effect/buff/moonlightdance)

/obj/structure/ritualcircle/pestra
	name = "Rune of Plague"
	desc = "A Rune of Disease. Looking at it makes you feel sick."
	icon_state = "pestra_chalky"
	var/plaguerites = list("Flylord's Triage")


/obj/structure/ritualcircle/pestra/attack_hand(mob/living/user)
	if(!HAS_TRAIT(user, TRAIT_RITUALIST))
		to_chat(user, span_smallred("I don't know the proper rites for this..."))
		return

	if(user.has_status_effect(/datum/status_effect/debuff/ritesexpended))
		to_chat(user, span_smallred("I have performed enough rituals for the day... I must rest before communing more."))
		return

	var/ritual_level = user.mind?.get_skill_level(/datum/skill/magic/ritual) || 0

	// Skill check from ritechoices
	var/rune_data = ritechoices["Rune of Plague"]
	if (!rune_data)
		to_chat(user, span_warning("This rune is incomplete or unregistered."))
		return

	var/required_level = rune_data["level"]
	if (ritual_level < required_level)
		to_chat(user, span_smallred("I lack the knowledge to invoke this rite."))
		return

	var/riteselection = input(user, "Rituals of Plague", src) as null|anything in plaguerites
	switch(riteselection) // put ur rite selection here
		if("Flylord's Triage")
			if(do_after(user, 50))
				user.say("O Queen of Blight, whose breath is plague,")
				if(do_after(user, 50))
					user.say("Whose kiss is rot, whose will is vague.")
					if(do_after(user, 50))
						user.say("Let blood run thin and pulses cease,")
						to_chat(user,span_danger("A hush falls. You feel the world reel — as if something ancient stirs beneath your skin...."))
						if(do_after(user, 30))
							icon_state = "pestra_active"
							user.say("And birth through me thy swarm's release")
							to_chat(user,span_cultsmall("My devotion to the Plague Queen allowing, her servants crawl up from my throat. Come now, father fly..."))
							loc.visible_message(span_warning("[user] gasps — and a torrent of flies erupts from their throat, wings screaming like bells of pestilence!"))
							playsound(loc, 'sound/misc/fliesloop.ogg', 100, FALSE, -1)
							flylordstriage(src)
							user.apply_status_effect(/datum/status_effect/debuff/ritesexpended)
							spawn(120)
								icon_state = "pestra_chalky"

/obj/structure/ritualcircle/pestra/proc/flylordstriage(src)
	var/ritualtargets = view(0, loc)
	for(var/mob/living/carbon/human/target in ritualtargets)
		to_chat(target,span_userdanger("You feel them crawling into your wounds and pores. Their horrific hum rings through your ears as they do their work!"))
		target.flash_fullscreen("redflash3")
		target.emote("agony")
		target.Stun(200)
		target.Knockdown(200)
		to_chat(target, span_userdanger("UNIMAGINABLE PAIN!"))
		target.apply_status_effect(/datum/status_effect/buff/flylordstriage)

/obj/structure/ritualcircle/dendor
	name = "Rune of Beasts"
	desc = "A Rune of Nature"
	icon_state = "dendor_chalky"
	var/bestialrites = list("Rite of the Lesser Wolf")

/obj/structure/ritualcircle/dendor/attack_hand(mob/living/user)
	if(!HAS_TRAIT(user, TRAIT_RITUALIST))
		to_chat(user, span_smallred("I don't know the proper rites for this..."))
		return

	if(user.has_status_effect(/datum/status_effect/debuff/ritesexpended))
		to_chat(user, span_smallred("I have performed enough rituals for the day... I must rest before communing more."))
		return

	var/ritual_level = user.mind?.get_skill_level(/datum/skill/magic/ritual) || 0

	// Skill check from ritechoices
	var/rune_data = ritechoices["Rune of Beasts"]
	if (!rune_data)
		to_chat(user, span_warning("This rune is incomplete or unregistered."))
		return

	var/required_level = rune_data["level"]
	if (ritual_level < required_level)
		to_chat(user, span_smallred("I lack the knowledge to invoke this rite."))
		return
	var/riteselection = input(user, "Rituals of Beasts", src) as null|anything in bestialrites
	switch(riteselection) // put ur rite selection here
		if("Rite of the Lesser Wolf")
			if(do_after(user, 50))
				user.say("Beast brothers, answer my call!")
				playsound(loc, 'sound/vo/mobs/vw/idle (1).ogg', 100, FALSE, -1)
				if(do_after(user, 50))
					user.say("All of you, strong, tough, or small!")
					playsound(loc, 'sound/vo/mobs/vw/idle (4).ogg', 100, FALSE, -1)
					if(do_after(user, 50))
						loc.visible_message(span_warning("[user] snaps and snarls at the rune. Drool runs down their lip..."))
						playsound(loc, 'sound/vo/mobs/vw/bark (1).ogg', 100, FALSE, -1)
						if(do_after(user, 30))
							icon_state = "dendor_active"
							loc.visible_message(span_warning("[user] snaps their head upward, they let out a howl!"))
							playsound(loc, 'sound/vo/mobs/wwolf/howl (2).ogg', 100, FALSE, -1)
							lesserwolf(src)
							user.apply_status_effect(/datum/status_effect/debuff/ritesexpended)
							spawn(120)
								icon_state = "dendor_chalky"

/obj/structure/ritualcircle/dendor/proc/lesserwolf(src)
	var/ritualtargets = view(1, loc)
	for(var/mob/living/carbon/human/target in ritualtargets)
		target.apply_status_effect(/datum/status_effect/buff/lesserwolf)

/obj/structure/ritualcircle/death
	name = "Rune of Death"
	desc = "A Rue of Death. Looking at it makes you feel uncomfortable."
	icon_state = "necra_chalky"
	var/deathrites = list("Undermaiden's Bargain")

/obj/structure/ritualcircle/death/attack_hand(mob/living/user)
	if(!HAS_TRAIT(user, TRAIT_RITUALIST))
		to_chat(user, span_smallred("I don't know the proper rites for this..."))
		return

	if(user.has_status_effect(/datum/status_effect/debuff/ritesexpended))
		to_chat(user, span_smallred("I have performed enough rituals for the day... I must rest before communing more."))
		return

	var/ritual_level = user.mind?.get_skill_level(/datum/skill/magic/ritual) || 0

	// Skill check from ritechoices
	var/rune_data = ritechoices["Rune of Death"]
	if (!rune_data)
		to_chat(user, span_warning("This rune is incomplete or unregistered."))
		return

	var/required_level = rune_data["level"]
	if (ritual_level < required_level)
		to_chat(user, span_smallred("I lack the knowledge to invoke this rite."))
		return

	var/riteselection = input(user, "Rituals of Death", src) as null|anything in deathrites

	switch(riteselection)
		if("Undermaiden's Bargain")
			loc.visible_message(span_warning("[user] sways before the rune, they open their mouth, though no words come out..."))
			playsound(user, 'sound/vo/mobs/ghost/whisper (3).ogg', 100, FALSE, -1)

			if(do_after(user, 60))
				loc.visible_message(span_warning("[user] silently weeps, yet their tears do not flow..."))
				playsound(user, 'sound/vo/mobs/ghost/whisper (1).ogg', 100, FALSE, -1)

				if(do_after(user, 60))
					loc.visible_message(span_warning("[user] shudders, the scent of dirt filling the air."))
					to_chat(user, span_danger("You feel cold breath on the back of your neck..."))
					playsound(user, 'sound/vo/mobs/ghost/death.ogg', 100, FALSE, -1)

					if(do_after(user, 60))
						loc.visible_message(span_warning("[user]'s eyes roll back into their head. Was this a good idea?"))
						to_chat(user, span_cultsmall("A whisper. A scream. A pact has been made."))
						playsound(user, 'sound/vo/mobs/ghost/whisper (2).ogg', 100, FALSE, -1)

						if(do_after(user, 20))
							icon_state = "necra_active"
							user.say("Forgive me, the bargain is intoned!")
							to_chat(user, span_cultsmall("My devotion to the dark has allowed me to strike a bargain for these souls, but who will pay the price?"))
							playsound(loc, 'sound/misc/deadbell.ogg', 100, FALSE, -1)
							loc.visible_message(span_warning("The bell tolls, but not for ye!"))
							undermaidenbargain(src)
							user.apply_status_effect(/datum/status_effect/debuff/ritesexpended)

							spawn(120)
								icon_state = "necra_chalky"

/obj/structure/ritualcircle/death/proc/undermaidenbargain(src)
	var/ritualtargets = view(7, loc)
	for(var/mob/living/carbon/human/target in ritualtargets)
		target.apply_status_effect(/datum/status_effect/buff/undermaidenbargain)


/obj/structure/ritualcircle/eora
    name = "Rune of Love"
    desc = "A Rune of Love"
    icon_state = "eora_chalky"
    var/peacerites = list("Rite of Pacification", "Rite of Oblivion") // Added Rite of Oblivion

/obj/structure/ritualcircle/eora/attack_hand(mob/living/user)
	if (!HAS_TRAIT(user, TRAIT_RITUALIST))
		to_chat(user, span_smallred("I don't know the proper rites for this..."))
		return

	if (user.has_status_effect(/datum/status_effect/debuff/ritesexpended))
		to_chat(user, span_smallred("I have performed enough rituals for the day... I must rest before communing more."))
		return

	var/ritual_level = user.mind?.get_skill_level(/datum/skill/magic/ritual) || 0

	// Skill check from ritechoices
	var/rune_data = ritechoices["Rune of Love"]
	if (!rune_data)
		to_chat(user, span_warning("This rune is incomplete or unregistered."))
		return

	var/required_level = rune_data["level"]
	if (ritual_level < required_level)
		to_chat(user, span_smallred("I lack the knowledge to invoke this rite."))
		return

	var/riteselection = input(user, "Rituals of Love", src) as null | anything in peacerites
	switch(riteselection)
		if ("Rite of Pacification")  // Rite of Pacification Logic
			if (do_after(user, 50))
				user.say("#Blessed be your weary head...")
				if (do_after(user, 50))
					user.say("#Full of strife and pain...")
					if (do_after(user, 50))
						user.say("#Let Her ease your fear...")
						if (do_after(user, 50))
							icon_state = "eora_active"
							pacify(src)  // Apply Pacify Effect
							user.apply_status_effect(/datum/status_effect/debuff/ritesexpended)
							spawn(120)
								icon_state = "eora_chalky"

		if ("Rite of Oblivion")
			loc.visible_message(span_warning("[user]'s eyes roll back as they begin to chant, the air thickening around them."))
			user.say("Slip through cracks where time won't tread,")
			playsound(user, 'sound/vo/mobs/ghost/whisper (3).ogg', 100, FALSE, -1)

			if (do_after(user, 60))
				user.say("Pluck the strings from thoughts long dead")
				playsound(user, 'sound/vo/mobs/ghost/whisper (1).ogg', 100, FALSE, -1)
				to_chat(user, span_danger("Your worst memories come flooding back - why do they seem suddenly sweet?"))

			if (do_after(user, 60))
				user.say("With velvet voice and rose-thorn grace.")
				to_chat(user, span_danger("You hear a woman's laugh echoing throughout your mind..."))
				playsound(user, 'sound/vo/mobs/ghost/death.ogg', 100, FALSE, -1)

			if (do_after(user, 60))
				user.say("Unlace the love, erase the face.")
				loc.visible_message(span_warning("[user]'s voice grows fuzzy and faint."))
				loc.visible_message(span_warning("An image of a laughing woman enters your mind. Old and young and wrong."))
				playsound(user, 'sound/vo/mobs/ghost/whisper (2).ogg', 100, FALSE, -1)

			if (do_after(user, 60))
				icon_state = "eora_active"
				user.say("Hush now… hush… it's gone, it's done—")
				loc.visible_message(span_warning("Is she laughing or crying? A hand stretches out. The fingers clench around something."))
				playsound(loc, 'sound/vo/female/old/laugh (1).ogg', 100, FALSE, -1)

			if (do_after(user, 20))
				user.say("The name, the touch, the setting sun.")
				loc.visible_message(span_warning("Another presence has entered the circle."))

                // EMOTION PHASE - Where things get a bit more complicated
				var/emotion_to_change = input(user, "Which feelings do you wish to alter? The closer you are to the associated memory, the more likely it'll be to work!", "Emotion Selection") as null | text
				if (!emotion_to_change) return

				var/ritualtargets = view(0, loc)
				for (var/mob/living/carbon/human/target in ritualtargets)
					to_chat(target, span_warning("Nails scrape against your feelings of [emotion_to_change]... something foreign brushes against your thoughts."))
					target.flash_fullscreen("redflash3")
					target.emote("agony")
					target.Stun(200)
					target.Knockdown(200)
					to_chat(target, span_userdanger("Her touch slices deep!"))

				if (do_after(user, 20))
					to_chat("[user] begins to speak faster, their voice tinged with power...")
					if (do_after(user, 40))
						user.say("With threads unseen, I begin to weave...")
						if (do_after(user, 50))
							user.say("Soft and slow, through the soul I cleave...")

				if (do_after(user, 40))
					user.say("Now, I will plant a seed in your mind...")
					if (do_after(user, 40))
						user.say("It is time for your memory to shift into a different kind...")

                // Memory suggestion input and final ritual actions
				var/memory_suggestion = input(user, "What memory would you like to alter?", "Memory Suggestion") as null | text
				if (!memory_suggestion) return

				if (do_after(user, 60))
					user.say("'[memory_suggestion]'.")
					if (do_after(user, 90))
						user.say("See it done! Feast on your fill!.")
						playsound(loc, 'sound/misc/astratascream.ogg', 80, FALSE, -1)

						rite_of_oblivion(src, user, emotion_to_change, memory_suggestion)
						spawn(120)
							icon_state = "eora_chalky"

/obj/structure/ritualcircle/eora/proc/pacify(src)
    var/ritualtargets = view(0, loc)
    for(var/mob/living/carbon/human/target in ritualtargets)
        loc.visible_message(span_warning("[target] sways like windchimes in the wind..."))
        target.visible_message(span_green("I feel the burdens of my heart lifting. Something feels very wrong... I don't mind at all..."))
        target.apply_status_effect(/datum/status_effect/buff/pacify)

/obj/structure/ritualcircle/eora/proc/rite_of_oblivion(obj/structure/ritualcircle/eora/src, mob/living/user, emotion_to_change, memory_suggestion)
    var/ritualtargets = view(0, loc)

    for(var/mob/living/carbon/human/target in ritualtargets)
        loc.visible_message(span_warning("[target] seems to fade from existence, their mind clearing of all burdens..."))
        target.visible_message(span_blue("You feel an eerie calm... Something stirs—a thought not your own."))

        // Ask the target if they accept the memory
        var/choice = input(target, "A foreign memory whispers into your thoughts. It seeks to implant the memory of '[memory_suggestion]' by focusing on your '[emotion_to_change]''. Do you accept it? The closer your memory and emotions align, the more difficult it is to fight!", "Memory Intrusion") in list("Accept", "Reject")

        if (choice == "Accept")
            to_chat(target, span_green("You embrace the feeling... Something new has taken root within."))
            to_chat(user, span_notice("[target.real_name] accepted your memory about '[memory_suggestion]'."))


        else
            to_chat(target, span_warning("You shudder and push the thought away—it wasn’t yours."))
            to_chat(user, span_warning("[target.real_name] rejected your memory about '[emotion_to_change]'."))

/* Trickery Ritual - Functional but incredibly janky

/obj/structure/ritualcircle/trickery
	name = "Rune of the Faceless"
	desc = "A Mysterious Rune of the Faceless One"
	icon_state = "noc_chalky"
	var/list/facelessrites = list("Rite of Mirrored Souls")

/obj/structure/ritualcircle/trickery/attack_hand(mob/living/user)
	if (!HAS_TRAIT(user, TRAIT_RITUALIST))
		to_chat(user, span_smallred("I don't know the proper rites for this..."))
		return

	if (user.has_status_effect(/datum/status_effect/debuff/ritesexpended))
		to_chat(user, span_smallred("I have performed enough rituals for the day... I must rest before communing more."))
		return

	var/ritual_level = user.mind?.get_skill_level(/datum/skill/magic/ritual) || 0

	var/rune_data = ritechoices["Rune of Trickery"]
	if (!rune_data)
		to_chat(user, span_warning("This rune is incomplete or unregistered."))
		return

	var/required_level = rune_data["level"]
	if (ritual_level < required_level)
		to_chat(user, span_smallred("I lack the knowledge to invoke this rite."))
		return

	var/riteselection = input(user, "Rituals of the Faceless", src) as null | anything in facelessrites
	switch(riteselection)
		if ("Rite of Mirrored Souls")
			if (do_after(user, 50))
				user.say("I call upon the Faceless One...")
				if (do_after(user, 50))
					user.say("To blur the lines between self and other...")
					if (do_after(user, 50))
						user.say("Let our essences intertwine and mirror each other...")
						if (do_after(user, 50))
							icon_state = "noc_active"
							src.mirrored_souls(user)
							user.apply_status_effect(/datum/status_effect/debuff/ritesexpended)
							spawn(120)
								icon_state = "noc_chalky"

/proc/swap_attributes(mob/living/A, mob/living/B)
    // Swap real names
    var/temp_name = A.real_name
    A.real_name = B.real_name
    B.real_name = temp_name

    // Swap appearances
    var/appearance/temp_appearance = A.appearance
    A.appearance = B.appearance
    B.appearance = temp_appearance

user.apply_status_effect(/datum/status_effect/buff/mirroredsouls, target)
target.apply_status_effect(/datum/status_effect/buff/mirroredsouls, user)


/obj/structure/ritualcircle/xylix
	name = "Rune of Trickery"
	desc = "A Holy Rune of Xylix"

/obj/structure/ritualcircle/malum
	name = "Rune of Forge"
	desc = "A Holy Rune of Malum"

/obj/structure/ritualcircle/abyssor
	name = "Rune of Storm"
	desc = "A Holy Rune of Abyssor"
*/
