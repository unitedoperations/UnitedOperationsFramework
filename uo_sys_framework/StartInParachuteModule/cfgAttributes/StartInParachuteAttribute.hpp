class UO_FW_StartInParachuteAttribute: Toolbox {
	attributeLoad ="\
		private _name = gettext (_config >> 'property');\
		missionNamespace setvariable [_name,_value];\
		private _control = (_this controlsGroupCtrl 2521);\
		_control setvariable ['UO_FW_ParentCfg',_config];\
		_control lbsetcursel _value\
	";
	attributeSave = "\
		private _name = gettext (_config >> 'property');\
		private _value = missionNamespace getvariable [_name,''];\
		_value\
	";
	h = "7 * (pixelH * pixelGrid * 0.50)";
	class Controls: Controls {
		class Title: Title {};
		class Value: ctrlToolbox {
			idc = 2521;
			style = "0x02";
			x = "48 * (pixelW * pixelGrid * 0.50)";
			w = "82 * (pixelW * pixelGrid * 0.50)";
			h = "6 * (pixelH * pixelGrid * 0.50)";
			rows = 1;
			columns = 3;
			strings[] = {"NONE","NONSTEERABLE","STEERABLE"};
			values[] = {0,1,2};
			onToolboxSelChanged ="\
				params ['_control','_value'];\
				private _config = _control getvariable ['UO_FW_ParentCfg',''];\
				private _name = gettext (_config >> 'property');\
				missionNamespace setvariable [_name,_value];\
			";
		};
	};
};