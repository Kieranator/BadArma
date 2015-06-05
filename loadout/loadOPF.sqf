_typeofUnit = toLower (_this select 0);
_unit = _this select 1;

// Remove all items
removeAllWeapons _unit; 

// Standard gear
/*
for "_i" from 1 to 3 do {_unit addItem "FirstAidKit";}; // 6 bandages
_unit addMagazines ["rhs_mag_rgd5",3]; // 3 frags
_unit addMagazines ["rhs_mag_mk84",1]; // 1 stun
_unit addMagazines ["rhs_mag_rdg2_white",2]; // 2 smokes
*/
for "_i" from 1 to 3 do {_unit addItemToUniform "FirstAidKit";}; // 6 bandages
for "_i" from 1 to 3 do {_unit addItemToUniform "rhs_mag_rgd5";}; // 3 frags
for "_i" from 1 to 1 do {_unit addItemToUniform "rhs_mag_mk84";}; // 1 stun
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rdg2_white";}; // 2 smokes

// Remove night vision
_nvg = ["NVGoggles","NVGoggles_OPFOR","NVGoggles_INDEP","rhsusf_ANPVS_14"];
{
	if(_x in (assignedItems _unit)) then
	{
		_unit unassignItem _x;
		_unit removeItem _x;
	};
} forEach _nvg;

switch (_typeofUnit) do
{
	case "tl":
		{
			_unit addBackpack "rhs_sidor";
			
			for "_i" from 1 to 3 do {_unit addItem "rhs_VOG25";};
			for "_i" from 1 to 8 do {_unit addItem"rhs_30Rnd_545x39_AK_green";};			
			
			_weapon = "rhs_weap_ak74m_gp25";
			_unit addWeapon _weapon;
		};
	case "sl":
		{
			_unit addBackpack "rhs_sidor";
			
			for "_i" from 1 to 3 do {_unit addItem "rhs_VOG25";};
			for "_i" from 1 to 8 do {_unit addItem "rhs_30Rnd_545x39_AK_green";};
			
			_weapon = "rhs_weap_ak74m_gp25";
			_unit addWeapon _weapon;
		};
	case "mg":
		{
			_unit addMagazines ["rhs_100Rnd_762x54mmR",3];
			
			_weapon = "rhs_weap_pkp";
			_unit addWeapon _weapon;
		};
	case "mga":
		{
			_unit addMagazines ["rhs_30Rnd_545x39_AK_green",12];
			_unit addMagazines ["rhs_100Rnd_762x54mmR",2];
		
			_weapon = "rhs_weap_ak74m";
			_unit addWeapon _weapon;
		};
	case "m":
		{
			_unit addMagazines ["rhs_30Rnd_545x39_AK_green",6];
		
			_weapon = "rhs_weap_ak74m";
			_unit addWeapon _weapon;
			
			(unitBackpack _unit) addItemCargoGlobal ["MediKit", 1];
			(unitBackpack _unit) addItemCargoGlobal ["FirstAidKit", 8];
		};
	case "r":
		{
			_unit addBackpack "rhs_sidor";
			
			_unit addMagazines ["rhs_30Rnd_545x39_AK_green",10];
		
			_weapon = "rhs_weap_ak74m";
			_unit addWeapon _weapon;			
		};
	case "rg":
		{
			_unit addBackpack "rhs_sidor";
			
			_unit addMagazines ["rhs_VOG25",8];
			_unit addMagazines ["rhs_30Rnd_545x39_AK_green",8];
			
			_weapon = "rhs_weap_ak74m_gp25";
			_unit addWeapon _weapon;		
	
		};
	case "rl":
		{
			_unit addBackpack "rhs_sidor";
			
			
			_unit addMagazines ["rhs_rshg2_mag",1];
			
			_weapon = "rhs_weap_rshg2";
			_unit addWeapon _weapon;
			
			
			_unit addMagazines ["rhs_30Rnd_545x39_AK_green",8];
			
			_weapon = "rhs_weap_ak74m";
			_unit addWeapon _weapon;
		};
};
_unit selectweapon primaryWeapon _unit;
