class EGVAR(Core,MissionTypeAttribute): Toolbox {
    attributeLoad = "\
        private _name = gettext (_config >> 'property');\
        missionNamespace setvariable [_name,_value];\
        private _control = (_this controlsGroupCtrl 100);\
        _control setvariable ['ParentCfg',_config];\
        _control lbsetcursel _value;\
    ";
    attributeSave = "\
        private _name = gettext (_config >> 'property');\
        private _value = missionNamespace getvariable [_name,''];\
        _value\
    ";
    h="8 * (pixelH * pixelGrid * 0.50)";
    class Controls: Controls {
        class Title: Title {};
        class Value: ctrlToolbox {
            idc=100;
            h="8 * (pixelH * pixelGrid * 0.50)";
            x="48 * (pixelW * pixelGrid * 0.50)";
            w="82 * (pixelW * pixelGrid * 0.50)";
            rows=1;
            columns=5;
            strings[]= {
                "CO",
                "TVT",
                "COTVT",
                "LOL",
                "UOTC"
            };
            tooltips[]= {
                "CO is defined as a mission where players are against AI",
                "TVT is defined as a mission where players are against players",
                "COTVT is defined as a mission where players are against AI that are assisted by players",
                "LOL is defined as any mission that does not fit within the other categories",
                "UOTC is defined as any mission built for the United Operations Training Center"
            };
            values[]={0,1,2,3,4};
            onToolboxSelChanged = "\
                params ['_control','_value'];\
                private _config = _control getvariable ['ParentCfg',''];\
                private _name = gettext (_config >> 'property');\
                missionNamespace setvariable [_name,_value];\
            ";
        };
    };
};
