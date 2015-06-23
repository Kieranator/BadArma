enableSaving [false, false];
enableSentences false;

{
	(_x) disableai "TARGET";
	(_x) disableai "AUTOTARGET";
	(_x) disableai "MOVE";
	(_x) disableai "ANIM";
	(_x) disableai "FSM";
} foreach allunits;