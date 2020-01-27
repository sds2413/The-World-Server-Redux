// Different types of fish! They are all subtypes of this tho
/mob/living/simple_animal/fish
	name = "fish"
	desc = "Its a fishy.  No touchy fishy."
	icon = 'icons/mob/fish.dmi'
	icon_state = "trout-dead"
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat
	intelligence_level = SA_ANIMAL

	// By defautl they can be in any water turf.  Subtypes might restrict to deep/shallow etc
	var/global/list/suitable_turf_types =  list(
		/turf/simulated/floor/beach/water,
		/turf/simulated/floor/beach/coastline,
		/turf/simulated/floor/holofloor/beach/water,
		/turf/simulated/floor/holofloor/beach/coastline,
		/turf/simulated/floor/water
	)

// Don't swim out of the water
/mob/living/simple_animal/fish/handle_wander_movement()
	if(isturf(src.loc) && !resting && !buckled && canmove) //Physically capable of moving?
		lifes_since_move++ //Increment turns since move (turns are life() cycles)
		if(lifes_since_move >= turns_per_move)
			if(!(stop_when_pulled && pulledby)) //Some animals don't move when pulled
				var/moving_to = 0 // otherwise it always picks 4, fuck if I know.   Did I mention fuck BYOND
				moving_to = pick(cardinal)
				dir = moving_to			//How about we turn them the direction they are moving, yay.
				var/turf/T = get_step(src,moving_to)
				if(T && is_type_in_list(T, suitable_turf_types))
					Move(T)
					lifes_since_move = 0

// Take damage if we are not in water
/mob/living/simple_animal/fish/handle_breathing()
	var/turf/T = get_turf(src)
	if(T && !is_type_in_list(T, suitable_turf_types))
		if(prob(50))
			say(pick("Blub", "Glub", "Burble"))
		adjustBruteLoss(unsuitable_atoms_damage)

/mob/living/simple_animal/fish/bass
	name = "bass"
	icon_state = "bass-swim"
	icon_living = "bass-swim"
	icon_dead = "bass-dead"

/mob/living/simple_animal/fish/trout
	name = "trout"
	icon_state = "trout-swim"
	icon_living = "trout-swim"
	icon_dead = "trout-dead"

/mob/living/simple_animal/fish/salmon
	name = "salmon"
	icon_state = "salmon-swim"
	icon_living = "salmon-swim"
	icon_dead = "salmon-dead"

/mob/living/simple_animal/fish/perch
	name = "perch"
	icon_state = "perch-swim"
	icon_living = "perch-swim"
	icon_dead = "perch-dead"

/mob/living/simple_animal/fish/pike
	name = "pike"
	icon_state = "pike-swim"
	icon_living = "pike-swim"
	icon_dead = "pike-dead"

/mob/living/simple_animal/fish/koi
	name = "koi"
	icon_state = "koi-swim"
	icon_living = "koi-swim"
	icon_dead = "koi-dead"

/mob/living/simple_animal/fish/javelin
	name = "javelin"
	tt_desc = "S Cetusan minimalix"
	icon_state = "javelin-swim"
	icon_living = "javelin-swim"
	icon_dead = "javelin-dead"

	meat_type = /obj/item/weapon/reagent_containers/food/snacks/carpmeat/sif

/mob/living/simple_animal/fish/icebass
	name = "glitter bass"
	tt_desc = "X Micropterus notius crotux"
	icon_state = "sifbass-swim"
	icon_living = "sifbass-swim"
	icon_dead = "sifbass-dead"

	var/max_red = 150
	var/min_red = 50

	var/max_blue = 255
	var/min_blue = 50

	var/max_green = 150
	var/min_green = 50

	var/dorsal_color = "#FFFFFF"
	var/belly_color = "#FFFFFF"

	var/image/dorsal_image
	var/image/belly_image

/mob/living/simple_animal/fish/icebass/initialize()
	..()
	dorsal_color = rgb(rand(min_red,max_red), rand(min_green,max_green), rand(min_blue,max_blue))
	belly_color = rgb(rand(min_red,max_red), rand(min_green,max_green), rand(min_blue,max_blue))
	update_icon()

/mob/living/simple_animal/fish/icebass/update_icon()
	overlays.Cut()
	..()
	if(!dorsal_image)
		dorsal_image = image(icon, "[icon_state]_mask-body")
	if(!belly_image)
		belly_image = image(icon, "[icon_state]_mask-belly")

	dorsal_image.color = dorsal_color
	belly_image.color = belly_color

	overlays += dorsal_image
	overlays += belly_image


/mob/living/simple_animal/fish/rockfish
	name = "rock-fish"
	tt_desc = "S Tetraodontidae scopulix"
	icon_state = "rockfish-swim"
	icon_living = "rockfish-swim"
	icon_dead = "rockfish-dead"

	var/max_red = 255
	var/min_red = 50

	var/max_blue = 255
	var/min_blue = 50

	var/max_green = 255
	var/min_green = 50

	var/head_color = "#FFFFFF"

	var/image/head_image

	meat_type = /obj/item/weapon/reagent_containers/food/snacks/carpmeat/sif

/mob/living/simple_animal/fish/rockfish/initialize()
	..()
	head_color = rgb(rand(min_red,max_red), rand(min_green,max_green), rand(min_blue,max_blue))

/mob/living/simple_animal/fish/rockfish/update_icon()
	overlays.Cut()
	..()
	if(!head_image)
		head_image = image(icon, "[icon_state]_mask")

	head_image.color = head_color

	overlays += head_image

/mob/living/simple_animal/fish/solarfish
	name = "sun-fin"
	tt_desc = "S Exocoetidae solarin"
	icon_state = "solarfin-swim"
	icon_living = "solarfin-swim"
	icon_dead = "solarfin-dead"

	meat_type = /obj/item/weapon/reagent_containers/food/snacks/carpmeat/sif

/mob/living/simple_animal/fish/murkin
	name = "murkin"
	tt_desc = "S Perca lutux"

	icon_state = "murkin-swim"
	icon_living = "murkin-swim"
	icon_dead = "murkin-dead"

	meat_type = /obj/item/weapon/reagent_containers/food/snacks/carpmeat/sif/murkfish