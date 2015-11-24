class katiba : weapon
{
	wepname = "arifle_Katiba_F";
	defmag = "30Rnd_65x39_caseless_green";
	extradefmags = 7;
	addmags[] = {{"30Rnd_65x39_caseless_green_mag_Tracer",2}};
	optic = "optic_ACO_grn";
};
class katiba_c : katiba
{
	wepname ="arifle_Katiba_C_F";
};

class katiba_gl : katiba
{
	wepname = "arifle_Katiba_GL_F";
	defglmag = "1Rnd_HE_Grenade_shell";
	extradefglmags = 5;
	addmags[] = 
	{
		{"30Rnd_65x39_caseless_green_mag_Tracer",2},
		{"1Rnd_Smoke_Grenade_shell",3}
	};
};