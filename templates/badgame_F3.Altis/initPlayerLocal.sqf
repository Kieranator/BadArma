// F3 - F3 Folk ARPS Group IDs
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

f_script_setGroupIDs = [] execVM "f\setGroupID\f_setGroupIDs.sqf";

// ====================================================================================


if (didJip) then
{
	[player] execVM "f\JIP\f_JIP_addReinforcementOptionsAction.sqf";
};