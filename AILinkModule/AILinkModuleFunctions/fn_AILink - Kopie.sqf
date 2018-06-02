

_logic = param [0,objNull,[objNull]];
// Argument 1 is list of affected units (affected by value selected in the 'class Units' argument))
_units = param [1,[],[[]]];
// True when the module was activated, false when it's deactivated (i.e., synced triggers are no longer active)
_activated = param [2,true,[true]];


// Module specific behavior. Function can extract arguments from logic and use them.
if (_activated) then
{
    ["AI skill", "Allows the mission maker to change the subskills of ai", "Sacher"] call FNC_RegisterModule;
    _typeArgument = (_logic getVariable ["TypeArgument",0.8]);
    _distanceArgument = (_logic getVariable ["DistanceArgument",0.8]);
    _aimingAccuracyArgument = (_logic getVariable ["AimingAccuracyArgument",0.8]);
    _aimingShakeArgument = (_logic getVariable ["AimingShakeArgument",0.8]);
    _aimingSpeedArgument = (_logic getVariable ["AimingSpeedArgument",0.8]);
    _commandingArgument = (_logic getVariable ["CommandingArgument",0.8]);
    _courageArgument = (_logic getVariable ["CourageArgument",0.8]);
    _reloadSpeedArgument = (_logic getVariable ["ReloadSpeedArgument",0.8]);
    _spotDistance = (_logic getVariable ["SpotDistance",0.8]);
    _spotTime = (_logic getVariable ["SpotTime",0.8]);


     _units = synchronizedObjects logic:

    #define SETAISKILL(UNIT) \
    UNIT setSkill ["aimingspeed" , _aimingSpeedArgument];\
    UNIT setSkill ["spotdistance" , _spotDistance];\
    UNIT setSkill ["aimingaccuracy" , _aimingAccuracyArgument];\
    UNIT setSkill ["aimingshake" , _aimingShakeArgument];\
    UNIT setSkill ["spottime" , _spotTime];\
    UNIT setSkill ["reloadspeed" , _aimingSpeedArgument];\
    UNIT setSkill ["commanding" , _aimingSpeedArgument];\
    UNIT setSkill ["general" , _aimingSpeedArgument];\
    UNIT setSkill ["courage" , _aimingSpeedArgument];

    ""
    {
        switch(_type)
        {
            case 1:
            {
                if(_distanceArgument == 0) then
                {
                    SETAISKILL(_x);
                }
                else
                {
                    {
                        SETAISKILL(_x);
                    }nearestObjects [getPos _x,["Man"],_distanceArgument];
                };

            };
            case 2:
            {
                if(_distanceArgument == 0) then
                {

                    {
                        SETAISKILL(_x);
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
                            SETAISKILL(_x);
                        }forEach (units _group);
                    }forEach _foundGroups;
                }
            };
            case 3:
            {
                _unit = _x;
                {
                    if(side _x == side _unit) then
                    {
                        SETAISKILL(_x);
                    };
                }forEach allUnits;
            };
        };
    }forEach _units;

};
