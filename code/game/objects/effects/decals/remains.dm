/obj/effect/decal/remains
	name = "remains"
	gender = PLURAL
	icon = 'icons/effects/blood.dmi'

/obj/effect/decal/remains/acid_act()
	visible_message(span_warning("[src] dissolve[gender==PLURAL?"":"s"] into a puddle of sizzling goop!"))
	playsound(src, 'sound/blank.ogg', 150, TRUE)
	new /obj/effect/decal/cleanable/greenglow(drop_location())
	qdel(src)

/obj/effect/decal/remains/human
	desc = ""
	icon = 'icons/roguetown/items/traps.dmi'//since this looks the same as traps, best to share icons so people have to actually examine bones 
	icon_state = "boner1"//hehe

/obj/effect/decal/remains/human/Initialize()
	update_icon()
	. = ..()

/obj/effect/decal/remains/human/update_icon()
	icon_state = "boner[rand(1, 3)]"

/obj/effect/decal/remains/plasma
	icon_state = "remainsplasma"

/obj/effect/decal/remains/xeno
	desc = ""
	icon_state = "remainsxeno"

/obj/effect/decal/remains/xeno/larva
	icon_state = "remainslarva"

/obj/effect/decal/remains/robot
	desc = ""
	icon = 'icons/mob/robots.dmi'
	icon_state = "remainsrobot"

/obj/effect/decal/cleanable/robot_debris/old
	name = "dusty robot debris"
	desc = ""
