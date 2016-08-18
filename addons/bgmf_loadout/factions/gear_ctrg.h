class blu_ctrg_f : faction
{
	class base : type
	{
		uniform[] = {"U_B_CTRG_Soldier_F","U_B_CTRG_Soldier_3_F"};
		helmet[] = {"H_HelmetB_TI_tna_F"};
		vest[] = {"V_TacVest_oli"};
		pack[] = {"B_AssaultPack_rgr"};
		goggles[] = {"G_Balaclava_TI_G_tna_F","G_Balaclava_TI_tna_F","G_Balaclava_TI_blk_F","G_Balaclava_TI_G_blk_F"};
		
		class primary : spar16 {};
	};
	
	class r : base
	{
		mags[] = {{"HandGrenade",2}, {"MiniGrenade",2}, {"SmokeShell", 2}};
	};
	
	// incomplete
	
	/*class rat : r
	{
		class secondary : m136_hedp {};
	};
	
	class ar : r
	{
		class primary : mx_sw {};
	};
	
	class aar : r
	{
		packmags[] = {{"100Rnd_65x39_caseless_mag",2},{"100Rnd_65x39_caseless_mag_Tracer",1}};
		binos[] = {"Binocular"};
	};
	
	class m : base
	{
		packitems[] = {{"Medikit",1},{"FirstAidKit",10}};
		mags[] = {{"SmokeShell", 6}};
	};
	class dm : r
	{
		class primary : mxm {};
	};
	class gren : base
	{
		class primary : mx_3gl {};
		mags[] = {{"HandGrenade",2}, {"SmokeShell", 4}};
	};
	
	class ftl : gren
	{
		helmet[] = {"H_HelmetSpecB_sand","H_HelmetSpecB_paint1", "H_HelmetSpecB_paint2"};
		
		class primary : mx_3gl
		{
			optic = "optic_Arco";
		};
	};
	class dc : ftl {};
	class co : dc {};
	
	class mmgg : r
	{
		class primary : spmg {};
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
		class secondary : titanc {};
		pack[] = {"B_Carryall_mcamo"};
	};
	class matag : aar
	{
		packmags[] = {{"Titan_AT",3}};
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
		pack[] = {"B_Carryall_mcamo"};
	};
	class msamag : r
	{
		packmags[] = {{"Titan_AA",3}};
	};

	*/
	#include "crate\crate_nato.h"
	#include "vehicle\veh_nato.h"
};