class opf_f : faction
{
	class base : type
	{
		helmet = "H_HelmetO_ocamo";
		primary = "arifle_Katiba_F";
		vest = "V_HarnessO_brn";
		primarymags[] = {{"30Rnd_65x39_caseless_green",7}, {"30Rnd_65x39_caseless_green_mag_Tracer",1}};
	};
	
	class r : base
	{
		pack = "B_Carryall_ocamo";
		packmags[] = {{"30Rnd_65x39_caseless_green",10}};
		primaryattach[] = {"optic_ACO_grn_smg"};
	};
};