class TeamTypeWest: Title
{
	attributeLoad="missionnamespace setvariable ['teamtype_BLUFOR',_value]; (_this controlsGroupCtrl 103) lbsetcursel _value;";
	attributeSave="missionnamespace getvariable ['teamtype_BLUFOR',0]";
	
	class Controls : Controls
	{
		class Title: Title {};
		class Value: ctrlToolbox
		{
			idc = 103;
			style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
			rows = 1;
            columns = 3;
            strings[] = {"Player","AI","Both"};
			values[] = {0,1,2};
			onToolboxSelChanged="missionnamespace setvariable ['teamtype_BLUFOR',(_this select 1)];";
		};
	};
};

class TeamTypeEast: TeamTypeWest
{
	attributeLoad="missionnamespace setvariable ['teamtype_OPFOR',_value]; (_this controlsGroupCtrl 104) lbsetcursel _value;";
	attributeSave="missionnamespace getvariable ['teamtype_OPFOR',0]";
	
	class Controls : Controls
	{
		class Title: Title {};
		class Value: ctrlToolbox
		{
			idc = 104;
			style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
			rows = 1;
            columns = 3;
            strings[] = {"Player","AI","Both"};
			values[] = {0,1,2};
			onToolboxSelChanged="missionnamespace setvariable ['teamtype_OPFOR',_this select 1];";
		};
	};
};

class TeamTypeIndfor: TeamTypeWest
{
	attributeLoad="missionnamespace setvariable ['teamtype_INDFOR',_value]; (_this controlsGroupCtrl 105) lbsetcursel _value;";
	attributeSave="missionnamespace getvariable ['teamtype_INDFOR',0]";
	
	class Controls : Controls
	{
		class Title: Title {};
		class Value: ctrlToolbox
		{
			idc = 105;
			style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
			rows = 1;
            columns = 3;
            strings[] = {"Player","AI","Both"};
			values[] = {0,1,2};
			onToolboxSelChanged="missionnamespace setvariable ['teamtype_INDFOR',_this select 1];";
		};
	};
};

class TeamTypeCiv: TeamTypeWest
{
	attributeLoad="missionnamespace setvariable ['teamtype_CIV',_value]; (_this controlsGroupCtrl 106) lbsetcursel _value;";
	attributeSave="missionnamespace getvariable ['teamtype_CIV',0]";
	
	class Controls : Controls
	{
		class Title: Title {};
		class Value: ctrlToolbox
		{
			idc = 106;
			style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "5 * (pixelH * pixelGrid * 0.50)";
			rows = 1;
            columns = 3;
            strings[] = {"Player","AI","Both"};
			values[] = {0,1,2};
			onToolboxSelChanged="missionnamespace setvariable ['teamtype_CIV',_this select 1];";
		};
	};
};

