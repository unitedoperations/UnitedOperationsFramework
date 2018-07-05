private["_markers"];
_markers = _this;
if(!(_markers call UO_FW_fnc_ValidateSoftAOLimits)) exitWith
{
		"Soft AO Limtis failed to Validate" call UO_FW_fnc_DebugMessage;
		false
};

if ((count _markers) > 0) then 
{

	[_markers] spawn 
	{

		_markers = [];

		_allowedOutside = true;

		_vehicle = (vehicle player);
		_pos = getPosATL _vehicle;

		{
			if ((_x select 0) == (side player) || (_x select 0) == ANY) then 
			{
				_markers set [count _markers, (_x select 1)];

				if ([_vehicle, (_x select 1)] call UO_FW_FNC_InArea) then 
				{
					_allowedOutside = false;
				};
			};
		} forEach (_this select 0);

		while {true} do 
		{

			_vehicle = (vehicle player);

			if (!(_vehicle isKindOf "Air")) then 
			{

				_outSide = true;

				{
					if ([_vehicle, _x] call UO_FW_FNC_InArea) exitWith 
					{
						_outSide = false;
					};
				} forEach _markers;

				if (_outside) then 
				{
					if (!(_allowedOutside) && (_vehicle call UO_FW_FNC_Alive)) then 
					{
						_vehicle setPos _pos;
					};
				} else 
				{
					_allowedOutside = false;
					_pos = getPosATL _vehicle;
				};

			} else 
			{
				_allowedOutside = true;
			};
			sleep(0.1);

		};

	};

};