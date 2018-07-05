class UO_FW_ENDCONDITIONS_MODEATTRIBUTE: Title {
	attributeLoad = "missionnamespace setvariable ['UO_FW_ENDCONDITIONS_MODEATTRIBUTE_value',_value]; (_this controlsGroupCtrl 196) lbsetcursel _value;";
	attributeSave = "missionnamespace getvariable ['UO_FW_ENDCONDITIONS_MODEATTRIBUTE_value',0];";
	h = "8 * (pixelH * pixelGrid * 0.50)";
	class Controls: Controls {
		class Title: Title {};
		class Value: ctrlToolbox {
			idc = 196;
			style = "0x02";
			x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "8 * (pixelH * pixelGrid * 0.50)";
			rows = 1;
            columns = 2;
			strings[] = {"All Condition","Any Condition"};
			values[] = {0,1};
			onToolboxSelChanged = "missionnamespace setvariable ['UO_FW_ENDCONDITIONS_MODEATTRIBUTE_value',(_this select 1)];";
		};
	};
};