class NATOBriefingMissionBLUFOR: EditMulti5
{
	attributeLoad="(_this controlsGroupCtrl 100) lbsetcursel (['NATO','WARSAW'] find _value);";
	attributeSave="['NATO','WARSAW'] select (missionnamespace getvariable ['briefing_type_BLUFOR','NATO']);";
	h="8 * (pixelH * pixelGrid * 0.50)";
	class Controls: Controls
	{
		class Title: Title
		{
			h="8 * (pixelH * pixelGrid * 0.50)";
		};
		class Value: Value
		{
			idc=100;
			style="0x02 + 0x30 + 0x800";
			h="8 * (pixelH * pixelGrid * 0.50)";
			x="48 * (pixelW * pixelGrid * 0.50)";
			w="82 * (pixelW * pixelGrid * 0.50)";
			rows=1;
			columns=2;
			strings[]=
			{
				"NATO",
				"Warsaw Pact"
			};
			tooltips[]=
			{
				"NATO style",
				"Warsaw Pact style"
			};
			values[]={'NATO','WARSAW'};
			onToolboxSelChanged="missionnamespace setvariable ['briefing_type_BLUFOR',_this select 1];";
		};
	};
};