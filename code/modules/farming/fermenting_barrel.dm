/obj/structure/fermenting_barrel
	name = "barrel"
	desc = ""
	icon = 'icons/roguetown/misc/structure.dmi'
	icon_state = "barrel1"
	density = TRUE
	opacity = FALSE
	anchored = FALSE
	pressure_resistance = 2 * ONE_ATMOSPHERE
	max_integrity = 300
	drag_slowdown = 2
	var/open = FALSE
	var/speed_multiplier = 1 //How fast it distills. Defaults to 100% (1.0). Lower is better.

/obj/structure/fermenting_barrel/Initialize()
	// Bluespace beakers, but without the portability or efficiency in circuits.
	create_reagents(900, DRAINABLE | AMOUNT_VISIBLE | REFILLABLE)
	icon_state = "barrel[rand(1,3)]"
	. = ..()

/obj/structure/fermenting_barrel/Destroy()
	chem_splash(loc, 2, list(reagents))
	qdel(reagents)
	..()

/obj/structure/fermenting_barrel/examine(mob/user)
	. = ..()
//	. += span_notice("It is currently [open?"open, letting you pour liquids in.":"closed, letting you draw liquids."]")

/obj/structure/fermenting_barrel/proc/makeWine(obj/item/reagent_containers/food/snacks/grown/fruit)
	if(fruit.reagents)
		fruit.reagents.remove_reagent(/datum/reagent/consumable/nutriment, fruit.reagents.total_volume)
		fruit.reagents.trans_to(src, fruit.reagents.total_volume)
	if(fruit.distill_reagent)
		reagents.add_reagent(fruit.distill_reagent, fruit.distill_amt)
	qdel(fruit)
	playsound(src, "bubbles", 100, TRUE)
	return TRUE

/obj/structure/fermenting_barrel/attackby(obj/item/I, mob/user, params)
	if(istype(I,/obj/item/reagent_containers/food/snacks/grown))
		if(try_ferment(I, user))
			return TRUE
	if(istype(I,/obj/item/reagent_containers/powder))
		var/obj/item/reagent_containers/powder/P = I
		P.reagents.trans_to(src, P.reagents.total_volume)
		qdel(P)
		playsound(src, "bubbles", 100, TRUE)
		return TRUE
	if(istype(I,/obj/item/storage/roguebag) && I.contents.len)
		var/success
		for(var/obj/item/reagent_containers/food/snacks/grown/bagged_fruit in I.contents)
			if(try_ferment(bagged_fruit, user, TRUE))
				success = TRUE
		if(success)
			to_chat(user, span_info("I dump the contents of [I] into [src]."))
			I.update_icon()
		else
			to_chat(user, span_warning("There's nothing in [I] that I can ferment."))
		return TRUE
	..()

/obj/structure/fermenting_barrel/proc/try_ferment(obj/item/reagent_containers/food/snacks/grown/fruit, mob/user, batch_process)
	if(!fruit.can_distill)
		if(!batch_process)
			to_chat(user, span_warning("I can't ferment this into anything."))
		return FALSE
	else if(!user.transferItemToLoc(fruit,src))
		if(!batch_process)
			to_chat(user, span_warning("[fruit] is stuck to my hand!"))
		return FALSE
	if(!batch_process)
		to_chat(user, span_info("I place [fruit] into [src]."))
	addtimer(CALLBACK(src, PROC_REF(makeWine), fruit), rand(1 MINUTES, 3 MINUTES))
	return TRUE

//obj/structure/fermenting_barrel/attack_hand(mob/user)
//	open = !open
//	if(open)
//		ENABLE_BITFIELD(reagents.flags, DRAINABLE)
//		ENABLE_BITFIELD(reagents.flags, REFILLABLE)
//		to_chat(user, span_notice("I open [src]."))
//	else
//		DISABLE_BITFIELD(reagents.flags, DRAINABLE)
//		DISABLE_BITFIELD(reagents.flags, REFILLABLE)
//		to_chat(user, span_notice("I close [src]."))
//	update_icon()

/obj/structure/fermenting_barrel/update_icon()
	if(open)
		icon_state = "barrel_open"
	else
		icon_state = "barrel"
	if(broken)
		icon_state = "barrel_destroyed"

