

private ["_unit"];

_unit = _this select 0;

if (_unit getVariable ["FW_Tracked", false]) then
{

    if (time < disconnect_control_time * 60 && (side _unit) in disconnect_control_sides) then
    {

        deleteVehicle _unit;

    };

};
