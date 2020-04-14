#define VIEW_RANGE_CLOSED	6
#define VIEW_OFFSET_CLOSED	0
#define VIEW_RANGE_OPEN	9
#define VIEW_OFFSET_OPEN	(WORLD_ICON_SIZE*4)

#define MOVESPEED_OPEN		0.25
/*
	Lurker:

	Slow ranged support mob. High damage, but fairly slow movement
	Has retractable armor.
		When Closed:
			Very tough
			Reduced Vision
			Can't attack

		When Open
			Vulnerable
			Longer vision range
			Can launch ranged attacks
			Slower movement
*/

/datum/species/necromorph/lurker
	name = SPECIES_NECROMORPH_LURKER
	mob_type	=	/mob/living/carbon/human/necromorph/lurker
	blurb = "Long range fire-support. The lurker is tough and hard to hit as long as its retractible armor is closed. When open it is slow and vulnerable, but fires sharp spines in waves of three."
	unarmed_types = list(/datum/unarmed_attack/claws) //Bite attack is a backup if blades are severed
	total_health = 60
	biomass = 50

	icon_template = 'icons/mob/necromorph/lurker.dmi'
	icon_lying = "_lying"
	single_icon = FALSE
	spawner_spawnable = TRUE

	pixel_offset_x = -16

	evasion = 10	//Doesn't move much, but small target

	view_range = VIEW_RANGE_CLOSED
	view_offset = VIEW_OFFSET_CLOSED


	has_limbs = list(
	BP_CHEST =  list("path" = /obj/item/organ/external/chest/simple),
	BP_L_ARM =  list("path" = /obj/item/organ/external/arm/tentacle/slim/lurker1),
	BP_HEAD =   list("path" = /obj/item/organ/external/arm/tentacle/slim/lurker2),
	BP_R_ARM =  list("path" = /obj/item/organ/external/arm/tentacle/slim/lurker3)
	)

	has_organ = list(    // which required-organ checks are conducted.
	BP_HEART =    /obj/item/organ/internal/heart/undead,
	BP_LUNGS =    /obj/item/organ/internal/lungs/undead,
	BP_BRAIN =    /obj/item/organ/internal/brain/undead/lurker,
	BP_EYES =     /obj/item/organ/internal/eyes/lurker
	)

	organ_substitutions = list(BP_L_LEG = BP_CHEST,
	BP_R_LEG = BP_CHEST,
	BP_L_FOOT = BP_CHEST,
	BP_R_FOOT = BP_CHEST)

	inherent_verbs = list(/mob/living/carbon/human/proc/retract_shell, /mob/proc/shout)
	modifier_verbs = list(KEY_ALT = list(/mob/living/carbon/human/proc/toggle_shell))

	slowdown = 2.75

	//Lurker's "legs" are part of the body sprite
	locomotion_limbs = list(BP_CHEST)


	//HUD Handling. This is needed to allow shell to be equipped
	hud_type = /datum/hud_data/necromorph/lurker
	/*
	species_audio = list(SOUND_FOOTSTEP = list('sound/effects/footstep/lurker_footstep_1.ogg',
	'sound/effects/footstep/lurker_footstep_2.ogg',
	'sound/effects/footstep/lurker_footstep_3.ogg',
	'sound/effects/footstep/lurker_footstep_4.ogg',
	'sound/effects/footstep/lurker_footstep_5.ogg'),
	SOUND_PAIN = list('sound/effects/creatures/necromorph/lurker/lurker_pain_1.ogg',
	 'sound/effects/creatures/necromorph/lurker/lurker_pain_2.ogg',
	 'sound/effects/creatures/necromorph/lurker/lurker_pain_3.ogg',
	 'sound/effects/creatures/necromorph/lurker/lurker_pain_4.ogg',
	 'sound/effects/creatures/necromorph/lurker/lurker_pain_5.ogg',
	 'sound/effects/creatures/necromorph/lurker/lurker_pain_6.ogg',
	 'sound/effects/creatures/necromorph/lurker/lurker_pain_7.ogg'),
	SOUND_DEATH = list('sound/effects/creatures/necromorph/lurker/lurker_death_1.ogg',
	'sound/effects/creatures/necromorph/lurker/lurker_death_2.ogg',
	'sound/effects/creatures/necromorph/lurker/lurker_death_3.ogg'),
	SOUND_ATTACK = list('sound/effects/creatures/necromorph/lurker/lurker_attack_1.ogg',
	'sound/effects/creatures/necromorph/lurker/lurker_attack_2.ogg',
	'sound/effects/creatures/necromorph/lurker/lurker_attack_3.ogg',
	'sound/effects/creatures/necromorph/lurker/lurker_attack_4.ogg',
	'sound/effects/creatures/necromorph/lurker/lurker_attack_5.ogg',
	'sound/effects/creatures/necromorph/lurker/lurker_attack_6.ogg',
	'sound/effects/creatures/necromorph/lurker/lurker_attack_7.ogg'),
	SOUND_SHOUT = list('sound/effects/creatures/necromorph/lurker/lurker_shout_1.ogg',
	'sound/effects/creatures/necromorph/lurker/lurker_shout_2.ogg',
	'sound/effects/creatures/necromorph/lurker/lurker_shout_3.ogg',
	'sound/effects/creatures/necromorph/lurker/lurker_shout_4.ogg',
	'sound/effects/creatures/necromorph/lurker/lurker_shout_5.ogg',
	'sound/effects/creatures/necromorph/lurker/lurker_shout_6.ogg'),
	SOUND_SHOUT_LONG = list('sound/effects/creatures/necromorph/lurker/lurker_shout_long_1.ogg',
	'sound/effects/creatures/necromorph/lurker/lurker_shout_long_2.ogg',
	'sound/effects/creatures/necromorph/lurker/lurker_shout_long_3.ogg',
	'sound/effects/creatures/necromorph/lurker/lurker_shout_long_4.ogg',
	'sound/effects/creatures/necromorph/lurker/lurker_shout_long_5.ogg'),
	SOUND_SPEECH = list('sound/effects/creatures/necromorph/lurker/lurker_speech_1.ogg',
	'sound/effects/creatures/necromorph/lurker/lurker_speech_2.ogg',
	'sound/effects/creatures/necromorph/lurker/lurker_speech_3.ogg',
	'sound/effects/creatures/necromorph/lurker/lurker_speech_4.ogg')
	)
	*/

