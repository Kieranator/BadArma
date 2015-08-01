class opf_f : faction
{
	class base : type
	{
		helmet[] = {"H_HelmetO_ocamo"};
		vest[] = {"V_HarnessO_brn"};
		
		#include "weapon_katiba.h"
	};
	
	class r : base
	{
		pack[] = {"B_Carryall_ocamo"};
		packmags[] = {{"30Rnd_65x39_caseless_green",10}};
	};
};