class opf_f : faction
{
	class base : type
	{
		uniform[] = {"U_O_CombatUniform_ocamo"};
		helmet[] = {"H_HelmetO_ocamo"};
		vest[] = {"V_HarnessO_brn"};
		pack[] = {"B_AssaultPack_ocamo"};
		
		class primary : katiba {};
	};
	
	class r : base
	{
		mags[] = {{"HandGrenade",2}, {"MiniGrenade",2}, {"SmokeShell", 2}};
	};
	
	class rat : r
	{
		class secondary : rpg26 {};
	};
	
	class ar : r
	{
		class primary : zafir {};
	};
	
	class aar : r
	{
		packmags[] = {{"150Rnd_762x54_Box",1}, {"150Rnd_762x54_Box_Tracer",1}};
		binos[] = {"Binocular"};
	};
	
	class m : base
	{
		packitems[] = {{"Medikit",1},{"FirstAidKit",10}};
		mags[] = {{"SmokeShell", 6}};
	};
	class dm : r
	{
		class primary : primary
		{
			optic = "optic_Hamr";
		};
	};
	class gren : base
	{
		class primary : katiba_gl {};
		mags[] = {{"HandGrenade",2}, {"SmokeShell",3}};
		vest[] = {"V_HarnessOGL_brn"};
	};
	
	class ftl : gren {};
	class dc : ftl
	{
		class primary : katiba_gl
		{
			optic = "optic_Hamr";
		};
	};
	class co : dc {};
	
	class mmgg : r
	{
		class primary : navid {};
	};
	class mmgag : aar
	{
		packmags[] = {{"150Rnd_93x64_Mag",3}};
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
		class secondary : rpg42 {};
	};
	class matag : aar
	{
		packmags[] = {{"RPG32_F",2}};
	};
	
	class hatg : r
	{
		pack[] = {"O_AT_01_weapon_F"};
	};
	class hatag : r
	{
		pack[] = {"O_HMG_01_support_F"};
	};
	
	class msamg : r
	{
		class secondary : titanaa_brn {};
		packmags[] = {{"Titan_AA",1}};
	};
	class msamag : aar
	{
		packmags[] = {{"Titan_AA",2}};
	};
};