private ["_unit","_type"];

_unit = _this select 0; //Unit to be a medic
_type = _this select 1;	//2 Doctor, 1 Medic, 0 Normal

if (local _unit) then {
    _unit setVariable ["ace_medical_medicClass",_type,true];
};
