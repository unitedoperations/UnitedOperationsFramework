class UO_FW_Slider: Slider {
    attributeLoad = "\
        params ['_ctrlGroup'];\
        private _slider = _ctrlGroup controlsGroupCtrl 100;\
        private _edit = _ctrlGroup controlsGroupCtrl 101;\
        _slider sliderSetPosition _value;\
        _edit ctrlSetText ([_value, 1, 1] call CBA_fnc_formatNumber);\
    ";
    attributeSave = "\
        params ['_ctrlGroup'];\
        sliderPosition (_ctrlGroup controlsGroupCtrl 100)\
    ";
};

#define UO_FW_SLIDER_ONLOAD(MINVAL,MAXVAL) \
onLoad = "\
    params ['_ctrlGroup'];\
    private _slider = _ctrlGroup controlsGroupCtrl 100;\
    private _edit = _ctrlGroup controlsGroupCtrl 101;\
    _slider ctrlAddEventHandler ['SliderPosChanged', {\
        params ['_slider'];\
        private _edit = (ctrlParentControlsGroup _slider) controlsGroupCtrl 101;\
        private _value = sliderPosition _slider;\
        _edit ctrlSetText ([_value, 1, 1] call CBA_fnc_formatNumber);\
    }];\
    _edit ctrlAddEventHandler ['KillFocus', {\
        params ['_edit'];\
        private _slider = (ctrlParentControlsGroup _edit) controlsGroupCtrl 100;\
        private _value = ((parseNumber ctrlText _edit) min MAXVAL) max MINVAL;\
        _slider sliderSetPosition _value;\
        _edit ctrlSetText str _value;\
    }];\
"

class UO_FW_1To4Step01_Slider: UO_FW_Slider {
    UO_FW_SLIDER_ONLOAD(1,4);
	class Controls: Controls {
        class Title: Title {};
		class Value: Value {
			sliderRange[]={1,4};
			sliderPosition=3;
			pageSize=0.1;
		};
        class Edit: Edit {};
	};
};

class UO_FW_0To5_Slider: UO_FW_Slider {
    UO_FW_SLIDER_ONLOAD(0,5);
	class Controls: Controls {
        class Title: Title {};
		class Value: Value {
			sliderRange[]={0,5};
			sliderPosition=0;
			pageSize=1;
		};
        class Edit: Edit {};
	};
};

class UO_FW_1To5_Slider: UO_FW_Slider {
    UO_FW_SLIDER_ONLOAD(1,5);
	class Controls: Controls {
        class Title: Title {};
		class Value: Value {
			sliderRange[]={1,5};
			sliderPosition=3;
			pageSize=1;
		};
        class Edit: Edit {};
	};
};

class UO_FW_5To20_Slider: UO_FW_Slider {
    UO_FW_SLIDER_ONLOAD(5,20);
	class Controls: Controls {
        class Title: Title {};
		class Value: Value {
			sliderRange[]={5,20};
			sliderPosition=5;
			pageSize=1;
		};
        class Edit: Edit {};
	};
};


class UO_FW_1To10_Slider: UO_FW_Slider {
    UO_FW_SLIDER_ONLOAD(1,10);
	class Controls: Controls {
        class Title: Title {};
		class Value: Value {
			sliderRange[]={1,10};
			sliderPosition=2;
			pageSize=1;
		};
        class Edit: Edit {};
	};
};

class UO_FW_15To40Step5_Slider: UO_FW_Slider {
    UO_FW_SLIDER_ONLOAD(15,40);
	class Controls: Controls {
        class Title: Title {};
		class Value: Value {
			sliderRange[]={15,40};
			sliderPosition=20;
			pageSize=5;
		};
        class Edit: Edit {};
	};
};

class UO_FW_1To100Step1_Slider: UO_FW_Slider {
    UO_FW_SLIDER_ONLOAD(1,100);
	class Controls: Controls {
        class Title: Title {};
		class Value: Value {
			sliderRange[]={1,100};
			sliderPosition=75;
			pageSize=5;
		};
        class Edit: Edit {};
	};
};