#define LURKER_LEAP_DESC	"<h2>Leap:</h2><br>\
<h3>Hotkey: Ctrl+Alt+Click </h3><br>\
<h3>Cooldown: 6 seconds</h3><br>\
The user screams for a few seconds, then leaps through the air towards the target at high speed. If they successfully hit the target, that target is knocked down, leaving them vulnerable to followup attacks.<br>\
Leap has some autoaim, clicking within 1 tile of a living mob is enough to target them. It will not home in on targets though, so you're in trouble if they move after you start.<br>\
While in the air, the lurker doesn't count as touching the ground, and will harmlessly soar over ground traps and barricades<br>\
If the user hits a solid obstacle while leaping, they will be knocked down and take some moderate damage. The obstacle will also be hit hard, and destroyed in some cases. <br>\
<br>\
Leap is best used to initiate a fight by ambushing an unaware opponent. Combined with the lurker's long vision range, you can jump on someone before they've even seen you, and catch them by surprise"


#define LURKER_TAILSTRIKE_DESC "<h2>Tailstrike:</h2><br>\
<h3>Hotkey: Alt+Click</h3><br>\
<h3>Cooldown: 2.5 seconds</h3><br>\
The lurker stands on its arms, swinging its tail around over 0.75 seconds to deal a powerful hit to a target up to 2 tiles away.<br>\
Tailstrike hits hard, and can even destroy obstacles, but it is slow, heavily telegraphed, and easy to dodge. Very difficult to land on a target that won't stay still<br>\

Best used to finish off stunned/downed/injured victims, or for smashing a path through doors and terrain"

#define LURKER_GALLOP_DESC "<h2>Gallop:</h2><br>\
<h3>Hotkey: Ctrl+Shift+Click</h3><br>\
<h3>Cooldown: 10 seconds</h3><br>\
The lurker breaks into a gallop, gaining a HUGE boost to speed for 4 seconds. During this time it briefly becomes the fastest of all necromorphs.<br>\
While galloping, the lurker is very vulnerable. Taking any damage, or bumping into any obstacles, will cause it to collapse and become stunned for a while<br>\

Gallop is great to use to follow up a Leap into battle, allowing you to quickly escape before your victim gets their bearings and hits you. <br>\
It can be used to chase down a fleeing opponent, to move along long hallways quickly, and it also allows the lurker to serve as a beast of burden, dragging corpses back faster than anyone else can."

/datum/species/necromorph/lurker/get_ability_descriptions()
	.= ""
	. += LURKER_LEAP_DESC
	. += "<hr>"
	. += LURKER_TAILSTRIKE_DESC
	. += "<hr>"
	. += LURKER_GALLOP_DESC


//Light claw attack, not its main means of damage
/datum/unarmed_attack/claws/lurker
	damage = 7


/*

	Lurker has three tentacles, and brain+eyes in its "chest"

*/
/obj/item/organ/external/arm/tentacle/slim/lurker1
	organ_tag = BP_L_ARM
	icon_name = "tentacle_1"
	retracted = TRUE

