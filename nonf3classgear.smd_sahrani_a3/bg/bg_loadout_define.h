class bg_loadout_define 
{
	class side
	{
		class faction // superclass
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
		}; // define subclasses below
	};
	
	class west : side
	{
		class faction
		{
			class type
			{
				uniform = "U_B_CombatUniform_mcam";
			};
		};
		
		#include "gear_nato.h"
		
	};
	
	class east : side
	{
		class faction
		{
			class type
			{
				uniform = "U_O_CombatUniform_ocamo";
			};
		};
		
		#include "gear_csat.h"
		
	};
	
	class guer : side
	{
		class faction
		{
			class type
			{
				uniform = "U_I_CombatUniform";
			};
		};
		
	//	#include "gear_guer.h"
	
	};
	
	class civ : side
	{
		class faction
		{
			class type
			{
				uniform = "U_C_Poloshirt_blue";
			};
		};
		
	//	#include "gear_civ.h"
	
	};
};