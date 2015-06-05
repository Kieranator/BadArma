_typeofUnit = toLower (_this select 0);
_unit = _this select 1;
_typeBackpack = _this select 2;
removeheadgear _unit;
removegoggles _unit;
_glasses = [];
removeBackpack _unit;
removeVest _unit;
removeallweapons _unit;

_firstaid = "FirstAidKit";
_unit addItem _firstaid;

_nvg = "NVGoggles";
if(_nvg in (assignedItems _unit)) then
{
    _unit unassignItem _nvg;
    _unit removeItem _nvg;
};
_nvg = "NVGoggles_OPFOR";
if(_nvg in (assignedItems _unit)) then
{
    _unit unassignItem _nvg;
    _unit removeItem _nvg;
};
_nvg = "NVGoggles_INDEP";
if(_nvg in (assignedItems _unit)) then
{
    _unit unassignItem _nvg;
    _unit removeItem _nvg;
};

_backpack = {
	_typeofBackPack = _this select 0;
	switch (_typeofBackPack) do
	{
	case "r":
		{
         if (_typeBackpack > 0) then {
            _backpack = ["rhs_sidor","rhs_assault_umbts"];
            _unit addBackpack (_backpack call BIS_fnc_selectRandom);
            clearMagazineCargoGlobal (unitBackpack _unit);
            clearItemCargoGlobal (unitBackpack _unit);
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_30Rnd_545x39_7N10_AK", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_30Rnd_545x39_7N22_AK", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_30Rnd_545x39_AK_green", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_rgd5", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_rdg2_white", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_rdg2_black", 1];
         };
		};
	case "m":
		{
         if (_typeBackpack > 0) then {
            _unit addBackpack "rhs_assault_umbts";
            clearMagazineCargoGlobal (unitBackpack _unit);
            clearItemCargoGlobal (unitBackpack _unit);
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_30Rnd_545x39_7N10_AK", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_30Rnd_545x39_7N22_AK", 1];
            (unitBackpack _unit) addItemCargoGlobal ["Medikit", 1];
            (unitBackpack _unit) addItemCargoGlobal ["FirstAidKit", 12];
         };
		};
	case "sn":
		{
         if (_typeBackpack > 0) then {
            _unit addBackpack "rhs_sidor";
            clearMagazineCargoGlobal (unitBackpack _unit);
            clearItemCargoGlobal (unitBackpack _unit);
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_rgd5", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_rdg2_white", 2];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_rdg2_black", 2];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_10Rnd_762x54mmR_7N1", 5];
         };
		};
	case "ftl":
		{
         if (_typeBackpack > 0) then {
            _unit addBackpack "rhs_assault_umbts";
            clearMagazineCargoGlobal (unitBackpack _unit);
            clearItemCargoGlobal (unitBackpack _unit);
            (unitBackpack _unit) addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_30Rnd_545x39_AK", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VOG25", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VOG25P", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VG40TB", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VG40SZ", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VG40OP_white", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VG40OP_green", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VG40OP_red", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_GRD40_White", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_GRD40_Green", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_GRD40_Red", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_45Rnd_545X39_AK_Green", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_45Rnd_545X39_7N22_AK", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_45Rnd_545X39_7N10_AK", 1];
         };
		};
	case "g":
		{
         if (_typeBackpack > 0) then {
            _unit addBackpack "rhs_assault_umbts";
            clearMagazineCargoGlobal (unitBackpack _unit);
            clearItemCargoGlobal (unitBackpack _unit);
            (unitBackpack _unit) addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_30Rnd_545x39_AK", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VOG25", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VOG25P", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VG40TB", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VG40SZ", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VG40OP_white", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VG40OP_green", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VG40OP_red", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_GRD40_White", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_GRD40_Green", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_GRD40_Red", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_45Rnd_545X39_AK_Green", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_45Rnd_545X39_7N22_AK", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_45Rnd_545X39_7N10_AK", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["Chemlight_green", 1];
         };
		};
	case "ar":
		{
         if (_typeBackpack > 0) then {
            _unit addBackpack "rhs_assault_umbts";
            clearMagazineCargoGlobal (unitBackpack _unit);
            clearItemCargoGlobal (unitBackpack _unit);
            (unitBackpack _unit) addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VOG25", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VOG25P", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VG40TB", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VG40SZ", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VG40OP_white", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VG40OP_green", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VG40OP_red", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_GRD40_White", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_GRD40_Green", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_GRD40_Red", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["Chemlight_green", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["30Rnd_545x39_AK107", 1];
         };
		};
	case "ar1":
		{
         if (_typeBackpack > 0) then {
            _unit addBackpack "rhs_assault_umbts";
            clearMagazineCargoGlobal (unitBackpack _unit);
            clearItemCargoGlobal (unitBackpack _unit);
            (unitBackpack _unit) addMagazineCargoGlobal [_mags1, 0];
            (unitBackpack _unit) addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VOG25", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VOG25P", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VG40TB", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VG40SZ", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VG40OP_white", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VG40OP_green", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VG40OP_red", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_GRD40_White", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_GRD40_Green", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_GRD40_Red", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["Chemlight_green", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["30Rnd_545x39_AK107", 1];
         };
		};
	case "aar":
		{
         if (_typeBackpack > 0) then {
            _unit addBackpack "rhs_assault_umbts";
            clearMagazineCargoGlobal (unitBackpack _unit);
            clearItemCargoGlobal (unitBackpack _unit);
            (unitBackpack _unit) addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VOG25", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VOG25P", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VG40TB", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VG40SZ", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VG40OP_white", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VG40OP_green", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VG40OP_red", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_GRD40_White", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_GRD40_Green", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_GRD40_Red", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["Chemlight_green", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["30Rnd_545x39_AK107", 1];
         };
		};
	case "mg":
		{
         if (_typeBackpack > 0) then {
            _unit addBackpack "rhs_assault_umbts";
            clearMagazineCargoGlobal (unitBackpack _unit);
            clearItemCargoGlobal (unitBackpack _unit);
            (unitBackpack _unit) addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VOG25", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VOG25P", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VG40TB", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VG40SZ", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VG40OP_white", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VG40OP_green", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VG40OP_red", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_GRD40_White", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_GRD40_Green", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_GRD40_Red", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["Chemlight_green", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_100Rnd_762x54mmR", 1];
         };
		};
	case "amg":
		{
         if (_typeBackpack > 0) then {
            _unit addBackpack "rhs_assault_umbts";
            clearMagazineCargoGlobal (unitBackpack _unit);
            clearItemCargoGlobal (unitBackpack _unit);
            (unitBackpack _unit) addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VOG25", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VOG25P", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VG40TB", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VG40SZ", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VG40OP_white", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VG40OP_green", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_VG40OP_red", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_GRD40_White", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_GRD40_Green", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_GRD40_Red", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["Chemlight_green", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_100Rnd_762x54mmR", 1];
         };
		};
	case "at":
		{
         if (_typeBackpack > 0) then {
            _unit addBackpack "rhs_rpg";
            clearMagazineCargoGlobal (unitBackpack _unit);
            clearItemCargoGlobal (unitBackpack _unit);
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_rpg7_PG7VL_mag", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_rpg7_PG7VR_mag", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_rpg7_OG7V_mag", 1];
         };
		};
	case "aat":
		{
         if (_typeBackpack > 0) then {
            _unit addBackpack "rhs_rpg";
            clearMagazineCargoGlobal (unitBackpack _unit);
            clearItemCargoGlobal (unitBackpack _unit);
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_rpg7_PG7VL_mag", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_rpg7_TBG7V_mag", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_rpg7_OG7V_mag", 1];
         };
		};
	case "mor":
		{
         if (_typeBackpack > 0) then {
            _unit addBackpack "I_Mortar_01_weapon_F";
            clearMagazineCargoGlobal (unitBackpack _unit);
            clearItemCargoGlobal (unitBackpack _unit);
         };
		};
	case "amor":
		{
         if (_typeBackpack > 0) then {
            _unit addBackpack "I_Mortar_01_support_F";
            clearMagazineCargoGlobal (unitBackpack _unit);
            clearItemCargoGlobal (unitBackpack _unit);
         };
		};
	case "eng":
		{
         if (_typeBackpack > 0) then {
            _unit addBackpack "rhs_assault_umbts_engineer";
            clearMagazineCargoGlobal (unitBackpack _unit);
            clearItemCargoGlobal (unitBackpack _unit);
            (unitBackpack _unit) addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mine_pmn2_mag", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mine_tm62m_mag", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mine_M19_mag", 1];
            (unitBackpack _unit) addItemCargoGlobal ["ToolKit", 1];
         };
		};
	case "demo":
		{
         if (_typeBackpack > 0) then {
            _unit addBackpack "rhs_assault_umbts_demo";
            clearMagazineCargoGlobal (unitBackpack _unit);
            clearItemCargoGlobal (unitBackpack _unit);
            (unitBackpack _unit) addMagazineCargoGlobal ["ATMine_Range_Mag", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["APERSMine_Range_Mag", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["APERSBoundingMine_Range_Mag", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["ClaymoreDirectionalMine_Remote_Mag", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mine_pmn2_mag", 1];
            (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mine_tm62m_mag", 1];
         };
		};
	};
};

switch (_typeofUnit) do
{
	case "r":
		{
            _uniform = ["rhs_uniform_msv_emr"];
            _unit forceAddUniform (_uniform call BIS_fnc_selectRandom);
            _helmet = ["rhs_6b28","rhs_6b28_bala","rhs_6b28_ess","rhs_6b28_ess_bala"];
            _unit addheadgear (_helmet call BIS_fnc_selectRandom);
            _vest = ["rhs_6b23_digi_rifleman","rhs_digi_6b23_6sh92","rhs_digi_6b23_6sh92_radio"];
            _unit addvest (_vest call BIS_fnc_selectRandom);
            _unit addMagazines ["rhs_30Rnd_545x39_AK", 4];
            _unit addMagazines ["rhs_30Rnd_545x39_AK_green", 3];
            _unit addMagazines ["rhs_mag_rgd5", 1];
            _unit addMagazines ["rhs_mag_rdg2_white", 1];
            _unit addMagazines ["rhs_mag_rdg2_black", 1];
            _weapon = ["rhs_weap_ak74m_2mag","rhs_weap_ak74m","rhs_weap_ak74m_camo","rhs_weap_ak74m_2mag_camo"];
            _nr1 = floor(random(count(_weapon)));
            _weapon = _weapon select _nr1;
            _mags1 = _mags1 select _nr1;
            _unit addWeapon _weapon;
            ["r"] call _backpack;
		};
	case "m":
		{
            _uniform = ["rhs_uniform_msv_emr"];
            _unit forceAddUniform (_uniform call BIS_fnc_selectRandom);
            _helmet = ["rhs_6b28","rhs_6b28_bala","rhs_6b28_ess","rhs_6b28_ess_bala"];
            _unit addheadgear (_helmet call BIS_fnc_selectRandom);
            _vest = ["rhs_digi_6b23_medic"];
            _unit addvest (_vest call BIS_fnc_selectRandom);
            _glasses = ["rhs_scarf"];
            _unit addGoggles (_glasses call BIS_fnc_selectRandom);
            _unit addMagazines ["rhs_30Rnd_545x39_AK", 4];
            _unit addMagazines ["rhs_30Rnd_545x39_AK_green", 3];
            _unit addMagazines ["rhs_mag_rgd5", 1];
            _unit addMagazines ["rhs_mag_rdg2_white", 1];
            _unit addMagazines ["rhs_mag_rdg2_black", 1];
            _weapon = ["rhs_weap_ak74m_2mag","rhs_weap_ak74m","rhs_weap_ak74m_camo","rhs_weap_ak74m_2mag_camo"];
            _nr1 = floor(random(count(_weapon)));
            _weapon = _weapon select _nr1;
            _mags1 = _mags1 select _nr1;
            _unit addWeapon _weapon;
            ["m"] call _backpack;
		};
	case "sn":
		{
            _uniform = ["rhs_uniform_msv_emr"];
            _unit forceAddUniform (_uniform call BIS_fnc_selectRandom);
            _helmet = ["rhs_Booniehat_digi"];
            _unit addheadgear (_helmet call BIS_fnc_selectRandom);
            _vest = ["rhs_6b23_digi_sniper"];
            _unit addvest (_vest call BIS_fnc_selectRandom);
            _glasses = ["rhs_balaclava","H_Watchcap_camo","H_Bandanna_sgg"];
            _unit addGoggles (_glasses call BIS_fnc_selectRandom);
            _unit addMagazines ["rhs_mag_rgd5", 1];
            _unit addMagazines ["rhs_mag_rdg2_white", 1];
            _unit addMagazines ["rhs_mag_rdg2_black", 1];
            _unit addMagazines ["rhs_10Rnd_762x54mmR_7N1", 5];
            _weapon = "rhs_weap_svdp";
            _unit addWeapon _weapon;
            ["sn"] call _backpack;
            _attach = ["rhs_acc_pso1m2"];
            _wepItems = primaryWeaponItems _unit;
			{
                _unit removePrimaryWeaponItem  _x;
			} foreach _wepItems;
            {
                _unit addPrimaryWeaponItem _x;
            } foreach _attach;
		};
	case "ftl":
		{
            _unit addItem "NVGoggles";
            _unit assignItem "NVGoggles";
            _uniform = ["rhs_uniform_msv_emr"];
            _unit forceAddUniform (_uniform call BIS_fnc_selectRandom);
            _helmet = ["rhs_fieldcap_helm_digi"];
            _unit addheadgear (_helmet call BIS_fnc_selectRandom);
            _vest = ["rhs_6b23_digi_6sh92_headset_mapcase"];
            _unit addvest (_vest call BIS_fnc_selectRandom);
            _glasses = ["rhs_balaclava"];
            _unit addGoggles (_glasses call BIS_fnc_selectRandom);
            _unit addMagazines ["rhs_mag_rgd5", 1];
            _unit addMagazines ["rhs_mag_rdg2_white", 1];
            _unit addMagazines ["rhs_mag_rdg2_black", 1];
            _unit addMagazines ["HandGrenade", 1];
            _unit addMagazines ["MiniGrenade", 1];
            _unit addMagazines ["rhs_30Rnd_545x39_AK", 1];
            _weapon = "rhs_weap_ak74m_gp25";
            _unit addWeapon _weapon;
            _unit addItem "ItemGPS";
            _unit assignItem "ItemGPS";
            ["ftl"] call _backpack;
            _attach = ["rhs_acc_1p29"];
            _wepItems = primaryWeaponItems _unit;
			{
                _unit removePrimaryWeaponItem  _x;
			} foreach _wepItems;
            {
                _unit addPrimaryWeaponItem _x;
            } foreach _attach;
		};
	case "g":
		{
            _uniform = ["rhs_uniform_msv_emr"];
            _unit forceAddUniform (_uniform call BIS_fnc_selectRandom);
            _helmet = ["rhs_6b28","rhs_6b28_bala","rhs_6b28_ess","rhs_6b28_ess_bala"];
            _unit addheadgear (_helmet call BIS_fnc_selectRandom);
            _vest = ["rhs_6b23_digi_6sh92_vog","rhs_digi_6b23_6sh92_vog_headset"];
            _unit addvest (_vest call BIS_fnc_selectRandom);
            _unit addMagazines ["rhs_mag_rgd5", 1];
            _unit addMagazines ["rhs_mag_rdg2_white", 1];
            _unit addMagazines ["rhs_mag_rdg2_black", 1];
            _unit addMagazines ["HandGrenade", 1];
            _unit addMagazines ["MiniGrenade", 1];
            _unit addMagazines ["rhs_30Rnd_545x39_AK", 1];
            _unit addMagazines ["SmokeShell", 1];
            _unit addMagazines ["SmokeShellYellow", 1];
            _unit addMagazines ["SmokeShellRed", 1];
            _unit addMagazines ["SmokeShellGreen", 1];
            _unit addMagazines ["SmokeShellPurple", 1];
            _unit addMagazines ["SmokeShellBlue", 1];
            _unit addMagazines ["SmokeShellOrange", 1];
            _weapon = "rhs_weap_ak74m_gp25";
            _unit addWeapon _weapon;
            ["g"] call _backpack;
            _attach = ["rhs_acc_pkas"];
            _wepItems = primaryWeaponItems _unit;
			{
                _unit removePrimaryWeaponItem  _x;
			} foreach _wepItems;
            {
                _unit addPrimaryWeaponItem _x;
            } foreach _attach;
		};
	case "ar":
		{
            _uniform = ["rhs_uniform_msv_emr"];
            _unit forceAddUniform (_uniform call BIS_fnc_selectRandom);
            _helmet = ["rhs_6b28","rhs_6b28_bala","rhs_6b28_ess","rhs_6b28_ess_bala"];
            _unit addheadgear (_helmet call BIS_fnc_selectRandom);
            _vest = ["rhs_6b23_digi_rifleman","rhs_digi_6b23_6sh92","rhs_digi_6b23_6sh92_radio"];
            _unit addvest (_vest call BIS_fnc_selectRandom);
            _glasses = ["rhs_balaclava"];
            _unit addGoggles (_glasses call BIS_fnc_selectRandom);
            _unit addMagazines ["rhs_mag_rgd5", 1];
            _unit addMagazines ["rhs_mag_rdg2_white", 1];
            _unit addMagazines ["rhs_mag_rdg2_black", 1];
            _unit addMagazines ["HandGrenade", 1];
            _unit addMagazines ["MiniGrenade", 1];
            _unit addMagazines ["SmokeShell", 1];
            _unit addMagazines ["SmokeShellYellow", 1];
            _unit addMagazines ["SmokeShellRed", 1];
            _unit addMagazines ["SmokeShellGreen", 1];
            _unit addMagazines ["SmokeShellPurple", 1];
            _unit addMagazines ["SmokeShellBlue", 1];
            _unit addMagazines ["SmokeShellOrange", 1];
            _unit addMagazines ["75Rnd_545x39_RPK107", 1];
            _weapon = "LMG_SUD_RPK107";
            _unit addWeapon _weapon;
            ["ar"] call _backpack;
            _attach = ["optic_sud_pso1"];
            _wepItems = primaryWeaponItems _unit;
			{
                _unit removePrimaryWeaponItem  _x;
			} foreach _wepItems;
            {
                _unit addPrimaryWeaponItem _x;
            } foreach _attach;
		};
	case "ar1":
		{
            _uniform = ["rhs_uniform_msv_emr"];
            _unit forceAddUniform (_uniform call BIS_fnc_selectRandom);
            _helmet = ["rhs_6b28","rhs_6b28_bala","rhs_6b28_ess","rhs_6b28_ess_bala"];
            _unit addheadgear (_helmet call BIS_fnc_selectRandom);
            _vest = ["rhs_6b23_digi_rifleman","rhs_digi_6b23_6sh92","rhs_digi_6b23_6sh92_radio"];
            _unit addvest (_vest call BIS_fnc_selectRandom);
            _glasses = ["rhs_balaclava"];
            _unit addGoggles (_glasses call BIS_fnc_selectRandom);
            _unit addMagazines ["rhs_mag_rgd5", 1];
            _unit addMagazines ["rhs_mag_rdg2_white", 1];
            _unit addMagazines ["rhs_mag_rdg2_black", 1];
            _unit addMagazines ["HandGrenade", 1];
            _unit addMagazines ["MiniGrenade", 1];
            _unit addMagazines ["SmokeShell", 1];
            _unit addMagazines ["SmokeShellYellow", 1];
            _unit addMagazines ["SmokeShellRed", 1];
            _unit addMagazines ["SmokeShellGreen", 1];
            _unit addMagazines ["SmokeShellPurple", 1];
            _unit addMagazines ["SmokeShellBlue", 1];
            _unit addMagazines ["SmokeShellOrange", 1];
            _unit addMagazines ["75Rnd_545x39_RPK107", 1];
            _mags1 = ["75Rnd_545x39_RPK107","gunclip2"];
            _weapon = ["LMG_SUD_RPK107","gun2"];
            _nr1 = floor(random(count(_weapon)));
            _weapon = _weapon select _nr1;
            _mags1 = _mags1 select _nr1;
            _unit addMagazines [_mags1, 2];
            _unit addWeapon _weapon;
            ["ar1"] call _backpack;
            _attach = ["optic_sud_pso1"];
            _wepItems = primaryWeaponItems _unit;
			{
                _unit removePrimaryWeaponItem  _x;
			} foreach _wepItems;
            {
                _unit addPrimaryWeaponItem _x;
            } foreach _attach;
		};
	case "aar":
		{
            _uniform = ["rhs_uniform_msv_emr"];
            _unit forceAddUniform (_uniform call BIS_fnc_selectRandom);
            _helmet = ["rhs_6b28","rhs_6b28_bala","rhs_6b28_ess","rhs_6b28_ess_bala"];
            _unit addheadgear (_helmet call BIS_fnc_selectRandom);
            _vest = ["rhs_6b23_digi_rifleman","rhs_digi_6b23_6sh92","rhs_digi_6b23_6sh92_radio"];
            _unit addvest (_vest call BIS_fnc_selectRandom);
            _glasses = ["rhs_balaclava"];
            _unit addGoggles (_glasses call BIS_fnc_selectRandom);
            _unit addMagazines ["rhs_mag_rgd5", 1];
            _unit addMagazines ["rhs_mag_rdg2_white", 1];
            _unit addMagazines ["rhs_mag_rdg2_black", 1];
            _unit addMagazines ["HandGrenade", 1];
            _unit addMagazines ["MiniGrenade", 1];
            _unit addMagazines ["SmokeShell", 1];
            _unit addMagazines ["SmokeShellYellow", 1];
            _unit addMagazines ["SmokeShellRed", 1];
            _unit addMagazines ["SmokeShellGreen", 1];
            _unit addMagazines ["SmokeShellPurple", 1];
            _unit addMagazines ["SmokeShellBlue", 1];
            _unit addMagazines ["SmokeShellOrange", 1];
            _unit addMagazines ["75Rnd_545x39_RPK107", 1];
            _weapon = "LMG_SUD_RPK107";
            _unit addWeapon _weapon;
            ["aar"] call _backpack;
            _attach = ["optic_sud_pso1"];
            _wepItems = primaryWeaponItems _unit;
			{
                _unit removePrimaryWeaponItem  _x;
			} foreach _wepItems;
            {
                _unit addPrimaryWeaponItem _x;
            } foreach _attach;
		};
	case "mg":
		{
            _uniform = ["rhs_uniform_msv_emr"];
            _unit forceAddUniform (_uniform call BIS_fnc_selectRandom);
            _helmet = ["rhs_6b28","rhs_6b28_bala","rhs_6b28_ess","rhs_6b28_ess_bala"];
            _unit addheadgear (_helmet call BIS_fnc_selectRandom);
            _vest = ["rhs_6b23_digi_rifleman","rhs_digi_6b23_6sh92","rhs_digi_6b23_6sh92_radio"];
            _unit addvest (_vest call BIS_fnc_selectRandom);
            _glasses = ["rhs_balaclava"];
            _unit addGoggles (_glasses call BIS_fnc_selectRandom);
            _unit addMagazines ["rhs_mag_rgd5", 1];
            _unit addMagazines ["rhs_mag_rdg2_white", 1];
            _unit addMagazines ["rhs_mag_rdg2_black", 1];
            _unit addMagazines ["HandGrenade", 1];
            _unit addMagazines ["MiniGrenade", 1];
            _unit addMagazines ["SmokeShellBlue", 1];
            _unit addMagazines ["SmokeShellOrange", 1];
            _unit addMagazines ["rhs_100Rnd_762x54mmR_green", 1];
            _weapon = "rhs_weap_pkp";
            _unit addWeapon _weapon;
            ["mg"] call _backpack;
            _attach = ["rhs_acc_1p29"];
            _wepItems = primaryWeaponItems _unit;
			{
                _unit removePrimaryWeaponItem  _x;
			} foreach _wepItems;
            {
                _unit addPrimaryWeaponItem _x;
            } foreach _attach;
		};
	case "amg":
		{
            _uniform = ["rhs_uniform_msv_emr"];
            _unit forceAddUniform (_uniform call BIS_fnc_selectRandom);
            _helmet = ["rhs_6b28","rhs_6b28_bala","rhs_6b28_ess","rhs_6b28_ess_bala"];
            _unit addheadgear (_helmet call BIS_fnc_selectRandom);
            _vest = ["rhs_6b23_digi_rifleman","rhs_digi_6b23_6sh92","rhs_digi_6b23_6sh92_radio"];
            _unit addvest (_vest call BIS_fnc_selectRandom);
            _glasses = ["rhs_balaclava"];
            _unit addGoggles (_glasses call BIS_fnc_selectRandom);
            _unit addMagazines ["rhs_mag_rgd5", 1];
            _unit addMagazines ["rhs_mag_rdg2_white", 1];
            _unit addMagazines ["rhs_mag_rdg2_black", 1];
            _unit addMagazines ["HandGrenade", 1];
            _unit addMagazines ["MiniGrenade", 1];
            _unit addMagazines ["SmokeShellBlue", 1];
            _unit addMagazines ["SmokeShellOrange", 1];
            _unit addMagazines ["rhs_100Rnd_762x54mmR_green", 1];
            _weapon = "rhs_weap_pkp";
            _unit addWeapon _weapon;
            ["amg"] call _backpack;
            _attach = ["rhs_acc_1p29"];
            _wepItems = primaryWeaponItems _unit;
			{
                _unit removePrimaryWeaponItem  _x;
			} foreach _wepItems;
            {
                _unit addPrimaryWeaponItem _x;
            } foreach _attach;
		};
	case "at":
		{
            _uniform = ["rhs_uniform_msv_emr"];
            _unit forceAddUniform (_uniform call BIS_fnc_selectRandom);
            _helmet = ["rhs_6b28","rhs_6b28_bala","rhs_6b28_ess","rhs_6b28_ess_bala"];
            _unit addheadgear (_helmet call BIS_fnc_selectRandom);
            _vest = ["rhs_6b23_digi_rifleman","rhs_digi_6b23_6sh92","rhs_digi_6b23_6sh92_radio"];
            _unit addvest (_vest call BIS_fnc_selectRandom);
            _unit addMagazines ["rhs_mag_rgd5", 1];
            _unit addMagazines ["rhs_mag_rdg2_white", 1];
            _unit addMagazines ["rhs_mag_rdg2_black", 1];
            _unit addMagazines ["rhs_30Rnd_545x39_AK", 1];
            _unit addMagazines ["rhs_30Rnd_545x39_7N10_AK", 1];
            _unit addMagazines ["rhs_30Rnd_545x39_7N22_AK", 1];
            _unit addMagazines ["rhs_30Rnd_545x39_AK_green", 1];
            _weapon = "rhs_weap_ak74m_2mag";
            _unit addWeapon _weapon;
            ["at"] call _backpack;
            _weapon = "rhs_weap_rpg7";
            _unit addWeapon _weapon;
		};
	case "aat":
		{
            _uniform = ["rhs_uniform_msv_emr"];
            _unit forceAddUniform (_uniform call BIS_fnc_selectRandom);
            _helmet = ["rhs_6b28","rhs_6b28_bala","rhs_6b28_ess","rhs_6b28_ess_bala"];
            _unit addheadgear (_helmet call BIS_fnc_selectRandom);
            _vest = ["rhs_6b23_digi_rifleman","rhs_digi_6b23_6sh92","rhs_digi_6b23_6sh92_radio"];
            _unit addvest (_vest call BIS_fnc_selectRandom);
            _unit addMagazines ["rhs_mag_rgd5", 1];
            _unit addMagazines ["rhs_mag_rdg2_white", 1];
            _unit addMagazines ["rhs_mag_rdg2_black", 1];
            _unit addMagazines ["rhs_30Rnd_545x39_AK", 1];
            _unit addMagazines ["rhs_30Rnd_545x39_7N10_AK", 1];
            _unit addMagazines ["rhs_30Rnd_545x39_7N22_AK", 1];
            _unit addMagazines ["rhs_30Rnd_545x39_AK_green", 1];
            _weapon = "rhs_weap_ak74m_2mag";
            _unit addWeapon _weapon;
            ["aat"] call _backpack;
		};
	case "mor":
		{
            _uniform = ["rhs_uniform_msv_emr"];
            _unit forceAddUniform (_uniform call BIS_fnc_selectRandom);
            _helmet = ["rhs_6b28","rhs_6b28_bala","rhs_6b28_ess","rhs_6b28_ess_bala"];
            _unit addheadgear (_helmet call BIS_fnc_selectRandom);
            _vest = ["rhs_6b23_digi_rifleman","rhs_digi_6b23_6sh92","rhs_digi_6b23_6sh92_radio"];
            _unit addvest (_vest call BIS_fnc_selectRandom);
            _unit addMagazines ["rhs_30Rnd_545x39_7N10_AK", 1];
            _unit addMagazines ["rhs_30Rnd_545x39_7N22_AK", 1];
            _unit addMagazines ["rhs_30Rnd_545x39_AK_green", 1];
            _unit addMagazines ["rhs_mag_rgd5", 1];
            _unit addMagazines ["rhs_mag_rdg2_white", 1];
            _unit addMagazines ["rhs_mag_rdg2_black", 1];
            _weapon = "rhs_weap_ak74m_2mag";
            _unit addWeapon _weapon;
            ["mor"] call _backpack;
		};
	case "amor":
		{
            _uniform = ["rhs_uniform_msv_emr"];
            _unit forceAddUniform (_uniform call BIS_fnc_selectRandom);
            _helmet = ["rhs_6b28","rhs_6b28_bala","rhs_6b28_ess","rhs_6b28_ess_bala"];
            _unit addheadgear (_helmet call BIS_fnc_selectRandom);
            _vest = ["rhs_6b23_digi_rifleman","rhs_digi_6b23_6sh92","rhs_digi_6b23_6sh92_radio"];
            _unit addvest (_vest call BIS_fnc_selectRandom);
            _unit addMagazines ["rhs_30Rnd_545x39_7N10_AK", 1];
            _unit addMagazines ["rhs_30Rnd_545x39_7N22_AK", 1];
            _unit addMagazines ["rhs_30Rnd_545x39_AK_green", 1];
            _unit addMagazines ["rhs_mag_rgd5", 1];
            _unit addMagazines ["rhs_mag_rdg2_white", 1];
            _unit addMagazines ["rhs_mag_rdg2_black", 1];
            _weapon = "rhs_weap_ak74m_2mag";
            _unit addWeapon _weapon;
            ["amor"] call _backpack;
		};
	case "eng":
		{
            _uniform = ["rhs_uniform_msv_emr"];
            _unit forceAddUniform (_uniform call BIS_fnc_selectRandom);
            _helmet = ["rhs_6b28","rhs_6b28_bala","rhs_6b28_ess","rhs_6b28_ess_bala"];
            _unit addheadgear (_helmet call BIS_fnc_selectRandom);
            _vest = ["rhs_digi_6b23_engineer"];
            _unit addvest (_vest call BIS_fnc_selectRandom);
            _unit addMagazines ["rhs_30Rnd_545x39_7N10_AK", 1];
            _unit addMagazines ["rhs_30Rnd_545x39_7N22_AK", 1];
            _unit addMagazines ["rhs_30Rnd_545x39_AK_green", 1];
            _unit addMagazines ["rhs_mag_rgd5", 1];
            _unit addMagazines ["rhs_mag_rdg2_white", 1];
            _unit addMagazines ["rhs_mag_rdg2_black", 1];
            _weapon = "rhs_weap_ak74m_2mag";
            _unit addWeapon _weapon;
            {_unit addItem "MineDetector"} forEach [1];
            ["eng"] call _backpack;
            _attach = ["rhs_acc_1p29"];
            _wepItems = primaryWeaponItems _unit;
			{
                _unit removePrimaryWeaponItem  _x;
			} foreach _wepItems;
            {
                _unit addPrimaryWeaponItem _x;
            } foreach _attach;
		};
	case "demo":
		{
            _uniform = ["rhs_uniform_msv_emr"];
            _unit forceAddUniform (_uniform call BIS_fnc_selectRandom);
            _helmet = ["rhs_6b28","rhs_6b28_bala","rhs_6b28_ess","rhs_6b28_ess_bala"];
            _unit addheadgear (_helmet call BIS_fnc_selectRandom);
            _vest = ["rhs_digi_6b23_engineer"];
            _unit addvest (_vest call BIS_fnc_selectRandom);
            _unit addMagazines ["rhs_30Rnd_545x39_7N10_AK", 1];
            _unit addMagazines ["rhs_30Rnd_545x39_7N22_AK", 1];
            _unit addMagazines ["rhs_30Rnd_545x39_AK_green", 1];
            _unit addMagazines ["rhs_mag_rgd5", 1];
            _unit addMagazines ["rhs_mag_rdg2_white", 1];
            _unit addMagazines ["rhs_mag_rdg2_black", 1];
            _weapon = "rhs_weap_ak74m_2mag";
            _unit addWeapon _weapon;
            ["demo"] call _backpack;
            _attach = ["rhs_acc_1p29"];
            _wepItems = primaryWeaponItems _unit;
			{
                _unit removePrimaryWeaponItem  _x;
			} foreach _wepItems;
            {
                _unit addPrimaryWeaponItem _x;
            } foreach _attach;
		};
};
_unit selectweapon primaryWeapon _unit;
