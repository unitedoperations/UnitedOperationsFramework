class OF_AntiNDModuleFunctions
{
	file = "\OF_OlsenFrameworkModuls\AISkillModule\AISkillModuleFunctions";
	class fn_LoadAISkill
	{
		preInit = 0; //(formerly known as "forced") 1 to call the function upon mission start, before objects are initialized. Passed arguments are ["preInit"]
		postInit = 0; //1 to call the function upon mission start, after objects are initialized. Passed arguments are ["postInit", didJIP]
		preStart = 0; //1 to call the function upon game start, before title screen, but after all addons are loaded (config.cpp only)
		ext = ".sqf"; //Set file type, can be ".sqf" or ".fsm" (meaning scripted FSM). Default is ".sqf".
		headerType = -1; //Set function header type: -1 - no header; 0 - default header; 1 - system header.
		recompile = 1; //1 to recompile the function upon mission start (config.cpp only; functions in description.ext are compiled upon mission start already)}; // [] call myTag_fnc_myFunction3
	};

};
