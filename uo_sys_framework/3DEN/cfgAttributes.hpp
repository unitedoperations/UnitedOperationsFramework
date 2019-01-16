// Base class templates
class Default;

class Title: Default {
	class Controls {
		class Title;
		class Value;
	};
};

class Combo: Title {
	class Controls {
		class Title;
		class Value;
	};
};

class ComboPreview: Combo {
	class Controls {
		class Title;
		class Value;
		class Preview;
	};
};

class Toolbox: Title {
	class Controls {
		class Title;
		class Value;
	};
};

class Edit: Title {
	class Controls {
		class Title;
		class Value;
	};
};

class EditShort: Edit {
	class Controls {
		class Title;
		class Value;
	};
};

class EditArray;

class EditStringArray: EditArray {
	attributeLoad="\
		_valueText = '';\
		_valuetext = _value joinString ',';\
		(_this controlsGroupCtrl 100) ctrlSetText _valueText;\
	";
	attributeSave="\
		_value = ctrlText (_this controlsGroupCtrl 100);\
		_values = [_value,','] call bis_fnc_splitString;\
		_values\
	";
};

class EditQuotedStringArray: EditArray {
	attributeLoad="\
		_valueText = '';\
		_valuetext = _value joinString ',';\
		(_this controlsGroupCtrl 100) ctrlSetText _valueText;\
	";
	attributeSave="\
		_value = ctrlText (_this controlsGroupCtrl 100);\
		_values = [_value,','] call bis_fnc_splitString;\
		_values\
	";
};

class Slider: Title {
	class Controls {
		class Title;
		class Value;
	};
};

class Checkbox: Title {
	class Controls {
		class Title;
		class Value;
	};
};

class CheckboxState: Checkbox {
	class Controls {
		class Title;
		class Value;
	};
};

class CategoryTitle: Title {
	class Controls {
		class Title: ctrlStatic {
			style=0;
			sizeEx="5.5 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
			x=0;
			//x="2 * (pixelH * pixelGrid * 	0.50)";
			w="48 * (pixelW * pixelGrid * 	0.50)";
			h="5 * (pixelH * pixelGrid * 	0.50)";
			colorBackground[]={0,0,0,0};
		};
	};
};

class CategoryTitleIndent: Title {
	class Controls {
		class Title: ctrlStatic {
			style=0;
			sizeEx="5.5 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
			//x=0;
			x="10 * (pixelH * pixelGrid * 0.50)";
			w="48 * (pixelW * pixelGrid * 0.50)";
			h="5 * (pixelH * pixelGrid * 0.50)";
			colorBackground[]={0,0,0,0};
		};
	};
};

class SubTitle: CategoryTitle {
	class Controls: Controls {
		class Title: Title {
			x="4 * (pixelH * pixelGrid * 0.50)";
			sizeEx="4.2 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
		};
	};
};

class SubTitleIndent: SubTitle {
	class Controls: Controls {
		class Title: Title {
			x="14 * (pixelH * pixelGrid * 0.50)";
			sizeEx="4.2 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
		};
	};
};

class CheckboxStateReversed: CheckboxState {
	class Controls: Controls {
		class Title: Title {};
		class Value: Value {
			onCheckedChanged="\
				_ctrlCheckbox = _this select 0;\
				_state = [true,false] select (cbChecked _ctrlCheckbox);\
				_fade = [0.75,0] select _state;\
				_ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCheckbox;\
				{\
					if (ctrlParentControlsGroup _x isEqualto _ctrlGroup) then {\
						_x ctrlenable _state;\
						_x ctrlsetfade _fade;\
						_x ctrlcommit 0;\
					};\
				} foreach (allcontrols (ctrlparent _ctrlCheckbox) - [ctrlParentControlsGroup _ctrlCheckbox]);\
			";
			onLoad="\
				_ctrlCheckbox = _this select 0;\
				_state = [true,false] select (cbChecked _ctrlCheckbox);\
				_fade = [0.75,0] select _state;\
				_ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCheckbox;\
				{\
					if (ctrlParentControlsGroup _x isEqualto _ctrlGroup) then {\
						_x ctrlenable _state;\
						_x ctrlsetfade _fade;\
						_x ctrlcommit 0;\
					};\
				} foreach (allcontrols (ctrlparent _ctrlCheckbox) - [ctrlParentControlsGroup _ctrlCheckbox]);\
			";
		};
	};
};

class None {
    idc = -1;
    type = 0; style = 0;
    w = 0; h = 0; y = 0; x = 0;
    attributeLoad = "";
    attributeSave = "";
    show = 0;
    tooltip = "";
    fade = 0;
    access = 0;
    default = 0;
    blinkingPeriod = 0;
    deletable = 0;
    shadow = 0;
    color[] = {1,1,1};
    colorBackground[] = {0.1,0.1,0.95};
    colorPreview[] = {1,1,1};
    colorPreviewBackground[] = {0.1,0.1,0.95};
    sizeEx = SIZEEX_PURISTA(SIZEEX_M); // Text size
    font = FONT_NORMAL; // Font from CfgFontFamilies
    text = "";
    lineSpacing = 1; // When ST_MULTI style is used, this defines distance between lines (1 is text height)
    fixedWidth = 0; // 1 (true) to enable monospace
    colorText[] = {1,1,1,1}; // Text color
    colorShadow[] = {0,0,0,1}; // Text shadow color (used only when shadow is 1)
    moving = 0; // 1 (true) to allow dragging the whole display by the control
    autoplay = 0; // Play video automatically (only for style ST_PICTURE with text pointing to an .ogv file)
    loops = 0; // Number of video repeats (only for style ST_PICTURE with text pointing to an .ogv file)
    tileW = 1; // Number of tiles horizontally (only for style ST_TILE_PICTURE)
    tileH = 1; // Number of tiles vertically (only for style ST_TILE_PICTURE)
    onCanDestroy = "";
    onDestroy = "";
    onMouseEnter = "";
    onMouseExit = "";
    onSetFocus = "";
    onKillFocus = "";
    onKeyDown = "";
    onKeyUp = "";
    onMouseButtonDown = "";
    onMouseButtonUp = "";
    action = "";
    onMouseButtonDblClick = "";
    onMouseZChanged = "";
    onMouseMoving = "";
    onMouseHolding = "";
    onVideoStopped = "";
};

#include "CfgAttributes\ExportToClipboardAttribute.hpp"
#include "CfgAttributes\ImportFromClipboardAttribute.hpp"
#include "CfgAttributes\ExportToProfileAttribute.hpp"
#include "CfgAttributes\ImportFromProfileAttribute.hpp"
#include "CfgAttributes\AIOnlyCategoryAttributes.hpp"
#include "CfgAttributes\PlayerOnlyCategoryAttributes.hpp"
