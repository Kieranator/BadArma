class civ_f : faction
{
	class base : type
	{
		helmet[] = {"H_StrawHat"};
		vest[] = {"V_LIB_WP_OfficerVest", "V_Chestrig_khk"};
		pack[] = {"LOP_Carryall_KHK"};
		packitems[] = {{"rhs_acc_pgo7v",0}};
		
		class primary0 : mx {};
		class primary1 : mk20 {};
		class primary2 : spmg {};
	};
};