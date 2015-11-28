// parameters:
// [ <unit type (string)>, <unit (man or crate or vehicle)>, <equipment/weapon faction (string)(optional)>, <uniform faction (string)(optional)>]
// ["r",player,"opf_f","aaf"] call bg_fnc_assigngear will give player CSAT rifleman weapons/items and an AAF rifleman uniform.

// ["ftl",this] call bg_fnc_assigngear in unit's init will autodetect unit faction and give them FTL gear.
// if a faction class is not defined for the autodetected faction, script will make no changes.
// if they are uncommented, settings in the bgmf classes in description.ext will override faction detection based on unit side.
// optional parameters for faction will override autodetection and bgmf class settings.

// if using autodetection and unit's faction is not defined, script will make no changes.
// if using bgmf class or optional parameter given faction not defined, none of the items in that category are applied.
// e.g.:

// ["r",this,"undefined_faction", "undefined_faction"] call bg_fnc_assigngear
// will not change the unit's gear in any way.

// ["r",this,"DEFINED_faction", "undefined_faction"] call bg_fnc_assigngear
// will only affect equipment category items, leaving uniform, vest, backpack, helmet, facewear untouched.


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


_faction_aliases = 
[
	["nato","blu_f"],
	["csat","opf_f"],
	["fia","blu_g_f"],
	["aaf","ind_f"],
	["civ","civ_f"],
	["usarmyocp","rhs_faction_usarmy_d"],
	["usarmyucp","rhs_faction_usarmy_wd"],
	["rus","rhs_faction_msv"],
	["redarmy","LIB_RKKA"],
	["nazi","LIB_WEHRMACHT"]
];

_unit_type = toLower (_this select 0);
_equip_type = _unit_type;
_uniform_type = _unit_type;

_unitfaction = toLower (faction _unit);
_unitsidestring = tolower (str(side _unit));

_equip_side = _unitsidestring;
_uniform_side = _unitsidestring;

_unit_is_man = _unit iskindof "man";


// ============================================================================================

// A public variable is set on the unit, indicating their type. This is mostly relevant for the F3 respawn component
_unit setVariable ["f_var_assignGear",_unit_type,true];

// This variable simply tracks the progress of the gear assignation process, for other scripts to reference.
_unit setVariable ["f_var_assignGear_done",false,true];

// Prevent BIS Randomisation System
_unit setVariable ["BIS_enableRandomization", false];


// ============================================================================================

// side & faction handling

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

_i = 0;
_eq_fac_found = false;
_un_fac_found = false;

while {_i < count _faction_aliases && (!_eq_fac_found || !_un_fac_found)} do
{
	_current = _faction_aliases select _i;

	if (_equip_faction == _current select 0) then {_equip_faction = _current select 1; _eq_fac_found = true;};
	if (_uniform_faction == _current select 0) then {_uniform_faction = _current select 1; _un_fac_found = true;};

	_i = _i + 1;
};


// faction and type class defaulting
// faction_exists vars also used to determine which gearing commands to use/skip

_uniform_faction_exists = isclass (missionconfigfile >> "bg_loadout_define" >> "define_factions">> _uniform_faction);
_equip_faction_exists = isclass (missionconfigfile >> "bg_loadout_define" >> "define_factions">> _equip_faction);
_equip_type_exists = isclass (missionconfigfile >> "bg_loadout_define" >> "define_factions" >> _equip_faction >> _equip_type);
_uniform_type_exists = isclass (missionconfigfile >> "bg_loadout_define" >> "define_factions" >> _uniform_faction >> _uniform_type);

if !(_uniform_faction_exists) then
{
	_uniform_faction = "faction";
};
if !(_equip_faction_exists) then
{
	_equip_faction = "faction";
};

// if factions undefined, exit script
if (!_uniform_faction_exists && !_equip_faction_exists) then {breakout "main";};


if (!_equip_type_exists && _unit_is_man) then
{
	_equip_type = configname ((missionconfigfile >> "bg_loadout_define" >> "define_factions" >> _equip_faction) select 0);
};
if (!_equip_type_exists && !_unit_is_man) then
{
	_equip_type =  "cargotype";
};

