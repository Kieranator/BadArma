class bg_loadout_define 
{
	class side // superclass
	{
		class faction
		{
			class type
			{
				uniform = "";
				helmet = "";
				vest = "";
				pack = "";
				facewear = "";
				goggles = "";
				binos = "";
				map = "ItemMap";
				terminal = "ItemGPS";
				radio = "ItemRadio";
				compass = "ItemCompass";
				watch = "ItemWatch";
				
				meditems[] = {{"FirstAidKit",1}};
				packmags[] = {{"",0}};
				packitems[] = {{"",0}};
				items[] = {{"",0}};
				mags[] = {{"",0}};
				
				primary = "";
				primarymags[] = {{"",0}};
				primaryattach[] = {""};
				
				handgun = "";
				handgunmags[] = {{"",0}};
				handgunattach[] = {""};
				
				secondary = "";
				secondarymags[] = {{"",0}};
				secondaryattach[] = {""};
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
				// redefining an entire property to add a single element is dumb
			};
		};
	}; // define subclasses below
	
	class west : side
	{
		class faction
		{
			class type
			{
				uniform = "U_B_CombatUniform_mcam";
			};
			
			class cargotype {};
		};
		
		#include "gear_nato.h"
		#include "gear_usarmyd_ocp.h"
		#include "gear_usarmywd_ucp.h"
		#include "gear_fia.h"
		
	};
	
	class east : side
	{
		class faction
		{
			class type
			{
				uniform = "U_O_CombatUniform_ocamo";
			};
			
			class cargotype {};
		};
		
		#include "gear_csat.h"
		#include "gear_rus.h"
		
	};
	
	class guer : side
	{
		class faction
		{
			class type
			{
				uniform = "U_I_CombatUniform";
			};
			
			class cargotype {};
		};
		
		#include "gear_aaf.h"
	
	};
	
	class civ : side
	{
		class faction
		{
			class type
			{
				uniform = "U_C_Poloshirt_blue";
			};
			
			class cargotype {};
		};
		
		#include "gear_civ.h"
		
	};
};