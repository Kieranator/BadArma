class blu_f : faction
{
	class base : type
	{
		helmet[] = {"H_HelmetB"};
		vest[] = {"V_PlateCarrier1_rgr"};
		pack[] = {"B_AssaultPack_mcamo"};
		
		#include "weapon_mx.h"
	};
	
	class r : base
	{
		mags[] = {{"HandGrenade",3}, {"MiniGrenade",3}, {"SmokeShell", 3}};
	};
	
	class rat : r
	{
		secondary[] = 
		{
			{
				"launch_B_Titan_short_F",
				{
					{"",0}
				}
			}
		};
	};
	
	class aar : r
	{
		packmags[] = {{"100Rnd_65x39_caseless_mag",3},{"100Rnd_65x39_caseless_mag_Tracer",1}};
		primaryattach[] = {{"optic_Aco"}};
		binos[] = {"Binocular"};
	};
	
	#include "crate_nato.h"
	#include "veh_nato.h"
};