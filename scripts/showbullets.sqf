player addEventHandler ["Fired",
{
	_opac = 1;
	_color = [1,0,0, _opac];
	_bulletno = random 100;
	
	["draw" + (str _bulletno),"onEachFrame",{
	
		drawIcon3d["", (_this select 1), getposvisual (_this select 0), .15, .15, 0, str(floor(player distance (_this select 0))), 0, .03, "TahomaB"];
	
	},[(_this select 6), _color]] call BIS_fnc_addStackedEventHandler;

	[_bulletno] spawn {
		sleep 10;
		[("draw" + (str (_this select 0))),"onEachFrame"] call BIS_fnc_removeStackedEventHandler;
	};
}];

// to remove (lazy), execute: player removealleventhanders "fired";