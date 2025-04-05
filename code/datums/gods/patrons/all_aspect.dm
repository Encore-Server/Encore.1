/datum/patron/all_aspect
	name = "The All-Aspect"
	domain = "The balance of all four Elementals"
	desc = "The balance between the Elementals is always adhered to, but the worshippers most keen to maintain the balance are those of the Katholikos."
	worshippers = "Fanatics, acolytes and inquisitors"
	associated_faith = /datum/faith/all_aspect
	amulet = /obj/item/clothing/neck/roguetown/psicross/silver
	t0 = null
	t1 = /obj/effect/proc_holder/spell/invoked/push_spell // Dark Souls wrath of the gods
	t2 = /obj/effect/proc_holder/spell/invoked/sacred_flame_rogue // Divine fire. Light the heretics' pyre. Nobody is able to get this high on All-Aspect anyway so t2 and beyond are kinda moot. But something for future plans maybe.
	t3 = /obj/effect/proc_holder/spell/invoked/blade_burst // Be attacked by unaspected holy energy or something. All-Aspect is the balance, so it being amorphous energy instead of any one element seems neat.
	t4 = /obj/effect/proc_holder/spell/invoked/revive // If powerful All-Aspect clergy somehow ever shows up, being able to revive people seems good. Gani and Akan both can.
	confess_lines = list(
		"THE BALANCE COMMANDS!",
		"THE ASPECTS PREVAIL!",
		"THE CYCLE IS MAINTAINED!",
	)
