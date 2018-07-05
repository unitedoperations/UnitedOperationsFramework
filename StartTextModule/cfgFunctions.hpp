class UO_FW_StartTextFunctions
{
	file = "\x\UO_FW\addons\main\StartTextModule\cfgFunctions\common";

	class InitStartText
	{
		
		postInit = 1; //1 to call the function upon mission start, after objects are initialized. Passed arguments are ["postInit", didJIP]
	};
	class ValidateStartText
	{};
	class ExecuteStartText
	{};

};