////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Sacher, v1.063, #Dyroxu)
////////////////////////////////////////////////////////

#include "..\..\Global\defs.hpp"
class UO_FW_DIA_BRACKETFIREMission
{
    idd = BFM_DIA_IDD_DISPLAY;
    movingEnable = false;
    enableSimulation = true;
    controlsBackground[] = {};
    objects[] = {};
    controls[] = {BFM_BACKGROUND,BFM_DESCRIPTIONTEXT,BFM_SELECTEDGUN,BFM_SELECTEDSHELLTEXT,BFM_STARTGRID,BFM_ENDGRID,BFM_BURSTNUMBERTEXT,BFM_BURSTROUNDSTEXT,
        BFM_DELAYTEXT,BFM_SPOTDISTTEXT,BFM_SELECTEDGUNEDIT,BFM_SELECTEDSHELLEDIT,BFM_STARTGRIDEDIT,
        BFM_ENDGRIDEDIT,BFM_BURSTNUMBEREDIT,BFM_BURSTROUNDSEDIT,BFM_BURSTDELAYEDIT,BFM_SPOTTINGDISTANCEDIT,BFM_FIREBUTTON,BFM_CANCELBUTTON};
        class BFM_BACKGROUND: MGVAR(RscText)
        {
            idc = -1;
            x = ARTIWIDTHMainSPACE * safezoneW + safezoneX - ARTIBORDERTHICKNESS;
            y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 0) * safezoneH + safezoneY - ARTIBORDERTHICKNESS;
            w =  ( ARTILAYOUTWIDTH +  ARTILAYOUTWIDTHSPACE) *  safezoneW  + ARTIBORDERTHICKNESS * 2 ;
            h = ARTILAYOUTHEIGHTSPACE * 10 * safezoneH + ARTIBORDERTHICKNESS * 2 ;
            shadow = 0;
            colorBackground[] = {0.65,0.65,0.65,0.7};
        };
        class BFM_DESCRIPTIONTEXT: MGVAR(RscText)
        {
            idc = -1;
            text = "Bracket Firemission"; //--- ToDo: Localize;

            x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
            y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 0) * safezoneH + safezoneY;
            w = ARTILAYOUTWIDTH * safezoneW;
            h = ARTILAYOUTHEIGHT * safezoneH;
            colorText[] = {0,0,0,1};
            shadow = 0;
        };
    class BFM_SELECTEDGUN: MGVAR(RscText)
    {
        idc = -1;
        text = "Selected gun:"; //--- ToDo: Localize;

        x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 1) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};
        shadow = 0;
    };
    class BFM_SELECTEDSHELLTEXT: MGVAR(RscText)
    {
        idc = -1;
        text = "Aviable ammunition:"; //--- ToDo: Localize;
        x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 2) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};
        shadow = 0;
    };
    class BFM_STARTGRID: MGVAR(RscText)
    {
        idc = -1;
        text = "Start Grid:"; //--- ToDo: Localize;
        x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 3) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};
        shadow = 0;
    };
    class BFM_ENDGRID: MGVAR(RscText)
    {
        idc = -1;
        text = "End Grid:"; //--- ToDo: Localize;
        x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 4) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};
        shadow = 0;
    };
    class BFM_BURSTNUMBERTEXT: MGVAR(RscText)
    {
        idc = -1;
        text = "Number of salvos:"; //--- ToDo: Localize;
        x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 5) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};
        shadow = 0;
    };
    class BFM_BURSTROUNDSTEXT: MGVAR(RscText)
    {
        idc = -1;
        text = "Number of rounds per salvo:"; //--- ToDo: Localize;
        x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 6) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};
        shadow = 0;
    };
    class BFM_DELAYTEXT: MGVAR(RscText)
    {
        idc = -1;
        text = "Delay between salvos:"; //--- ToDo: Localize;
        x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 7) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};
        shadow = 0;
    };
    class BFM_SPOTDISTTEXT: MGVAR(RscText)
    {
        idc = -1;
        text = "Minimum spotting round distance:"; //--- ToDo: Localize;
        x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 8) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};
        shadow = 0;
    };
    class BFM_FIREBUTTON: MGVAR(RscButton)
    {
        idc = -1;
        text = "Fire Artillery"; //--- ToDo: Localize;
        x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 9) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;

            onMouseButtonDown = "[] call UO_FW_fnc_DIA_BracketFiremissionFire;";
    };
    class BFM_SELECTEDGUNEDIT: MGVAR(RscListbox)
    {
        idc = BFM_DIA_IDC_GUNSELECT;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 1) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        //colorText[] = {0,1,1,1};
        //colorBackground[] = {1,1,1,1};
        //colorActive[] = {0,1,0,1};
        onLBSelChanged = "(_this select 1) call UO_FW_fnc_DIA_BracketFiremissionSetArtillery;";
    };
    class BFM_SELECTEDSHELLEDIT: MGVAR(RscListbox)
    {
        idc = BFM_DIA_IDC_SHELLSELECT;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 2) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
    };
    class BFM_STARTGRIDEDIT: MGVAR(RscEdit)
    {
        idc = BFM_DIA_IDC_STARTGRID;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 3) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};
        shadow = 0;
    };
    class BFM_ENDGRIDEDIT: MGVAR(RscEdit)
    {
        idc = BFM_DIA_IDC_ENDGRID;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 4) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};
        shadow = 0;
    };
    class BFM_BURSTNUMBEREDIT: MGVAR(RscEdit)
    {
        idc = BFM_DIA_IDC_BURSTNUMBER;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 5) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};
        shadow = 0;
    };
    class BFM_BURSTROUNDSEDIT: MGVAR(RscEdit)
    {
        idc = BFM_DIA_IDC_BURSTROUNDS;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 6) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};
        shadow = 0;
    };
    class BFM_BURSTDELAYEDIT: MGVAR(RscEdit)
    {
        idc = BFM_DIA_IDC_BURSTDELAY;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 7) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};
        shadow = 0;
    };
    class BFM_SPOTTINGDISTANCEDIT: MGVAR(RscEdit)
    {
        idc = BFM_DIA_IDC_SPOTTING;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 8) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};
        shadow = 0;
    };
    class BFM_CANCELBUTTON: MGVAR(RscButton)
    {
        idc = 1600;
        text = "Cancel"; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 9) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;

            onMouseButtonDown = "[] call UO_FW_fnc_DIA_BracketFiremissionCloseDialog;";
    };
};

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
