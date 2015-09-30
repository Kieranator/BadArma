// [ <unit type (string)>, <unit (object)>, <equipment/weapon faction (string) (optional)>, <uniform faction (string) (optional)>] call bg_fnc_assigngear
// ["r",player,"opf_f","aaf"] call bg_fnc_assigngear in debug will give player CSAT rifleman weapons/items and an AAF rifleman uniform

// ["ftl",this] call bg_fnc_assigngear in a unit's init will autodetect unit faction & side and gear them as a fireteam leader if that faction is defined for their side
//  if they are uncommented, settings in the bgmf classes in description.ext will override side/faction detection

private ["_unit"];
_unit = (_this select 1);

// Depending on locality the script decides if it should run
if !(local _unit) exitWith {};

scopename "main";

//init vars
private
[
	"_unitfaction","_uniform_faction","_equip_faction","_uniform_side","_equip_side","_unit_type", "_unitsidestring", "_uniform_side_exists","_equip_side_exists", "_uniform_faction_exists", "_equip_faction_exists", "_typeexists",
	"_uniform", "_helmet", "_vest", "_pack", "_facewear", "_goggles", "_map", "_terminal", "_radio", "_compass", "_watch",
	"_mags", "_meditems", "_items", "_packitems", "_packmags",
	"_primary", "_primaryfinal","_primaryattach", "_secondary", "_secondaryfinal","_secondaryattach", "_handgun", "_handgunfinal","_handgunattach", "_binos", "_binosfinal",
	"_weapons1", "_weapons2", "_weapons3", "_mags1", "_mags2", "_mags3", "_items1", "_items2", "_items3", "_packs1", "_packs2", "_packs3",
	"_gearvalue", "_classtype", "_wtc", "_code",
	"_properties", "_classes"
];

_unit_type = toLower (_this select 0);
_equip_type = _unit_type;
_uniform_type = _unit_type;

_unitfaction = toLower (faction _unit);
_unitsidestring = tolower (str(side group _unit));

_equip_side = _unitsidestring;
_uniform_side = _unitsidestring;

// ============================================================================================

// A public variable is set on the unit, indicating their type. This is mostly relevant for the F3 respawn component
_unit setVariable ["f_var_assignGear",_unit_type,true];

// This variable simply tracks the progress of the gear assignation process, for other scripts to reference.
_unit setVariable ["f_var_assignGear_done",false,true];

// Prevent BIS Randomisation System
_unit setVariable ["BIS_enableRandomization", false];

// ============================================================================================

//// side & faction handling

// get faction from bgmf classes in description.ext, else use unit's faction
_uniform_faction = 
	if (istext (missionconfigfile >> "bgmf_uniform" >> _unitSidestring)) then 
	{
		gettext (missionconfigfile >> "bgmf_uniform" >> _unitSidestring)
	}
	else {_unitfaction};

_equip_faction = 
	if (istext (missionconfigfile >> "bgmf_equip" >> _unitSidestring)) then 
	{
		gettext (missionconfigfile >> "bgmf_equip" >> _unitSidestring)
	}
	else {_unitfaction};


// optional arguments to override equipment and uniform faction
if(count _this > 2) then
{
	 _equip_faction = 
		 if (toLower (_this select 2) == "def") 
		 then {_equip_faction} 
		 else {toLower (_this select 2)}
};

if(count _this > 3) then
{
	_uniform_faction = toLower (_this select 3)
};


// faction aliases
switch (_uniform_faction) do
{
	default {};
	case ("breakout") : {breakout "main"};
	case ("nato") : {_uniform_faction = "blu_f"};
	case ("csat") : {_uniform_faction = "opf_f"};
	case ("fia") : {_uniform_faction = "blu_g_f"};
	case ("aaf") : {_uniform_faction = "ind_f"};
	case ("civ") : {_uniform_faction = "civ_f"};
	case ("usarmyocp") : {_uniform_faction = "rhs_faction_usarmy_d"};
	case ("usarmyucp") : {_uniform_faction = "rhs_faction_usarmy_wd"};
	case ("rus") : {_uniform_faction = "rhs_faction_msv"};
};

switch (_equip_faction) do
{
	default {};
	case ("breakout") : {breakout "main"};
	case ("nato") : {_equip_faction = "blu_f"};
	case ("csat") : {_equip_faction = "opf_f"};
	case ("fia") : {_equip_faction = "blu_g_f"};
	case ("aaf") : {_equip_faction = "ind_f"};
	case ("civ") : {_equip_faction = "civ_f"};
	case ("usarmyocp") : {_equip_faction = "rhs_faction_usarmy_d"};
	case ("usarmyucp") : {_equip_faction = "rhs_faction_usarmy_wd"};
	case ("rus") : {_equip_faction = "rhs_faction_msv"};
};