/obj/structure/fermenting_barrel/random/water
	name = "water barrel"
	icon_state = "pbarrel1"

/obj/structure/fermenting_barrel/random/water/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/water, rand(0,900))

/obj/structure/fermenting_barrel/random/beer/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/consumable/ethanol/beer, rand(0,900))

/obj/structure/fermenting_barrel/water
	name = "water barrel"
	icon_state = "pbarrel1"

/obj/structure/fermenting_barrel/water/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/water,900)

/obj/structure/fermenting_barrel/beer
	desc = "A barrel containing a generic housebrewed small-beer."

/obj/structure/fermenting_barrel/beer/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/consumable/ethanol/beer,900)

/obj/item/roguebin/water/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/water,500)
	update_icon()

/obj/item/roguebin/water/gross/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/water/gross,500)
	update_icon()

/obj/structure/fermenting_barrel/zagul
	desc = "A barrel marked with a coastal zagul. An extremely cheap lager hailing from a local brewery."

/obj/structure/fermenting_barrel/zagul/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/consumable/ethanol/beer/zagul,900)

/obj/structure/fermenting_barrel/blackgoat
	desc = "A barrel marked with the Black Goat Kriek emblem. A fruit-sour beer brewed with jackberries for a tangy taste."

/obj/structure/fermenting_barrel/blackgoat/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/consumable/ethanol/beer/blackgoat,900)

/obj/structure/fermenting_barrel/hagwoodbitter
	desc = "A barrel marked with the Hagwood Bitters emblem. A common export from Tor Sterkenstadt, this drink is a popular mainstay at parties and celebrations across the Goblet."

/obj/structure/fermenting_barrel/hagwoodbitter/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/consumable/ethanol/beer/hagwoodbitter,900)

/obj/structure/fermenting_barrel/onion
	desc = "A barrel with an emblem from the Bars of Fog. A drink first fermented and distilled as a joke by some Nortlanders on a Swampweed trip, this onion brandy found unexpected popularity locally, but didn't make much headway in the wider Goblet for its offputting choice of ingredient."

/obj/structure/fermenting_barrel/onion/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/consumable/ethanol/beer/onion,900)

/obj/structure/fermenting_barrel/druidsdelight
	desc = "A barrel with a generic leaf emblem. An Elven beer brewed from an herbal gruit."

/obj/structure/fermenting_barrel/druidsdelight/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/consumable/ethanol/beer/druidsdelight,900)

/obj/structure/fermenting_barrel/fireleaf
	desc = "A barrel with a generic leaf emblem. An Elven beer formed by distilling cabbages."

/obj/structure/fermenting_barrel/fireleaf/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/consumable/ethanol/beer/fireleaf,900)

/obj/structure/fermenting_barrel/buttermelt
	desc = "A barrel with the Tor Sterkenstadt emblem. This beer, known as Buttermelt, is widely considered one of the greatest exported by the City of Celebrants."

/obj/structure/fermenting_barrel/buttermelt/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/consumable/ethanol/beer/buttermelt,900)

/obj/structure/fermenting_barrel/stonebeards
	desc = "A barrel with the Tor Sterkenstadt emblem. Stonebeards Reserve is one of the most renown beers in existence, with only a few hundred barrels made every year. Many have been pilfered by the invaders of the Sultanate, only increasing their rarity."

/obj/structure/fermenting_barrel/stonebeards/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/consumable/ethanol/beer/stonebeards,900)

/obj/structure/fermenting_barrel/voddena
	desc = "A barrel with the Dors emblem. This strange liquid has a reputation for being one of the most potent alcoholic drink in all the Goblet. It has received wild success as an export, and is purchased by people of all classes, for an efficient and quick way to get wasted."

/obj/structure/fermenting_barrel/voddena/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/consumable/ethanol/beer/voddena,900)

/obj/structure/fermenting_barrel/wine
	desc = "A barrel with a plain grape emblem. This one appears to be labelled as a generic red wine, sourced from all over the Goblet."

/obj/structure/fermenting_barrel/wine/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/consumable/ethanol/beer/wine,900)

