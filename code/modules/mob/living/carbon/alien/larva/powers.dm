/obj/effect/proc_holder/alien/hide
	name = "Hide"
	desc = ""
	plasma_cost = 0

	action_icon_state = "alien_hide"

/obj/effect/proc_holder/alien/hide/fire(mob/living/carbon/alien/user)
	if(user.stat != CONSCIOUS)
		return

	if (user.layer != ABOVE_NORMAL_TURF_LAYER)
		user.layer = ABOVE_NORMAL_TURF_LAYER
		user.visible_message(span_name("[user] scurries to the ground!"), \
						span_noticealien("I am now hiding."))
	else
		user.layer = MOB_LAYER
		user.visible_message(span_notice("[user] slowly peeks up from the ground..."), \
					span_noticealien("I stop hiding."))
	return 1


/obj/effect/proc_holder/alien/larva_evolve
	name = "Evolve"
	desc = ""
	plasma_cost = 0

	action_icon_state = "alien_evolve_larva"

/obj/effect/proc_holder/alien/larva_evolve/fire(mob/living/carbon/alien/user)
	if(!islarva(user))
		return
	var/mob/living/carbon/alien/larva/L = user

	if(L.handcuffed || L.legcuffed) // Cuffing larvas ? Eh ?
		to_chat(user, span_warning("I cannot evolve when you are cuffed!"))
		return

	if(L.amount_grown >= L.max_grown)	//TODO ~Carn
		to_chat(L, span_name("I am growing into a beautiful alien! It is time to choose a caste."))
		to_chat(L, span_info("There are three to choose from:"))
		to_chat(L, span_name("Hunters</span> <span class='info'>are the most agile caste, tasked with hunting for hosts. They are faster than a human and can even pounce, but are not much tougher than a drone."))
		to_chat(L, span_name("Sentinels</span> <span class='info'>are tasked with protecting the hive. With their ranged spit, invisibility, and high health, they make formidable guardians and acceptable secondhand hunters."))
		to_chat(L, span_name("Drones</span> <span class='info'>are the weakest and slowest of the castes, but can grow into a praetorian and then queen if no queen exists, and are vital to maintaining a hive with their resin secretion abilities."))
		var/alien_caste = alert(L, "Please choose which alien caste you shall belong to.",,"Hunter","Sentinel","Drone")

		if(user.incapacitated()) //something happened to us while we were choosing.
			return

		var/mob/living/carbon/alien/humanoid/new_xeno
		switch(alien_caste)
			if("Hunter")
				new_xeno = new /mob/living/carbon/alien/humanoid/hunter(L.loc)
			if("Sentinel")
				new_xeno = new /mob/living/carbon/alien/humanoid/sentinel(L.loc)
			if("Drone")
				new_xeno = new /mob/living/carbon/alien/humanoid/drone(L.loc)

		L.alien_evolve(new_xeno)
		return 0
	else
		to_chat(user, span_warning("I am not fully grown!"))
		return 0
