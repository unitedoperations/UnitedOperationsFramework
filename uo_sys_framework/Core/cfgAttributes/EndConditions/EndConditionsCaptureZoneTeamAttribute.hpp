class UO_FW_EndConditions_CaptureZoneTeam: Toolbox {
    h = "8 * (pixelH * pixelGrid * 0.50)";
    class Controls: Controls {
        class Title: Title {};
        class Value: ctrlToolbox {
            idc = 100;
            style = "0x02";
            x = "48 * (pixelW * pixelGrid * 0.50)";
            w = "82 * (pixelW * pixelGrid * 0.50)";
            h = "8 * (pixelH * pixelGrid * 0.50)";
            rows = 1;
            columns = 5;
            values[] = {0,1,2,3,4};
            strings[] = {"Uncaptured","BLUFOR","OPFOR","INDFOR","CIV"};
        };
    };
};
