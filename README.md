# BadArma
Collection of scripts and mission templates for use with in-house badgame Arma 3 modset.

##Player faction parameter
allow admin to choose friendly unit's loadout/gear faction from params,
mission creator can still force specific units to have specific
loadouts. admin can also choose 'no change'. current factions are rhs us
army, us marines, rhs russians, best korea.

-parameter sets all players' gear faction incl jip
-uses f3 processed params / f3 params compatible
-parameter overrides units' init gear call. *this setvariable
["bg_gearset", true]* in unit init to force unit's init gear call.
-sets loadout based on unit classname, currently supports most vanilla
nato units
-does not handle ai, they still need an init gear call. setopforfaction
script Soon(TM)