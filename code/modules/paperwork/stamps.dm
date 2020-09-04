/obj/item/weapon/stamp
	name = "rubber stamp"
	desc = "A rubber stamp for stamping important documents."
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "stamp-qm"
	item_state = "stamp"
	throwforce = 0
	w_class = ITEMSIZE_TINY
	slot_flags = SLOT_HOLSTER
	throw_speed = 7
	throw_range = 15
	matter = list(DEFAULT_WALL_MATERIAL = 60)
	pressure_resistance = 2
	attack_verb = list("stamped")

/obj/item/weapon/stamp/captain
	name = "mayor's rubber stamp"
	icon_state = "stamp-cap"

/obj/item/weapon/stamp/hop
	name = "city clerk's rubber stamp"
	icon_state = "stamp-hop"

/obj/item/weapon/stamp/hos
	name = "chief of police's rubber stamp"
	icon_state = "stamp-hos"

/obj/item/weapon/stamp/ward
	name = "warden's rubber stamp"
	icon_state = "stamp-ward"

/obj/item/weapon/stamp/ce
	name = "chief engineer's rubber stamp"
	icon_state = "stamp-ce"

/obj/item/weapon/stamp/rd
	name = "research director's rubber stamp"
	icon_state = "stamp-rd"

/obj/item/weapon/stamp/cmo
	name = "chief medical officer's rubber stamp"
	icon_state = "stamp-cmo"

/obj/item/weapon/stamp/psych
	name = "psych's rubber stamp"
	icon_state = "stamp-cmo"

/obj/item/weapon/stamp/doctor
	name = "doctor's rubber stamp"
	icon_state = "stamp-cmo"

/obj/item/weapon/stamp/denied
	name = "\improper DENIED rubber stamp"
	icon_state = "stamp-deny"

/obj/item/weapon/stamp/approved
	name = "\improper APPROVED rubber stamp"
	icon_state = "stamp-cent"

/obj/item/weapon/stamp/clown
	name = "clown's rubber stamp"
	icon_state = "stamp-clown"

/obj/item/weapon/stamp/internalaffairs
	name = "internal affairs rubber stamp"
	icon_state = "stamp-intaff"

/obj/item/weapon/stamp/centcomm
	name = "\improper CentCom rubber stamp"
	icon_state = "stamp-cent"

/obj/item/weapon/stamp/qm
	name = "supply chief's rubber stamp"
	icon_state = "stamp-qm"

/obj/item/weapon/stamp/cargo
	name = "factory rubber stamp"
	icon_state = "stamp-cargo"

/obj/item/weapon/stamp/solgov
	name = "\improper Sol Government rubber stamp"
	icon_state = "stamp-sg"

//Business Stamps

/obj/item/weapon/stamp/business
	name = "business rubber stamp"
	desc = "An small handheld printer for stamping important documents."
	icon_state = "stamp-biz"
	var/business_name
	unique_save_vars = list("business_name")

/obj/item/weapon/stamp/business/attackby(obj/item/weapon/W as obj, mob/user as mob)
	var/obj/item/weapon/card/id/I = W.GetID()
	var/owner_uid = I.unique_ID

	if(!business_name)
		var/biz = get_business_by_owner_uid(owner_uid).name
		if(biz)
			playsound(src, 'sound/machines/chime.ogg', 25)
			name = "[biz] rubber stamp"
			to_chat(user, "<span class='notice'>The stamp registers your business name to its memory.</span>")
		else
			playsound(src, 'sound/machines/buzz-sigh.ogg', 25)
			to_chat(user, "<span class='notice'>[name] was unable to find a business linked to your ID.</span>")
	else
		playsound(src, 'sound/machines/buzz-sigh.ogg', 25)
		to_chat(user, "<span class='notice'>There is already a business linked to the stamp.</span>")

// Syndicate stamp to forge documents.
/obj/item/weapon/stamp/chameleon/attack_self(mob/user as mob)

	var/list/stamp_types = typesof(/obj/item/weapon/stamp) - list(src.type, /obj/item/weapon/stamp/business) // Get all stamp types except our own
	var/list/stamps = list()

	// Generate them into a list
	for(var/stamp_type in stamp_types)
		var/obj/item/weapon/stamp/S = new stamp_type
		stamps[capitalize(S.name)] = S

	var/list/show_stamps = list("EXIT" = null) + sortList(stamps) // the list that will be shown to the user to pick from

	var/input_stamp = input(user, "Choose a stamp to disguise as.", "Choose a stamp.") in show_stamps

	if(user && (src in user.contents))

		var/obj/item/weapon/stamp/chosen_stamp = stamps[capitalize(input_stamp)]

		if(chosen_stamp)
			name = chosen_stamp.name
			icon_state = chosen_stamp.icon_state