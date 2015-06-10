if (isServer) then {

	// NPC LOADOUT SCRIPT
	
	// Original Script By:
	// F3 - Folk Assign Gear Script - Green
	// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

	// Modifications by:
	// M3
	// jorsh

	// INTERPRET PASSED VARIABLES
	// The following inrerprets formats what has been passed to this script element
	_typeofUnit = toLower (_this select 0);		// Tidy input for SWITCH/CASE statements, expecting something like : r = Rifleman, co = Commanding Officer, rat = Rifleman (AT)
	_unit = _this select 1;						// expecting name of unit; originally passed by using 'this' in unit init

	// ====================================================================================

	// PREPARE UNIT FOR GEAR ADDITION
	// The following code removes all existing weapons and backpacks

	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;
	
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ItemWatch";
	_unit linkItem "ItemGPS";

	// ====================================================================================

	// DEFINE UNIT TYPE LOADOUTS
	// The following blocks of code define loadouts for each type of unit (the unit type
	// is passed to the script in the first variable)

	switch (_typeofUnit) do
	{

	// ====================================================================================

	// LOADOUT: USA RIFLEMAN
		default
		{	
			comment "Add containers";
			_unit forceAddUniform "rhs_uniform_cu_ocp";
			_unit addItemToUniform "AGM_Morphine";
			for "_i" from 1 to 6 do {_unit addItemToUniform "AGM_Bandage";};
			_unit addVest "rhsusf_iotv_ocp_Rifleman";
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
			for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_mk84";};
			_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk262_Stanag";
			_unit addBackpack "rhsusf_assault_eagleaiii_ocp";
			for "_i" from 1 to 20 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
			_unit addHeadgear "rhsusf_ach_helmet_ocp";
			_unit addGoggles "BWA3_G_Combat_Black";

			comment "Add weapons";
			_unit addWeapon "rhs_weap_m4a1";
			_unit addPrimaryWeaponItem "rhsusf_acc_compm4";
			_unit addItem "ACRE_PRC343";
		};
		
		// LOADOUT: USA MEDIC
		case "um":
		{
			comment "Add containers";
			_unit forceAddUniform "rhs_uniform_cu_ocp";
			_unit addItemToUniform "AGM_Morphine";
			for "_i" from 1 to 6 do {_unit addItemToUniform "AGM_Bandage";};
			_unit addItemToUniform "rhs_mag_30Rnd_556x45_Mk262_Stanag";
			_unit addItemToUniform "rhs_mag_30Rnd_556x45_Mk262_Stanag";
			_unit addVest "rhsusf_iotv_ocp_Medic";
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
			for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShell";};
			for "_i" from 1 to 7 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
			_unit addBackpack "rhsusf_assault_eagleaiii_ocp";
			for "_i" from 1 to 10 do {_unit addItemToBackpack "AGM_Epipen";};
			for "_i" from 1 to 20 do {_unit addItemToBackpack "AGM_Morphine";};
			for "_i" from 1 to 20 do {_unit addItemToBackpack "AGM_Bandage";};
			for "_i" from 1 to 2 do {_unit addItemToBackpack "AGM_Bloodbag";};
			for "_i" from 1 to 5 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
			_unit addHeadgear "rhsusf_ach_helmet_ocp";
			_unit addGoggles "BWA3_G_Combat_Black";

			comment "Add weapons";
			_unit addWeapon "rhs_weap_m4a1";
			_unit addPrimaryWeaponItem "rhsusf_acc_compm4";
			_unit addItem "ACRE_PRC343";
		};
		
		// LOADOUT: USA GRENADIER
		case "ug":
		{
			comment "Add containers";
			_unit forceAddUniform "rhs_uniform_cu_ocp";
			_unit addItemToUniform "AGM_Morphine";
			for "_i" from 1 to 6 do {_unit addItemToUniform "AGM_Bandage";};
			_unit addVest "rhsusf_iotv_ocp_Grenadier";
			for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_mk84";};
			for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_M433_HEDP";};
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m714_White";};
			_unit addBackpack "rhsusf_assault_eagleaiii_ocp";
			for "_i" from 1 to 14 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
			_unit addHeadgear "rhsusf_ach_helmet_ocp";
			_unit addGoggles "AV_ESS_blk";
			
			comment "Add weapons";
			_unit addWeapon "rhs_m4a1_m320";
			_unit addPrimaryWeaponItem "rhsusf_acc_compm4";
			_unit addItem "ACRE_PRC343";
		};
		
		// LOADOUT: USA SQUAD LEADER
		case "usl":
		{
			comment "Add containers";
			_unit forceAddUniform "rhs_uniform_cu_ocp";
			_unit addItemToUniform "AGM_Morphine";
			for "_i" from 1 to 6 do {_unit addItemToUniform "AGM_Bandage";};
			_unit addVest "rhsusf_iotv_ocp_Squadleader";
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
			for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_M433_HEDP";};
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m713_Red";};
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m715_Green";};
			_unit addBackpack "rhsusf_assault_eagleaiii_ocp";
			for "_i" from 1 to 11 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
			for "_i" from 1 to 3 do {_unit addItemToBackpack "RH_15Rnd_9x19_M9";};
			for "_i" from 1 to 3 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
			_unit addHeadgear "rhsusf_ach_helmet_headset_ess_ocp";
			
			comment "Add weapons";
			_unit addWeapon "rhs_m4a1_m320";
			_unit addPrimaryWeaponItem "rhsusf_acc_compm4";
			_unit addWeapon "RH_m9";
			_unit addWeapon "Binocular";
			_unit addItem "ACRE_PRC148";
			_unit addItem "ACRE_PRC343";

		};
		
		// LOADOUT: USA TEAM LEADER
		case "utl":
		{
			comment "Add containers";
			_unit forceAddUniform "rhs_uniform_cu_ocp";
			_unit addItemToUniform "AGM_Morphine";
			for "_i" from 1 to 6 do {_unit addItemToUniform "AGM_Bandage";};
			_unit addVest "rhsusf_iotv_ucp_Teamleader";
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
			for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_M433_HEDP";};
			for "_i" from 1 to 4 do {_unit addItemToVest "rhs_mag_m714_White";};
			_unit addBackpack "rhsusf_assault_eagleaiii_ocp";
			for "_i" from 1 to 11 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
			for "_i" from 1 to 3 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
			_unit addHeadgear "rhsusf_ach_helmet_headset_ocp";
			_unit addGoggles "BWA3_G_Combat_Black";
			
			comment "Add weapons";
			_unit addWeapon "rhs_m4a1_m320";
			_unit addPrimaryWeaponItem "rhsusf_acc_compm4";
			_unit addWeapon "Binocular";
			_unit addItem "ACRE_PRC148";
			_unit addItem "ACRE_PRC343";

		};
		
		// LOADOUT: USA MARKSMAN
		case "umm":
		{
			comment "Add containers";
			_unit forceAddUniform "rhs_uniform_cu_ocp";
			_unit addItemToUniform "AGM_Morphine";
			for "_i" from 1 to 6 do {_unit addItemToUniform "AGM_Bandage";};
			_unit addVest "rhsusf_iotv_ocp_Rifleman";
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
			for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_mk84";};
			_unit addBackpack "rhsusf_assault_eagleaiii_ocp";
			for "_i" from 1 to 14 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
			_unit addHeadgear "rhsusf_ach_helmet_ocp";
			_unit addGoggles "PU_shemagh_Tan";

			comment "Add weapons";
			_unit addWeapon "rhs_weap_m4a1_grip";
			_unit addPrimaryWeaponItem "RH_ta31rco";
			_unit addItem "ACRE_PRC343";

		};
		
		// LOADOUT: USA AUTORIFLEMAN
		case "uar":
		{
			comment "Add containers";
			_unit forceAddUniform "rhs_uniform_cu_ocp";
			_unit addItemToUniform "AGM_Morphine";
			for "_i" from 1 to 6 do {_unit addItemToUniform "AGM_Bandage";};
			_unit addVest "rhsusf_iotv_ocp_SAW";
			for "_i" from 1 to 2 do {_unit addItemToVest "rhsusf_100Rnd_556x45_soft_pouch";};
			for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
			_unit addBackpack "rhsusf_assault_eagleaiii_ocp";
			for "_i" from 1 to 3 do {_unit addItemToBackpack "rhsusf_100Rnd_556x45_soft_pouch";};
			_unit addHeadgear "rhsusf_ach_helmet_headset_ocp";
			_unit addGoggles "BWA3_G_Combat_Black";

			comment "Add weapons";
			_unit addWeapon "rhs_weap_m249_pip";
			_unit addItem "ACRE_PRC343";
		};
		
		// LOADOUT: USA AUTORIFLEMAN ASSIST.
		case "uam":
		{
			comment "Add containers";
			_unit forceAddUniform "rhs_uniform_cu_ocp";
			_unit addItemToUniform "AGM_Morphine";
			for "_i" from 1 to 6 do {_unit addItemToUniform "AGM_Bandage";};
			for "_i" from 1 to 3 do {_unit addItemToUniform "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
			_unit addVest "rhsusf_iotv_ocp_Rifleman";
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
			for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
			for "_i" from 1 to 7 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
			_unit addBackpack "rhsusf_assault_eagleaiii_ocp";
			for "_i" from 1 to 4 do {_unit addItemToBackpack "rhsusf_100Rnd_556x45_soft_pouch";};
			_unit addHeadgear "rhsusf_ach_helmet_ocp";
			_unit addGoggles "BWA3_G_Combat_Black";

			comment "Add weapons";
			_unit addWeapon "rhs_weap_m4a1";
			_unit addItemToUniform "rhs_mag_30Rnd_556x45_Mk262_Stanag";
			_unit addPrimaryWeaponItem "rhsusf_acc_compm4";
			_unit addWeapon "Binocular";
			_unit addItem "ACRE_PRC343";
		};
		
		// LOADOUT: USA LAT
		case "uat":
		{	
			comment "Add containers";
			_unit forceAddUniform "rhs_uniform_cu_ocp";
			_unit addItemToUniform "AGM_Morphine";
			for "_i" from 1 to 6 do {_unit addItemToUniform "AGM_Bandage";};
			_unit addVest "rhsusf_iotv_ocp_Rifleman";
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
			for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_mk84";};
			_unit addBackpack "rhsusf_assault_eagleaiii_ocp";
			for "_i" from 1 to 14 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
			_unit addItemToBackpack "rhs_m136_hedp_mag";
			_unit addHeadgear "rhsusf_ach_helmet_ocp";
			_unit addGoggles "BWA3_G_Combat_Black";

			comment "Add weapons";
			_unit addWeapon "rhs_weap_m4a1";
			_unit addPrimaryWeaponItem "rhsusf_acc_compm4";
			_unit addWeapon "rhs_weap_M136_hedp";
			_unit addItem "ACRE_PRC343";
		};
		
		
	// ====================================================================================
		
		
		
		// LOADOUT: USMC RIFLEMAN
		case "mr":
		{
			
			comment "Add containers";
			_unit forceAddUniform "Niko_USA_MARPAT";
			_unit addItemToUniform "AGM_Morphine";
			for "_i" from 1 to 6 do {_unit addItemToUniform "AGM_Bandage";};
			_unit addVest "V_PlateCarrier1_PMC_marpat";
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
			for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_mk84";};
			_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";
			_unit addBackpack "B_Kitbag_rgr";
			for "_i" from 1 to 20 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
			_unit addHeadgear "Niko_MICH_MARPAT";

			comment "Add weapons";
			_unit addWeapon "rhs_weap_m16a4";
			_unit addPrimaryWeaponItem "RH_t1";
			_unit addItem "ACRE_PRC343";

		};
		
		// LOADOUT: USMC MEDIC
		case "mm":
		{
			comment "Add containers";
			_unit forceAddUniform "Niko_USA_MARPAT";
			_unit addItemToUniform "AGM_Morphine";
			for "_i" from 1 to 6 do {_unit addItemToUniform "AGM_Bandage";};
			_unit addVest "V_PlateCarrier1_PMC_marpat";
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
			for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShell";};
			_unit addBackpack "B_Kitbag_rgr";
			for "_i" from 1 to 10 do {_unit addItemToBackpack "AGM_Epipen";};
			for "_i" from 1 to 20 do {_unit addItemToBackpack "AGM_Morphine";};
			for "_i" from 1 to 20 do {_unit addItemToBackpack "AGM_Bandage";};
			for "_i" from 1 to 2 do {_unit addItemToBackpack "AGM_Bloodbag";};
			for "_i" from 1 to 14 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
			_unit addHeadgear "Niko_MICH_MARPAT";

			comment "Add weapons";
			_unit addWeapon "rhs_weap_m16a4";
			_unit addPrimaryWeaponItem "RH_t1";
			_unit addItem "ACRE_PRC343";
		};
		
		// LOADOUT: USMC GRENADIER
		case "mg":
		{
			comment "Add containers";
			_unit forceAddUniform "Niko_USA_MARPAT";
			_unit addItemToUniform "AGM_Morphine";
			for "_i" from 1 to 6 do {_unit addItemToUniform "AGM_Bandage";};
			_unit addVest "V_PlateCarrier1_PMC_marpat";
			for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_mk84";};
			for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_M433_HEDP";};
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m714_White";};
			_unit addBackpack "B_Kitbag_rgr";
			for "_i" from 1 to 14 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
			_unit addHeadgear "Niko_MICH_MARPAT";
			
			comment "Add weapons";
			_unit addWeapon "rhs_weap_m16a4_carryhandle_M203";
			_unit addPrimaryWeaponItem "RH_t1";
			_unit addItem "ACRE_PRC343";
		};
		
		// LOADOUT: USMC SQUAD LEADER
		case "msl":
		{
			comment "Add containers";
			_unit forceAddUniform "Niko_USA_MARPAT";
			_unit addItemToUniform "AGM_Morphine";
			for "_i" from 1 to 6 do {_unit addItemToUniform "AGM_Bandage";};
			for "_i" from 1 to 3 do {_unit addItemToUniform "RH_15Rnd_9x19_M9";};
			_unit addVest "V_PlateCarrier1_PMC_marpat";
			for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_M433_HEDP";};
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m713_Red";};
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m715_Green";};
			for "_i" from 1 to 9 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
			for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
			_unit addBackpack "B_Kitbag_rgr";
			_unit addHeadgear "Niko_MICH_MARPAT";
			
			comment "Add weapons";
			_unit addWeapon "rhs_weap_m16a4_carryhandle_M203";
			_unit addPrimaryWeaponItem "RH_t1";
			_unit addWeapon "RH_m9";
			_unit addWeapon "Binocular";
			_unit addItem "ACRE_PRC148";
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
			_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";
			_unit addItem "ACRE_PRC343";
			
		};
		
		// LOADOUT: USMC TEAM LEADER
		case "utl":
		{
			comment "Add containers";
			_unit forceAddUniform "Niko_USA_MARPAT";
			_unit addItemToUniform "AGM_Morphine";
			for "_i" from 1 to 6 do {_unit addItemToUniform "AGM_Bandage";};
			for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_m67";};
			_unit addVest "V_PlateCarrier1_PMC_marpat";
			for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_M433_HEDP";};
			for "_i" from 1 to 4 do {_unit addItemToVest "rhs_mag_m714_White";};
			for "_i" from 1 to 10 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
			for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
			_unit addBackpack "B_Kitbag_rgr";
			_unit addHeadgear "Niko_MICH_MARPAT";
			
			comment "Add weapons";
			_unit addWeapon "rhs_weap_m16a4_carryhandle_M203";
			_unit addPrimaryWeaponItem "RH_t1";
			_unit addWeapon "Binocular";
			_unit addItem "ACRE_PRC148";
			_unit addItem "ACRE_PRC343";

		};
		
		// LOADOUT: USMC MARKSMAN
		case "mmm":
		{
			comment "Add containers";
			_unit forceAddUniform "Niko_USA_MARPAT";
			_unit addItemToUniform "AGM_Morphine";
			for "_i" from 1 to 6 do {_unit addItemToUniform "AGM_Bandage";};
			_unit addVest "V_PlateCarrier1_PMC_marpat";
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
			for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_mk84";};
			_unit addBackpack "B_Kitbag_rgr";
			for "_i" from 1 to 14 do {_unit addItemToBackpack "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
			_unit addHeadgear "Niko_MICH_MARPAT";

			comment "Add weapons";
			_unit addWeapon "rhs_weap_m16a4_grip";
			_unit addPrimaryWeaponItem "RH_ta31rco";
			_unit addItem "ACRE_PRC343";
		};
		
		// LOADOUT: USMC AUTORIFLEMAN
		case "mar":
		{
			comment "Add containers";
			_unit forceAddUniform "Niko_USA_MARPAT";
			for "_i" from 1 to 6 do {_unit addItemToUniform "AGM_Bandage";};
			_unit addItemToUniform "AGM_Morphine";
			for "_i" from 1 to 3 do {_unit addItemToUniform "RH_15Rnd_9x19_M9";};
			_unit addVest "V_PlateCarrier1_PMC_marpat";
			for "_i" from 1 to 4 do {_unit addItemToVest "rhsusf_100Rnd_556x45_soft_pouch";};
			_unit addHeadgear "Niko_MICH_MARPAT";

			comment "Add weapons";
			_unit addWeapon "rhs_weap_m249_pip";
			_unit addWeapon "RH_m9";
			_unit addItem "ACRE_PRC343";

			_unit addItemToVest "rhsusf_100Rnd_556x45_soft_pouch";
		};
		
		// LOADOUT: USMC AUTORIFLEMAN ASSIST.
		case "mam":
		{
			comment "Add containers";
			_unit forceAddUniform "Niko_USA_MARPAT";
			for "_i" from 1 to 6 do {_unit addItemToUniform "AGM_Bandage";};
			_unit addItemToUniform "AGM_Morphine";
			for "_i" from 1 to 3 do {_unit addItemToUniform "RH_15Rnd_9x19_M9";};
			_unit addVest "V_PlateCarrier1_PMC_marpat";
			_unit addItemToVest "rhs_mag_m67";
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_mk84";};
			for "_i" from 1 to 12 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
			_unit addBackpack "B_Kitbag_rgr";
			for "_i" from 1 to 4 do {_unit addItemToBackpack "rhsusf_100Rnd_556x45_soft_pouch";};
			_unit addHeadgear "Niko_MICH_MARPAT";

			comment "Add weapons";
			_unit addWeapon "rhs_weap_m16a4";
			_unit addPrimaryWeaponItem "RH_t1";
			_unit addWeapon "RH_m9";
			_unit addItem "ACRE_PRC343";
		};
		
		// LOADOUT: USMC LAT
		case "mat":
		{
			
			comment "Add containers";
			_unit forceAddUniform "Niko_USA_MARPAT";
			for "_i" from 1 to 6 do {_unit addItemToUniform "AGM_Bandage";};
			_unit addItemToUniform "AGM_Morphine";
			for "_i" from 1 to 3 do {_unit addItemToUniform "RH_15Rnd_9x19_M9";};
			_unit addVest "V_PlateCarrier1_PMC_marpat";
			_unit addItemToVest "rhs_mag_m67";
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_mk84";};
			for "_i" from 1 to 12 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
			_unit addHeadgear "Niko_MICH_MARPAT";

			comment "Add weapons";
			_unit addWeapon "rhs_weap_m16a4";
			_unit addPrimaryWeaponItem "RH_t1";
			_unit addWeapon "av_at4";
			_unit addWeapon "RH_m9";
			_unit addItem "ACRE_PRC343";

		};

	// ====================================================================================		
		
		// LOADOUT: RUS RIFLEMAN
		case "rr":
		{
			
			_unit forceAddUniform "rhs_uniform_flora_patchless";
			for "_i" from 1 to 6 do {_unit addItemToUniform "AGM_Bandage";};
			_unit addItemToUniform "AGM_Morphine";
			_unit addVest "rhs_6b23_rifleman";
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rdg2_white";};
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rgd5";};
			_unit addBackpack "rhs_sidor";
			for "_i" from 1 to 14 do {_unit addItemToBackpack "rhs_30Rnd_545x39_7N10_AK";};
			_unit addHeadgear "rhs_6b27m";

			comment "Add weapons";
			_unit addWeapon "rhs_weap_ak74m";
			_unit addItem "ACRE_PRC343";
		};
		
		// LOADOUT: RUS MEDIC
		case "rm":
		{
			comment "Add containers";
			_unit forceAddUniform "rhs_uniform_flora_patchless";
			for "_i" from 1 to 4 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
			_unit addVest "rhs_6b23_medic";
			for "_i" from 1 to 10 do {_unit addItemToVest "rhs_30Rnd_545x39_7N10_AK";};
			_unit addBackpack "rhs_sidor";
			for "_i" from 1 to 20 do {_unit addItemToBackpack "AGM_Morphine";};
			for "_i" from 1 to 20 do {_unit addItemToBackpack "AGM_Bandage";};
			for "_i" from 1 to 10 do {_unit addItemToBackpack "AGM_Epipen";};
			for "_i" from 1 to 2 do {_unit addItemToBackpack "AGM_Bloodbag";};
			for "_i" from 1 to 3 do {_unit addItemToBackpack "rhs_30Rnd_545x39_7N10_AK";};
			_unit addHeadgear "rhs_6b27m";

			comment "Add weapons";
			_unit addWeapon "rhs_weap_ak74m";
			_unit addItemToVest "rhs_30Rnd_545x39_7N10_AK";
			_unit addItem "ACRE_PRC343";
		};
		
		// LOADOUT: RUS GRENADIER
		case "rg":
		{
			comment "Add containers";
			_unit forceAddUniform "rhs_uniform_flora_patchless";
			for "_i" from 1 to 6 do {_unit addItemToUniform "AGM_Bandage";};
			_unit addItemToUniform "AGM_Morphine";
			_unit addVest "rhs_6b23_6sh92_vog";
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rdg2_white";};
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rgd5";};
			for "_i" from 1 to 8 do {_unit addItemToVest "rhs_VOG25";};
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_GRD40_White";};
			_unit addBackpack "rhs_sidor";
			for "_i" from 1 to 14 do {_unit addItemToBackpack "rhs_30Rnd_545x39_7N10_AK";};
			_unit addHeadgear "rhs_6b27m";

			comment "Add weapons";
			_unit addWeapon "rhs_weap_ak74m_gp25";
			_unit addItem "ACRE_PRC343";
		};
		
		// LOADOUT: RUS SQUAD LEADER
		case "rsl":
		{
			comment "Add containers";
			_unit forceAddUniform "rhs_uniform_flora_patchless";
			for "_i" from 1 to 6 do {_unit addItemToUniform "AGM_Bandage";};
			_unit addItemToUniform "AGM_Morphine";
			for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
			_unit addVest "rhs_6b23_6sh92_vog_headset";
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rgd5";};
			for "_i" from 1 to 8 do {_unit addItemToVest "rhs_VOG25";};
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_GRD40_Green";};
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_GRD40_Red";};
			_unit addBackpack "rhs_sidor";
			for "_i" from 1 to 11 do {_unit addItemToBackpack "rhs_30Rnd_545x39_7N10_AK";};
			for "_i" from 1 to 3 do {_unit addItemToBackpack "RH_8Rnd_762_tt33";};
			_unit addHeadgear "rhs_6b27m";

			comment "Add weapons";
			_unit addWeapon "rhs_weap_ak74m_gp25";
			for "_i" from 1 to 3 do {_unit addItemToVest "rhs_30Rnd_545x39_AK_green";};
			_unit addWeapon "Binocular";
			_unit addItem "ACRE_PRC148";
			_unit addWeapon "RH_tt33";
			_unit addItem "ACRE_PRC343";

		};
		
		// LOADOUT: RUS TEAM LEADER
		case "rtl":
		{
			comment "Add containers";
			_unit forceAddUniform "rhs_uniform_flora_patchless";
			for "_i" from 1 to 6 do {_unit addItemToUniform "AGM_Bandage";};
			_unit addItemToUniform "AGM_Morphine";
			for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
			_unit addVest "rhs_6b23_6sh92_vog_headset";
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rgd5";};
			for "_i" from 1 to 8 do {_unit addItemToVest "rhs_VOG25";};
			for "_i" from 1 to 4 do {_unit addItemToVest "rhs_GRD40_White";};
			_unit addBackpack "rhs_sidor";
			for "_i" from 1 to 14 do {_unit addItemToBackpack "rhs_30Rnd_545x39_7N10_AK";};
			_unit addHeadgear "rhs_6b27m";

			comment "Add weapons";
			_unit addWeapon "rhs_weap_ak74m_gp25";
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_30Rnd_545x39_AK_green";};
			_unit addWeapon "Binocular";
			_unit addItem "ACRE_PRC148";
			_unit addItem "ACRE_PRC343";
		};
		
		// LOADOUT: RUS MARKSMAN
		case "rmm":
		{
			_unit forceAddUniform "rhs_uniform_flora_patchless";
			for "_i" from 1 to 6 do {_unit addItemToUniform "AGM_Bandage";};
			_unit addItemToUniform "AGM_Morphine";
			_unit addVest "rhs_6b23_rifleman";
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rdg2_white";};
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rgd5";};
			_unit addBackpack "rhs_sidor";
			for "_i" from 1 to 14 do {_unit addItemToBackpack "rhs_30Rnd_545x39_AK_green";};
			_unit addHeadgear "rhs_6b27m";

			comment "Add weapons";
			_unit addWeapon "rhs_weap_ak74m";
			_unit addPrimaryWeaponItem "rhs_acc_pso1m2";
			_unit addItem "ACRE_PRC343";
		};
		
		// LOADOUT: RUS AUTORIFLEMAN
		case "rar":
		{
			_unit forceAddUniform "rhs_uniform_flora_patchless";
			for "_i" from 1 to 6 do {_unit addItemToUniform "AGM_Bandage";};
			_unit addItemToUniform "AGM_Morphine";
			_unit addVest "rhs_6b23_rifleman";
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rdg2_white";};
			_unit addItemToVest "rhs_100Rnd_762x54mmR";
			_unit addBackpack "rhs_sidor";
			for "_i" from 1 to 3 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR";};
			_unit addHeadgear "rhs_6b27m";

			comment "Add weapons";
			_unit addWeapon "rhs_weap_pkp";
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rgd5";};
			_unit addItem "ACRE_PRC343";
		};
		
		// LOADOUT: RUS AUTORIFLEMAN ASSIST.
		case "ram":
		{
			_unit forceAddUniform "rhs_uniform_flora_patchless";
			for "_i" from 1 to 6 do {_unit addItemToUniform "AGM_Bandage";};
			_unit addItemToUniform "AGM_Morphine";
			_unit addItemToUniform "rhs_mag_rdg2_white";
			_unit addItemToUniform "rhs_mag_rgd5";
			_unit addVest "rhs_6b23_rifleman";
			for "_i" from 1 to 7 do {_unit addItemToVest "rhs_30Rnd_545x39_7N10_AK";};
			_unit addBackpack "rhs_sidor";
			for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_100Rnd_762x54mmR";};
			for "_i" from 1 to 5 do {_unit addItemToBackpack "rhs_30Rnd_545x39_7N10_AK";};
			_unit addHeadgear "rhs_6b27m";

			comment "Add weapons";
			_unit addWeapon "rhs_weap_ak74m";
			_unit addItemToVest "rhs_30Rnd_545x39_7N10_AK";
			_unit addWeapon "Binocular";
			_unit addItem "ACRE_PRC343";
		};
		
		// LOADOUT: RUS LAT
		case "rat":
		{	
			_unit forceAddUniform "rhs_uniform_flora_patchless";
			for "_i" from 1 to 6 do {_unit addItemToUniform "AGM_Bandage";};
			_unit addItemToUniform "AGM_Morphine";
			_unit addVest "rhs_6b23_rifleman";
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rdg2_white";};
			for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rgd5";};
			_unit addItemToVest "rhs_rpg26_mag";
			_unit addBackpack "rhs_sidor";
			for "_i" from 1 to 14 do {_unit addItemToBackpack "rhs_30Rnd_545x39_7N10_AK";};
			_unit addHeadgear "rhs_6b27m";

			comment "Add weapons";
			_unit addWeapon "rhs_weap_ak74m";
			_unit addWeapon "rhs_weap_rpg26";
			_unit addItem "ACRE_PRC343";
		};

	// ====================================================================================
	
	// LOADOUT: NK RIFLEMAN
		case "nr":
		{
			
			comment "Add containers";
			_unit forceAddUniform "MNP_CombatUniform_NKR_Rg";
			for "_i" from 1 to 5 do {_unit addItemToUniform "AGM_Bandage";};
			for "_i" from 1 to 4 do {_unit addItemToUniform "hlc_30Rnd_545x39_B_AK";};
			_unit addItemToUniform "AGM_Morphine";
			_unit addVest "OMON_ch";
			for "_i" from 1 to 8 do {_unit addItemToVest "hlc_30Rnd_545x39_B_AK";};
			_unit addHeadgear "MNP_Helmet_SOV_Steel";

			comment "Add weapons";
			_unit addWeapon "hlc_rifle_aek971";
			_unit addItemToUniform "hlc_30Rnd_545x39_B_AK";
		};
		
		// LOADOUT: NK MEDIC
		case "nm":
		{
			comment "Add containers";
			_unit forceAddUniform "MNP_CombatUniform_NKR_Rg";
			for "_i" from 1 to 5 do {_unit addItemToUniform "AGM_Bandage";};
			for "_i" from 1 to 4 do {_unit addItemToUniform "hlc_30Rnd_545x39_B_AK";};
			_unit addItemToUniform "AGM_Morphine";
			_unit addVest "OMON_ch";
			for "_i" from 1 to 8 do {_unit addItemToVest "hlc_30Rnd_545x39_B_AK";};
			_unit addBackpack "rhs_sidor";
			for "_i" from 1 to 20 do {_unit addItemToBackpack "AGM_Morphine";};
			for "_i" from 1 to 20 do {_unit addItemToBackpack "AGM_Bandage";};
			for "_i" from 1 to 10 do {_unit addItemToBackpack "AGM_Epipen";};
			for "_i" from 1 to 2 do {_unit addItemToBackpack "AGM_Bloodbag";};
			for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_mag_rdg2_black";};
			_unit addHeadgear "MNP_Helmet_SOV_Steel";

			comment "Add weapons";
			_unit addWeapon "hlc_rifle_aek971";
			_unit addItemToUniform "hlc_30Rnd_545x39_B_AK";
		};
		
		// LOADOUT: NK GRENADIER
		case "ng":
		{
			comment "Add containers";
			_unit forceAddUniform "MNP_CombatUniform_NKR_Rg";
			for "_i" from 1 to 5 do {_unit addItemToUniform "AGM_Bandage";};
			for "_i" from 1 to 4 do {_unit addItemToUniform "hlc_30Rnd_545x39_B_AK";};
			_unit addItemToUniform "AGM_Morphine";
			_unit addVest "OMON_ch";
			for "_i" from 1 to 8 do {_unit addItemToVest "hlc_30Rnd_545x39_B_AK";};
			_unit addBackpack "rhs_sidor";
			for "_i" from 1 to 15 do {_unit addItemToBackpack "rhs_mag_rgd5";};
			for "_i" from 1 to 5 do {_unit addItemToBackpack "rhs_mag_rdg2_black";};
			_unit addHeadgear "MNP_Helmet_SOV_Steel";

			comment "Add weapons";
			_unit addWeapon "hlc_rifle_aek971";
			_unit addItemToUniform "hlc_30Rnd_545x39_B_AK";
		};
		
		// LOADOUT: NK TEAM LEADER
		case "ntl":
		{
			comment "Add containers";
			_unit forceAddUniform "MNP_CombatUniform_NKR_Rg";
			for "_i" from 1 to 5 do {_unit addItemToUniform "AGM_Bandage";};
			for "_i" from 1 to 4 do {_unit addItemToUniform "hlc_30Rnd_545x39_B_AK";};
			_unit addItemToUniform "AGM_Morphine";
			_unit addVest "p2_ak";
			for "_i" from 1 to 5 do {_unit addItemToVest "hlc_30Rnd_545x39_B_AK";};
			_unit addBackpack "rhs_sidor";
			for "_i" from 1 to 15 do {_unit addItemToBackpack "hlc_VOG25_AK";};
			for "_i" from 1 to 5 do {_unit addItemToBackpack "hlc_GRD_white";};
			for "_i" from 1 to 3 do {this addItemToBackpack "hlc_30Rnd_545x39_t_ak";};
			_unit addHeadgear "MNP_Helmet_SOV_Steel";

			comment "Add weapons";
			_unit addWeapon "hlc_rifle_aks74_GL";
			_unit addItemToUniform "hlc_30Rnd_545x39_B_AK";

		};
		
		// LOADOUT: NK SQUAD LEADER
		case "nsl":
		{
			comment "Add containers";
			_unit forceAddUniform "MNP_CombatUniform_NKR_Rg";
			for "_i" from 1 to 5 do {_unit addItemToUniform "AGM_Bandage";};
			for "_i" from 1 to 4 do {_unit addItemToUniform "hlc_30Rnd_545x39_B_AK";};
			_unit addItemToUniform "AGM_Morphine";
			_unit addVest "p2_ak";
			for "_i" from 1 to 5 do {_unit addItemToVest "hlc_30Rnd_545x39_B_AK";};
			_unit addBackpack "rhs_sidor";
			for "_i" from 1 to 8 do {_unit addItemToBackpack "hlc_VOG25_AK";};
			for "_i" from 1 to 4 do {_unit addItemToBackpack "hlc_GRD_orange";};
			for "_i" from 1 to 3 do {_unit addItemToBackpack "hlc_30Rnd_545x39_t_ak";};
			_unit addHeadgear "MNP_Helmet_SOV_Steel";

			comment "Add weapons";
			_unit addWeapon "hlc_rifle_aks74_GL";
			_unit addItemToUniform "hlc_30Rnd_545x39_B_AK";
			_unit addWeapon "Binocular";
		};
		
		// LOADOUT: NK MARKSMAN
		case "nmm":
		{
			comment "Add containers";
			_unit forceAddUniform "MNP_CombatUniform_NKR_Rg";
			for "_i" from 1 to 5 do {_unit addItemToUniform "AGM_Bandage";};
			_unit addItemToUniform "AGM_Morphine";
			for "_i" from 1 to 4 do {_unit addItemToUniform "10Rnd_LOP_762x54_T_mag";};
			_unit addVest "OMON_ch";
			for "_i" from 1 to 8 do {_unit addItemToVest "10Rnd_LOP_762x54_mag";};
			_unit addHeadgear "MNP_Helmet_SOV_Steel";

			comment "Add weapons";
			_unit addWeapon "LOP_Rifle_SVD";
			_unit addItemToVest "10Rnd_LOP_762x54_mag";
		};
		
		// LOADOUT: NK AUTORIFLEMAN
		case "nar":
		{
			comment "Add containers";
			_unit forceAddUniform "MNP_CombatUniform_NKR_Rg";
			for "_i" from 1 to 5 do {_unit addItemToUniform "AGM_Bandage";};
			_unit addItemToUniform "AGM_Morphine";
			for "_i" from 1 to 3 do {_unit addItemToUniform "hlc_45Rnd_762x39_m_rpk";};
			_unit addVest "OMON_ch";
			for "_i" from 1 to 6 do {_unit addItemToVest "hlc_45Rnd_762x39_m_rpk";};
			_unit addHeadgear "MNP_Helmet_SOV_Steel";
	
			comment "Add weapons";
			_unit addWeapon "hlc_rifle_rpk";
			_unit addItemToUniform "hlc_45Rnd_762x39_m_rpk";
		};
		
		// LOADOUT: NK AUTORIFLEMAN ASSIST.
		case "nam":
		{
			comment "Add containers";
			_unit forceAddUniform "MNP_CombatUniform_NKR_Rg";
			for "_i" from 1 to 5 do {_unit addItemToUniform "AGM_Bandage";};
			for "_i" from 1 to 4 do {_unit addItemToUniform "hlc_30Rnd_545x39_B_AK";};
			_unit addItemToUniform "AGM_Morphine";
			_unit addVest "OMON_ch";
			for "_i" from 1 to 8 do {_unit addItemToVest "hlc_30Rnd_545x39_B_AK";};
			_unit addBackpack "rhs_sidor";
			for "_i" from 1 to 9 do {_unit addItemToBackpack "hlc_45Rnd_762x39_m_rpk";};
			_unit addHeadgear "MNP_Helmet_SOV_Steel";

			comment "Add weapons";
			_unit addWeapon "hlc_rifle_aek971";
			_unit addItemToUniform "hlc_30Rnd_545x39_B_AK";
		};
		
		// LOADOUT: NK LAT
		case "nat":
		{	
			comment "Add containers";
			_unit forceAddUniform "MNP_CombatUniform_NKR_Rg";
			for "_i" from 1 to 5 do {_unit addItemToUniform "AGM_Bandage";};
			for "_i" from 1 to 4 do {_unit addItemToUniform "hlc_30Rnd_545x39_B_AK";};
			_unit addItemToUniform "AGM_Morphine";
			_unit addVest "OMON_ch";
			_unit addItemToVest "rhs_rpg26_mag";
			_unit addWeapon "rhs_weap_rpg26";
			for "_i" from 1 to 8 do {_unit addItemToVest "hlc_30Rnd_545x39_B_AK";};
			_unit addHeadgear "MNP_Helmet_SOV_Steel";

			comment "Add weapons";
			_unit addWeapon "hlc_rifle_aek971";
			_unit addItemToUniform "hlc_30Rnd_545x39_B_AK";
		};

	// ====================================================================================

	// END SWITCH FOR DEFINE UNIT TYPE LOADOUTS
	};
}