if !(_uniform_type_exists) then
{
	_uniform_type = configname ((missionconfigfile >> "bg_loadout_define" >> "define_factions" >> _uniform_faction) select 0);
};


// ============================================================================================

// gear vars

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
// uniform
if _uniform_faction_exists then
{
	{
		_properties pushback _x;
	} foreach configproperties 
		[
		missionconfigfile >> "bg_loadout_define" >> "define_factions" >> _uniform_faction >> _uniform_type,
		"!isclass _x && (configname _x) in [""uniform"",""helmet"",""vest"",""pack"",""facewear""]"
		];
};
	
// equipment
if _equip_faction_exists then
{
	{
		_properties pushback _x;
	} foreach configproperties 
		[
		missionconfigfile >> "bg_loadout_define" >> "define_factions" >> _equip_faction >> _equip_type, 
		"!isclass _x && !((configname _x) in [""uniform"",""helmet"",""vest"",""pack"",""facewear""])"
		];

	// collect class config paths, i.e. weapons

	{
		_classes pushback _x;
	} foreach configproperties [missionconfigfile >> "bg_loadout_define" >> "define_factions" >> _equip_faction >> _equip_type, "isclass _x"];
};
	
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

if _equip_faction_exists then
{
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

	// if a weapon category is empty, refer to base class
	{
		if (str _x == "[]") then
		{
			_wtc = _x;
			_wtc set [0, (missionconfigfile >> "bg_loadout_define" >> "weapon")];
		};
	} foreach [_primary,_handgun,_secondary];
};


// ============================================================================================


// gear commands

//crates and vehicles
if !_unit_is_man then
{
	if !_equip_faction_exists then {breakout "main";};
	
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
	// for use if equip faction not defined
	_unit_magcargo = magazinecargo _unit;
	_unit_itemcargo = itemcargo _unit;
	_unit_pack = backpack _unit; // when adding a pack the old one gets dropped instead of deleted
	
	if _equip_faction_exists then
	{
		//randomization needfuls
		//a random weapon from each category (primary, handgun, and launcher) is selected
		//randomization from a mixed pool of primaries, handguns, and launchers is not supported + very low priority
		
		//bis fnc selectrandom doesnt work on arrays of config paths???
		_primaryfinal = _primary select floor(random (count _primary));
		_secondaryfinal = _secondary select floor(random (count _secondary));
		_handgunfinal = _handgun select floor(random (count _handgun));
		
		_binosfinal = _binos call bis_fnc_selectrandom;
		
		// clear unit
		
		if !_uniform_faction_exists then
		{
			removebackpack _unit;
			_unit forceadduniform (uniform _unit);
			_unit addheadgear (headgear _unit);
			_unit addvest (vest _unit);
			_unit addbackpack _unit_pack;
		};		
		removeAllWeapons _unit;
		removeAllAssignedItems _unit;
		removegoggles _unit;
	};
	
	if _uniform_faction_exists then
	{
		removebackpack _unit;
		//add containers
		_unit forceadduniform (_uniform call bis_fnc_selectrandom);
		_unit addheadgear (_helmet call bis_fnc_selectrandom);
		_unit addvest (_vest call bis_fnc_selectrandom);
		_unit addbackpack (_pack call bis_fnc_selectrandom);
	};
	
	
	// if equip faction undefined, re-add old inventory
	if (!_equip_faction_exists && _uniform_faction_exists) then
	{
		//general items
		{
			_unit additem _x;
		} foreach _unit_itemcargo;
		//general items
		{
			_unit addmagazine _x;
		} foreach _unit_magcargo;
	};
	
	
	if _equip_faction_exists then
	{
		//goggles
		_unit addgoggles (_facewear call bis_fnc_selectrandom);
		
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
};

// This variable simply tracks the progress of the gear assignation process, for other scripts to reference.
_unit setVariable ["f_var_assignGear_done",true,true];
