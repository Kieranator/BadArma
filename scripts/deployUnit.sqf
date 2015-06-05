/* 
[<man, group, or array of men or groups>, <position, group, man, vehicle, marker(string), or trigger>] execvm "deployUnit.sqf"

sends <unit(s)> to <destination>, handling different destination types:

position - moves unit to random position within 10m of given destination position
man - moves unit to position 1-10m away, excluding 180 degree arc in front of destination man
group - same as man for destination group leader
vehicle - populates destination vehicle in priority: driver, gunner, commander, cargo
          overflow is randomly placed [radius = largest veh dimension + 1m] away from vehicle
          random placement excludes front 180 degrees relative to vehicle
marker - same as position for marker center
trigger - places unit randomly within [radius = smallest trigger dimension] of trigger center

mainly intended for deploying players from briefing to mission area / insertion points, or slightly more elegant tping i guess

use proper destinations, i do not currently intend to handle fetching guaranteed safe positions

multiple units handled recursively


to do: 


accomodate player namespace variable for pre-assigned / player chosen vehicle positions
	look into replacing this pile with stuff from f3 premount or scrap it in favor of moveinany
	starting to push outside scope, other people have already done this shit better

copilot position doesnt have a vehicleposition id, currently fills after commander & before cargo ('any')	

handle non-icon markers / zones

put units on shore nearby in ship overflow?

handle _unit is vehicle?

findsafepos(0.105796 msca) or findemptypos (0.0046875 ms)
	
handle _dest is inside building?

if _dest is marker, checking with 'in' is case sensitive

formationposition requires formleader to deploy first

*/

private ["_unit","_dest", "_vehpos", "_i", "_vehpostype", "_allmarkers", "_safepos", "_ranpos"];

_unit = _this select 0;
_dest = _this select 1;


// recursive handling of _unit is group? :
if (typename _unit == "GROUP") exitwith
{
	{
		[_x, _dest] execvm "deployUnit.sqf";
	}foreach units _unit;
	systemchat "deployunit - _unit is group";
};
if (typename _unit == "ARRAY") exitwith
{
	{
		[_x, _dest] execvm "deployUnit.sqf";
	}foreach _unit;
	systemchat "deployunit - _unit is array";
};



_vehpos = 0;
_i = 0;
_vehpostype = ["driver","gunner","commander","cargo"];


_ranpos = {

	private ["_pos", "_max", "_min", "_dir", "_arc", "_random"];
	
	switch (count _this) do {
	    case 1 : {_center = _this select 0; _max = 0; _min = 0; _dir = 0; _arc = 0;};
	    case 2 : {_center = _this select 0; _max = _this select 1; _min = 0; _dir = 0; _arc = 0;};
	    case 3 : {_center = _this select 0; _max = _this select 1; _min = _this select 2; _dir = 0; _arc = 0;};
	    case 4 : {_center = _this select 0; _max = _this select 1; _min = _this select 2; _dir = _this select 3; _arc = 180;};
	    case 5 : {_center = _this select 0; _max = _this select 1; _min = _this select 2; _dir = _this select 3; _arc = _this select 4;};
	    default {systemchat "ranpos - missing/too many params";};
	};
	
	_random = 0.5 * _arc + random (360 - _arc) + _dir;
   
	[
	(_pos select 0) + (_max + _min - random (_max + 1)) * (sin (_random)),
	(_pos select 1) + (_max + _min - random (_max + 1)) * (cos (_random))
	]

};
/*
//vehicle handling
if (_unit iskindof "landvehicle" || _unit iskindof "air") then
{
	//paste and modify man handling switch
};
*/
//man handling
switch (typename _dest) do
{
	case "ARRAY" : 
	{
		if ({typename _x == "SCALAR"}count _dest == 3 && count _dest == 3) then //verify array is at least similar to a position
		{
			moveout _unit;
			//_safepos = [_dest, 0, 10, 1, 1, 20, 0] call BIS_fnc_findSafePos;
			//_safepos = _dest findemptyposition [0,40];
			_unit setpos ([_dest, 10] call _ranpos);
		};
	};
	case "GROUP" : 
	{
		moveout _unit;
		_unit setpos ([getpos (leader _dest), 10, 0, getdir (leader _dest)] call _ranpos); //formationpos not usable unless group merge
	}; 
	case "OBJECT" : 
	{
		//systemchat "deployunit - case object";
		if (_dest iskindof "man") then
		{
			moveout _unit;
			_unit setpos ([getpos _dest, 10, 1, getdir _dest] call _ranpos);
		};
		
		if (_dest iskindof "emptydetector") then
		{
			moveout _unit;
			if (((triggerarea _dest) select 0) < ((triggerarea _dest) select 1)) then
			{
				_i = (triggerarea _dest) select 0
			}
			else
			{
				_i = (triggerarea _dest) select 1
			};
			_unit setpos ([getpos _dest, _i] call _ranpos);
		};
		
		if (_dest iskindof "landvehicle" || _dest iskindof "air" || _dest iskindof "ship") then 
		{
			//systemchat "deployunit - iskindof landvehicle / air";
			while {_vehpos == 0 && _i < (count _vehpostype)} do 
			{
				_vehpos = _dest emptypositions (_vehpostype select _i);
				if (_vehpos > 0) then
				{
					switch (_i) do
					{
						case 0 : {moveout _unit; _unit moveindriver _dest; systemchat format ["deployunit - %1 driver", name _unit];};
						case 1 : {moveout _unit; _unit moveingunner _dest; systemchat format ["deployunit - %1 gunner", name _unit];};
						case 2 : {moveout _unit; _unit moveincommander _dest; format ["deployunit - %1 command", name _unit];};
						default {moveout _unit; _unit moveinany _dest; systemchat format ["deployunit - %1 any", name _unit];};
					};
				}
				else
				{
					//systemchat format ["deployunit - emptypos not found as %1",(_vehpostype select _i)];
					_i = _i + 1;
				};
			};
			
			if (_vehpos == 0 && vehicle _unit != _dest) then
			{
				systemchat "deployunit - vehicle full";
				moveout _unit;
				_unit setpos (
					[
						getpos _dest, 
						sizeof (typeof _dest) * 0.5 + 3, 
						sizeof (typeof _dest) * 0.5 + 2, //keeps units from spawning in tailrotors
						getdir _dest, //dont put units in front of vehicles
					] call _ranpos);
			};
			//systemchat format["deployunit - while end : vehpos %1, _i %2", _vehpos, _i];		
		};
	};
	case "STRING" : 
	{
		if (_dest in allmapmarkers) then
		{
			moveout _unit;
                        _unit setpos ([getmarkerpos _dest, 10] call _ranpos);
		}
		else
		{
			systemchat "deployunit - bad destination input - string";
		};
	};
	default {systemchat "deployunit - bad destination input"};
};
