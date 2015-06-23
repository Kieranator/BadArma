class blu_g_f : faction
{
	class base : type
	{
		uniform = "U_BG_Guerilla1_1";
		helmet = "H_Bandanna_surfer";
		vest = "V_Chestrig_oli";
		
		#include "weapon_trg.h"
	};
	
	class r : base
	{
		mags[] = {{"HandGrenade",3}, {"MiniGrenade",3}, {"SmokeShell", 3}};
	};
	
	class aar : r
	{
		packitems[] = {{"Binocular",1}};
		pack = "B_AssaultPack_rgr";
	};
};