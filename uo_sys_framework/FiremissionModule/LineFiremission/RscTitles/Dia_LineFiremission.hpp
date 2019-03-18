////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Sacher, v1.063, #Dyroxu)
////////////////////////////////////////////////////////

#include "..\..\Global\defs.hpp"
class UO_FW_DIA_LINEFIREMission
{
    idd = LFM_DIA_IDD_DISPLAY;
    movingEnable = false;
    enableSimulation = true;
     scriptName = "Dialog_LineFiremission";
    controlsBackground[] = {};
    objects[] = {};
    controls[] = {LFM_BACKGROUND,LFM_DESCRIPTIONTEXT,LFM_SELECTEDGUN,LFM_SELECTEDSHELLTEXT,LFM_STARTGRID,LFM_ENDGRID,LFM_BURSTNUMBERTEXT,LFM_BURSTROUNDSTEXT,
        LFM_DELAYTEXT,LFM_SPOTDISTTEXT,LFM_SELECTEDGUNEDIT,LFM_SELECTEDSHELLEDIT,LFM_STARTGRIDEDIT,LFM_ENDGRIDEDIT,LFM_BURSTNUMBEREDIT,LFM_BURSTROUNDSEDIT,LFM_BURSTDELAYEDIT,LFM_SPOTTINGDISTANCEDIT,LFM_FIREBUTTON,LFM_CANCELBUTTON};
        class LFM_BACKGROUND: MGVAR(RscText)
        {
            idc = -1;
            x = ARTIWIDTHMainSPACE * safezoneW + safezoneX - ARTIBORDERTHICKNESS;
            y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 0) * safezoneH + safezoneY - ARTIBORDERTHICKNESS;
            w =  ( ARTILAYOUTWIDTH +  ARTILAYOUTWIDTHSPACE) *  safezoneW  + ARTIBORDERTHICKNESS * 2 ;
            h = ARTILAYOUTHEIGHTSPACE * 10 * safezoneH + ARTIBORDERTHICKNESS * 2 ;
            shadow = 0;
            colorBackground[] = {0.65,0.65,0.65,0.7};
        };
        class LFM_DESCRIPTIONTEXT: MGVAR(RscText)
        {
            idc = -1;
            text = "Line Firemission"; //--- ToDo: Localize;

            x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
            y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 0) * safezoneH + safezoneY;
            w = ARTILAYOUTWIDTH * safezoneW;
            h = ARTILAYOUTHEIGHT * safezoneH;
            colorText[] = {0,0,0,1};
            shadow = 0;

        };
    class LFM_SELECTEDGUN: MGVAR(RscText)
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
    class LFM_SELECTEDSHELLTEXT: MGVAR(RscText)
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
    class LFM_STARTGRID: MGVAR(RscText)
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
    class LFM_ENDGRID: MGVAR(RscText)
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
    class LFM_BURSTNUMBERTEXT: MGVAR(RscText)
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
    class LFM_BURSTROUNDSTEXT: MGVAR(RscText)
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
    class LFM_DELAYTEXT: MGVAR(RscText)
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
    class LFM_SPOTDISTTEXT: MGVAR(RscText)
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
    class LFM_FIREBUTTON: MGVAR(RscButton)
    {
        idc = -1;
        text = "Fire Artillery"; //--- ToDo: Localize;
        x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 9) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;

            onMouseButtonDown = "[] call UO_FW_fnc_DIA_LineFiremissionFire;";
    };
    class LFM_SELECTEDGUNEDIT: MGVAR(RscListbox)
    {
        idc = LFM_DIA_IDC_GUNSELECT;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 1) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        //colorText[] = {0,1,1,1};
        //colorBackground[] = {1,1,1,1};
        //colorActive[] = {0,1,0,1};
        onLBSelChanged = "(_this select 1) call UO_FW_fnc_DIA_LineFiremissionSetArtillery;";
    };
    class LFM_SELECTEDSHELLEDIT: MGVAR(RscListbox)
    {
        idc = LFM_DIA_IDC_SHELLSELECT;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 2) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
    };
    class LFM_STARTGRIDEDIT: MGVAR(RscEdit)
    {
        idc = LFM_DIA_IDC_STARTGRID;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 3) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};
        shadow = 0;

    };
    class LFM_ENDGRIDEDIT: MGVAR(RscEdit)
    {
        idc = LFM_DIA_IDC_ENDGRID;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 4) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};
        shadow = 0;

    };
    class LFM_BURSTNUMBEREDIT: MGVAR(RscEdit)
    {
        idc = LFM_DIA_IDC_BURSTNUMBER;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 5) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};
        shadow = 0;

    };
    class LFM_BURSTROUNDSEDIT: MGVAR(RscEdit)
    {
        idc = LFM_DIA_IDC_BURSTROUNDS;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 6) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};
        shadow = 0;

    };
    class LFM_BURSTDELAYEDIT: MGVAR(RscEdit)
    {
        idc = LFM_DIA_IDC_BURSTDELAY;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 7) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};
        shadow = 0;

    };
    class LFM_SPOTTINGDISTANCEDIT: MGVAR(RscEdit)
    {
        idc = LFM_DIA_IDC_SPOTTING;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 8) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};
        shadow = 0;

    };
    class LFM_CANCELBUTTON: MGVAR(RscButton)
    {

        shadow = 0;
        idc = 1600;
        text = "Cancel"; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 9) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;

            onMouseButtonDown = "[] call UO_FW_fnc_DIA_LineFiremissionCloseDialog;";
    };
};

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
