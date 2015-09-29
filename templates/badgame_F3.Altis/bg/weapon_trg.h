class trg20 : weapon
{
	wepname = "arifle_TRG20_F";
	defmag = "30Rnd_556x45_Stanag";
	extradefmags = 7;
	addmags[] = {{"30Rnd_556x45_Stanag_Tracer_Yellow",2}};
};

class trg21 : trg20
{
	wepname = "arifle_TRG21_F";
};

class trg21_gl : trg21
{
	wepname = "arifle_TRG21_GL_F";
	defglmag = "1Rnd_HE_Grenade_shell";
	extradefglmags = 5;
	addmags[] = 
	{
		{"30Rnd_556x45_Stanag_Tracer_Yellow",2},
		{"1Rnd_Smoke_Grenade_shell",3}
	};
};