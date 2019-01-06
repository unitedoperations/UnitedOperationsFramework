//radio selection dialog
//name radio channels dialog?


class UO_FW_CAPTUREZONE_TEAMATTRIBUTE_BLU: Title {
	attributeLoad = "missionnamespace setvariable ['UO_FW_CAPTUREZONE_TEAMATTRIBUTE_value',_value]; (_this controlsGroupCtrl 1942) lbsetcursel _value;";
	attributeSave = "missionnamespace getvariable ['UO_FW_CAPTUREZONE_TEAMATTRIBUTE_value',0];";
	  h = "9 * (pixelH * pixelGrid * 0.50)";
	class Controls: Controls {
		class Title: Title {};
		class Value: ctrlToolbox {
			idc = 1942;
			style = "0x02";
			x = "48 * (pixelW * pixelGrid * 0.50)";
      w = "82 * (pixelW * pixelGrid * 0.50)";
      h = "8 * (pixelH * pixelGrid * 0.50)";
			rows = 1;
      columns = 3;
			strings[] = {"CAN CAPTURE","CANNOT CAPTURE","IGNORED"};
			values[] = {0,1,2};
			onToolboxSelChanged = "missionnamespace setvariable ['UO_FW_CAPTUREZONE_TEAMATTRIBUTE_value',(_this select 1)];";
		};
	};
};

class UO_FW_CAPTUREZONE_TEAMATTRIBUTE_OPF: Title {
	attributeLoad = "missionnamespace setvariable ['UO_FW_CAPTUREZONE_TEAMATTRIBUTE_OPF_value',_value]; (_this controlsGroupCtrl 1943) lbsetcursel _value;";
	attributeSave = "missionnamespace getvariable ['UO_FW_CAPTUREZONE_TEAMATTRIBUTE_OPF_value',0];";
	  h = "9 * (pixelH * pixelGrid * 0.50)";
	class Controls: Controls {
		class Title: Title {};
		class Value: ctrlToolbox {
			idc = 1943;
			style = "0x02";
			x = "48 * (pixelW * pixelGrid * 0.50)";
      w = "82 * (pixelW * pixelGrid * 0.50)";
      h = "8 * (pixelH * pixelGrid * 0.50)";
			rows = 1;
      columns = 3;
			strings[] = {"CAN CAPTURE","CANNOT CAPTURE","IGNORED"};
			values[] = {0,1,2};
			onToolboxSelChanged = "missionnamespace setvariable ['UO_FW_CAPTUREZONE_TEAMATTRIBUTE_OPF_value',(_this select 1)];";
		};
	};
};

class UO_FW_CAPTUREZONE_TEAMATTRIBUTE_IND: Title {
	attributeLoad = "missionnamespace setvariable ['UO_FW_CAPTUREZONE_TEAMATTRIBUTE_IND_value',_value]; (_this controlsGroupCtrl 1943) lbsetcursel _value;";
	attributeSave = "missionnamespace getvariable ['UO_FW_CAPTUREZONE_TEAMATTRIBUTE_IND_value',0];";
	  h = "9 * (pixelH * pixelGrid * 0.50)";
	class Controls: Controls {
		class Title: Title {};
		class Value: ctrlToolbox {
			idc = 1943;
			style = "0x02";
			x = "48 * (pixelW * pixelGrid * 0.50)";
      w = "82 * (pixelW * pixelGrid * 0.50)";
      h = "8 * (pixelH * pixelGrid * 0.50)";
			rows = 1;
      columns = 3;
			strings[] = {"CAN CAPTURE","CANNOT CAPTURE","IGNORED"};
			values[] = {0,1,2};
			onToolboxSelChanged = "missionnamespace setvariable ['UO_FW_CAPTUREZONE_TEAMATTRIBUTE_IND_value',(_this select 1)];";
		};
	};
};

class UO_FW_CAPTUREZONE_TEAMATTRIBUTE_CIV: Title {
	attributeLoad = "missionnamespace setvariable ['UO_FW_CAPTUREZONE_TEAMATTRIBUTE_CIV_value',_value]; (_this controlsGroupCtrl 1943) lbsetcursel _value;";
	attributeSave = "missionnamespace getvariable ['UO_FW_CAPTUREZONE_TEAMATTRIBUTE_CIV_value',0];";
	  h = "9 * (pixelH * pixelGrid * 0.50)";
	class Controls: Controls {
		class Title: Title {};
		class Value: ctrlToolbox {
			idc = 1943;
			style = "0x02";
			x = "48 * (pixelW * pixelGrid * 0.50)";
      w = "82 * (pixelW * pixelGrid * 0.50)";
      h = "8 * (pixelH * pixelGrid * 0.50)";
			rows = 1;
      columns = 3;
			strings[] = {"CAN CAPTURE","CANNOT CAPTURE","IGNORED"};
			values[] = {0,1,2};
			onToolboxSelChanged = "missionnamespace setvariable ['UO_FW_CAPTUREZONE_TEAMATTRIBUTE_CIV_value',(_this select 1)];";
		};
	};
};
