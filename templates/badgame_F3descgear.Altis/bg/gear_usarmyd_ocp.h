class rhs_faction_usarmy_d : faction
{
	class base : type
	{
		uniform[] = {"rhs_uniform_cu_ocp"};
		helmet[] = {"rhsusf_ach_helmet_ocp"};
		vest[] = {"rhsusf_iotv_ocp_Rifleman"};
		pack[] = {"rhsusf_assault_eagleaiii_ocp"};
		
		#include "weapon_m4.h"
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
				"rhs_weap_m136",
				{
					{"",0}
				}
			}
		};
	};
	
	class ar : base
	{
		packmags[] = {{"hlc_200rnd_556x45_T_SAW",1}};
		
		#include "weapon_m249.h"
	};
	
	class aar : r
	{
		packmags[] = {{"100Rnd_65x39_caseless_mag",3},{"100Rnd_65x39_caseless_mag_Tracer",1}};
		binos[] = {"Binocular"};
	};
};