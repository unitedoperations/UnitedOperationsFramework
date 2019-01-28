class UO_FW_ExportToClipboardAttribute: Title {
    class Controls: Controls {
        class Title: Title {};
        class Value: ctrlButtonPictureKeepAspect {
            idc=100;
            x="(48) * (pixelW * pixelGrid * 0.50)";
            w="0.99 * 5 * (pixelW * pixelGrid * 0.50)";
            h="5 * (pixelH * pixelGrid * 0.50)";
            text="\a3\3DEN\Data\Attributes\ComboPreview\play_ca.paa";
            onMouseButtonClick="['',true] call UO_FW_fnc_ExportSettings;";
        };
    };
};
