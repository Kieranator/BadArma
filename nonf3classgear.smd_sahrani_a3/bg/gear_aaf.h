class ind_f : faction
{
	class base : type
	{
		helmet[] = {"H_HelmetIA"};
		vest[] = {"V_PlateCarrierIA1_dgtl"};
		pack[] = {"B_AssaultPack_dgtl"};
		
		#include "weapon_mk20.h"
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
				"launch_NLAW_F", 
				{
					{"",0}
				}
			}
		};
	};
	
	class aar : r
	{
		binos[] = {"Binocular"};
	};
};