/obj/structure/fermenting_barrel/sourwine
	desc = "A bottle with the black ink cork-seal of Wavehearth. This one is labelled as an extremely sour wine that is watered down with mineral water, cheap and popular with the peasantry."

/obj/structure/fermenting_barrel/sourwine/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/consumable/ethanol/beer/sourwine,900)

/obj/structure/fermenting_barrel/whitewine
	desc = "A barrel with the emblem of the vintners from Sanct. This one appears to be labelled as a sweet white wine from the countryside vineyards."

/obj/structure/fermenting_barrel/whitewine/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/consumable/ethanol/beer/whitewine,900)

/obj/structure/fermenting_barrel/redwine
	desc = "A barrel with the emblem of the vintners from Sanct. This one appears to be labelled as a relatively young red wine from the countryside vineyards."

/obj/structure/fermenting_barrel/redwine/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/consumable/ethanol/beer/redwine,900)

/obj/structure/fermenting_barrel/elfred
	desc = "A barrel gilded with a silver emblem. It appears to be labelled as an elven red wine from Wavehearth, and is incredibly popular with the city's nobility. Likely worth more than what an entire village makes!"

/obj/structure/fermenting_barrel/elfred/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/consumable/ethanol/beer/elfred,900)

/obj/structure/fermenting_barrel/elfblue
	desc = "A barrel gilded with a golden emblem. This is the legendary Rols Blue from the Vineyard of Saint's Rest, created in commemoration of the discovery of the Good King. This barrel would swoon Gods over, and must be worth a small fortune!"

/obj/structure/fermenting_barrel/elfblue/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/consumable/ethanol/beer/elfblue,900)

/obj/structure/fermenting_barrel/blessedwine
	desc = "A barrel with the Katholikos emblem burned into the wood. It is labeled as a sweet red wine, consecrated with the divine power of the Aspects through the addition of blessed water, and is known for its gentle restorative properties."

/obj/structure/fermenting_barrel/blessedwine/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/consumable/ethanol/beer/redwine/blessed,900)

/obj/structure/fermenting_barrel/cursedwine
	desc = "A barrel with no emblem or indication as to who created it. It is labeled as containing a sweet red wine, though simply being near it makes you feel uneasy."

/obj/structure/fermenting_barrel/cursedwine/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/consumable/ethanol/beer/redwine/cursed,900)

/obj/structure/fermenting_barrel/jagdtrunk
	desc = "A barrel with a Gernhollow emblem. This dark liquid is the strongest alcohol coming out of Geramor available. A herbal schnapps, sure to burn out any disease."

/obj/structure/fermenting_barrel/jagdtrunk/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/consumable/ethanol/beer/jagdtrunk,900)

/obj/structure/fermenting_barrel/apfelweinheim
	desc = "A barrel with the Dunmoon Brewery emblem. A cider from the truetech giant, the city of Dunmoon. Well received for its addition of pear, alongside crisp apples."

/obj/structure/fermenting_barrel/apfelweinheim/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/consumable/ethanol/beer/apfelweinheim,900)

/obj/structure/fermenting_barrel/rtoper
	desc = "A barrel with a haphazardly drawn emblem of Havel Sectus. An especially tart, slightly salty cider from the island. Myths say the brewers let the barrels age buried in the sand of the island shores, which results in that especially stong flavour."

/obj/structure/fermenting_barrel/rtoper/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/consumable/ethanol/beer/rtoper,900)

/obj/structure/fermenting_barrel/nred
	desc = "A barrel with a Jin cork-seal. A red ale brewed to perfection in the Noma lands."

/obj/structure/fermenting_barrel/nred/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/consumable/ethanol/beer/nred,900)

/obj/structure/fermenting_barrel/gronnmead
	desc = "A barrel with a Nortmidst cork-seal. A deep red honey-wine, refined with the red berries that still cling to life in the frosty reaches of the capital. Legend claims the once-white berries that this wine was refined with became red in colour as the plants feasted on the spilled blood of the Wooly Serpent, Jormungandr."

/obj/structure/fermenting_barrel/gronnmead/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/consumable/ethanol/beer/gronnmead,900)

