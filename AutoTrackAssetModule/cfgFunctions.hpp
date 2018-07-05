class UO_FW_AutoTrackFunctions
{
	file = "\x\UO_FW\addons\main\AutoTrackAssetModule\cfgFunctions\common";

	class InitAutoTrackAsset
	{
		
		postInit = 1; //1 to call the function upon mission start, after objects are initialized. Passed arguments are ["postInit", didJIP]
	};
};