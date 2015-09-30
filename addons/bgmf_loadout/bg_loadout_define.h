class bg_loadout_define 
{
	class weapon // base class for defining weapons
	{
		wepname = ""; // classname of weapon
		
		defmag = ""; // 1 mag of this classname will be loaded in the weapon, intent is to maximize inv space. pending removal?
		extradefmags = 0; // additional mags of defmag type to add.  pending removal?
		
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
	#include "weapon_mx.h"
	#include "weapon_mk20.h"
	#include "weapon_katiba.h"
	#include "weapon_trg.h"
	#include "weapon_ak74m.h"
	#include "weapon_m4a1.h"
	#include "weapon_m16a4.h"
	
	//autorifles/MGs
	#include "weapon_spmg.h"
	#include "weapon_mk200.h"
	#include "weapon_navid.h"
	#include "weapon_zafir.h"
	#include "weapon_rpk.h"
	#include "weapon_pkp.h"
	#include "weapon_m249.h"
	#include "weapon_m240.h"
	
	//launchers
	#include "weapon_m136.h"
	#include "weapon_titan.h"
	#include "weapon_nlaw.h"
	#include "weapon_maaws.h"
	#include "weapon_igla.h"
	#include "weapon_rpg26.h"
	#include "weapon_rpg42.h"
	#include "weapon_rpg7.h"
	#include "weapon_stinger.h"
	
	
	class side
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
	};
	
	// faction definitions:
	
	class west : side
	{
		class faction : faction
		{
			class type : type
			{
				uniform[] = {"U_B_CombatUniform_mcam"};
			};
			
			class cargotype : cargotype {};
		};
		
		#include "gear_nato.h"
		#include "gear_usarmyd_ocp.h"
		#include "gear_usarmywd_ucp.h"
		#include "gear_fia.h"
		
	};
	
	class east : side
	{
		class faction : faction
		{
			class type : type
			{
				uniform[] = {"U_O_CombatUniform_ocamo"};
			};
			
			class cargotype : cargotype {};
		};
		
		#include "gear_csat.h"
		#include "gear_rus.h"
		
	};
	
	class guer : side
	{
		class faction : faction
		{
			class type : type
			{
				uniform[] = {"U_I_CombatUniform"};
			};
			
			class cargotype : cargotype {};
		};
		
		#include "gear_aaf.h"
	
	};
	
	class civ : side
	{
		class faction : faction
		{
			class type : type
			{
				uniform[] = {"U_C_Poloshirt_blue"};
			};
			
			class cargotype : cargotype {};
		};
		
		#include "gear_civ.h"
		
	};
};