class UO_FW_SoftAOLimit
{
    displayName = "Soft AO Limit Settings";
    collapsed = 1;
    class Attributes
    	{
				class UO_FW_SoftAoLimit_TimeOutside
				{
					displayName = "Max time outside of AO";
					tooltip = "The amount of time in seconds a land based unit is allowed to stay outside the AO (-1 = Infinity)";
					control = "Edit";
					typeName = "NUMBER";
					property = "UO_FW_SoftAoLimit_TimeOutside";
					expression = "missionNamespace setVariable ['%s', _value]; %s = _value;";
					validate = "number";
					defaultValue = "30";
				};
				class UO_FW_SoftAoLimit_TimeOutsideAir
				{
					displayName = "Max time outside of AO for aerial units";
					tooltip = "The amount of time in seconds an air based unit is allowed to stay outside the AO (-1 = Infinity)";
					control = "Edit";
					typeName = "NUMBER";
					property = "UO_FW_SoftAoLimit_TimeOutsideAir";
					expression = "missionNamespace setVariable ['%s', _value]; %s = _value;";
					validate = "number";
					defaultValue = "-1";
				};
    };
};