// if optional argument is given (or gear is set via bgmf classes in descritopn.ext), unit gets that faction's gear regardless of side
// empty vehicles need this because they init as side CIV
// always include a faction when calling function on a crate. otherwise their faction is "Default"
// atm isnt working with empty vehicles, just empties their inv. treat them like crates
if ( (count _this > 2) || (!(_unit iskindof "man") && (_unitsidestring == "civ" && _equip_faction != "civ_f")) || istext (missionconfigfile >> "bgmf_equip" >> _unitSidestring) ) then
{
	if !(isclass (configfile >> "bg_loadout_define" >> _equip_side >> _equip_faction)) then
	{
		{
			if (isclass (configfile >> "bg_loadout_define" >> _x >> _equip_faction)) exitwith
			{
				_equip_side = _x;
			};
		} foreach ["west", "east", "guer", "civ"];
	};
};

if (count _this > 3 || istext (missionconfigfile >> "bgmf_uniform" >> _uniform_side)) then 
{
	if !(isclass (configfile >> "bg_loadout_define" >> _uniform_side >> _uniform_faction)) then
	{
		{
			if (isclass (configfile >> "bg_loadout_define" >> _x >> _uniform_faction)) exitwith
			{
				_uniform_side = _x;
			};
		} foreach ["west", "east", "guer", "civ"];
	};
};


// side, faction, type class defaulting

_uniform_side_exists = isclass (configfile >> "bg_loadout_define" >> _uniform_side);
_equip_side_exists = isclass (configfile >> "bg_loadout_define" >> _equip_side);
_uniform_faction_exists = isclass (configfile >> "bg_loadout_define" >> _uniform_side>> _uniform_faction);
_equip_faction_exists = isclass (configfile >> "bg_loadout_define" >> _equip_side>> _equip_faction);
_equip_type_exists = isclass (configfile >> "bg_loadout_define" >> _equip_side >> _equip_faction >> _equip_type);
_uniform_type_exists = isclass (configfile >> "bg_loadout_define" >> _uniform_side >> _uniform_faction >> _uniform_type);

if !(_uniform_side_exists) then
{
	_uniform_side = "side";
};
if !(_equip_side_exists) then
{
	_equip_side = "side";
};

if !(_uniform_faction_exists) then
{
	_uniform_faction = configname ((configfile >> "bg_loadout_define" >> _uniform_side) select 0);
};
if !(_equip_faction_exists) then
{
	_equip_faction = configname ((configfile >> "bg_loadout_define" >> _equip_side) select 0);
};

if !(_equip_type_exists) then
{
	_equip_type = configname ((configfile >> "bg_loadout_define" >> _equip_side >> _equip_faction) select 0);
};
if !(_equip_type_exists) then
{
	_uniform_type = configname ((configfile >> "bg_loadout_define" >> _uniform_side >> _uniform_faction) select 0);
};


// ============================================================================================

//// gear vars

// generates vars from description.ext

_gearvalue = "";
_properties = [];
_classes = [];

// for the selected lodaout, collect property paths in one array, class paths in another
// now separated such that:
// uniform, vest, pack, helmet, and facewear are from the uniform config
// everything else is from the equipment config

// !!! if one of the side, faction, or type vars is undefined/nil, configproperties will cause ctd !!!

// collect properties config paths, i.e. everything but weapons
{
	_properties pushback _x;
} foreach configproperties 
	[
	configfile >> "bg_loadout_define" >> _uniform_side >> _uniform_faction >> _uniform_type,
	"!isclass _x && (configname _x) in [""uniform"",""helmet"",""vest"",""pack"",""facewear""]"
	];

{
	_properties pushback _x;
} foreach configproperties 
	[
	configfile >> "bg_loadout_define" >> _equip_side >> _equip_faction >> _equip_type, 
	"!isclass _x && !((configname _x) in [""uniform"",""helmet"",""vest"",""pack"",""facewear""])"
	];
	
// collect class config paths, i.e. weapons

{
	_classes pushback _x;
} foreach configproperties [configfile >> "bg_loadout_define" >> _equip_side >> _equip_faction >> _equip_type, "isclass _x"];

// use the collected property names to define variables of the same name
{
	if (isarray (_x)) then
	{
		_gearValue = str getarray _x;
	};
	if (istext (_x)) then
	{
		_gearValue = str gettext _x;
	};
	_code = format ["_%1 = %2", configname _x, _gearValue];
	call compile _code;
} foreach _properties;


// sort weapon classes
_primary = [];
_handgun = [];
_secondary = [];
{
	switch (getNumber (configFile >> "cfgWeapons" >> gettext (_x >> "wepname") >> "type")) do
	{
		default {diag_log format ["bg_assigngear: class %1 not primary, handgun, or secondary", configname _x];};
		case (1) : {_primary pushback _x};
		case (2) : {_handgun pushback _x};
		case (4) : {_secondary pushback _x};
	};
} foreach _classes;

