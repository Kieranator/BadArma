#define BG_REJOIN_DISTANCE 40
#define BG_TELEPORT_DISTANCE 200
// F3 - JIP Reinforcement Options
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// DECLARE VARIABLES AND FUNCTIONS

private ["_unit","_textAction","_grp","_joinDistance","_loadout"];

// ====================================================================================

// ALLOW PLAYER TO SELECT GROUP
// Using a dialog we allow the player to select the group s/he is going to [re-]join.

["JIP",["Select the group to join."]] call BIS_fnc_showNotification;

f_var_JIP_state = 0;
createDialog "GrpPicker";
waitUntil {f_var_JIP_state == 1};
_grp = (player getVariable "f_var_JIP_grp");

// ====================================================================================

// ALLOW PLAYER TO SELECT LOADOUT
// Using a dialog we allow the player to select the loadout s/he requires.

f_var_JIP_state = 2;
if (f_var_JIP_GearMenu) then {
	["JIP",["Select your gear kit."]] call BIS_fnc_showNotification;

	createDialog "KitPicker";
	waitUntil {f_var_JIP_state == 3};

	_loadout = (player getVariable "f_var_JIP_loadout");
	[_loadout,player] call f_fnc_assignGear;
};

// ====================================================================================

// REMOVE REINFORCEMENT OPTIONS ACTION TO PLAYER ACTION MENU
// We remove the action to the player's action menu.
// NB This is on the assumption that the player has made positive selections and not
// cancelled the menu.

player removeAction F3_JIP_reinforcementOptionsAction;
F3_JIP_reinforcementOptionsAction = nil;

// ====================================================================================
BG_JIP_Teleport =
{
    private ["_next", "_destinationGroup"];
    diag_log str("BG_JIP_Teleport setting teleportActivated true and teleportCompleted false");
    player setVariable ["BG_JIP_TelportActivated", true];
    player setVariable ["BG_JIP_TelportCompleted", false];

    // TODO: Check to see if Leader of Group is in a vehicle.  If yes check to see if there are open cargo spaces in vehicle.
    // leader(_destinationGroup) in a vehicle?
    // if yes check for open cargo spaces
    // if open cargo spaces then automatically teleport him inside the vehicle. Then check for successful move since possible Teleport collisions with another JIP is possible.
    // if not open cargo spaces alert the JIP user that your player is in a vehicle with no Cargo spaces please wait. Disable the 10 min timer.
    // While waiting for leader(_destinationGroup) to have open cargo spaces, check for leader jumping out of the vehicle.


    hint "Click Map Location to Teleport";
    2 cutText ["Click the Map within " + str( BG_TELEPORT_DISTANCE ) + " meters of the group leader","PLAIN",2];

    if (isNil "BG_JIP_DeploymentPeriod") then { diag_log str("WARNING: BG_JIP_DeploymentPeriod is NULL. Report to BG Developement Team: ViperMaul"); };

    if (BG_JIP_DeploymentPeriod) then {
        onMapSingleClick "[_pos] call BG_JIP_Validate_Click;";

        while {!(player getVariable "BG_JIP_TelportCompleted")} Do {

            sleep 0.125;

        };

        // Clean up time
        diag_log str("BG_JIP_Teleport Clean Up Start");
        //player removeAction(_this select 2);
        player setVariable ["BG_JIP_TelportActivated", false];
        player setVariable ["BG_JIP_TelportCompleted", true];
        BG_JIP_DeploymentPeriod = false;
        onMapSingleClick '';
        diag_log str("BG_JIP_Teleport Clean Up Finished");
    };
};


//Verify Click is Valid, ie no water, no air,
BG_JIP_Validate_Click =
{
    private ["_pos", "_destinationGroup", "_isWater", "_isGroundLevel"];
    _pos = _this select 0;
    _destinationGroup = player getVariable "BG_JIP_Group";
    _isGroundLevel = true;
    _isWater = false;
    teleportCompleted = true;
    hint Format["Processing Position: %1",_pos];

    If (isnil ("_pos")) exitWith { false };

    _isWater = surfaceIsWater _pos;
    MyWater =_isWater;

    if ( !_isWater && _isGroundLevel) then
    {

        hint Format["Position of Group Leader: %1",Position (leader _destinationGroup) ];

        _BG_mapClick = [_pos select 0, _pos select 1, 0];
        if ((_BG_mapClick distance (getPos(leader _destinationGroup))) < 200) then
        {
            hint "Teleporting...";
            player setPosATL _pos;
        }
        else
        {
            teleportCompleted = onMapSingleClick "[_pos] call BG_JIP_Validate_Click";
            hint format ["Distance to Leader: %1 Not Close enough. Try Again.",(_BG_mapClick distance (getPos(leader _destinationGroup)))];
        };

    }
    else
    {
        teleportCompleted = onMapSingleClick "[_pos] call BG_JIP_Validate_Click;";
        hint "Invalid Location. Try again";
    };

    if (teleportCompleted) then
    {

        // Clean up time
        diag_log str("BG_JIP_Validate_Click Clean Up Start");
        BG_JIP_DeploymentPeriod = false;
        player setVariable ["BG_JIP_TelportCompleted", true];
        player setVariable ["BG_JIP_TelportActivated", false];
       // player removeAction BG_JIP_addAction;
       // player removeAction BG_JIP_disableAction;
        onMapSingleClick '';
        diag_log str("BG_JIP_Validate_Click Clean Up Finished");
    };

    true
};
// IMPLEMENT CHOICES
// Using the choices made by the player we implement the desired loadout and set the
// target group for her/him to join.
// If the player is already in the group, he simply remains there

_joinDistance = 10;

if (_grp != group player) then {
	[player] joinSilent grpNull;

	if (!isNull _grp) then {
		[_grp,_joinDistance] execVM "f\JIP\f_JIP_nearTargetGroupCheck.sqf";
		player setVariable ["BG_JIP_Group",_grp];
		[] spawn BG_JIP_Teleport;
		["JIP",[format ["Selection successful. Get within %2m of %1 to link up.",name leader _grp,_joinDistance]]] call BIS_fnc_showNotification;
	};
};