/obj/structure/fermenting_barrel/avarmead
	desc = "A barrel with a generic honeycomb emblem. A golden honey-wine brewed by the Nortic Tribes, primarily those that live in areas not overtaken by the creeping White Death. Manages to keep a proper taste while staying strong."

/obj/structure/fermenting_barrel/avarmead/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/consumable/ethanol/beer/avarmead,900)

/obj/structure/fermenting_barrel/avarrice
	desc = "A bottle with a simple cork-seal. A murky, white wine made from what few berries can be grown in the cold of Nortmidst."

/obj/structure/fermenting_barrel/avarrice/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/consumable/ethanol/beer/avarrice,900)

/obj/structure/fermenting_barrel/saigamilk
	desc = "A bottle with a Running Saiga cork-seal. A form of alcohol brewed from the milk of a saiga and salt. Common drink of the Noma living in the steppe."

/obj/structure/fermenting_barrel/saigamilk/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/consumable/ethanol/beer/saigamilk,900)

/obj/structure/fermenting_barrel/kgunlager
	desc = "A bottle with a Dunmoon Brewery cork-seal. A pale lager brewed in the truetech heartland of Dunmoon, refined with green tea for an unique flavour-profile."

/obj/structure/fermenting_barrel/kgunlager/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/consumable/ethanol/beer/kgunlager,900)

/obj/structure/fermenting_barrel/kgunsake
	desc = "A bottle with a Golden Swan cork-seal. A translucient, pale-blue liquid made from rice. A favourite drink of the people of the Cudao mainland."

/obj/structure/fermenting_barrel/kgunsake/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/consumable/ethanol/beer/kgunsake,900)

/obj/structure/fermenting_barrel/kgunplum
	desc = "A bottle with a Yinshi cork-seal. A reddish-golden alcohol made from a fruit commonly found along the mountainous peaks around Cudao's capital. Popular with the upper class."

/obj/structure/fermenting_barrel/kgunplum/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/consumable/ethanol/beer/kgunplum,900)

/obj/effect/spawner/lootdrop/roguetown/alcohol/cheap
	name = "cheap alcohol spawner"
	loot = list(/obj/structure/fermenting_barrel/zagul = 1, /obj/structure/fermenting_barrel/fireleaf = 1, /obj/structure/fermenting_barrel/sourwine = 1, /obj/structure/fermenting_barrel/rtoper = 1, /obj/structure/fermenting_barrel/blackgoat = 1)
	lootcount = 1

/obj/effect/spawner/lootdrop/roguetown/alcohol/average
	name = "average alcohol spawner"
	loot = list(/obj/structure/fermenting_barrel/beer = 1, /obj/structure/fermenting_barrel/hagwoodbitter = 1, /obj/structure/fermenting_barrel/onion = 1, /obj/structure/fermenting_barrel/druidsdelight = 1, /obj/structure/fermenting_barrel/voddena = 1, /obj/structure/fermenting_barrel/whitewine = 1, /obj/structure/fermenting_barrel/redwine = 1, /obj/structure/fermenting_barrel/apfelweinheim = 1, /obj/structure/fermenting_barrel/saigamilk = 1, /obj/structure/fermenting_barrel/avarmead = 1, /obj/structure/fermenting_barrel/avarrice = 1, /obj/structure/fermenting_barrel/kgunsake = 1, /obj/structure/fermenting_barrel/kgunlager = 1)
	lootcount = 1

/obj/effect/spawner/lootdrop/roguetown/alcohol/expensive
	name = "expensive alcohol spawner"
	loot = list(/obj/structure/fermenting_barrel/buttermelt = 1, /obj/structure/fermenting_barrel/elfred = 1, /obj/structure/fermenting_barrel/jagdtrunk = 1, /obj/structure/fermenting_barrel/gronnmead = 1, /obj/structure/fermenting_barrel/nred = 1, /obj/structure/fermenting_barrel/kgunplum = 1)
	lootcount = 1

/obj/effect/spawner/lootdrop/roguetown/alcohol/rare
	name = "rare alcohol spawner"
	loot = list(/obj/structure/fermenting_barrel/stonebeards = 1, /obj/structure/fermenting_barrel/elfblue = 1)
	lootcount = 1
