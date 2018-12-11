/*	Description: Toggles AI Driver camera
 *	Arguments:
 * 		Bool - off or on
 *	Return Value:
 * 		ARRAY 	
 *	Author
 *		PiZZADOX
 */

#include "\x\UO_FW\addons\main\script_macros.hpp"


params ["_arg"];

if (_arg) then {
    UO_FW_driverCam = "camera" camCreate [0,0,0];
    UO_FW_driverCam cameraEffect ["INTERNAL", "BACK","UO_FW_rtt"];
    UO_FW_driverCam camSetFov 0.9;
    UO_FW_driverCam camCommit 0;

    UO_FW_pipNvEnabled = false;
    
    _veh = vehicle player;
    _mempoint = getText ( configfile >> "CfgVehicles" >> (typeOf _veh) >> "memoryPointDriverOptics" );
    UO_FW_driverCam attachTo [_veh,[0,0,0], _mempoint];
    
    with uiNamespace do {
        "UO_FW_pipDriver" cutRsc ["RscTitleDisplayEmpty", "PLAIN"];
        UO_FW_pipDisplay = uiNamespace getVariable "RscTitleDisplayEmpty";
        UO_FW_driverPipDisplay = UO_FW_pipDisplay ctrlCreate ["RscPicture", -1];
        UO_FW_driverPipDisplay ctrlSetPosition [0.1,1,0.75,0.5];
        UO_FW_driverPipDisplay ctrlCommit 0;
        UO_FW_driverPipDisplay ctrlSetText "#(argb,512,512,1)r2t(UO_FW_rtt,1.0)";
    };

} else {
    if (!isNil "UO_FW_driverCam" && {!isNull UO_FW_driverCam}) then {
        with uiNamespace do {
            UO_FW_pipDisplay closeDisplay 2;
        };
        detach UO_FW_driverCam;
        UO_FW_driverCam cameraEffect ["terminate", "back", "UO_FW_rtt"];
        camDestroy UO_FW_driverCam;
    };
};