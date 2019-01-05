#include "\x\UO_FW\addons\main\HeadlessAIModule\module_macros.hpp"
UO_FW_EXEC_CHECK(SERVERHC);

//[_logic,_area,_selectedSide,_time] passed array
params ["","_area","_selectedSide","_waittime"];
private _isValid = true;

//if (!isMultiplayer) then {
//	_isValid = false;
//	"Setup Timer: Singleplayer session detected, this module will function only in multiplayer." call UO_FW_FNC_DebugMessage;
//};

if (count _area < 4) then {
	_isValid = false;
		UO_FW_DEBUG("","Setup timer module:<br></br>Warning area not generated!");
};

if (_selectedSide isEqualto "") then {
	_isValid = false;
	UO_FW_DEBUG("","Setup timer module:<br></br>Invalid side for setup timer!");
};

if (_waittime < 10) then {
	_isValid = false;
	UO_FW_DEBUG("","Setup timer module:<br></br>Too short of a Setup Timer wait time!");
};

if (!UO_FW_SERVER_SETUPMODULE_ALLOWED) then {
	_isValid = false;
	private _msg = format ["Setup timer has been disabled by the Server"];
  UO_FW_DEBUG("",_msg);
};

_isValid
