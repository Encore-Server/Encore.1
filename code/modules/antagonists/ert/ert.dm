//Both ERT and DS are handled by the same datums since they mostly differ in equipment in objective.
/datum/team/ert
	name = "Emergency Response Team"
	var/datum/objective/mission //main mission

/datum/antagonist/ert
	name = "Emergency Response Officer"
	var/datum/team/ert/ert_team
	var/leader = FALSE
	var/datum/outfit/outfit = /datum/outfit/ert/security
	var/role = "Security Officer"
	var/list/name_source
	var/random_names = TRUE
	show_in_antagpanel = FALSE
	antag_moodlet = /datum/mood_event/focused
	can_hijack = HIJACK_PREVENT

/datum/antagonist/ert/on_gain()
	if(random_names)
		update_name()
	forge_objectives()
	equipERT()
	. = ..()

/datum/antagonist/ert/get_team()
	return ert_team

/datum/antagonist/ert/New()
	. = ..()
	name_source = GLOB.last_names

/datum/antagonist/ert/proc/update_name()
	owner.current.fully_replace_character_name(owner.current.real_name,"[role] [pick(name_source)]")

/datum/antagonist/ert/deathsquad/New()
	. = ..()
	name_source = GLOB.commando_names

/datum/antagonist/ert/deathsquad/apply_innate_effects(mob/living/mob_override)
	ADD_TRAIT(owner, TRAIT_DISK_VERIFIER, DEATHSQUAD_TRAIT)

/datum/antagonist/ert/deathsquad/remove_innate_effects(mob/living/mob_override)
	REMOVE_TRAIT(owner, TRAIT_DISK_VERIFIER, DEATHSQUAD_TRAIT)

/datum/antagonist/ert/security // kinda handled by the base template but here for completion

/datum/antagonist/ert/security/red
	outfit = /datum/outfit/ert/security/alert

/datum/antagonist/ert/engineer
	role = "Engineer"
	outfit = /datum/outfit/ert/engineer

/datum/antagonist/ert/engineer/red
	outfit = /datum/outfit/ert/engineer/alert

/datum/antagonist/ert/medic
	role = "Medical Officer"
	outfit = /datum/outfit/ert/medic

/datum/antagonist/ert/medic/red
	outfit = /datum/outfit/ert/medic/alert

/datum/antagonist/ert/commander
	role = "Commander"
	outfit = /datum/outfit/ert/commander

/datum/antagonist/ert/commander/red
	outfit = /datum/outfit/ert/commander/alert

/datum/antagonist/ert/deathsquad
	name = "Deathsquad Trooper"
	outfit = /datum/outfit/death_commando
	role = "Trooper"

/datum/antagonist/ert/medic/inquisitor
	outfit = /datum/outfit/ert/medic/inquisitor

/datum/antagonist/ert/security/inquisitor
	outfit = /datum/outfit/ert/security/inquisitor

/datum/antagonist/ert/chaplain
	role = "Chaplain"
	outfit = /datum/outfit/ert/chaplain

/datum/antagonist/ert/chaplain/inquisitor
	outfit = /datum/outfit/ert/chaplain/inquisitor

/datum/antagonist/ert/chaplain/on_gain()
	. = ..()
	owner.isholy = TRUE

/datum/antagonist/ert/commander/inquisitor
	outfit = /datum/outfit/ert/commander/inquisitor

/datum/antagonist/ert/commander/inquisitor/on_gain()
	. = ..()
	owner.isholy = TRUE

/datum/antagonist/ert/janitor
	role = "Janitor"
	outfit = /datum/outfit/ert/janitor

/datum/antagonist/ert/janitor/heavy
	role = "Heavy Duty Janitor"
	outfit = /datum/outfit/ert/janitor/heavy

/datum/antagonist/ert/deathsquad/leader
	name = "Deathsquad Officer"
	outfit = /datum/outfit/death_commando
	role = "Officer"

/datum/antagonist/ert/intern
	name = "CentCom Intern"
	outfit = /datum/outfit/centcom_intern
	random_names = FALSE
	role = "Intern"

/datum/antagonist/ert/intern/leader
	name = "CentCom Head Intern"
	outfit = /datum/outfit/centcom_intern/leader
	role = "Head Intern"

/datum/antagonist/ert/create_team(datum/team/ert/new_team)
	if(istype(new_team))
		ert_team = new_team

/datum/antagonist/ert/proc/forge_objectives()
	if(ert_team)
		objectives |= ert_team.objectives

/datum/antagonist/ert/proc/equipERT()
	var/mob/living/carbon/human/H = owner.current
	if(!istype(H))
		return
	H.equipOutfit(outfit)

/datum/antagonist/ert/greet()
	if(!ert_team)
		return

	to_chat(owner, "<B><font size=3 color=red>I am the [name].</font></B>")

	var/missiondesc = ""
	if(leader) //If Squad Leader
		missiondesc += " Lead my squad to ensure the completion of the mission. Board the shuttle when my team is ready."
	else
		missiondesc += " Follow orders given to you by my squad leader."

		missiondesc += "Avoid civilian casualties when possible."

	missiondesc += "<BR><B>My Mission</B> : [ert_team.mission.explanation_text]"
	to_chat(owner,missiondesc)

/datum/antagonist/ert/deathsquad/greet()
	if(!ert_team)
		return

	to_chat(owner, "<B><font size=3 color=red>I am the [name].</font></B>")

	var/missiondesc = ""
	if(leader) //If Squad Leader
		missiondesc += " Lead my squad to ensure the completion of the mission. Board the shuttle when my team is ready."
	else
		missiondesc += " Follow orders given to you by my squad leader."

	missiondesc += "<BR><B>My Mission</B> : [ert_team.mission.explanation_text]"
	to_chat(owner,missiondesc)
