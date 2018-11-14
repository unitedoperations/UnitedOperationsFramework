/*	Description: Get a number of random positions with in a circle.
 * 	Arguments:
 * 		ARRAY	- Position
 * 		NUMBER	- Minimum range out from original position.
 * 		NUMBER	- Maximum range out from original position. (radius) 
 * 		NUMBER	- Amount of positions to return.
 * 	Return Value:
 * 		ARRAY 	- POSITIONS
 *	Author
 *		suits & PiZZADOX
 */
params [["_pos",[0,0,0],[[]]],["_rangeMin",0,[0]],["_rangeMax",100,[0]],["_posCount",5,[0]],["_water",false,[false]],["_return",[],[[]]],"_i"];
	private _max = _posCount * 5;
	if(_rangeMax < (_posCount * 5)) then {
		_rangeMax = (_posCount * 5);
	};
	for [{_i=0},{(_i < _posCount && _i < _max)},{_i = _i + 1}] do {  
		_angle = random 360; 
		_dist = _rangeMin + (random (_rangeMax - _rangeMin)); 
		_newPos = [_pos, _dist, _angle] call BIS_fnc_relPos; 
		if(!_water && surfaceIsWater _newPos) then {
			_i = _i - 1; 
			_newPos = [];
		};
		if(!(_newPos isEqualTo [])) then {
			_return pushBack _newPos;
		};
	}; 
	_return