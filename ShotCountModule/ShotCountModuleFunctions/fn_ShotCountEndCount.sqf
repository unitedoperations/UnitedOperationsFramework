_munitionsBLU = aCount_west_ExpendedAmmunition;
_munitionsRED = aCount_east_ExpendedAmmunition;
_munitionsRES = aCount_resistance_ExpendedAmmunition;

["aCount_event_scoreScreen", [_munitionsBLU,_munitionsRED,_munitionsRES]] call CBA_fnc_globalEvent;
