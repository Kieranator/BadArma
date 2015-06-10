# BadArma
Collection of scripts and mission templates for use with in-house badgame Arma 3 modset.

##Player faction parameter
Originally made setplayerfaction for my outsider threat mission, at the moment I'm put off of f3's gear shit so I'm messing with this until I see the light and get with the program.

Allow admin to choose friendly units' loadout/gear faction from parameters, mission creator can still force specific units to have specific loadouts. Admin can also choose 'no change'. Current factions are RHS US Army, USMC, RHS Russians, Best Korea.

- Parameter sets all players' gear faction, including jip  
- Uses f3 processed params / f3 params compatible  
- Parameter overrides units' init gear call. *this setvariable ["bg_gearset", true]* in unit init to force unit's init gear call.   
- Sets loadout based on unit classname, currently supports most vanilla nato units  
- Does not handle ai, they still need an init gear call. setopforfaction script Soon(TM)  
