class UO_FW_ENDCONDITIONS_CAPTUREZONETEAM: Title 
{
	attributeLoad = "missionnamespace setvariable ['UO_FW_ENDCONDITIONS_CAPTUREZONETEAM_value',_value]; (_this controlsGroupCtrl 91888) lbsetcursel _value;";
	attributeSave = "missionnamespace getvariable ['UO_FW_ENDCONDITIONS_CAPTUREZONETEAM_value',0];";
	h = "8 * (pixelH * pixelGrid * 0.50)";
	class Controls: Controls 
	{
		class Title: Title {};
		class Value: ctrlToolbox 
		{
			idc = 91888;
			style = "0x02";
			x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "8 * (pixelH * pixelGrid * 0.50)";
			rows = 1;
            columns = 5;
			strings[] = {"NOONE","BLUFOR","OPFOR","INDFOR","CIV"};
			values[] = {0,1,2,3,4};
			onToolboxSelChanged = "missionnamespace setvariable ['UO_FW_ENDCONDITIONS_CAPTUREZONETEAM_value',(_this select 1)];";
		};
	};
};