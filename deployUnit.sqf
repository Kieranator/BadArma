/* 

[<man, group, or array of men or groups>, <position, group, man, vehicle, marker, or trigger>] execvm "deployUnit.sqf"

to do: 
	
put units on shore nearby in ship overflow / spawn rubber boats?

handle _unit is vehicle?

add optional direction and arc parameter to ranpos function, primarily to avoid spawning people in front of vehicles

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

	private ["_center", "_max", "_min", "_random"];
	_pos = _this select 0;
	_max = _this select 1;
	_random = random 360;
	if (count _this > 2) then
	{
		_min = _this select 2;
	}
	else
	{
		_min = 0;
	};
	
	[(_pos select 0) + (_max + _min - random (_max + 1)) * (sin (_random)),
	(_pos select 1) + (_max + _min - random (_max + 1)) * (cos (_random))]

};

//vehicle handling
if (_unit iskindof "landvehicle" || _unit iskindof "air") then
{
	//paste and modify man handling switch
};

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
		_unit setpos ([getpos (leader _dest), 10] call _ranpos); //formationpos not usable unless group merge
	}; 
	case "OBJECT" : 
	{
		//systemchat "deployunit - case object";
		if (_dest iskindof "man") then
		{
			moveout _unit;
			_unit setpos ([getpos _dest, 10, 1] call _ranpos);
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
						sizeof (typeof _dest) * 0.5 + 2 //keeps units from spawning in tailrotors
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
			_unit setpos getmarkerpos _dest; //need safe pos
		}
		else
		{
			systemchat "deployunit - bad destination input - string";
		};
	};
	default {systemchat "deployunit - bad destination input"};
};
