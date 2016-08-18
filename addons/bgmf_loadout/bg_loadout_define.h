class bg_loadout_define 
{

	class weapon // base class for defining weapons
	{
		wepname = ""; // classname of weapon
		
		defmag = ""; // 1 mag of this classname will be loaded in the weapon, intent is to maximize inv space
		extradefmags = 0; // additional mags of defmag type to add
		
		defglmag = ""; // same as defmag but for unerbarrel mags
		extradefglmags = 0;
		
		addmags[] = {{"",0}};	// additional mags to add to inventory when unit is given this weapon. format is {{"mag_classname_1",<# of mags>},{"mag_classname_2",<# of mags>},{...},...}
		
		optic = "";
		rail = ""; // lasers, flashlights, etc
		bipod = "";
		muzzle = ""; // silencers, flash suppressors, etc 
	};
	
	// the mx file is commented
	
	//rifles
	#include "weapons\weapon_mx.h"
	#include "weapons\weapon_mk20.h"
	#include "weapons\weapon_katiba.h"
	#include "weapons\weapon_trg.h"
	#include "weapons\weapon_ak74m.h"
	#include "weapons\weapon_m4a1.h"
	#include "weapons\weapon_m16a4.h"
	#include "weapons\weapon_m16a1.h"
	#include "weapons\weapon_g43.h"
	#include "weapons\weapon_k98.h"
	#include "weapons\weapon_mosin.h"
	#include "weapons\weapon_svt40.h"
	#include "weapons\weapon_m14.h"
	#include "weapons\weapon_m1carbine.h"
	#include "weapons\weapon_sks.h"
	
	#include "weapons\weapon_ak12.h"
	#include "weapons\weapon_type115.h"
	#include "weapons\weapon_spar.h"
	
	//smg
	#include "weapons\weapon_mp18-44.h"
	#include "weapons\weapon_pps.h"
	
	#include "weapons\weapon_protector.h"
	
	//shotguns
	#include "weapons\weapon_m590.h"
	
	//autorifles/MGs
	#include "weapons\weapon_spmg.h"
	#include "weapons\weapon_mk200.h"
	#include "weapons\weapon_navid.h"
	#include "weapons\weapon_zafir.h"
	#include "weapons\weapon_rpk.h"
	#include "weapons\weapon_pkp.h"
	#include "weapons\weapon_m249.h"
	#include "weapons\weapon_m240.h"
	#include "weapons\weapon_mg30-42.h"
	#include "weapons\weapon_dp.h"
	#include "weapons\weapon_m60.h"
	
	//launchers
	#include "weapons\weapon_bazooka.h"
	#include "weapons\weapon_m136.h"
	#include "weapons\weapon_titan.h"
	#include "weapons\weapon_nlaw.h"
	#include "weapons\weapon_maaws.h"
	#include "weapons\weapon_igla.h"
	#include "weapons\weapon_rpg26.h"
	#include "weapons\weapon_rpg42.h"
	#include "weapons\weapon_rpg7.h"
	#include "weapons\weapon_stinger.h"
	#include "weapons\weapon_panzerschrek.h"
	
	
	class define_factions
	{
		class faction
		{
			class type
			{
				uniform[] = {""}; // supports randomization, separate entries with ,  e.g. {"U_B_CombatUniform_mcam", "U_B_CombatUniform_mcam_vest"}
				helmet[] = {""}; 
				vest[] = {""};
				pack[] = {""};
				facewear[] = {""};
				goggles[] = {""};
				binos[] = {""};
				map = "ItemMap"; // these entries do not support randomization
				terminal = "ItemGPS";
				radio = "ItemRadio";
				compass = "ItemCompass";
				watch = "ItemWatch";
				
				meditems[] = {{"FirstAidKit",1}}; // identical format to addmags in the weapon class, {{"item_classname",<number of items>},{...}...}
				packmags[] = {{"",0}};
				packitems[] = {{"",0}};
				items[] = {{"",0}};
				mags[] = {{"",0}};
			};
			class cargotype
			{
				weapons1[] = {{"",0}};
				weapons2[] = {{"",0}};
				weapons3[] = {{"",0}};
				
				mags1[] = {{"",0}};
				mags2[] = {{"",0}};
				mags3[] = {{"",0}};
				
				items1[] = {{"",0}};
				items2[] = {{"",0}};
				items3[] = {{"",0}};
				
				packs1[] = {{"",0}};
				packs2[] = {{"",0}};
				packs3[] = {{"",0}};
				// redundant properties because cargos tend to have lots of things
				// and redefining an entire property to add one thing is dumb
			};
		};
		
		
		
		// faction definitions:
			
		#include "factions\gear_aaf.h"
		#include "factions\gear_civ.h"
		#include "factions\gear_csat.h"
		#include "factions\gear_fia.h"
		#include "factions\gear_nato.h"
		#include "factions\gear_redarmy.h"
		#include "factions\gear_rus.h"
		#include "factions\gear_usarmyd_ocp.h"
		#include "factions\gear_usarmywd_ucp.h"
		#include "factions\gear_wehrmacht.h"
		
		#include "factions\gear_viper.h"
		#include "factions\gear_synd.h"
		#include "factions\gear_gendar.h"
		#include "factions\gear_nato_t.h"
		#include "factions\gear_ctrg.h"
				
			
		
	};
	
	
	
	
	
};
