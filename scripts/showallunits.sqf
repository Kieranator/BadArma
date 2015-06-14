unitarray = [];
{if (side _x in [east, west, resistance, civilian]) then {unitarray pushback _x};} foreach allunits;



_opac = 1;
	
{
	_color = [0,0,1, _opac];
	if (side _x == east) then {_color = [1,0,0, _opac]};
	if (side _x == resistance) then {_color = [0,1,0, _opac]};
	if (side _x == civilian) then {_color = [1,0,1, _opac]};

	["draw" + (str _x),"onEachFrame",{
		
		drawIcon3d["", (_this select 1), (_this select 0) modelToWorldVisual((_this select 0) selectionPosition "Spine3"), .3, .3, 0, "", 0, .03, "TahomaB"]; //(name (_this select 0))
		
	},[_x, _color]] call BIS_fnc_addStackedEventHandler;
	
	_x addEventHandler ["Killed",
	{
		[("draw" + (str (_this select 0))),"onEachFrame"] call BIS_fnc_removeStackedEventHandler;
	}];
} foreach unitarray;


// to remove, execute:  {   ["draw" + (str _x),"onEachFrame"] call BIS_fnc_removeStackedEventHandler;    } foreach unitarray;


/*	[("draw" + (str(o2))),"onEachFrame",{

			if (((floor(player distance o2)) < 51)) then {
				drawIcon3d["", [0,1,0,(-2*log(floor(player distance o2)/50))], o2 modelToWorldVisual(o2 selectionPosition "Spine3"), .3, .3, 0, (str(floor(player distance o2))+"M"), 0, .03, "TahomaB"];
			};

	},[]] call BIS_fnc_addStackedEventHandler;
	
	o2 addEventHandler ["Killed",{["drawe2","onEachFrame"] call BIS_fnc_removeStackedEventHandler;}];
};*/