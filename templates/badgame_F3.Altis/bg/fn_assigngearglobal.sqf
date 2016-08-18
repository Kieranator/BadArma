//based on:
// F3 - Assign Gear Script - AI
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// SERVER CHECK
// Make sure that the script is only run on the server
// disabled, the purpose of this script has changed from when it was f3's
// i want to run it from initplayerlocal, reduce server load, w/e

//if !(isServer) exitWith {};

// ====================================================================================

// DECLARE PRIVATE VARIABLES

private ["_units","_unit","_faction","_known","_unitFactions","_unitClasses","_unitside", "_unitfaction", "_code", "_geararray"];

// ====================================================================================

// SETUP CUSTOM VARIABLES

// The factions of all units which should be affected

//need to populate this from missionconfig?
_unitfactions = ["","blu_f", "rhs_faction_usarmy_wd", "rhs_faction_usarmy_d", "blu_g_f", "ind_f", "opf_f", "rhs_faction_msv", "LIB_RKKA", "LIB_WEHRMACHT"];

// The default gear type picked when no corresponding entry is found in the _unitClasses array
// Set _defaultclass to "" to let these units keep their default gear
_defaultclass = "base";

// The unit classes and their corresponding F3 Assign Gear Component type
_unitClasses = [

	["_officer_"	,	"co"	],
	["_colonel_"	,	"co"	],
	["_sl_"			,	"dc"	],
	["_tl_"			,	"ftl"	],
	["_tl"			,	"ftl"	],
	["_lite_"		,	"car"	],
	["_ar_"			,	"ar"	],
	["_ar"			,	"ar"	],
	["_aar_"		,	"aar"	],
	["_a_"			,	"aar"	],
	["_lat_"		,	"rat"	],
	["_medic_"		,	"m"		],
	["_medic"		,	"m"		],
	["_gl_"			,	"gren"	],
	["_exp_"		,	"eng"	],
	["_engineer_"	,	"engm"	],
	["_mg_"			,	"mmgg"	],
	["_amg_"		,	"mmgag"	],
	["_at_"			,	"matg"	],
	["_at"			,	"matg"	],
	["_aat_"		,	"matag"	],
	["_marksman"    ,   "dm"    ],
	["_aa_"			,	"msamg"	],
	["_aaa_"		,	"msamag"],
	["_uav_"		,	"uav"	],
	["_m_"			,	"dm"	],
	["_sniper_"		,	"sn"	],
	["_spotter_"	,	"sp"	],
	["_diver_"		,	"div"	],
	["_repair_"		,	"vd"	],
	["_crew_"		,	"vd"	],
	["_helipilot_"	,	"pp"	],
	["_helicrew_"	,	"pc"	],
	["_pilot_"		,	"pp"	]

];

// ====================================================================================

// Interpret parameters
if (typename _this == "OBJECT" || typename _this == "ARRAY") then
{
	if (typename _this == "OBJECT") then 
	{
		_units = [_this];
	}
	else
	{
		_units = _this;
	};
}
else
{
	_units = if (count _this == 0) then [{waitUntil {scriptDone f_script_setLocalVars};f_var_men},{_this}];
};

// LOOP THROUGH ALL UNITS AND ASSIGN GEAR
{
	//sleep 0.1;
	_unit = _x;
	
	_unitfaction = faction _unit;
	call compile format ["if !(isnil ""bg_param_%1faction"") then {_unitfaction = _unitfactions select bg_param_%1faction};", side _x];
	
	// Check if the unit was already touched by the F3 Assign Gear Component
	if (!(_unit getvariable ["f_var_assignGear_done", false]) && (_unit isKindOf "Man")) then 
	{
	
	
		_known = false;
		{
			_known = [toLower (_x select 0),toLower (typeOf _unit)] call BIS_fnc_inString;

			// If the unit's classname corresponds to a class in the assignment array, set its gear accordingly
			if (_known) exitWith {
			
				_geararray = [_x select 1, _unit];
				if (_unitfaction != "") then {_geararray append [_unitfaction,_unitfaction]};
				
				[_geararray] remoteExecCall ["bg_fnc_assigngear", _unit];
			};
		} forEach _unitClasses;

		// If the class is not in the _unitClasses array
		if (!_known) then {
			if (_defaultclass != "") then {
				
				_geararray = [_defaultclass, _unit];
				if (_unitfaction != "") then {_geararray append [_unitfaction,_unitfaction]};
			
				[_geararray] remoteExecCall ["bg_fnc_assigngear", _unit];
			};
		};
		
	};
} foreach _units;
