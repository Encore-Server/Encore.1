/*	Photocopiers!
 *	Contains:
 *		Photocopier
 *		Toner Cartridge
 */

/*
 * Photocopier
 */
/obj/machinery/photocopier
	name = "photocopier"
	desc = ""
	icon = 'icons/obj/library.dmi'
	icon_state = "photocopier"
	density = TRUE
	use_power = IDLE_POWER_USE
	idle_power_usage = 30
	active_power_usage = 200
	power_channel = EQUIP
	max_integrity = 300
	integrity_failure = 0.33
	var/obj/item/paper/copy = null	//what's in the copier!
	var/obj/item/photo/photocopy = null
	var/obj/item/documents/doccopy = null
	var/copies = 1	//how many copies to print!
	var/toner = 40 //how much toner is left! woooooo~
	var/maxcopies = 10	//how many copies can be copied at once- idea shamelessly stolen from bs12's copier!
	var/greytoggle = "Greyscale"
	var/mob/living/ass //i can't believe i didn't write a stupid-ass comment about this var when i first coded asscopy.
	var/busy = FALSE

/obj/item/toner
	name = "toner cartridge"
	icon = 'icons/obj/device.dmi'
	icon_state = "tonercartridge"
	grind_results = list(/datum/reagent/iodine = 40, /datum/reagent/iron = 10)
	var/charges = 5
	var/max_charges = 5
