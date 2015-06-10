if ((bg_param_playerfaction) == 1) then // us army
{
	switch (typeof player) do 
	{
		case "B_crew_F": {["uc",player,1] call bg_fnc_initloadouts};
		case "B_engineer_F": {["ue",player,1] call bg_fnc_initloadouts};
		case "B_helicrew_F": {["uhc",player,1] call bg_fnc_initloadouts};
		case "B_Helipilot_F": {["uhp",player,1] call bg_fnc_initloadouts};
		case "B_medic_F": {["um",player,1] call bg_fnc_initloadouts};
		case "B_officer_F": {["uo",player,1] call bg_fnc_initloadouts};
		case "B_Pilot_F": {["up",player,1] call bg_fnc_initloadouts};
		case "B_Soldier_A_F": {["uam",player,1] call bg_fnc_initloadouts};
		case "B_soldier_AA_F": {["uaa",player,1] call bg_fnc_initloadouts};
		case "B_soldier_AR_F": {["uar",player,1] call bg_fnc_initloadouts};
		case "B_soldier_AT_F": {["uat",player,1] call bg_fnc_initloadouts};
		case "B_Soldier_exp_F": {["ux",player,1] call bg_fnc_initloadouts};
		case "B_Soldier_F": {["ur",player,1] call bg_fnc_initloadouts};
		case "B_Soldier_GL_F": {["ug",player,1] call bg_fnc_initloadouts};
		case "B_soldier_LAT_F": {["ula",player,1] call bg_fnc_initloadouts};
		case "B_Soldier_lite_F": {["url",player,1] call bg_fnc_initloadouts};
		case "B_soldier_M_F": {["umm",player,1] call bg_fnc_initloadouts};
		case "B_soldier_PG_F": {["upt",player,1] call bg_fnc_initloadouts};
		case "B_soldier_repair_F": {["urp",player,1] call bg_fnc_initloadouts};
		case "B_Soldier_SL_F": {["usl",player,1] call bg_fnc_initloadouts};
		case "B_Soldier_TL_F": {["utl",player,1] call bg_fnc_initloadouts};
		case "B_soldier_UAV_F": {["uu",player,1] call bg_fnc_initloadouts};
		default {["nondefaulta3",player,1] call bg_fnc_initloadouts};
	};	
};
if ((bg_param_playerfaction) == 2) then // usmc
{
	switch (typeof player) do 
	{
		case "B_crew_F": {["mc",player,1] call bg_fnc_initloadouts};
		case "B_engineer_F": {["me",player,1] call bg_fnc_initloadouts};
		case "B_helicrew_F": {["mhc",player,1] call bg_fnc_initloadouts};
		case "B_Helipilot_F": {["mhp",player,1] call bg_fnc_initloadouts};
		case "B_medic_F": {["mm",player,1] call bg_fnc_initloadouts};
		case "B_officer_F": {["mo",player,1] call bg_fnc_initloadouts};
		case "B_Pilot_F": {["mp",player,1] call bg_fnc_initloadouts};
		case "B_Soldier_A_F": {["mam",player,1] call bg_fnc_initloadouts};
		case "B_soldier_AA_F": {["maa",player,1] call bg_fnc_initloadouts};
		case "B_soldier_AR_F": {["mar",player,1] call bg_fnc_initloadouts};
		case "B_soldier_AT_F": {["mat",player,1] call bg_fnc_initloadouts};
		case "B_Soldier_exp_F": {["mx",player,1] call bg_fnc_initloadouts};
		case "B_Soldier_F": {["mr",player,1] call bg_fnc_initloadouts};
		case "B_Soldier_GL_F": {["mg",player,1] call bg_fnc_initloadouts};
		case "B_soldier_LAT_F": {["mla",player,1] call bg_fnc_initloadouts};
		case "B_Soldier_lite_F": {["mrl",player,1] call bg_fnc_initloadouts};
		case "B_soldier_M_F": {["mmm",player,1] call bg_fnc_initloadouts};
		case "B_soldier_PG_F": {["mpt",player,1] call bg_fnc_initloadouts};
		case "B_soldier_repair_F": {["mrp",player,1] call bg_fnc_initloadouts};
		case "B_Soldier_SL_F": {["msl",player,1] call bg_fnc_initloadouts};
		case "B_Soldier_TL_F": {["mtl",player,1] call bg_fnc_initloadouts};
		case "B_soldier_UAV_F": {["mu",player,1] call bg_fnc_initloadouts};
		default {["nondefaulta3",player,1] call bg_fnc_initloadouts};
	};
};
if ((bg_param_playerfaction) == 3) then // russian
{
	switch (typeof player) do 
	{
		case "B_crew_F": {["rc",player,1] call bg_fnc_initloadouts};
		case "B_engineer_F": {["re",player,1] call bg_fnc_initloadouts};
		case "B_helicrew_F": {["rhc",player,1] call bg_fnc_initloadouts};
		case "B_Helipilot_F": {["rhp",player,1] call bg_fnc_initloadouts};
		case "B_medic_F": {["rm",player,1] call bg_fnc_initloadouts};
		case "B_officer_F": {["ro",player,1] call bg_fnc_initloadouts};
		case "B_Pilot_F": {["rp",player,1] call bg_fnc_initloadouts};
		case "B_Soldier_A_F": {["ram",player,1] call bg_fnc_initloadouts};
		case "B_soldier_AA_F": {["raa",player,1] call bg_fnc_initloadouts};
		case "B_soldier_AR_F": {["rar",player,1] call bg_fnc_initloadouts};
		case "B_soldier_AT_F": {["rat",player,1] call bg_fnc_initloadouts};
		case "B_Soldier_exp_F": {["rx",player,1] call bg_fnc_initloadouts};
		case "B_Soldier_F": {["rr",player,1] call bg_fnc_initloadouts};
		case "B_Soldier_GL_F": {["rg",player,1] call bg_fnc_initloadouts};
		case "B_soldier_LAT_F": {["rla",player,1] call bg_fnc_initloadouts};
		case "B_Soldier_lite_F": {["rrl",player,1] call bg_fnc_initloadouts};
		case "B_soldier_M_F": {["rmm",player,1] call bg_fnc_initloadouts};
		case "B_soldier_PG_F": {["rpt",player,1] call bg_fnc_initloadouts};
		case "B_soldier_repair_F": {["rrp",player,1] call bg_fnc_initloadouts};
		case "B_Soldier_SL_F": {["rsl",player,1] call bg_fnc_initloadouts};
		case "B_Soldier_TL_F": {["rtl",player,1] call bg_fnc_initloadouts};
		case "B_soldier_UAV_F": {["ru",player,1] call bg_fnc_initloadouts};
		default {["nondefaulta3",player,1] call bg_fnc_initloadouts};
	};
};
if ((bg_param_playerfaction) == 4) then //nk
{
	switch (typeof player) do 
	{
		case "B_crew_F": {["nc",player,1] call bg_fnc_initloadouts};
		case "B_engineer_F": {["ne",player,1] call bg_fnc_initloadouts};
		case "B_helicrew_F": {["nhc",player,1] call bg_fnc_initloadouts};
		case "B_Helipilot_F": {["nhp",player,1] call bg_fnc_initloadouts};
		case "B_medic_F": {["nm",player,1] call bg_fnc_initloadouts};
		case "B_officer_F": {["no",player,1] call bg_fnc_initloadouts};
		case "B_Pilot_F": {["np",player,1] call bg_fnc_initloadouts};
		case "B_Soldier_A_F": {["nam",player,1] call bg_fnc_initloadouts};
		case "B_soldier_AA_F": {["naa",player,1] call bg_fnc_initloadouts};
		case "B_soldier_AR_F": {["nar",player,1] call bg_fnc_initloadouts};
		case "B_soldier_AT_F": {["nat",player,1] call bg_fnc_initloadouts};
		case "B_Soldier_exp_F": {["nx",player,1] call bg_fnc_initloadouts};
		case "B_Soldier_F": {["nr",player,1] call bg_fnc_initloadouts};
		case "B_Soldier_GL_F": {["ng",player,1] call bg_fnc_initloadouts};
		case "B_soldier_LAT_F": {["nla",player,1] call bg_fnc_initloadouts};
		case "B_Soldier_lite_F": {["nrl",player,1] call bg_fnc_initloadouts};
		case "B_soldier_M_F": {["nmm",player,1] call bg_fnc_initloadouts};
		case "B_soldier_PG_F": {["npt",player,1] call bg_fnc_initloadouts};
		case "B_soldier_repair_F": {["nrp",player,1] call bg_fnc_initloadouts};
		case "B_Soldier_SL_F": {["nsl",player,1] call bg_fnc_initloadouts};
		case "B_Soldier_TL_F": {["ntl",player,1] call bg_fnc_initloadouts};
		case "B_soldier_UAV_F": {["nu",player,1] call bg_fnc_initloadouts};
		default {["nondefaulta3",player,1] call bg_fnc_initloadouts};
	};
};
if ((bg_param_playerfaction) == 5) then //isis
{
	switch (typeof player) do 
	{
		case "B_crew_F": {["ic",player,1] call bg_fnc_initloadouts};
		case "B_engineer_F": {["ie",player,1] call bg_fnc_initloadouts};
		case "B_helicrew_F": {["ihc",player,1] call bg_fnc_initloadouts};
		case "B_Helipilot_F": {["ihp",player,1] call bg_fnc_initloadouts};
		case "B_medic_F": {["im",player,1] call bg_fnc_initloadouts};
		case "B_officer_F": {["io",player,1] call bg_fnc_initloadouts};
		case "B_Pilot_F": {["ip",player,1] call bg_fnc_initloadouts};
		case "B_Soldier_A_F": {["iam",player,1] call bg_fnc_initloadouts};
		case "B_soldier_AA_F": {["iaa",player,1] call bg_fnc_initloadouts};
		case "B_soldier_AR_F": {["iar",player,1] call bg_fnc_initloadouts};
		case "B_soldier_AT_F": {["iat",player,1] call bg_fnc_initloadouts};
		case "B_Soldier_exp_F": {["ix",player,1] call bg_fnc_initloadouts};
		case "B_Soldier_F": {["ir",player,1] call bg_fnc_initloadouts};
		case "B_Soldier_GL_F": {["ig",player,1] call bg_fnc_initloadouts};
		case "B_soldier_LAT_F": {["ila",player,1] call bg_fnc_initloadouts};
		case "B_Soldier_lite_F": {["irl",player,1] call bg_fnc_initloadouts};
		case "B_soldier_M_F": {["imm",player,1] call bg_fnc_initloadouts};
		case "B_soldier_PG_F": {["ipt",player,1] call bg_fnc_initloadouts};
		case "B_soldier_repair_F": {["irp",player,1] call bg_fnc_initloadouts};
		case "B_Soldier_SL_F": {["isl",player,1] call bg_fnc_initloadouts};
		case "B_Soldier_TL_F": {["itl",player,1] call bg_fnc_initloadouts};
		case "B_soldier_UAV_F": {["iu",player,1] call bg_fnc_initloadouts};
		default {["nondefaulta3",player,1] call bg_fnc_initloadouts};
	};
};
