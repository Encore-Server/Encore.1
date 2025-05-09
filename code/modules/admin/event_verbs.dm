//Event verbs
//pretty much niche shit to make event running easier
/client/proc/event_checkpoint()
	set category = "Admin"
	set name = "Event Checkpoint"
	var/source = mob.loc

	var/confirm = alert(src, "Create Checkpoint", "Is this the first, second or third?", "First", "Second", "Third")
	var/first_checkpoint = /obj/structure/fluff/traveltile/checkpoint
	var/second_checkpoint = /obj/structure/fluff/traveltile/checkpoint/second
	var/third_checkpoint = /obj/structure/fluff/traveltile/checkpoint/third

	switch(confirm)
		if("First")
			new first_checkpoint(source)

		if("Second")
			new second_checkpoint(source)

		if("Third")
			new third_checkpoint(source)
