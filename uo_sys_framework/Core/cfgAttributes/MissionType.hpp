class MissionType: Toolbox
{
	attributeLoad="missionnamespace setvariable ['mission_type',_value]; (_this controlsGroupCtrl 100) lbsetcursel _value;";
	attributeSave="missionnamespace getvariable ['mission_type',0];";
	h="8 * (pixelH * pixelGrid * 0.50)";
	class Controls: Controls
	{
		class Title: Title {};
		class Value: ctrlToolbox
		{
			idc=100;
			style="0x02 + 0x30 + 0x800";
			h="8 * (pixelH * pixelGrid * 0.50)";
			x="48 * (pixelW * pixelGrid * 0.50)";
			w="82 * (pixelW * pixelGrid * 0.50)";
			rows=1;
			columns=5;
			strings[]=
			{
				"x\UO_FW\addons\main\Core\Resources\Attributes\missiontype\CO.paa",
				"x\UO_FW\addons\main\Core\Resources\Attributes\missiontype\TVT.paa",
				"x\UO_FW\addons\main\Core\Resources\Attributes\missiontype\COTVT.paa",
				"x\UO_FW\addons\main\Core\Resources\Attributes\missiontype\LOL.paa",
				"x\UO_FW\addons\main\Core\Resources\Attributes\missiontype\UOTC.paa"
			};
			tooltips[]=
			{
				"CO is defined as a mission where Players are against AI",
				"TVT is defined as a mission where players are against players",
				"COTVT is defined as a mission where players are against AI that are assisted by players",
				"LOL is defined as any mission that does not fit within the other categories",
				"UOTC is defined as any mission built for the United Operations Training Center"
			};
			values[]={0,1,2,3,4};
			onToolboxSelChanged="missionnamespace setvariable ['mission_type',_this select 1];";
		};
	};
};