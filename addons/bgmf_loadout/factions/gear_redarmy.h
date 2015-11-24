class LIB_RKKA : faction
{
	class base : type
	{
		uniform[] = {"U_LIB_SOV_Strelok"};
		helmet[] = {"H_LIB_SOV_RA_Helmet"};
		vest[] = {"V_LIB_SOV_RA_MosinBelt"};
		pack[] = {"B_LIB_SOV_RA_Rucksack"};
		
		class primary : mosin {};
	};
	
	class r : base
	{
		mags[] = {{"lib_rg42",3}, {"SmokeShell", 2}};
	};
	
	class rat : r //using this as smg, AT grenades
	{
		class primary : ppsh41drum {};
		mags[] = {{"lib_rpg6",5}};
		vest[] = {"V_LIB_SOV_RA_PPShBelt","V_LIB_SOV_RAZV_PPShBelt"};
	};
	
	class ar : r
	{
		class primary : dp {};
		uniform[] = {"U_LIB_SOV_Efreitor"};
		vest[] = {"V_LIB_SOV_RA_MGBelt","V_LIB_SOV_RAZV_MGBelt"};
	};
	
	class aar : r
	{
		packmags[] = {{"lib_47Rnd_762x54",4}};
		binos[] = {"Binocular"};
	};
	
	class m : base
	{
		uniform[] = {"U_LIB_SOV_Efreitor"};
		packitems[] = {{"Medikit",1},{"FirstAidKit",10}};
		mags[] = {{"SmokeShell", 6}};
		vest[] = {"V_LIB_SOV_RA_MosinBelt"};
		pack[] = {"B_LIB_SOV_RA_MedicalBag"};
	};
	class dm : r
	{
		class primary : mosinsn {};
		uniform[] = {"U_LIB_SOV_Starshina"};
	};
	class gren : base
	{
		class primary : svt40 {};
		mags[] = {{"lib_rg42",6}, {"SmokeShell", 4}};
		vest[] = {"V_LIB_SOV_RA_SVTBelt","V_LIB_SOV_RAZV_SVTBelt"};
	};
	
	class ftl : r
	{
		class primary : ppsh41 {};
		class primary2 : pps43 {};
		class primary3 : svt40 {};
		vest[] = {"V_LIB_SOV_RA_SVTBelt","V_LIB_SOV_RAZV_SVTBelt"};
		uniform[] = {"U_LIB_SOV_Starshina"};
	};
	class dc : ftl 
	{
		uniform[] = {"U_LIB_SOV_Sergeant"};
		vest[] = {"V_LIB_SOV_RAZV_OfficerVest"};
	};
	class co : dc 
	{
		uniform[] = {"U_LIB_SOV_Leutenant"};
		helmet[] = {"H_LIB_SOV_RA_OfficerCap"};
		vest[] = {"V_LIB_SOV_RA_TankOfficerSet"};
	};
	
	class mmgg : ar {};
	class mmgag : aar 
	{};
	// no ww2 rus deployable bags in arsenal, wth
	
	class hmgg : mmgg
	{
		//pack[] = {"RHS_M2_Gun_Bag"};
	};
	class hmgag : mmgag
	{
		//pack[] = {"RHS_M2_MiniTripod_Bag"};
	};
	
	class matg : r
	{
		class secondary : bazooka {};
	};
	class matag : aar
	{
		packmags[] = {{"LIB_1Rnd_60mm_M6",3}};
	};
	
	class hatg : matg
	{
		//pack[] = {"B_AT_01_weapon_F"};
	};
	class hatag : matag
	{
		//pack[] = {"B_HMG_01_support_F"};
	};
	
	/*class msamg : r
	{
		class secondary : stinger {};
	};
	class msamag : aar
	{
		packmags[] = {{"rhs_fim92_mag",1}};
	};*/
};