class m16a4 : weapon
{
	wepname = "rhs_weap_m16a4_carryhandle";
	defmag = "rhs_mag_30Rnd_556x45_M855A1_Stanag";
	extradefmags = 7;
	addmags[] = {{"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",2}};
	optic = "rhsusf_acc_compm4";
};

class m16a4_m203 : m16a4
{
	wepname = "rhs_weap_m16a4_carryhandle_M203";
	defglmag = "rhs_mag_M433_HEDP";
	extradefglmags = 5;
	addmags[] = 
	{
		{"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",2},
		{"rhs_mag_m714_White",3}
	};
};