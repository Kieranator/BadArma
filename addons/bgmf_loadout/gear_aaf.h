class ind_f : faction
{
	class base : type
	{
		uniform[] = {"U_I_CombatUniform", "U_I_CombatUniform_shortsleeve"};
		helmet[] = {"H_HelmetIA"};
		vest[] = {"V_PlateCarrierIAGL_dgtl", "V_PlateCarrierIA2_dgtl"};
		pack[] = {"B_AssaultPack_dgtl"};
		
		class primary : mk20 {};
	};

	class r : base
	{
		mags[] = {{"HandGrenade",2}, {"MiniGrenade",2}, {"SmokeShell", 2}};
	};
	
	class rat : r
	{
		class secondary : nlaw {};
	};
	
	class ar : r
	{
		class primary : mk200 {};
	};
	
	class aar : r
	{
		packmags[] = {{"200Rnd_65x39_cased_Box",2}};
		binos[] = {"Binocular"};
	};
	
	class m : base
	{
		packitems[] = {{"Medikit",1},{"FirstAidKit",10}};
		mags[] = {{"SmokeShell", 6}};
		vest[] = {"V_PlateCarrierIA1_dgtl"};
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
		class primary : mk20_gl {};
		pack[] = {"B_AssaultPack_dgtl"};
		mags[] = {{"HandGrenade",2}, {"SmokeShell",3}};
		vest[] = {"V_PlateCarrierIAGL_dgtl"};
	};
	
	class ftl : gren{};
	class dc : ftl
	{
		class primary : mk20_gl
		{
			optic = "optic_MRCO";
		};
		vest[] = {"V_PlateCarrierIA2_dgtl"};
	};
	class co : dc {};
	
	class mmgg : r
	{
		primaryattach[] = {{"RH_TD_ACB_b"}};
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
		pack[] = {"B_AssaultPack_dgtl"};
		class secondary : maaws {};
	};
	class matag : aar
	{
		packmags[] = {{"MAAWS_HEDP",3}};
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
		class secondary : igla {};
		pack[] = {"B_AssaultPack_dgtl"};
		packmags[] = {{"rhs_mag_9k38_rocket",1}};
	};
	class msamag : aar
	{
		packmags[] = {{"rhs_mag_9k38_rocket",2}};
	};
};