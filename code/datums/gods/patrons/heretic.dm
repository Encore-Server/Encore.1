/datum/patron/heretic
	name = null
	associated_faith = /datum/faith/heretic
	undead_hater = FALSE
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	confess_lines = list(
		"THE ELEMENTS DECEIVE!",
		"DIVINITY ROTS!",
		"THE HIGHEST COURT MUST FALL!",
	)

/datum/patron/heretic/jealous_god // The One Envy considers those not of the Shirleigh dynasty to be beneath her notice, beyond carrying out occasional acts of capciciousness for her own amusement. She does not grant miracles to those not of Alyssandrine and Malryck's blood.
	name = "The Jealous God"
	domain = "Domotan Island, and seemingly little else"
	desc = "She whose name is unknown, she whose agenda is lost; the Jealous God embodies no elemental aspect, and serves neither the divine nor ilk of Hell. Her solemn devotees are the royal family of Etgard itself, the Shirleigh Dynasty and their constituents. They are the only divine to lay absolute claim over Domotan Island, and is thus praised only in hushed tones beyond the walls of Etgard Keep."
	worshippers = "The Shirleigh Dynasty, the brainwashed and the desperate"
	mob_traits = list(TRAIT_CABAL, TRAIT_SEEPRICES_SHITTY)
	t0 = null
	t1 = null
	t2 = null
	t3 = null
	t4 = null
	confess_lines = list(
		"SHE SEES! SHE LAUGHS!",
		"SHE LAUGHS! SHE SEES!",
		"SHE KNOWS! SHE KNOWS!",
	)

/datum/patron/heretic/devil
	name = "Archdevils"
	domain = "All heretical anti-deities subservient to Hell"
	desc = "Archdevils of the steepest rage whose influence has been made in the world, either as intruders from Hell itself or hidden Divines seeking to disrupt the Elemental Balance. Worshippers of warring devils are usually affected by the fall of Angros, whose descent into madness is idealized as an attempt to break free of divine shackles."
	worshippers = "All manner of nefarious folk"
	mob_traits = list(TRAIT_HORDE, TRAIT_ORGAN_EATER)
	t0 = /obj/effect/proc_holder/spell/invoked/eyebite
	t1 = /obj/effect/proc_holder/spell/targeted/shadowwalk
	t2 = /obj/effect/proc_holder/spell/invoked/projectile/bloodlightning
	t3 = /obj/effect/proc_holder/spell/invoked/projectile/bloodsteal
	confess_lines = list(
		"CLAW AT THE SOIL! BREAK THE FIRMAMENT!",
		"RELEASE THE OLD ONES! RETURN THEIR CROWN!",
		"WHAT ONCE WAS WILL BECOME NOW, AGAIN!",
	)

/datum/patron/heretic/otherkind
	name = "Secret Gods"
	domain = "Secret sects hidden within the Divine Courts"
	desc = "The praise of divines other than those subservient to the Four Elementals is heresy, even if those stragglers seek not to disrupt the balance; the mere worship gives power to Heavenly figures, after all. Which God that is remains up to you."
	worshippers = "The desperate, the drunk and the depraved"
	mob_traits = list(TRAIT_DEPRAVED, TRAIT_CRACKHEAD)
	t0 = /obj/effect/proc_holder/spell/aoe_turf/conjure/the_traps
	t1 = /obj/effect/proc_holder/spell/targeted/spiderconjur//weaving a web of LIES
	t3 = /obj/effect/proc_holder/spell/invoked/projectile/bloodlightning//Secret gods have to be a little higher level to start getting aggressive
	t4 = /obj/effect/proc_holder/spell/self/dendor_shapeshift//freakyyyy
	confess_lines = list(
		"THE DECEIVERS FLEE! SEE THEIR LIES!",
		"A PANTHEON EXISTS BEYOND YOUR OWN!",
		"DIVINES WITHOUT NUMBER ARE BEYOND THE STARS!",
	)
