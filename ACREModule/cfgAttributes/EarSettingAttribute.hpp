//radio selection dialog
//name radio channels dialog?


class UO_FW_ACRE_EarSetting_SR: Title {
	attributeLoad = "missionnamespace setvariable ['UO_FW_EarSetting_SR_value',_value]; (_this controlsGroupCtrl 194) lbsetcursel _value;";
	attributeSave = "missionnamespace getvariable ['UO_FW_EarSetting_SR_value',0];";
	h = "13 * (pixelH * pixelGrid * 0.50)";
	class Controls: Controls {
		class Title: Title {};
		class Value: ctrlToolbox {
			idc = 194;
			style = "0x02";
			x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "12 * (pixelH * pixelGrid * 0.50)";
			rows = 1;
            columns = 3;
			strings[] = {"CENTER","LEFT","RIGHT"};
			values[] = {0,1,2};
			onToolboxSelChanged = "missionnamespace setvariable ['UO_FW_EarSetting_SR_value',(_this select 1)];";
		};
	};
};

class UO_FW_ACRE_EarSetting_LR: Title {
	attributeLoad = "missionnamespace setvariable ['UO_FW_EarSetting_LR_value',_value]; (_this controlsGroupCtrl 195) lbsetcursel _value;";
	attributeSave = "missionnamespace getvariable ['UO_FW_EarSetting_LR_value',0];";
	h = "13 * (pixelH * pixelGrid * 0.50)";
	class Controls: Controls {
		class Title: Title {};
		class Value: ctrlToolbox {
			idc = 195;
			style = "0x02";
			x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "12 * (pixelH * pixelGrid * 0.50)";
			rows = 1;
            columns = 3;
			strings[] = {"CENTER","LEFT","RIGHT"};
			values[] = {0,1,2};
			onToolboxSelChanged = "missionnamespace setvariable ['UO_FW_EarSetting_LR_value',(_this select 1)];";
		};
	};
};

class UO_FW_ACRE_EarSetting_PK: Title {
	attributeLoad = "missionnamespace setvariable ['UO_FW_EarSetting_PK_value',_value]; (_this controlsGroupCtrl 196) lbsetcursel _value;";
	attributeSave = "missionnamespace getvariable ['UO_FW_EarSetting_PK_value',0];";
	h = "13 * (pixelH * pixelGrid * 0.50)";
	class Controls: Controls {
		class Title: Title {};
		class Value: ctrlToolbox {
			idc = 196;
			style = "0x02";
			x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "12 * (pixelH * pixelGrid * 0.50)";
			rows = 1;
            columns = 3;
			strings[] = {"CENTER","LEFT","RIGHT"};
			values[] = {0,1,2};
			onToolboxSelChanged = "missionnamespace setvariable ['UO_FW_EarSetting_PK_value',(_this select 1)];";
		};
	};
};