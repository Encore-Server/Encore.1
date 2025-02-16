/datum/job/roguetown/orthodoxist
	title = "Orthodoxist"
	flag = ORTHODOXIST
	department_flag = INQUISITION
	faction = "Station"
	total_positions = 99//Uncapped basically
	spawn_positions = 99
	allowed_races = RACES_ALL_KINDS
	allowed_patrons = list(/datum/patron/all_aspect) //You MUST have an All Aspect character to start. Just so people don't get japed into Oops Suddenly Katholikos!
	tutorial = "A fervent believer in the cause of the Inquisition. Recruited by the Inquisitor to further the Katholikos' goal in the locale."
	selection_color = JCOLOR_INQUISITION
	outfit = null
	outfit_female = null
	display_order = JDO_ORTHODOXIST
	min_pq = -999 // We need you to be atleast kinda competent to do this. This is a soft antaggy sorta role. Also needs to know wtf an ELEMENTAL is
	max_pq = null
	round_contrib_points = 2
	advclass_cat_rolls = list(CTAG_INQUISITION = 20)
	wanderer_examine = FALSE
	advjob_examine = TRUE

/datum/job/roguetown/orthodoxist/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(L)
		var/mob/living/carbon/human/H = L
		if(!H.mind)
			return
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")
