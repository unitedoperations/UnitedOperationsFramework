////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Sacher, v1.063, #Dyroxu)
////////////////////////////////////////////////////////

#include "..\..\Global\defs.hpp"
class UO_FW_DIA_POLARFIREMission
{
    idd = POFM_DIA_IDD_DISPLAY;
    movingEnable = false;
    enableSimulation = true;
     scriptName = "Dialog_PolarFiremission";
    controlsBackground[] = {};
    objects[] = {};
    controls[] = {POFM_BACKGROUND,POFM_DESCRIPTIONTEXT,POFM_SELECTEDGUNTEXT,POFM_SELECTEDSHELLTEXT,POFM_GRIDTEXT,POFM_MILSTEXT,POFM_DISTANCETEXT,POFM_DISPERSIONTEXT,POFM_BURSTNUMBERTEXT,POFM_BURSTROUNDSTEXT,
        POFM_DELAYTEXT,POFM_SPOTDISTTEXT,POFM_SELECTEDGUNEDIT,POFM_SELECTEDSHELLEDIT,POFM_GRIDEDIT,POFM_MILSEDIT,POFM_DISTANCEEDIT,POFM_DISPERSIONEDIT,POFM_BURSTNUMBEREDIT,POFM_BURSTROUNDSEDIT,
        POFM_BURSTDELAYEDIT,POFM_SPOTTINGDISTANCEDIT,POFM_FIREBUTTON,POFM_CANCELBUTTON};
        class POFM_BACKGROUND: MGVAR(RscText)
        {
            idc = -1;
            x = ARTIWIDTHMainSPACE * safezoneW + safezoneX - ARTIBORDERTHICKNESS;
            y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 0) * safezoneH + safezoneY - ARTIBORDERTHICKNESS;
            w =  ( ARTILAYOUTWIDTH +  ARTILAYOUTWIDTHSPACE) *  safezoneW  + ARTIBORDERTHICKNESS * 2 ;
            h = ARTILAYOUTHEIGHTSPACE * 12 * safezoneH + ARTIBORDERTHICKNESS * 2 ;
                shadow = 0;
            colorBackground[] = {0.65,0.65,0.65,0.7};
        };
        class POFM_DESCRIPTIONTEXT: MGVAR(RscText)
        {
            idc = -1;
            text = "Polar Firemission"; //--- ToDo: Localize;

            x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
            y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 0) * safezoneH + safezoneY;
            w = ARTILAYOUTWIDTH * safezoneW;
            h = ARTILAYOUTHEIGHT * safezoneH;
            colorText[] = {0,0,0,1};

    shadow = 0;

        };
    class POFM_SELECTEDGUNTEXT: MGVAR(RscText)
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
    class POFM_SELECTEDSHELLTEXT: MGVAR(RscText)
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
    class POFM_GRIDTEXT: MGVAR(RscText)
    {
        idc = -1;
        text = "Caller Grid:"; //--- ToDo: Localize;
        x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 3) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};

    shadow = 0;
    };
    class POFM_MILSTEXT: MGVAR(RscText)
    {
        idc = -1;
        text = "Mils:"; //--- ToDo: Localize;
        x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 4) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};

    shadow = 0;
    };
    class POFM_DISTANCETEXT: MGVAR(RscText)
    {
        idc = -1;
        text = "Distance:"; //--- ToDo: Localize;
        x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 5) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};

    shadow = 0;
    };
    class POFM_DISPERSIONTEXT: MGVAR(RscText)
    {
        idc = -1;
        text = "Dispersion:"; //--- ToDo: Localize;
        x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 6) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};

    shadow = 0;
    };
    class POFM_BURSTNUMBERTEXT: MGVAR(RscText)
    {
        idc = -1;
        text = "Number of salvos:"; //--- ToDo: Localize;
        x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 7) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};

    shadow = 0;
    };
    class POFM_BURSTROUNDSTEXT: MGVAR(RscText)
    {
        idc = -1;
        text = "Number of rounds per salvo:"; //--- ToDo: Localize;
        x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 8) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};

    shadow = 0;
    };
    class POFM_DELAYTEXT: MGVAR(RscText)
    {
        idc = -1;
        text = "Delay between salvos:"; //--- ToDo: Localize;
        x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 9) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};

    shadow = 0;
    };
    class POFM_SPOTDISTTEXT: MGVAR(RscText)
    {
        idc = -1;
        text = "Minimum spotting round distance:"; //--- ToDo: Localize;
        x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 10) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};

    shadow = 0;
    };
    class POFM_FIREBUTTON: MGVAR(RscButton)
    {
        idc = 1430;
        text = "Fire Artillery"; //--- ToDo: Localize;
        x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 11) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
    shadow = 0;
            onMouseButtonDown = "[] call UO_FW_fnc_DIA_PolarFiremissionFire;";
    };
    class POFM_SELECTEDGUNEDIT: MGVAR(RscListbox)
    {
        idc = POFM_DIA_IDC_GUNSELECT;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 1) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        //colorText[] = {0,1,1,1};
        //
        shadow = 0;
        onLBSelChanged = "(_this select 1) call UO_FW_fnc_DIA_PolarFiremissionSetArtillery;";
    };
    class POFM_SELECTEDSHELLEDIT: MGVAR(RscListbox)
    {
        idc = POFM_DIA_IDC_SHELLSELECT;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 2) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
            shadow = 0;
    };
    class POFM_GRIDEDIT: MGVAR(RscEdit)
    {
        idc = POFM_DIA_IDC_GRID;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 3) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};

    shadow = 0;
    };
    class POFM_MILSEDIT: MGVAR(RscEdit)
    {
        idc = POFM_DIA_IDC_MILS;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 4) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};

    shadow = 0;
    };
    class POFM_DISTANCEEDIT: MGVAR(RscEdit)
    {
        idc = POFM_DIA_IDC_DISTANCE;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 5) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};

    shadow = 0;
    };
    class POFM_DISPERSIONEDIT: MGVAR(RscEdit)
    {
        idc = POFM_DIA_IDC_DISPERSION;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 6) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};

    shadow = 0;
    };
    class POFM_BURSTNUMBEREDIT: MGVAR(RscEdit)
    {
        idc = POFM_DIA_IDC_BURSTNUMBER;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 7) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};

    shadow = 0;
    };
    class POFM_BURSTROUNDSEDIT: MGVAR(RscEdit)
    {
        idc = POFM_DIA_IDC_BURSTROUNDS;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 8) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};

    shadow = 0;
    };
    class POFM_BURSTDELAYEDIT: MGVAR(RscEdit)
    {
        idc = POFM_DIA_IDC_BURSTDELAY;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 9) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};


    shadow = 0;
    };
    class POFM_SPOTTINGDISTANCEDIT: MGVAR(RscEdit)
    {
        idc = POFM_DIA_IDC_SPOTTING;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 10) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};

    shadow = 0;
    };
    class POFM_CANCELBUTTON: MGVAR(RscButton)
    {
        idc = 1600;
        text = "Cancel"; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 11) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
    shadow = 0;
            onMouseButtonDown = "[] call UO_FW_fnc_DIA_PolarFiremissionCloseDialog;";
    };
};

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
