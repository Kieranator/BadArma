private ["_side","_leaderside","_typeofUnit","_unit","_typeBackpack",
"_weapon1","_weapon2","_weapon3","_weapon4","_mags1","_mags2","_mags3","_mags4"];

_typeofUnit = toLower (_this select 0);
_unit = _this select 1;
_typeBackpack = _this select 2;
_side = side _unit;
_leaderside = side (leader group _unit);

_unit setVariable ["BIS_enableRandomization", false]; // Comment out to enable bohemia headgear randomization
_unit setVariable ["f_var_assignGear",_typeofUnit,true];

if ((_unit isKindOF "CAManBase")&&(_side != _leaderside)) then
{
	_side = _leaderside;
};

if (isServer && !(_unit getvariable ["bg_gearset", false])) then
{
	if (_side == WEST) then
	{
		#include "playergear.sqf"
	}
	else
	{
		#include "demoISIS.sqf"
	};
}
else
{
	// Check for JIP from standard slots.
	if (local _unit) then
	{
		if (isNil "bg_isJIP") then
		{
			bg_isJIP = SLX_XEH_MACHINE select 1;
		};
		
		if (isNil "bg_isJIP") then
		{
			diag_log format ["BG WARNING bg_isJIP = %1",bg_isJIP]
		};
		
		diag_log format["bg Checking JIP %1 : %2",_unit, time];
		
		//If not JIP then skip all this.
		if (bg_isJIP || time>10) then
		{
			if (_side == WEST) then
			{
				#include "demoRHS.sqf"
			}
			else
			{
				#include "demoISIS.sqf"
			};
		};
	};
};
