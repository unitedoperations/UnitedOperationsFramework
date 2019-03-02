class UO_FW_EndConditions_ExtractTeam: Toolbox {
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
            columns = 4;
            strings[] = {"BLUFOR","OPFOR","Indfor","CIVILIAN"};
            values[] = {0,1,2,3};
        };
    };
};
