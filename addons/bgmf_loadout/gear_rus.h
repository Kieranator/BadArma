class rhs_faction_msv : faction
{
	class base : type
	{
		uniform[] = {"rhs_uniform_flora_patchless", "rhs_uniform_vdv_flora"};
		helmet[] = {"rhs_6b27m", "rhs_6b27m_bala", "rhs_6b27m_ess", "rhs_6b27m_ess_bala"};
		vest[] = {"rhs_6b13_Flora_6sh92"};
		pack[] = {"rhs_sidor"};
		
		class primary : ak74m {};
	};
	
	class r : base
	{
		mags[] = {{"rhs_mag_rgd5",3}, {"rhs_mag_rdg2_white",2}};
	};
	
	class rat : r
	{
		class secondary : rpg26 {};
	};
	
	class ar : r
	{
		class primary : rpk74 {};
	};
	
	class aar : r
	{
		packmags[] = {{"hlc_45Rnd_545x39_t_rpk",5}};
		binos[] = {"Binocular"};
	};
	
	class m : base
	{
		packitems[] = {{"Medikit",1},{"FirstAidKit",10}};
		mags[] = {{"rhs_mag_rdg2_white", 6}};
		vest[] = {"rhs_6b23_medic"};
	};
	class dm : r
	{
		class primary : ak74m
		{
			optic = "rhs_acc_pso1m2";
		};
	};
	class gren : base
	{
		class primary : ak74m_gp {};
		mags[] = {{"rhs_mag_rgd5",2}, {"rhs_mag_rdg2_white",3}};
		vest[] = {"rhs_6b13_Flora_6sh92_vog"};
	};
	
	class ftl : gren
	{
		vest[] = {"rhs_6b13_Flora_6sh92_radio"};
	};
	class dc : ftl
	{
		class primary : ak74m_gp
		{
			optic = "rhs_acc_pso1m2";
		};
	};
	class co : dc {};
	
	class mmgg : r
	{
		class primary : pkp {};
	};
	class mmgag : aar
	{
		packmags[] = {{"rhs_100Rnd_762x54mmR",2}};
	};
	
	class hmgg : r
	{
		pack[] = {"RHS_NSV_Gun_Bag"};
	};
	class hmgag : r
	{
		pack[] = {"RHS_NSV_Tripod_Bag"};
	};
	
	class matg : r
	{
		pack[] = {"rhs_rpg_empty"};
		class secondary : rpg7 {};
	};
	class matag : aar
	{
		pack[] = {"rhs_rpg_empty"};
		packmags[] = {{"rhs_rpg7_PG7VL_mag",3}};
	};
	
	class hatg : matg
	{
		pack[] = {"B_AT_01_weapon_F"};
	};
	class hatag : matag
	{
		pack[] = {"B_HMG_01_support_F"};
	};
	
	class msamg : r
	{
		class secondary : igla {};
		packmags[] = {{"rhs_mag_9k38_rocket",1}};
	};
	class msamag : aar
	{
		packmags[] = {{"rhs_mag_9k38_rocket",2}};
	};
};