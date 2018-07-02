//radio selection dialog
//name radio channels dialog?

class UO_FW_ACRE_SR_BLUFOR_SELECT: Toolbox {
	attributeLoad = "missionnamespace setvariable ['UO_FW_ACRE_SR_BLUFOR_SELECT_value',_value]; (_this controlsGroupCtrl 411) lbsetcursel _value;";
	attributeSave = "missionnamespace getvariable ['UO_FW_ACRE_SR_BLUFOR_SELECT_value',0];";
	h = "13 * (pixelH * pixelGrid * 0.50)";
	class Controls: Controls {
		class Title: Title {};
		class Value: ctrlToolbox {
			idc = 411;
			style = "0x02";
			x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "12 * (pixelH * pixelGrid * 0.50)";
			rows = 1;
            columns = 3;
			strings[] = {"NONE","PRC-343","SEM-52SL"};
			values[] = {0,1,2};
			onToolboxSelChanged = "missionnamespace setvariable ['UO_FW_ACRE_SR_BLUFOR_SELECT_value',(_this select 1)];";
		};
	};
};

class UO_FW_ACRE_LR_BLUFOR_SELECT: Toolbox {
	attributeLoad = "missionnamespace setvariable ['UO_FW_ACRE_LR_BLUFOR_SELECT_value',_value]; (_this controlsGroupCtrl 412) lbsetcursel _value;";
	attributeSave = "missionnamespace getvariable ['UO_FW_ACRE_LR_BLUFOR_SELECT_value',0];";
	h = "13 * (pixelH * pixelGrid * 0.50)";
	class Controls: Controls {
		class Title: Title {};
		class Value: ctrlToolbox {
			idc = 412;
			style = "0x02";
			x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "12 * (pixelH * pixelGrid * 0.50)";
			rows = 1;
            columns = 3;
			strings[] = {"NONE","PRC-148","PRC-152"};
			values[] = {0,1,2};
			onToolboxSelChanged = "missionnamespace setvariable ['UO_FW_ACRE_LR_BLUFOR_SELECT_value',(_this select 1)];";
		};
	};
};

class UO_FW_ACRE_PK_BLUFOR_SELECT: Toolbox {
	attributeLoad = "missionnamespace setvariable ['UO_FW_ACRE_PK_BLUFOR_SELECT_value',_value]; (_this controlsGroupCtrl 413) lbsetcursel _value;";
	attributeSave = "missionnamespace getvariable ['UO_FW_ACRE_PK_BLUFOR_SELECT_value',0];";
	h = "13 * (pixelH * pixelGrid * 0.50)";
	class Controls: Controls {
		class Title: Title {};
		class Value: ctrlToolbox {
			idc = 413;
			style = "0x02";
			x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "12 * (pixelH * pixelGrid * 0.50)";
			rows = 1;
            columns = 4;
			strings[] = {"NONE","PRC-117F","PRC-77","SEM-70"};
			values[] = {0,1,2,3};
			onToolboxSelChanged = "missionnamespace setvariable ['UO_FW_ACRE_PK_BLUFOR_SELECT_value',(_this select 1)];";
		};
	};
};