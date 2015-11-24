class m4a1 : weapon
{
	wepname = "rhs_weap_m4a1_carryhandle";
	defmag = "rhs_mag_30Rnd_556x45_M855A1_Stanag";
	extradefmags = 7;
	addmags[] = {{"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",2}};
	optic = "rhsusf_acc_compm4";
};

class m4a1_m320 : m4a1
{
	wepname = "rhs_weap_m4a1_m320";
	defglmag = "rhs_mag_M433_HEDP";
	extradefglmags = 5;
	addmags[] = 
	{
		{"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",2},
		{"rhs_mag_m714_White",3}
	};
};