
private ["_unit"];
_unit = (_this select 1);

// Depending on locality the script decides if it should run
if !(local _unit) exitWith {};

//init vars
private
[
	"_faction","_typeofUnit", "_unitsidestring", "_sideexists", "_factionexists", "_typeexists",
	"_uniform", "_helmet", "_vest", "_pack", "_facewear", "_goggles", "_map", "_terminal", "_radio", "_compass", "_watch",
	"_meditems", "_items", "_packitems", "_packmags",
	"_primary", "_primaryfinal","_primaryattach", "_secondary", "_secondaryfinal","_secondaryattach", "_handgun", "_handgunfinal","_handgunattach", "_binos", "_binosfinal",
	"_weapons1", "_weapons2", "_weapons3", "_mags1", "_mags2", "_mags3", "_items1", "_items2", "_items3", "_packs1", "_packs2", "_packs3",
	"_gearvalue", "_gearname", "_classtype", "_wtc"
];

_typeofUnit = toLower (_this select 0);
_faction = toLower (faction _unit);
_unitSidestring = tolower (str(side _unit));

diag_log "___________________________________________";
diag_log format["Gearing ""%1"": %2, %3", _unit, _unitsidestring, _faction];


// A public variable is set on the unit, indicating their type. This is mostly relevant for the F3 respawn component
_unit setVariable ["f_var_assignGear",_typeofUnit,true];

// This variable simply tracks the progress of the gear assignation process, for other scripts to reference.
_unit setVariable ["f_var_assignGear_done",false,true];

// Prevent BIS Randomisation System
_unit setVariable ["BIS_enableRandomization", false];


// optional third argument to set faction
if(count _this > 2) then
{
	_faction = toLower (_this select 2);
	
	// faction aliases because
	switch (_faction) do
	{
		default {};
		case ("nato") : {_faction = "blu_f"};
		case ("csat") : {_faction = "opf_f"};
		case ("fia") : {_faction = "blu_g_f"};
		case ("aaf") : {_faction = "ind_f"};
		case ("civ") : {_faction = "civ_f"};
		case ("usarmyocp") : {_faction = "rhs_faction_usarmy_d"};
		case ("usarmyucp") : {_faction = "rhs_faction_usarmy_wd"};
		case ("rus") : {_faction = "rhs_faction_msv"};
	};
};
// if third argument is given, unit gets that faction's gear regardless of side
// empty vehicles also need this because they init as side CIV regardless of faction
// always include a faction when calling function on a crate, vanilla faction is "Default"
if ( (count _this > 2) || (!(_unit iskindof "man") && (_unitsidestring == "civ" && _faction != "civ_f")) ) then
{
	if !(isclass (missionconfigfile >> "bg_loadout_define" >> _unitsidestring >> _faction)) then
	{
		{
			if (isclass (missionconfigfile >> "bg_loadout_define" >> _x >> _faction)) exitwith
			{
				_unitsidestring = _x;
			};
		} foreach ["west", "east", "guer", "civ"];
	};
};


//defaulting
_sideexists = isclass (missionconfigfile >> "bg_loadout_define" >> _unitSidestring);
_factionexists = isclass (missionconfigfile >> "bg_loadout_define" >> _unitSidestring >> _faction);
_typeexists = isclass (missionconfigfile >> "bg_loadout_define" >> _unitSidestring >> _faction >> _typeofunit);

diag_log format ["%1: %2 >> %3 >> %4 requested", _unit, _unitsidestring, _faction, _typeofunit];

if !(_sideexists) then
{
	_unitsidestring = "side";
};
if !(_factionexists) then
{
	_faction = configname ((missionconfigfile >> "bg_loadout_define" >> _unitsidestring) select 0);
};
if !(_typeexists) then
{
	_typeofunit = configname ((missionconfigfile >> "bg_loadout_define" >> _unitsidestring >> _faction) select 0);
};

diag_log format ["%1: %2 >> %3 >> %4 final", _unit, _unitsidestring, _faction, _typeofunit];


//vars

// only generate vars from unit's type class
_classtype = "type";
if !(_unit iskindof "man") then
{
	_classtype = "cargotype";
};

