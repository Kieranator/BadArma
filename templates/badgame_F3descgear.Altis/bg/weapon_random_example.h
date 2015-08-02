primary[] =
{
	{
		"arifle_MX_F", // classname of weapon
		{
			{"30Rnd_65x39_caseless_mag",8}, // weapon comes with 8 mags of given classname
			{"30Rnd_65x39_caseless_mag_Tracer",2} // weapon also comes with 2 of these
		//	{"HandGrenade",3} // any magazine will work obv, wouldnt recommend it for clarity's sake
		},
		{
			{""},{"optic_Holosight"},{"optic_ACO_grn_smg","acc_pointer_IR"} // weapon items
			
		//	if multiple entries, one set is chosen randomly. eg:
		//	{""} weapon will never have any weapon items, unless through other attachment property
		//	{"optic_ACO_grn_smg","acc_pointer_IR"} weapon always gets both
		//	{"optic_ACO_grn_smg"},{"acc_pointer_IR"} weapon will always have one or the other, never both, never none
		}
	},
	{
		"arifle_Katiba_F",
		{
			{"30Rnd_65x39_caseless_green",8},
			{"30Rnd_65x39_caseless_green_mag_Tracer",2}
		},
		{
			{""},{"optic_Holosight"},{"optic_ACO_grn_smg"}
		}
	},
	{"",{{"",0}},{{""}}} // empty entry means a random chance of receiving no weapon
};

handgun[] = 
{
	{
		"RH_m9",
		{
			{"RH_15Rnd_9x19_M9",2}
		},
		{
			{""}
		}
	},
	{
		"hgun_ACPC2_F",
		{
			{"9Rnd_45ACP_Mag",2}
		},
		{
			{""}
		}
	},
	{"",{{"",0}},{{""}}}
};

secondary[] =
{
	{
		"rhs_weap_rpg26",
		{
			{"",0}
		},
		{
			{""}
		}
	},
	{
		"rhs_weap_rpg7",
		{
			{"rhs_rpg7_PG7VL_mag",2}
		},
		{
			{""},{"rhs_acc_pgo7v"}
		}
	},
	{"",{{"",0}},{{""}}}
};