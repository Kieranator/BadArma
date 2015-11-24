class ak74m : weapon
{
	wepname = "rhs_weap_ak74m";
	defmag = "rhs_30Rnd_545x39_7N10_AK";
	extradefmags = 7;
	addmags[] = {{"rhs_30Rnd_545x39_AK_green",2}};
	muzzle = "rhs_acc_dtk";
};

class ak74m_2mag : ak74m
{
	wepname = "rhs_weap_ak74m_2mag";
};

class ak74m_plummag : ak74m
{
	wepname = "rhs_weap_ak74m_plummag";
};

class ak74m_gp : ak74m
{
	wepname = "rhs_weap_ak74m_gp25";
	defglmag = "rhs_VOG25";
	extradefglmags = 5;
	addmags[] = 
	{
		{"rhs_GRD40_White",3},
		{"rhs_30Rnd_545x39_AK_green",2}
	};
};