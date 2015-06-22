class blu_f : faction
{
	class base : type
	{
		helmet = "H_HelmetB";
		vest = "V_PlateCarrier1_rgr";
		pack = "B_AssaultPack_mcamo";
		primary = "arifle_MX_F";
		primarymags[] = {{"30Rnd_65x39_caseless_mag",7}, {"30Rnd_65x39_caseless_mag_Tracer",2}};
		
	};
	
	class r : base
	{
		mags[] = {{"HandGrenade",3}, {"MiniGrenade",3}, {"SmokeShell", 3}};
	};
	
	class rat : r
	{
		secondary = "rhs_weap_rpg7";
		secondaryattach[] = {"rhs_acc_pgo7v"};
		packmags[] = {{"rhs_rpg7_PG7VL_mag",2}};
	};
	
	class aar : r
	{
		primary = "arifle_MX_pointer_F";
		packmags[] = {{"100Rnd_65x39_caseless_mag",3},{"100Rnd_65x39_caseless_mag_Tracer",1}};
		primaryattach[] = {"optic_Aco"};
		packitems[] = {{"Binocular",1}};
	};
};