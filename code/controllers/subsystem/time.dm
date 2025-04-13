SUBSYSTEM_DEF(time)
	name = "Time"
	init_order = INIT_ORDER_TIME
	priority = FIRE_PRIORITY_TIME
	wait = 1 SECONDS
	flags = SS_BACKGROUND | SS_KEEP_TIMING
	runlevels = RUNLEVEL_INIT|RUNLEVEL_LOBBY|RUNLEVEL_SETUP|RUNLEVEL_GAME|RUNLEVEL_POSTGAME


/datum/controller/subsystem/time/Initialize()
	process_station_time()
	return ..()

/datum/controller/subsystem/time/fire(resumed = 0)
	process_station_time()
	return
