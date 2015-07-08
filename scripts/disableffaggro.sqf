// allows players to kill friendly ai without aggro'ing them
// mp only, server only

if (isserver) then
{
	{
		if (isplayer _x) then
		{
			_x addeventhandler
			[
				"HandleRating",
				{
					if (rating (_this select 0) + (_this select 1) < -1488) then
					{
						//systemchat format ["%1 + %2 = %3", rating (_this select 0), (_this select 1),(rating (_this select 0) + (_this select 1))];
						
						(_this select 0) setunitrank (rank (_this select 0));
						(_this select 0) addrating -(_this select 1);
						
						switch (rank (_this select 0)) do
						{
							default {(_this select 0) addrating - 1488};
							case "CORPORAL" : {(_this select 0) addrating (-500 - 1488)};
							case "SERGEANT" : {(_this select 0) addrating (-1500 - 1488)};
							case "LIEUTENANT" : {(_this select 0) addrating (-2500 - 1488)};
							case "CAPTAIN" : {(_this select 0) addrating (-3500 - 1488)};
							case "MAJOR" : {(_this select 0) addrating (-5000 - 1488)};
							case "COLONEL" : {(_this select 0) addrating (-7500 - 1488)};
						};
						//systemchat format ["%1 rating = %2", (_this select 0), (rating (_this select 0) + (_this select 1))];
					};
				}
			]
		};
	} foreach playableunits; 
	//} foreach playableunits; // switchableunits for sp
};