class mx : weapon
{
	wepname = "arifle_MX_F";
	defmag = "30Rnd_65x39_caseless_mag";
	extradefmags = 7;
	addmags[] =
	{
		{"30Rnd_65x39_caseless_mag_Tracer",2}
	};
	optic = "optic_ACO";
};

class mxc : mx
{
	wepname = "arifle_MXC_F";
	optic = "optic_Holosight_smg";
};

class mx_3gl : mx
{
	wepname = "arifle_MX_GL_F";
	defglmag = "3Rnd_HE_Grenade_shell";
	extradefglmags = 2;
	addmags[] =
	{
		{"30Rnd_65x39_caseless_mag_Tracer",2},
		{"3Rnd_Smoke_Grenade_shell",1}
	};
};

class mx_sw : mx
{
	wepname = "arifle_MX_SW_F";
	defmag = "100Rnd_65x39_caseless_mag";
	extradefmags = 3;
	addmags[] = {{"100Rnd_65x39_caseless_mag_Tracer",1}};
};

class mxm : mx
{
	wepname = "arifle_MXM_F";
	optic = "optic_Arco";
	bipod = "bipod_01_F_snd";
};