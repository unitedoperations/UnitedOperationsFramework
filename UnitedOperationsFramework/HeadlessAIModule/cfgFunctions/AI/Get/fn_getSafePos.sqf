/*	Author: rübe (RUBE_randomCirclePositions)
 * 	Modfied by: suits
 * 	Description: Find safe spawn positions.
 *	Arguments:
 * 		ARRAY 	- Start Position
 *		NUMBER 	- Number of Positions Needed
 *		ARRAY 	- Min and Max Distance
 *		NUMBER	- Gradient Allowed
 *		BOOL	- On Road
 *		BOOL	- On Water
 *		OBJECT	- Ignore Object
 * 	Return Value:
 *		ARRAY 	- Safe Positions
 * 	Examples:
 *		[[_cPos],_numPos,[_range],_gradientPos,_roadPos,_waterPos,_ignoreObjectPos] call UO_AI_fnc_getSafePos;
 *		[[0,0,0],10,[0,20],0.7,false,false,objNull] call UO_AI_fnc_getSafePos;
 *		[position player,3,[0,50],0.7,false,false,objNull] call UO_AI_fnc_getSafePos;
 */
 private["_cPos","_numPos","_range","_rangeMin","_rangeMax","_gradientPos","_roadPos","_water","_ignoreObject","_minSpacingPos","_returnPos","_waterPos","_i","_maxIter","_randomPos","_randomDir","_ramdomDist","_tempPos","_checkPos","_nearRoads","_road","_isWater"];
	params [["_cPos",[0,0,0],[[]],[3]],["_numPos",0,[0]],["_range",[],[[]],[2]],["_gradientPos",0.7,[0]],["_roadPos",false,[false]],["_water",false,[false]],["_ignoreObject",objNull,[objNull]]];
	_range params [["_rangeMin",0,[0]],["_rangeMax",10,[0]]];
	_minSpacingPos		= ((_rangeMax / _numPos) / 2);
	_returnPos			= [];
	_waterPos 			= 0;
	_i 					= 0;
	_maxIter 			= 1000 + (_minSpacingPos * _numPos);
	if (_water) then {_waterPos = 2;};
	while {(count _returnPos) < _numPos && _i < _maxIter} do {
		_randomPos		= [];
		_randomDir 		= random 360;
		_ramdomDist 	= _rangeMin + (random (_rangeMax - _rangeMin));
		_tempPos 		= [_cPos, _ramdomDist, _randomDir] call BIS_fnc_relPos;
		if (!((count (_tempPos isFlatEmpty [0.5,0,_gradientPos,_minSpacingPos, _waterPos, false, _ignoreObject])) == 0)) then {
			_randomPos 	= _tempPos;
			_checkPos 	= true;
			if (_minSpacingPos > 0) then {
				{
					if ((_randomPos distance _x) < _minSpacingPos) then {
						_checkPos = false;
					};
				} forEach _returnPos;
			};			
			if(_roadPos) then {
				_nearRoads 		= _randomPos nearRoads 30;
				if(count _nearRoads > 0) then {
					_road 		= _nearRoads select (floor random (count _nearRoads));
					_randomPos 	= getPos _road;
				} else {
					_checkPos 	= false;
				};
			};			
			if !(_water) then { 
				_isWater = surfaceIsWater _randomPos;
				if (_isWater) then {
					_checkPos = false;
				};
			}; 
			if (_checkPos) then	{
				_returnPos pushBack _randomPos;
			};
		};
		if (_i > _maxIter) exitWith {};
		_i = _i + 1;
	};
	_returnPos