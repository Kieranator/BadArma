/*
[
	<center position (required)>,
	<max distance from center (required)>,
	<min distance from center (default 0)>,
	<center azimuth of excluded arc (no exlcuded arc unless set)>,
	<excluded arc size in degrees (default 180)>
] execvm "ranpos.sqf";

returns surface position
*/
private ["_pos", "_max", "_min", "_dir", "_arc", "_random"];

switch (count _this) do {
    case 2 : {_pos = _this select 0; _max = _this select 1; _min = 0; _dir = 0; _arc = 0;};
    case 3 : {_pos = _this select 0; _max = _this select 1; _min = _this select 2; _dir = 0; _arc = 0;};
    case 4 : {_pos = _this select 0; _max = _this select 1; _min = _this select 2; _dir = _this select 3; _arc = 180;};
    case 5 : {_pos = _this select 0; _max = _this select 1; _min = _this select 2; _dir = _this select 3; _arc = _this select 4;};
    default {systemchat "ranpos - missing/too many params";};
};

if (_max < _min) then { _max = _min};
_random = 0.5 * _arc + random (360 - _arc) + _dir;

[
	(_pos select 0) + (_min + random (_max - _min)) * (sin (_random)),
	(_pos select 1) + (_min + random (_max - _min)) * (cos (_random))
];