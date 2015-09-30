class CfgPatches 
{
	class bgmf_loadout
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {};
	};
};

#include "bg_loadout_define.h"

class CfgFunctions
{
	class bg
	{
		class common
		{
			class assigngear
			{
				file = "\bgmf_loadout\assigngear.sqf";
			};
			class assigngearglobal
			{
				file = "\bgmf_loadout\assigngearglobal.sqf";
			};
		};
	};
};

/*
class CfgFunctions {
	class BG
	{	
		class common 
		{
			class revive_player {file = "\bg_toolbox\fnc_revive_player.sqf";};
			class shut_up {file = "\bg_toolbox\fnc_shutthefuckup.sqf";};
		};
	};
};





class CfgFunctions
{
 class BG
 {
  class common
  {
   class AddUniform
   {
    file = "\bg_units\uniform.sqf";
   };
   class AddAssignedItem
   {
    file = "\bg_units\item.sqf";
   };
   class InitPMC
   {
    file = "\bg_units\scripts\InitPMCUnit.sqf";
   };
  };
 };
};
*/
/*class Extended_PreInit_EventHandlers
{
 class AGM_Core
 {
  init = "call compile preprocessFileLineNumbers '\AGM_Core\preInit.sqf'";
  serverInit = "call compile preprocessFileLineNumbers '\AGM_Core\scripts\readParameters.sqf'";
  disableModuload = 1;
 };
};
class Extended_PostInit_EventHandlers
{
 class AGM_Core
 {
  init = "call compile preprocessFileLineNumbers '\AGM_Core\init.sqf'";
  disableModuload = 1;
 };
};*/