// if a weapon category is empty, refer to base weapon class
{
	if (str _x == "[]") then
	{
		_wtc = _x;
		_wtc set [0, (configfile >> "bg_loadout_define" >> "weapon")];
	};
} foreach [_primary,_handgun,_secondary];

// ============================================================================================

//// gear commands

//crates and vehicles
if !(_unit iskindof "man") then
{
	//clear crate/vehicle
	clearWeaponCargoGlobal _unit;
	clearMagazineCargoGlobal _unit;
	clearItemCargoGlobal _unit;
	clearBackpackCargoGlobal _unit;
	
	// add weapons
	{
		{
			_unit addweaponcargoglobal _x;
		} foreach _x;
	} foreach [_weapons1, _weapons2, _weapons3];
	
	// add mags
	{
		{
			_unit addmagazinecargoglobal _x;
		} foreach _x;
	} foreach [_mags1, _mags2, _mags3];
	
	// add items
	{
		{
			_unit additemcargoglobal _x;
		} foreach _x;
	} foreach [_items1, _items2, _items3];
	
	// add packs
	{
		{
			_unit addbackpackcargoglobal _x;
		} foreach _x;
	} foreach [_packs1, _packs2, _packs3];
}

//men
else
{
	//randomization needfuls
	//a random weapon from each category (primary, handgun, and launcher) is selected
	//randomization from a mixed pool of primaries, handguns, and launchers is not supported + very low priority
	//bis fnc selectrandom doesnt work on arrays of config paths???
	_primaryfinal = _primary select floor(random (count _primary));
	_secondaryfinal = _secondary select floor(random (count _secondary));
	_handgunfinal = _handgun select floor(random (count _handgun));
	_binosfinal = _binos call bis_fnc_selectrandom;
	
	//clear unit
	removeBackpack _unit;
	removeAllWeapons _unit;
	removeAllItemsWithMagazines _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeHeadgear _unit;
	removegoggles _unit;
	removeVest _unit;

	//add containers
	_unit forceadduniform (_uniform call bis_fnc_selectrandom);
	_unit addheadgear (_helmet call bis_fnc_selectrandom);
	_unit addvest (_vest call bis_fnc_selectrandom);
	_unit addgoggles (_facewear call bis_fnc_selectrandom);
	_unit addbackpack (_pack call bis_fnc_selectrandom);
	clearMagazineCargoGlobal (unitBackpack _unit);
	
	//linkables
	{_unit linkitem _x} foreach [_map, _compass, _watch, _radio, _terminal, (_goggles call bis_fnc_selectrandom)];

	//items in backpack
	{
		(unitBackpack _unit) addItemCargoGlobal _x;
	} foreach _packitems;

	//medical items
	{
		for "_i" from 1 to (_x select 1) do
		{
			_unit additem (_x select 0);
		};
	} foreach _meditems;

	//general items
	{
		for "_i" from 1 to (_x select 1) do
		{
			_unit additem (_x select 0);
		};
	} foreach _items;
	
	//binos
	_unit addweapon _binosfinal;
	
	//default mag + weapon, weapon starts loaded
	{
		_unit addmagazine (gettext (_x >> "defmag"));
		_unit addmagazine (gettext (_x >> "defglmag"));
		_unit addweapon (gettext (_x >> "wepname"));
	} foreach [_primaryfinal, _secondaryfinal, _handgunfinal];
	
	//additional mags
	{
		_unit addmagazines [gettext (_x >> "defmag"),getnumber (_x >> "extradefmags")];
		_unit addmagazines [gettext (_x >> "defglmag"),getnumber (_x >> "extradefglmags")];
		{
			_unit addmagazines _x;
		} foreach getarray (_x >> "addmags");
	} foreach [_primaryfinal, _secondaryfinal, _handgunfinal];
	
	{
		_unit addmagazines _x;
	} foreach _mags;
			
	//mags in backpack
	{
		(unitBackpack _unit) addMagazineCargoGlobal _x;
	} foreach _packmags;
	
	//attachments
	{
		_unit addprimaryweaponitem _x;
	} foreach [gettext (_primaryfinal >> "optic"),gettext (_primaryfinal >> "rail"),gettext (_primaryfinal >> "bipod"),gettext (_primaryfinal >> "muzzle")];
	{
		_unit addsecondaryweaponitem _x;
	} foreach [gettext (_secondaryfinal >> "optic"),gettext (_secondaryfinal >> "rail"),gettext (_secondaryfinal >> "bipod"),gettext (_secondaryfinal >> "muzzle")];
	{
		_unit addhandgunitem _x;
	} foreach [gettext (_handgunfinal >> "optic"),gettext (_handgunfinal >> "rail"),gettext (_handgunfinal >> "bipod"),gettext (_handgunfinal >> "muzzle")];
};

// This variable simply tracks the progress of the gear assignation process, for other scripts to reference.
_unit setVariable ["f_var_assignGear_done",true,true];
