_Unit = _this select 0;

_Player = false;
if (isPlayer _Unit) then {_Player = true;};

//Determine if this AI should even execute new code
_UseAI = _Unit getVariable ["UO_FW_AI_NOAI",false];
if (isNil ("_UseAI")) then
{
	_UseAI = false;
};
_BunkerAI = _Unit getVariable ["UO_FW_AI_BUNKER",false];
if (isNil ("_BunkerAI")) then
{
	_BunkerAI = false;
};
_Passarray = [_UseAI,_Player,_BunkerAI];
_Passarray
