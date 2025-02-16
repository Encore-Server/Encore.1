/obj/effect/proc_holder/spell/targeted/explosion
	name = "Explosion"
	desc = ""
	invocation = "EXPLOSION!!"
	invocation_type = "shout"
	charge_max = 12000//Twenty minute recharge seems reasonable for the craziest spell in the game

	var/ex_severe = -1
	var/ex_heavy = 4
	var/ex_light = 7
	var/ex_flash = 25//You are going to get flashed
	var/exp_fire = 9//even the caster is in danger
	devotion_unlockable = FALSE

/obj/effect/proc_holder/spell/targeted/explosion/cast(list/targets,mob/user = usr)
	for(var/mob/living/target in targets)
		if(target.anti_magic_check())
			continue
		explosion(target.loc,ex_severe,ex_heavy,ex_light,ex_flash, 0, flame_range = exp_fire)
		var/turf/origin_turf = get_turf(src)
		for(var/mob/living/player in GLOB.player_list)
			if(player.stat == DEAD)
				continue
			if(isbrain(player))
				continue

			var/distance = get_dist(player, origin_turf)
			var/dirtext = " to the "
			var/direction = get_dir(player, origin_turf)
			switch(direction)
				if(NORTH)
					dirtext += "north"
				if(SOUTH)
					dirtext += "south"
				if(EAST)
					dirtext += "east"
				if(WEST)
					dirtext += "west"
				if(NORTHWEST)
					dirtext += "northwest"
				if(NORTHEAST)
					dirtext += "northeast"
				if(SOUTHWEST)
					dirtext += "southwest"
				if(SOUTHEAST)
					dirtext += "southeast"
				else //Where ARE you.
					dirtext = "although I cannot make out an exact direction"

			var/disttext
			switch(distance)
				if(0 to 20)
					disttext = " within 20 paces"
				if(20 to 40)
					disttext = " 20 to 40 paces away"
				if(40 to 80)
					disttext = " 40 to 80 paces away"
				if(80 to 160)
					disttext = " far"
				else
					disttext = " very far" 
		
					player.playsound_local(get_turf(player), 'sound/magic/distant_explosion_huge.ogg', 100, FALSE, pressure_affected = FALSE)
					to_chat(player, span_warning("I hear an earth-shattering explosion somewhere[disttext], [dirtext]"))
	return
