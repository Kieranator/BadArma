// Remove all items
removeAllWeapons _unit; 

// Standard gear
for "_i" from 1 to 3 do {_unit addItem "FirstAidKit";}; // 6 bandages
_unit addMagazines ["rhs_mag_m67",3]; // 3 frags
_unit addMagazines ["rhs_mag_mk84",1]; // 1 stun
_unit addMagazines ["SmokeShell",2]; // 2 smokes

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
		_unit addBackpack "rhsusf_falconii";
		
		_unit addMagazines ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",8];
		_unit addMagazines ["rhs_mag_M433_HEDP",3];
		
		_weapon = "rhs_m4a1_m320";
		_unit addWeapon _weapon;
		
		 _attach = "rhsusf_acc_compm4";
		_unit addPrimaryWeaponItem _attach;
	};
	case "sl":
	{
		_unit addBackpack "rhsusf_falconii";
		
		_unit addMagazines ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",8];
		_unit addMagazines ["rhs_mag_M433_HEDP",3];
		
		_weapon = "rhs_m4a1_m320";
		_unit addWeapon _weapon;
		
		 _attach = "rhsusf_acc_compm4";
		_unit addPrimaryWeaponItem _attach;
	};
	case "mg":
	{
		_unit addMagazines ["rhsusf_100Rnd_556x45_soft_pouch",3];
		
		_weapon = "rhs_weap_m249_pip";
		_unit addWeapon _weapon;
	};
	case "mga":
	{
		_unit addMagazines ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",12];
		_unit addMagazines ["rhsusf_100Rnd_556x45_soft_pouch",2];
		
		_weapon = "rhs_weap_m4_carryhandle";
		_unit addWeapon _weapon;
	};
	case "m":
	{
		_unit addMagazines ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",6];
		
		_weapon = "rhs_weap_m4_carryhandle";
		_unit addWeapon _weapon;
		
		(unitBackpack _unit) addItemCargoGlobal ["MediKit", 1];
		(unitBackpack _unit) addItemCargoGlobal ["FirstAidKit", 8];
	};
	case "r":
	{
		_unit addBackpack "rhsusf_falconii";
		
		_unit addMagazines ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",10];
		
		_weapon = "rhs_weap_m4_carryhandle";
		_unit addWeapon _weapon;
	};
	case "rg":
	{
		_unit addBackpack "rhsusf_falconii";
	
		_unit addMagazines ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",8];
		_unit addMagazines ["rhs_mag_M433_HEDP",8];
	
		_weapon = "rhs_m4_m320";
		_unit addWeapon _weapon;
		
		 _attach = "rhsusf_acc_compm4";
		_unit addPrimaryWeaponItem _attach;
	};
	case "rl":
	{
		_unit addBackpack "rhsusf_falconii";
	
		_unit addMagazines ["rhs_m136_mag",1];
		
		_weapon = "rhs_weap_M136";
		_unit addWeapon _weapon;
		
		
		_unit addMagazines ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",8];
		
		_weapon = "rhs_weap_m4_carryhandle";
		_unit addWeapon _weapon;
	};
};
_unit selectweapon primaryWeapon _unit;