/obj/item/organ/external/arm/tentacle/slim/lurker2
	organ_tag = BP_HEAD
	icon_name = "tentacle_2"
	retracted = TRUE

/obj/item/organ/external/arm/tentacle/slim/lurker3
	organ_tag = BP_R_ARM
	icon_name = "tentacle_3"
	retracted = TRUE

/obj/item/organ/internal/brain/undead/lurker
	parent_organ = BP_CHEST

/obj/item/organ/internal/eyes/lurker
	parent_organ = BP_CHEST











/*--------------------------------------

	Retracting
	User calls these procs, they tell the extension to do stuff.
	The extension manages the limbs, shell-clothing-item, and updating icons
----------------------------------------*/
/mob/living/carbon/human/proc/toggle_shell()
	var/datum/extension/retractable_cover/lurker/RL = get_extension(src, /datum/extension/retractable_cover)
	if (RL.open)
		RL.start_closing()
	else
		RL.start_opening()

/mob/living/carbon/human/proc/retract_shell()
	set name = "Retract Shell"
	set category = "Abilities"
	set desc = "Retracts your protective plating, exposing your offensive tentacle weapons."

	var/datum/extension/retractable_cover/lurker/RL = get_extension(src, /datum/extension/retractable_cover)
	RL.start_opening()

/mob/living/carbon/human/proc/close_shell()
	set name = "Close Shell"
	set category = "Abilities"
	set desc = "Closes your protective plating,protecting the tentacles."

	var/datum/extension/retractable_cover/lurker/RL = get_extension(src, /datum/extension/retractable_cover)
	RL.start_closing()


/*

	Lurker's retractible armor plating is implemented as a clothing item, in the back slot

*/
/obj/item/clothing/lurker_shell
	name = "retractible shell"
	siemens_coefficient = 0.9
	species_restricted = FALSE
	permeability_threshold = 0.8	//As long as health is above this proportion of max health, reagent permeability is unaffected. Below that value it increases rapidly
	armor = list(melee = 50, bullet = 50, laser = 50, energy = 50, bomb = 50, bio = 50, rad = 50)
	icon = 'icons/mob/necromorph/lurker.dmi'
	icon_state = "lurker_shell"
	item_state = "lurker_shell"
	slot_flags = SLOT_BACK
	sprite_sheets = list(
		SPECIES_NECROMORPH_LURKER = 'icons/mob/necromorph/lurker.dmi'
		)

/obj/item/clothing/lurker_shell/proc/close()
	icon_state = initial(icon_state)
	item_state = initial(item_state)
	armor = initial(armor)
	update_wear_icon()

/obj/item/clothing/lurker_shell/proc/open()
	icon_state = ""
	item_state = ""
	armor = list()
	update_wear_icon()

/datum/species/necromorph/lurker/handle_post_spawn(var/mob/living/carbon/human/H)
	.=..()

	var/obj/item/clothing/lurker_shell/shell = new(H)
	H.equip_to_slot_or_del(shell, slot_back)

	set_extension(H, /datum/extension/retractable_cover/lurker, shell, list(BP_HEAD, BP_L_ARM, BP_R_ARM))



/*

	Extension to manage the retracting

*/
/datum/extension/retractable_cover/lurker
	var/speed_delta = 0


/datum/extension/retractable_cover/lurker/close()
	var/obj/item/clothing/lurker_shell/LS = cover
	LS.close()
	.=..()
	user.verbs -= /mob/living/carbon/human/proc/close_shell
	user.verbs |= /mob/living/carbon/human/proc/retract_shell
	user.view_range = VIEW_RANGE_CLOSED
	user.view_offset = VIEW_OFFSET_CLOSED
	user.reset_view()

	//Reset movespeed
	user.move_speed_factor += speed_delta
	speed_delta = 0


/datum/extension/retractable_cover/lurker/open()
	var/obj/item/clothing/lurker_shell/LS = cover
	LS.open()
	.=..()
	user.verbs |= /mob/living/carbon/human/proc/close_shell
	user.verbs -= /mob/living/carbon/human/proc/retract_shell
	user.view_range = VIEW_RANGE_OPEN
	user.view_offset = VIEW_OFFSET_OPEN
	user.reset_view()

	//Lets set the speed
	var/newspeed = user.move_speed_factor * MOVESPEED_OPEN
	speed_delta = user.move_speed_factor - newspeed
	user.move_speed_factor = newspeed


#undef VIEW_RANGE_CLOSED
#undef VIEW_OFFSET_CLOSED
#undef VIEW_RANGE_OPEN
#undef VIEW_OFFSET_OPEN