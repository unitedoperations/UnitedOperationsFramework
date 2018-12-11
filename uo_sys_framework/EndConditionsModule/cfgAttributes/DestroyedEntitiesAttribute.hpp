class UO_FW_ENDCONDITIONS_DESTROYTYPE: Title {
	attributeLoad = "missionnamespace setvariable ['UO_FW_ENDCONDITIONS_DESTROYTYPE_value',_value]; (_this controlsGroupCtrl 194) lbsetcursel _value;";
	attributeSave = "missionnamespace getvariable ['UO_FW_ENDCONDITIONS_DESTROYTYPE_value',0];";
	h = "8 * (pixelH * pixelGrid * 0.50)";
	class Controls: Controls {
		class Title: Title {};
		class Value: ctrlToolbox {
			idc = 194;
			style = "0x02";
			x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "8 * (pixelH * pixelGrid * 0.50)";
			rows = 1;
            columns = 4;
			strings[] = {"DESTROYED","DAMAGED","EITHER","ALIVE"};
			values[] = {0,1,2,3};
			onToolboxSelChanged = "missionnamespace setvariable ['UO_FW_ENDCONDITIONS_DESTROYTYPE_value',(_this select 1)];";
		};
	};
};