/// this is bad code
/mob/living/silicon/robot/update_icons()
	if(!module) // this is worse code
		return
	cut_overlays()
	icon_state = module.cyborg_base_icon

	//Citadel changes start here - Allows modules to use different icon files, and allows modules to specify a pixel offset
	icon = (module.cyborg_icon_override ? module.cyborg_icon_override : initial(icon))
	if(laser)
		add_overlay("laser")//Is this even used??? - Yes borg/inventory.dm
	if(disabler)
		add_overlay("disabler")//ditto

	if(robot_resting)
		if(stat != DEAD && can_rest())
			switch(robot_resting)
				if(ROBOT_REST_NORMAL)
					icon_state = "[module.cyborg_base_icon]-rest"
				if(ROBOT_REST_SITTING)
					icon_state = "[module.cyborg_base_icon]-sit"
				if(ROBOT_REST_BELLY_UP)
					icon_state = "[module.cyborg_base_icon]-bellyup"
				else
					icon_state = "[module.cyborg_base_icon]"
			cut_overlays()
	else
		icon_state = "[module.cyborg_base_icon]"

	if(stat == DEAD && module.has_snowflake_deadsprite)
		icon_state = "[module.cyborg_base_icon]-wreck"

	if(module.cyborg_pixel_offset)
		pixel_w = module.cyborg_pixel_offset
	//End of citadel changes

	if(module.cyborg_base_icon == "robot")
		icon = 'icons/mob/robots.dmi'
		pixel_w = initial(pixel_w)
		pixel_x = initial(pixel_x)

	if(stat != DEAD && !(IsUnconscious() ||IsStun() || IsKnockdown() || IsParalyzed() || low_power_mode) && !robot_resting) //Not dead, not stunned.
		if(!eye_lights)
			eye_lights = new()
		if(lamp_intensity > 2)
			eye_lights.icon_state = "[module.special_light_key ? "[module.special_light_key]":"[module.cyborg_base_icon]"]_l"
		else
			eye_lights.icon_state = "[module.special_light_key ? "[module.special_light_key]":"[module.cyborg_base_icon]"]_e[is_servant_of_ratvar(src) ? "_r" : ""]"
		eye_lights.icon = icon
		add_overlay(eye_lights)

	if(opened)
		if(wiresexposed)
			add_overlay("ov-opencover +w")
		else if(cell)
			add_overlay("ov-opencover +c")
		else
			add_overlay("ov-opencover -c")
	if(hat)
		var/mutable_appearance/head_overlay = hat.build_worn_icon(default_layer = 20, default_icon_file = 'icons/mob/clothing/head.dmi', override_state = hat.icon_state)
		head_overlay.pixel_y += hat_offset
		add_overlay(head_overlay)
	update_fire()

	SEND_SIGNAL(src, COMSIG_ROBOT_UPDATE_ICONS)
