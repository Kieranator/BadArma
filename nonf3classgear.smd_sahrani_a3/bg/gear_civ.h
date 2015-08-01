class civ_f : faction
{
	class base : type
	{
		helmet[] = {"H_StrawHat"};
		vest[] = {"V_LIB_WP_OfficerVest", "V_Chestrig_khk"};
		pack[] = {"LOP_Carryall_KHK"};
		packitems[] = {{"rhs_acc_pgo7v",0}};
		//binos[] = {""};
		
		#include "weapon_random_example.h"
	};
	
	class rat : base
	{
		primaryattach[] = {{"optic_Aco","acc_pointer_IR"},{"none"}};
	};
};