// generates vars from description.ext
_gearvalue = "";
_gearname = "";
for "_x" from 0 to (count (missionconfigfile >> "bg_loadout_define" >> "side" >> "faction" >> _classtype) - 1) do
{
	_gearname = configname ((missionconfigfile >> "bg_loadout_define" >> "side" >> "faction" >> _classtype) select _x);
	
	if (isarray ((missionconfigfile >> "bg_loadout_define" >> "side" >> "faction" >> _classtype) select _x)) then
	{
		_gearValue = str (getarray (missionconfigfile >> "bg_loadout_define" >> _unitsidestring >> _faction >> _typeofunit >> _gearname));
	}
	else
	{
		_gearValue = str (gettext (missionconfigfile >> "bg_loadout_define" >> _unitsidestring >> _faction >> _typeofunit >> _gearname));
	};
	
	_code = format ["_%1 = %2", _gearName, _gearValue];
	//diag_log format ["type: %1 : _code: %2 ", _unit, _code];
	call compile _code;
};


//commands

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
	
	diag_log format ["crate/veh inventory: %1", _weapons1 + _weapons2 + _weapons3 +_mags1 + _mags2 + _mags3 + _items1 + _items2 + _items3 + _packs1 + _packs2 + _packs3 - ["",0]];
}

//men
else
{
	//few randomization needfuls
	_primaryfinal = _primary call bis_fnc_selectrandom;
	_secondaryfinal = _secondary call bis_fnc_selectrandom;
	_handgunfinal = _handgun call bis_fnc_selectrandom;
	_binosfinal = _binos call bis_fnc_selectrandom;
	
	diag_log format ["weapons: <%1>, <%2>, <%3>, <%4>",	(_primaryfinal select 0), (_secondaryfinal select 0),(_handgunfinal select 0), _binosfinal];
	
	//attachments
	// -attach properties override attachments set in weapon property
	// to override to no attachments, define -attach property as {{""}}
	// property must be {{"none"}} for weapon property attachments to apply
	// attachment element in weapon property is optional
	{
		if (str(_x) == "[[""none""]]" && count([_primaryfinal, _secondaryfinal, _handgunfinal] select _foreachindex) > 2) then
		{
			//_x = +([_primaryfinal, _secondaryfinal, _handgunfinal] select _foreachindex select 2);
			//[_primaryattach, _secondaryattach, _handgunattach] set [_foreachindex, +([_primaryfinal, _secondaryfinal, _handgunfinal] select _foreachindex select 2)];
			//neither of those  work but this does??
			_wtc = _x;
			{
				(_wtc) set [_foreachindex, (_x)];
			} foreach (([_primaryfinal, _secondaryfinal, _handgunfinal] select _foreachindex) select 2);
		};
	} foreach [_primaryattach, _secondaryattach, _handgunattach];
	
	//diag_log format ["Pattach %1, Sattach %2, Hattach %3",_primaryattach, _secondaryattach, _handgunattach];
	
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

	//mags in backpack
	{
		(unitBackpack _unit) addMagazineCargoGlobal _x;
	} foreach _packmags;

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

	//mags
	{
		{
			_unit addmagazines _x;
		} foreach _x;
	} foreach [(_primaryfinal select 1),(_secondaryfinal select 1),(_handgunfinal select 1)];
	
	//weapons
	{
		_unit addweapon _x;
	} foreach [(_primaryfinal select 0),(_secondaryfinal select 0),(_handgunfinal select 0), (_binosfinal)];
	
	//attachments
	{
		_unit addprimaryweaponitem _x;
	} foreach (_primaryattach call bis_fnc_selectrandom);
	{
		_unit addsecondaryweaponitem _x;
	} foreach (_secondaryattach call bis_fnc_selectrandom);
	{
		_unit addhandgunitem _x;
	} foreach (_handgunattach call bis_fnc_selectrandom);
	diag_log format ["attachments: %1", primaryweaponitems _unit + secondaryweaponitems _unit + handgunitems _unit - [""]]
};
diag_log "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^";

// This variable simply tracks the progress of the gear assignation process, for other scripts to reference.
_unit setVariable ["f_var_assignGear_done",true,true];
