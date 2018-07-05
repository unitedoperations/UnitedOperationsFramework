_logic = param [0,objNull,[objNull]];

// True when the module was activated, false when it's deactivated (i.e., synced triggers are no longer active)
_activated = param [1,true,[true]];


// Module specific behavior. Function can extract arguments from logic and use them.
if (_activated) then
{
        

        _sides = [west,east,resistance,civilian];
        _selectedSide = _sides select ((_logic getVariable ["UO_FW_SetupTimer_SideSelect",1]));
        _time = _logic getVariable ["UO_FW_SetupTimer_Time",0];
        _marker = _logic getVariable ["UO_FW_SetupTimer_Marker",""];
        _deleteMarker = _logic getVariable ["UO_FW_SetupTimer_DeleteMarker",true];
		
		[_selectedSide,_time,_marker,_deleteMarker] call UO_FW_fnc_ExecuteSetupTimer;
  

};
