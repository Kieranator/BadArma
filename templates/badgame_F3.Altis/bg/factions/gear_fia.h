class blu_g_f : faction
{
	class base : type
	{
		uniform[] =
		{
			"U_BG_Guerilla1_1","U_BG_leader","U_BG_Guerilla2_3","U_BG_Guerrilla_6_1","U_BG_Guerilla3_1","U_I_G_Story_Protagonist_F","U_I_MilitiaShortSleeve","U_BG_Guerilla2_1","U_BG_Guerilla2_2",
			"LOP_U_AFR_Fatigue_02","LOP_U_ChDKZ_Fatigue_01","U_I_ParamilitaryUniform","U_I_PoliceUniform","MNP_CombatUniform_Militia_DA","MNP_CombatUniform_Militia_DC","MNP_CombatUniform_Militia_DB","MNP_CombatUniform_Militia_C"
		};
		helmet[] =
		{
			"H_Bandanna_gry","H_Bandanna_cbr","H_Bandanna_khk",
			"H_Watchcap_blk","H_Watchcap_cbr","H_Watchcap_khk",
			"H_Booniehat_oli","H_Booniehat_khk",
			"H_Cap_blk","H_Cap_oli","H_Cap_tan"
		};
		facewear[] = {"","","","","G_Bandanna_aviator","G_Bandanna_beast","G_Bandanna_khk","G_Bandanna_oli","G_Bandanna_shades","G_Bandanna_sport"};
		vest[] = {"V_TacVest_blk","V_TacVest_oli","V_TacVest_khk","V_I_G_resistanceLeader_F"};
		pack[] = {"B_AssaultPack_rgr","B_TacticalPack_oli","B_TacticalPack_blk","B_TacticalPack_rgr"};
		
		class primary : trg21 {};
	};
	
	class r : base
	{
		mags[] = {{"HandGrenade",2}, {"MiniGrenade",2}, {"SmokeShell", 2}};
	};
	
	class rat : r
	{
		class secondary : m136_hedp {};
	};
	
	class ar : r
	{
		class primary : mk200 {};
	};
	
	class aar : r
	{
		pack[] = {"B_Kitbag_rgr","B_Kitbag_cbr"};
		packmags[] = {{"200Rnd_65x39_cased_Box",2}};
		binos[] = {"Binocular"};
	};
	
	class m : base
	{
		packitems[] = {{"Medikit",1},{"FirstAidKit",10}};
		mags[] = {{"SmokeShell", 6}};
		pack[] = {"B_Kitbag_rgr","B_Kitbag_cbr"};
	};
	class dm : r
	{
		class primary : primary
		{
			optic = "optic_MRCO";
		};
	};
	class gren : base
	{
		class primary : trg21_gl {};
		mags[] = {{"HandGrenade",2}, {"SmokeShell",3}};
	};
	
	class ftl : gren 
	{
		helmet[] = {"H_Cap_headphones","H_Cap_oli_hs"};
	};
	class dc : ftl
	{
		helmet[] = {"H_Cap_headphones"};
		class primary : trg21_gl {
			optic = "optic_MRCO";
		};
	};
	class co : dc {};
	
	class mmgg : r
	{
		class primary : spmg_blk
		{
			bipod = "RH_TD_ACB_b";
		};
	};
	class mmgag : aar
	{
		packmags[] = {{"130Rnd_338_Mag",3}};
	};
	
	class hmgg : r
	{
		pack[] = {"RHS_M2_Gun_Bag"};
	};
	class hmgag : r
	{
		pack[] = {"RHS_M2_MiniTripod_Bag"};
	};
	
	class matg : r
	{
		class secondary : rpg42 {};
	};
	class matag : aar
	{
		packmags[] = {{"RPG32_F",2}};
	};
	
	class hatg : r
	{
		pack[] = {"B_AT_01_weapon_F"};
	};
	class hatag : r
	{
		pack[] = {"B_HMG_01_support_F"};
	};
	
	class msamg : r
	{
		class secondary : titanaa {};
	};
	class msamag : aar
	{
		packmags[] = {{"Titan_AA",2}};
	};
};