class rhs_faction_msv : faction
{
	class base : type
	{
		uniform = "rhs_uniform_flora_patchless";
		helmet = "rhs_6b27m";
		vest = "rhs_6b23_6sh92";
		pack = "rhs_sidor";
		
		#include "weapon_ak74.h"
	};
	
	class r : base
	{
		mags[] = {{"HandGrenade",3}, {"MiniGrenade",3}, {"SmokeShell", 3}};
	};
	
	class rat : r
	{
		secondary = "rhs_weap_rpg26";
	};
	
	class aar : r
	{
		packitems[] = {{"Binocular",1}};
	};
};