/datum/patron/elemental
	name = null
	associated_faith = /datum/faith/elemental
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal

/datum/patron/elemental/gani
	name = "Gani"
	domain = "Mother Goddess of the Earth and Soil"
	desc = "Gani, the Mother, embodies the fundamental element of earth. They are an ancient spirit made divine as they would personify the very essence of the stern, immovable and protective Aspect of Stone. Gani is the world beneath the feet of all. She is the only God of the Four whose omnipresence extends beyond her domain."
	worshippers = "All Earthly things, the farms, the huntsmen and matriarchs"
	amulet = /obj/item/clothing/neck/roguetown/psicross/gani
	mob_traits = list(TRAIT_KNEESTINGER_IMMUNITY)
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t1 = /obj/effect/proc_holder/spell/targeted/blesscrop
	t2 = /obj/effect/proc_holder/spell/targeted/conjure_glowshroom
	t3 = /obj/effect/proc_holder/spell/self/dendor_shapeshift
	t4 = /obj/effect/proc_holder/spell/invoked/revive
	additional_spells = list(/obj/effect/proc_holder/spell/invoked/heal)
	confess_lines = list(
		"GOLDEN GREENING!",
		"WE SPROUT ANEW!",
		"BY LEAF AND LIMB!",
	)

/datum/patron/elemental/mjallidhorn
	name = "Mjallidhorn"
	domain = "The Warrior God of Ice"
	desc = "Mjhallidhorn, the Warrior, embodies the fundamental element of ice. They are a once-mortal made divine as they would personify the very essence of the ruthless, brutal and materialistic Aspect of Frost. Mjallidhorn is an Elemental locked in battle in the far north against the hordes of Hell, perhaps forevermore."
	worshippers = "Warriors, sellswords, justiciers and freedom fighters"
	amulet = /obj/item/clothing/neck/roguetown/psicross/mjallidhorn
	mob_traits = list(TRAIT_SOUL_EXAMINE, TRAIT_MJALLIDHORN_SWIM, TRAIT_DEATHSIGHT)
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t1 = /obj/effect/proc_holder/spell/targeted/abrogation
	t2 = /obj/effect/proc_holder/spell/invoked/avert
	t3 = /obj/effect/proc_holder/spell/targeted/soulspeak
	t4 = /obj/effect/proc_holder/spell/targeted/burialrite
	confess_lines = list(
		"THE NORTH'S MADNESS!",
		"BLOOD IN THE FIRMAMENT! BLOOD IN ALL THINGS!",
		"I FEAR NOT DEATH, THE FOREVER WAR AWAITS ME!",
	)

/datum/patron/elemental/akan
	name = "Akan"
	domain = "God of Air, the Sky and Heaven"
	desc = "Akan, the Elder, embodies the fundamental element of air. They are an ancient spirit made divine as they would personify the very essence of the wistful, everlasting and free Aspect of the Sky."
	worshippers = "Nomads, scholars and the forever-free"
	amulet = /obj/item/clothing/neck/roguetown/psicross/akan
	mob_traits = list(TRAIT_EMPATH, TRAIT_NIGHT_OWL, TRAIT_AKANSIGHT)
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t1 = /obj/effect/proc_holder/spell/invoked/diagnose
	t2 = /obj/effect/proc_holder/spell/invoked/attach_bodypart
	t3 = /obj/effect/proc_holder/spell/invoked/cure_rot
	t4 = /obj/effect/proc_holder/spell/invoked/revive
	confess_lines = list(
		"AKAN HEARS, BUT DOES NOT SEE!",
		"I SEE WHAT THE BLIND MAN SEES!",
		"A CLOUD 'BOUT THE ERRANT SOUL!",
	)

/datum/patron/elemental/visires
	name = "Visires"
	domain = "The Goddess of Fire and Wrath"
	desc = "The youngest of the Elemental Gods. A once-mortal given host to the Aspect of Fire and made divine. The worship of Visires represents the plea for passion, life and the will to live; just as much it does the destruction, the hunger and the chaos that it may impose."
	worshippers = "Conquerors, the wrathful, the pupils of the Sun's science"
	amulet = /obj/item/clothing/neck/roguetown/psicross/visires
	t0 = /obj/effect/proc_holder/spell/invoked/projectile/spitfire
	t1 = /obj/effect/proc_holder/spell/invoked/sacred_flame_rogue
	t2 = /obj/effect/proc_holder/spell/invoked/projectile/fireball
	t3 = /obj/effect/proc_holder/spell/invoked/projectile/fireball/greater
	t4 = /obj/effect/proc_holder/spell/targeted/explosion//EXPLOSION!!!
	confess_lines = list(
		"VISIRES SUNDERS!",
		"THE ASPECT OF FIRE HUNGERS!",
		"I SERVE THE STARS!",
	)

/datum/patron/elemental/iliope
	name = "Iliope the Fool"
	domain = "Demigod of trickery, dreams and inspiration"
	desc = "A demi-deity of Akan's court, both famous and infamous for their sway over the forces of luck. Iliope is known for the inspiration of many a bards lyric. Speaks through their gift to man; the Tarot deck."
	worshippers = "Gamblers, bards, artists, and the silver-tongued"
	mob_traits = list(TRAIT_ILIOPE)
	amulet = /obj/item/clothing/neck/roguetown/psicross/iliope
	t0 = /obj/effect/proc_holder/spell/invoked/blindness/miracle
	t1 = /obj/effect/proc_holder/spell/invoked/invisibility/miracle
	t2 = /obj/effect/proc_holder/spell/targeted/forcewall//real mime shit
	t3 = /obj/effect/proc_holder/spell/targeted/ethereal_jaunt
	t4 = /obj/effect/proc_holder/spell/targeted/smoke
	confess_lines = list(
		"VISIRES IS MY LIGHT!",
		"AKAN FLIES FREE AND TOO FAR FROM ME!",
		"GANI PROVIDES!",
		"GOLER KANH IS MY MUSE!",
		"MJALLIDHORN IS MY TERROR!",
	)

/datum/patron/elemental/golerkanh
	name = "Goler Kanh"
	domain = "Demigod of the Hand, Purveyor of Stone"
	desc = "A servant deity to Gani. The creator of technology, and he who first harnessed land and rock to serve mortal will."
	worshippers = "Smiths, engineers and tinkerers"
	amulet = /obj/item/clothing/neck/roguetown/psicross/golerkanh
	t0 = /obj/effect/proc_holder/spell/invoked/sacred_flame_rogue
	t1 = /obj/effect/proc_holder/spell/targeted/tesla
	t2 = /obj/effect/proc_holder/spell/invoked/knock
	t3 = /obj/effect/proc_holder/spell/invoked/projectile/fetch
	t4 = /obj/effect/proc_holder/spell/targeted/projectile/magic_missile
	confess_lines = list(
		"IN MY HAND IS ALL MORTAL POWER!",
		"WITH GANI'S EDGE I STRIKE!",
		"I AM AN INSTRUMENT OF CREATION!",
	)
