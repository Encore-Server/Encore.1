/datum/voicepack/male/demon/get_sound(soundin, modifiers)
	var/used
	switch(modifiers)
		if("old")
			used = getmold(soundin)
		if("young")
			used = getmyoung(soundin)
		if("silenced")
			used = getmsilenced(soundin)
	if(!used)
		switch(soundin)
			if("laugh")
				used = 'sound/vo/mobs/demon/demon_laughter.ogg'
			if("aggro")
				used = 'sound/vo/mobs/demon/demon_roar.ogg'
			if("deathgurgle")
				used = 'sound/vo/mobs/demon/demon_growl.ogg'
			if("idle")
				used = 'sound/vo/mobs/demon/demon_hiss.ogg'
			if("pain")
				used = 'sound/vo/mobs/demon/demon_pain.ogg'
			if("paincrit")
				used = 'sound/vo/mobs/demon/demon_roar.ogg'
			if("painscream")
				used = 'sound/vo/mobs/demon/demon_roar.ogg'
			if("rage")
				used = 'sound/vo/mobs/demon/demon_growl.ogg'
	if(!used)
		used = ..(soundin)
	return used
