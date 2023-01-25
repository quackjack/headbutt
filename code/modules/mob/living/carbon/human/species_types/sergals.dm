/datum/species/sergal
	name = "Sergal" //base sergal form w/o any regional differences
	id = "sergal"
	limbs_id = "sergal"
	icon_limbs = "sergal"
	default_color = "FFFFFF"
	inherent_traits = list(TRAIT_NIGHT_VISION)
	species_traits = list(EYECOLOR,HAIR,FACEHAIR,LIPS,MUTCOLORS_PARTSONLY,WINGCOLOR,HAS_FLESH,HAS_BONE)
	mutant_bodyparts = list("mcolor" = "FFFFFF", "mcolor2" = "FFFFFF","mcolor3" = "FFFFFF","tail_human" = "None", "ears" = "None", "taur" = "None", "deco_wings" = "None", "legs" = "Plantigrade", "mam_body_markings" = list())
	use_skintones = USE_SKINTONES_GRAYSCALE_CUSTOM
	skinned_type = /obj/item/stack/sheet/animalhide/human
	disliked_food = GROSS | LONGPORK | TOXIC
	liked_food = MEAT | RAW
	tail_type = "tail_human"
	wagging_type = "waggingtail_human"
	species_type = "furry"
	allowed_limb_ids = list("mammal","aquatic","avian")
