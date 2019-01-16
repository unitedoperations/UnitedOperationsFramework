private ["_Unit", "_nearestCity", "_locationPos", "_nearestVillage", "_locationPos2", "_nearestHill", "_locationPos4", "_nearestLocal", "_locationPos3"];
params ["_Unit","_VariableCheck"];

//Check if the leader changed formation 10 seconds ago already. If so, exit the script
if (_VariableCheck) exitWith {};

//Grab the group of the unit
private _group = group _Unit;

//Grab the nearest "City" from the unit
_nearestCity = nearestLocation [getPosASL _Unit, "nameCity"];

//Lets grab the location position
_locationPos = locationPosition _nearestCity;

//If the unit is less than 500 meters from the location exit with the following code
if ((_locationPos distance _Unit) < 500) exitWith {

	//Check if the unit is in a vehicle or not
	if ((vehicle _Unit) != _Unit) then {
		_group setFormation "COLUMN";
	} else {
		_group setFormation "STAG COLUMN";
	};

	//Set the units variable so they dont try changing formations too frequently.
	_UO_FW_AI_CHANGEDFORMATION = true;
	_UO_FW_AI_CHANGEDFORMATION

};

//The rest of the commands follow the same logic. Commenting where necessary.
_nearestVillage = nearestLocation [getPosASL _Unit, "NameVillage"];
_locationPos2 = locationPosition _nearestVillage;

if ((_locationPos2 distance _Unit) < 500) exitWith {
	if ((vehicle _Unit) != _Unit) then {
		_group setFormation "COLUMN";
	} else {
		_group setFormation "STAG COLUMN";
	};

		_UO_FW_AI_CHANGEDFORMATION = true;
		_UO_FW_AI_CHANGEDFORMATION

};


_nearestHill = nearestLocation [getPosASL _Unit, "Hill"];
_locationPos4 = locationPosition _nearestHill;

if ((_locationPos4 distance _Unit) < 500) exitWith {
	if ((vehicle _Unit) != _Unit) then {
		_group setFormation "LINE";
	} else {
		_group setFormation "LINE";
	};

	_UO_FW_AI_CHANGEDFORMATION = true;
	_UO_FW_AI_CHANGEDFORMATION

};


_nearestLocal = nearestLocation [getPosASL _Unit, "NameLocal"];
_locationPos3 = locationPosition _nearestLocal;

if ((_locationPos3 distance _Unit) < 300) exitWith {
	if ((vehicle _Unit) != _Unit) then {
		_group setFormation "COLUMN";
	} else {
		_group setFormation "COLUMN";
	};

	_UO_FW_AI_CHANGEDFORMATION = true;
	_UO_FW_AI_CHANGEDFORMATION
};


//Execute this code only when all the above were NOT true. Return to wedge formation
_group setFormation "WEDGE";

_UO_FW_AI_CHANGEDFORMATION = true;

_UO_FW_AI_CHANGEDFORMATION
