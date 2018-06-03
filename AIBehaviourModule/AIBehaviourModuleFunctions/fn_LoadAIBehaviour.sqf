_logic = param [0,objNull,[objNull]];
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
_units = param [1,[],[[]]];
// True when the module was activated, false when it's deactivated (i.e., synced triggers are no longer active)
_activated = param [2,true,[true]];


// Module specific behavior. Function can extract arguments from logic and use them.
if (_activated) then
{
    ["AI Behaviour", "Handles various functions for AI combat behaviour.", "Sacher"] call UO_FNC_RegisterModule;
    _typeArgument = (_logic getVariable ["TypeArgument",1]);
    _distanceArgument = (_logic getVariable ["DistanceArgument",0.8]);
    _minMoraleArgument = (_logic getVariable ["MinMoraleArgument",0.8]);
    _minStanceArgument = (_logic getVariable ["MinStanceArgument",0.8]);
    _maxMoraleArgument = (_logic getVariable ["MaxMoraleArgument",0.8]);
    _maxStanceArgument = (_logic getVariable ["MaxStanceArgument",0.8]);

    _array = [[_minMoraleArgument,_minMoraleArgument],[_maxMoraleArgument,_maxMoraleArgument]];

     _units = synchronizedObjects logic:

    {
        switch(_type) do
        {
            case 1:
            {
                if(_distanceArgument == 0) then
                {
                    [_x,_array] call UO_fnc_AICover;
                }
                else
                {
                    {
                        [_x,_array] call UO_fnc_AICover;
                    }forEach  nearestObjects [getPos _x,["Man"],_distanceArgument];
                };

            };
            case 2:
            {
                if(_distanceArgument == 0) then
                {

                    {
                        [_x,_array] call UO_fnc_AICover;
                    }
                    forEach (units (group _x));
                };
                else
                {
                    _foundGroups = [];
                    {
                        _index = _foundGroups pushBackUnique (group _x);
                    }nearestObjects [getPos _x,["Man"],_distanceArgument];
                    {
                        _group = _x;
                        {
                            [_x,_array] call UO_fnc_AICover;
                        }forEach (units _group);
                    }forEach _foundGroups;
                };
            };
            case 3:
            {
                _unit = _x;
                {
                    if(side _x == side _unit) then
                    {
                        [_x,_array] call UO_fnc_AICover;
                    };
                }forEach allUnits;
            };
        };
    }forEach _units;

};
