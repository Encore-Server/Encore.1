//Weeping Wood and western side of the map
/area/rogue/outdoors/woods/west
	name = "wilderness"
	icon_state = "woods"
	ambientsounds = AMB_JUNGLEDAY
	ambientnight = AMB_JUNGLENIGHT
	spookysounds = SPOOKY_FROG
	spookynight = SPOOKY_MYSTICAL
	droning_sound = 'sound/music/area/forest.ogg'
	droning_sound_dusk = 'sound/music/area/forest.ogg'
	droning_sound_night = 'sound/music/area/forest.ogg'
	soundenv = 15
	ambush_times = list("night","dawn","dusk","day")
	ambush_types = list(
				/turf/open/floor/rogue/dirt,
				/turf/open/floor/rogue/grass,
				/turf/open/floor/rogue/sand,
				/turf/open/water/ocean,
				/turf/open/water/ocean/deep)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 40,
				/mob/living/simple_animal/hostile/retaliate/rogue/mossback = 20,
				/mob/living/carbon/human/species/goblin/npc/ambush = 30)
	first_time_text = "THE WEEPING WOOD"

/area/rogue/outdoors/woods/west/thornbed
	name = "thornbed"
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/bogtroll = 45,
				/mob/living/simple_animal/hostile/retaliate/rogue/mossback = 20)
	first_time_text = "THORNBED"

/area/rogue/outdoors/woods/west/crescent
	name = "crescent"
	ambush_mobs = list(
				/mob/living/carbon/human/species/goblin/npc/ambush/sea = 15,
				/mob/living/simple_animal/hostile/retaliate/rogue/mossback = 65)
	first_time_text = "CRESCENT OF REBIRTH"
/area/rogue/outdoors/woods/west/crags
	name = "crags"
	ambush_mobs = list(
				/mob/living/carbon/human/species/goblin/npc/ambush/sea = 95,//Good luck lmao
				/mob/living/simple_animal/hostile/retaliate/rogue/mossback = 35)
	first_time_text = "GOBLIN CRAGS"//No one would suspect an ambush here, right?

//swampweed and booze here, not much danger
/area/rogue/outdoors/woods/west/lonelyeerie
	name = "lonelyeerie"
	ambush_mobs = null//very lonely
	first_time_text = "LONELY EERIE"

//old fort
/area/rogue/under/cave/oldfort
	name = "oldfort_lower"
	icon_state = "under"
	first_time_text = "KILN OF CLAIMS"
	droning_sound = 'sound/music/area/sargoth.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/oldfort

/area/rogue/outdoors/oldfort
	name = "oldfort_outdoors"
	icon_state = "sargoth"
	first_time_text = "INVADER'S GRAVE"
	droning_sound = 'sound/music/area/siege.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

//old town ruins
/area/rogue/under/cave/oldtown
	name = "oldtown_lower"
	icon_state = "under"
	first_time_text = "OLD SHIRLEIGH"
	droning_sound = 'sound/music/area/dwarf.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/oldtown

/area/rogue/indoors/oldtown
	name = "oldtown_indoors"
	droning_sound = 'sound/music/area/septimus.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/oldtown

/area/rogue/outdoors/oldtown
	name = "oldtown_outdoors"
	icon_state = "sargoth"
	first_time_text = "ANCIENT DOMA"
	droning_sound = 'sound/music/area/spidercave.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

//lost keep
/area/rogue/under/cave/lostkeep
	name = "lostkeep_lower"
	icon_state = "under"
	first_time_text = "CRADLE OF SIN"
	droning_sound = 'sound/music/area/dungeon.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/lostkeep

/area/rogue/indoors/lostkeep
	name = "lostkeep_indoors"
	droning_sound = 'sound/music/area/church.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/lostkeep

/area/rogue/outdoors/lostkeep
	name = "lostkeep_outdoors"
	icon_state = "sargoth"
	first_time_text = "MONUMENT TO SIN"
	droning_sound = 'sound/music/area/dwarf.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

//hotel paradise
/area/rogue/under/cave/paradise
	name = "paradise_lower"
	icon_state = "under"
	droning_sound = 'sound/music/area/dwarf.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/paradise

/area/rogue/indoors/paradise
	name = "paradise_indoors"
	droning_sound = 'sound/music/area/bath.ogg'
	droning_sound_dusk = null
	first_time_text = "HOTEL PARADISE"
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/paradise

/area/rogue/outdoors/paradise
	name = "paradise_outdoors"
	icon_state = "sargoth"
	first_time_text = "THE BLUE HOPE"
	droning_sound = 'sound/newmusic/Inn_Ambient.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

//lighthouse
/area/rogue/under/cave/lighthouse
	name = "lighthouse_lower"
	icon_state = "under"
	droning_sound = 'sound/music/area/church.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/dungeon1

/area/rogue/indoors/lighthouse
	name = "lighthouse_indoors"
	droning_sound = 'sound/music/area/bath.ogg'
	droning_sound_dusk = null
	first_time_text = "HOUSE OF LIGHT"
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/lighthouse

/area/rogue/outdoors/lighthouse
	name = "lighthouse_outdoors"
	icon_state = "sargoth"
	first_time_text = "THE BATTLEMENTS"
	droning_sound = 'sound/music/area/forest.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
