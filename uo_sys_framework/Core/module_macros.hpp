#define UO_FW_ADDTEAM(SIDE,NAME,TYPE)\
if(NAME != "") then {[SIDE,NAME,TYPE] call UO_FW_fnc_AddTeam;};
