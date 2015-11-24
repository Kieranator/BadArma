class LIB_WEHRMACHT : faction
{
	class base : type
	{
		uniform[] = {"U_LIB_GER_Recruit","U_LIB_GER_Oberschutze","U_LIB_GER_Gefreiter","U_LIB_GER_MG_schutze"};
		helmet[] = {"H_LIB_GER_Helmet"};
		vest[] = {"V_LIB_GER_VestKar98"};
		pack[] = {"BasicBag"};
		
		class primary : k98 {};
	};
	
	class r : base
	{
		mags[] = {{"lib_shg24",3}, {"lib_nb39", 2}};
	};
	
	class rat : r //using this as smg, AT grenades
	{
		class primary : g43 {};
		mags[] = {{"lib_shg24x7",5}};
		vest[] = {"V_LIB_GER_VestG43"};
	};
	
	class ar : r
	{
		class primary : mg30 {};
		uniform[] = {"U_LIB_GER_MG_schutze"};
		vest[] = {"V_LIB_GER_VestMG"};
	};
	
	class aar : r
	{
		packmags[] = {{"lib_30Rnd_792x57",7}};
		binos[] = {"Binocular"};
	};
	
	class m : base
	{
		uniform[] = {"U_LIB_GER_Medic"};
		packitems[] = {{"Medikit",1},{"FirstAidKit",10}};
		mags[] = {{"lib_nb39", 6}};
		pack[] = {"B_LIB_GER_MedicBackpack"};
	};
	class dm : r
	{
		class primary : k98sn {};
	};
	class gren : base
	{
		class primary : k98gl {};
		class primary2: g43gl {};
		mags[] = {{"lib_shg24",2}, {"lib_nb39", 3}};
		vest[] = {"V_LIB_GER_VestG43"};
	};
	
	class ftl : r
	{
		class primary : mp40 {};
		class primary2 : mp38 {};
		uniform[] = {"U_LIB_GER_Unterofficer"};
		vest[] = {"V_LIB_WP_MP40Vest"};
	};
	class dc : ftl {};
	class co : dc 
	{
		uniform[] = {"U_LIB_GER_Leutnant"};
	};
	
	class mmgg : r
	{
		class primary : mg42 {};
	};
	class mmgag : aar
	{
		packmags[] = {{"lib_50Rnd_792x57",5}};
	};
	// no ww2 german deployable packs available in arsenal wth
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
		class secondary : panzerschrek {};
	};
	class matag : aar
	{
		packmags[] = {{"LIB_1Rnd_RPzB",3}};
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