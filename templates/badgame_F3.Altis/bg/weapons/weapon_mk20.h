class mk20 : weapon
{
	wepname = "arifle_Mk20_F";
	defmag = "30Rnd_556x45_Stanag";
	extradefmags = 7;
	addmags[] = 
	{
		{"30Rnd_556x45_Stanag_Tracer_Yellow",2}
	};
	optic = "FHQ_optic_AC11704";
};
class mk20_tan : mk20
{
	wepname = "arifle_Mk20_plain_F";
};

class mk20c : mk20
{
	wepname = "arifle_Mk20C_F";
};
class mk20c_tan : mk20
{
	wepname = "arifle_Mk20C_plain_F";
};

class mk20_gl : mk20
{
	wepname = "arifle_Mk20_GL_F";
	defglmag = "1Rnd_HE_Grenade_shell";
	extradefglmags = 5;
	addmags[] = 
	{
		{"30Rnd_556x45_Stanag_Tracer_Yellow",2},
		{"1Rnd_Smoke_Grenade_shell",3}
	};
};
class mk20_gl_tan : mk20_gl
{
	wepname = "arifle_Mk20_GL_plain_F";
};