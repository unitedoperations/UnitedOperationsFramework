class UO_FW_ENDCONDITIONS_EXTRACTTEAM: Title {
	attributeLoad = "missionnamespace setvariable ['UO_FW_ENDCONDITIONS_EXTRACTTEAM_value',_value]; (_this controlsGroupCtrl 917) lbsetcursel _value;";
	attributeSave = "missionnamespace getvariable ['UO_FW_ENDCONDITIONS_EXTRACTTEAM_value',0];";
	h = "8 * (pixelH * pixelGrid * 0.50)";
	class Controls: Controls {
		class Title: Title {};
		class Value: ctrlToolbox {
			idc = 917;
			style = "0x02";
			x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "8 * (pixelH * pixelGrid * 0.50)";
			rows = 1;
            columns = 4;
			strings[] = {"BLUFOR","OPFOR","INDFOR","CIV"};
			values[] = {0,1,2,3};
			onToolboxSelChanged = "missionnamespace setvariable ['UO_FW_ENDCONDITIONS_EXTRACTTEAM_value',(_this select 1)];";
		};
	};
};