class UO_FW_10To100_Slider: UO_FW_Slider {
    UO_FW_SLIDER_ONLOAD(10,100);
	class Controls: Controls {
        class Title: Title {};
		class Value: Value {
			sliderRange[]={10,100};
			sliderPosition=30;
			pageSize=1;
		};
        class Edit: Edit {};
	};
};

class UO_FW_10To95Step5_Slider: UO_FW_Slider {
    UO_FW_SLIDER_ONLOAD(10,95);
	class Controls: Controls {
        class Title: Title {};
		class Value: Value {
			sliderRange[]={10,95};
			sliderPosition=75;
			pageSize=5;
		};
        class Edit: Edit {};
	};
};

class UO_FW_30To100_Slider: UO_FW_Slider {
    UO_FW_SLIDER_ONLOAD(30,100);
	class Controls: Controls {
        class Title: Title {};
		class Value: Value {
			sliderRange[]={30,100};
			sliderPosition=30;
			pageSize=1;
		};
        class Edit: Edit {};
	};
};

class UO_FW_0To120_Slider: UO_FW_Slider {
    UO_FW_SLIDER_ONLOAD(0,120);
	class Controls: Controls {
        class Title: Title {};
		class Value: Value {
			sliderRange[]={0,120};
			sliderPosition=30;
			pageSize=1;
		};
        class Edit: Edit {};
	};
};

class UO_FW_30To120_Slider: UO_FW_Slider {
    UO_FW_SLIDER_ONLOAD(30,120);
	class Controls: Controls {
        class Title: Title {};
		class Value: Value {
			sliderRange[]={30,120};
			sliderPosition=30;
			pageSize=1;
		};
        class Edit: Edit {};
	};
};

class UO_FW_120To360_Slider: UO_FW_Slider {
    UO_FW_SLIDER_ONLOAD(120,360);
	class Controls: Controls {
        class Title: Title {};
		class Value: Value {
			sliderRange[]={120,360};
			sliderPosition=120;
			pageSize=1;
		};
        class Edit: Edit {};
	};
};

class UO_FW_50To200Step50_Slider: UO_FW_Slider {
    UO_FW_SLIDER_ONLOAD(50,200);
	class Controls: Controls {
        class Title: Title {};
		class Value: Value {
			sliderRange[]={50,200};
			sliderPosition=100;
			pageSize=50;
		};
        class Edit: Edit {};
	};
};

class UO_FW_50To250Step50_Slider: UO_FW_Slider {
    UO_FW_SLIDER_ONLOAD(50,250);
	class Controls: Controls {
        class Title: Title {};
		class Value: Value {
			sliderRange[]={50,250};
			sliderPosition=100;
			pageSize=50;
		};
        class Edit: Edit {};
	};
};

class UO_FW_200To1000Step100_Slider: UO_FW_Slider {
    UO_FW_SLIDER_ONLOAD(200,1000);
	class Controls: Controls {
        class Title: Title {};
		class Value: Value {
			sliderRange[]={200,1000};
			sliderPosition=300;
			pageSize=100;
		};
        class Edit: Edit {};
	};
};

class UO_FW_300To1000Step100_Slider: UO_FW_Slider {
    UO_FW_SLIDER_ONLOAD(300,1000);
	class Controls: Controls {
        class Title: Title {};
		class Value: Value {
			sliderRange[]={300,1000};
			sliderPosition=300;
			pageSize=100;
		};
        class Edit: Edit {};
	};
};

class UO_FW_500To2500Step100_Slider: UO_FW_Slider {
    UO_FW_SLIDER_ONLOAD(500,2500);
	class Controls: Controls {
        class Title: Title {};
		class Value: Value {
			sliderRange[]={500,2500};
			sliderPosition=1000;
			pageSize=100;
		};
        class Edit: Edit {};
	};
};
