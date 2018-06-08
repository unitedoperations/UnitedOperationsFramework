switch (_this select 0) do
{
	case west:
	{

		_found = aCount_west_ExpendedAmmunition find (_this select 1);
		if(_found < 0) then
		{
			aCount_west_ExpendedAmmunition pushBack (_this select 1) ;
			aCount_west_ExpendedAmmunition pushBack 1;
		}
		else
		{
			aCount_west_ExpendedAmmunition set [_found + 1,(aCount_west_ExpendedAmmunition select _found + 1) + 1 ];
		}

	};

	case east:
	{

		_found = aCount_east_ExpendedAmmunition find (_this select 1);
		if(_found < 0) then
		{

			aCount_east_ExpendedAmmunition pushBack  (_this select 1);
			aCount_east_ExpendedAmmunition pushBack 1;
		}
		else
		{
			aCount_east_ExpendedAmmunition set [_found + 1,(aCount_east_ExpendedAmmunition select _found + 1) + 1 ];
		}
	};
	case resistance:
	{

		_found = aCount_resistance_ExpendedAmmunition find (_this select 1);
		if(_found < 0) then
		{

			aCount_resistance_ExpendedAmmunition pushBack  (_this select 1);
			aCount_resistance_ExpendedAmmunition pushBack 1;
		}
		else
		{
			aCount_resistance_ExpendedAmmunition set [_found + 1,(aCount_resistance_ExpendedAmmunition select _found + 1) + 1 ];
		}
	};
};
