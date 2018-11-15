/*	Description: Para drops units with in specified gather range, saves backpacks and reloads them on landing.
 * 	Arguments:
 * 		STRING 	- Start Marker Name
 *		STRING 	- Drop Marker Name
 *		NUMBER 	- Drop Height
 *		NUMBER 	- Direction
 *		NUMBER 	- Gather Units for Para Radius
 *		NUMBER 	- Max Column Length
 *		NUMBER 	- Spread Forwards
 *		NUMBER 	- Spread Sideways
 *		BOOL	- Allow multiple Para Drops
 *		BOOL	- Disable Para Drops
 * 	Return Value:
 *		BOOL 	- True
 *	Example:
 *		["start_marker","drop_marker",height,direction,radius,length,spread_forwards,spread_sideways,allow_multi,allow_para] call asor_fnc_paraDrop;
 *		["para_start","para_drop",2000,-1,25,100,25,25,true,true] call asor_fnc_paraDrop;
 */
if(!isServer) exitWith {[_this,'UO_AI_fnc_paraDrop',false] call BIS_fnc_MP;};
	private["_paraStart","_paraDrop","_dropHeight","_direction","_startRadius","_maxLength","_spreadForwards","_spreadSideways","_dropPos","_startPos","_units","_unitsPerColumn","_columns","_totalWidth","_nextColumn","_nextRow","_currentRow","_currentColumn","_clients","_thisunitpos","_aiPara"];
	params [["_paraStart","para_start",[""]],["_paraDrop","para_drop",[""]],["_dropHeight",2000,[0]],["_direction",-1,[0]],["_startRadius",25,[0]],["_maxLength",100,[0]],["_spreadForwards",25,[0]],["_spreadSideways",25,[0]],["_aiPara",false,[false]],["_multiPara",true,[true]],["_allowPara",true,[true]]];
	if (_allowPara || ASOR_ParaDrop) then {ASOR_ParaDrop = true; publicVariable 'ASOR_ParaDrop'} else {ASOR_ParaDrop = false; publicVariable 'ASOR_ParaDrop'};
	if (ASOR_ParaDrop) then {
		sleep 5;
		_direction			= if (_direction == -1) then {random 360};
		if ( isNil 'ASORPara_Location' ) then {
			_dropPos = getMarkerPos _paraDrop; 
		} else {
			_dropPos	= ASORPara_Location;
		};
		_dropPos 			set [2, _dropHeight];
		_startPos			= getMarkerPos _paraStart;
		_allunits			= _startPos nearEntities [["Man"], _startRadius];
		_units				= [];
		if (_aiPara) then {
			{	
				_units pushBack _x;
			} forEach _allunits; 
		} else {
			{	
				if (isPlayer _x) then {
					_units pushBack _x;
				};
			} forEach _allunits; 
		};
		
		_unitsPerColumn = ceil(_maxLength / _spreadForwards);
		_columns 		= ceil((count _units) / _unitsPerColumn);
		_totalWidth 	= _columns * _spreadSideways;
		_startPos 		= ([[-floor( _columns*0.5*_spreadSideways), 0, 0], _direction] call BIS_fnc_rotateVector2D) vectorAdd _dropPos;
		_nextColumn 	= [[_spreadSideways, 0, 0], _direction] call BIS_fnc_rotateVector2D;
		_nextRow 		= [[0, _spreadForwards, 0], _direction] call BIS_fnc_rotateVector2D;
		_currentRow 	= 0;
		_currentColumn 	= 0;
		_clients = [];
		{
			_clients = _clients - [owner _x];
			_clients = _clients + [owner _x];
		} forEach _units; 
		[{2 cutText ["", "BLACK OUT", 5];},"BIS_fnc_spawn",_clients] call BIS_fnc_MP;
		sleep 5;
		{
			_thisunitpos = _startPos vectorAdd (_nextColumn vectorMultiply _currentColumn) vectorAdd (_nextRow vectorMultiply _currentRow);
			removeBackpackGlobal _x;
			_x addBackpackGlobal "B_Parachute";
			_x setDir _direction;
			_x setPosATL _thisunitpos;
			_currentRow = _currentRow + 1;
			if(_currentRow > _unitsPerColumn) then {
				_currentRow = 0;
				_currentColumn = _currentColumn + 1;
			};
		} forEach _units;
		sleep 1;
		[{2 cutText ["", "BLACK IN", 5];},"BIS_fnc_spawn",_clients] call BIS_fnc_MP;
		_multiPara = ASOR_MultiPara;
		if (!_multiPara) then {
			ASOR_ParaDrop = false;
			publicVariable 'ASOR_ParaDrop';
		};
	};
	true