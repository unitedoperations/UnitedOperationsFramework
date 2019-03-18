////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Sacher, v1.063, #Dyroxu)
////////////////////////////////////////////////////////

#include "..\..\Global\defs.hpp"
class UO_FW_DIA_POINTFIREMission
{
    idd = PFM_DIA_IDD_DISPLAY;
    movingEnable = false;
    enableSimulation = true;
     scriptName = "Dialog_PointFiremission";
    controlsBackground[] = {};
    objects[] = {};
    controls[] = {PFM_BACKGROUND,PFM_DESCRIPTIONTEXT,PFM_SELECTEDGUNTEXT,PFM_SELECTEDSHELLTEXT,PFM_GRIDTEXT,PFM_DISPERSIONTEXT,PFM_BURSTNUMBERTEXT,PFM_BURSTROUNDSTEXT,
        PFM_DELAYTEXT,PFM_SPOTDISTTEXT,PFM_SELECTEDGUNEDIT,PFM_SELECTEDSHELLEDIT,PFM_GRIDEDIT,PFM_DISPERSIONEDIT,PFM_BURSTNUMBEREDIT,PFM_BURSTROUNDSEDIT,
        PFM_BURSTDELAYEDIT,PFM_SPOTTINGDISTANCEDIT,PFM_FIREBUTTON,PFM_CANCELBUTTON};
        class PFM_BACKGROUND: MGVAR(RscText)
        {
            idc = -1;
            x = ARTIWIDTHMainSPACE * safezoneW + safezoneX - ARTIBORDERTHICKNESS;
            y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 0) * safezoneH + safezoneY - ARTIBORDERTHICKNESS;
            w =  ( ARTILAYOUTWIDTH +  ARTILAYOUTWIDTHSPACE) *  safezoneW  + ARTIBORDERTHICKNESS * 2 ;
            h = ARTILAYOUTHEIGHTSPACE * 10 * safezoneH + ARTIBORDERTHICKNESS * 2 ;
                shadow = 0;
            colorBackground[] = {0.65,0.65,0.65,0.7};
        };
        class PFM_DESCRIPTIONTEXT: MGVAR(RscText)
        {
            idc = -1;
            text = "Point Firemission"; //--- ToDo: Localize;

            x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
            y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 0) * safezoneH + safezoneY;
            w = ARTILAYOUTWIDTH * safezoneW;
            h = ARTILAYOUTHEIGHT * safezoneH;
            colorText[] = {0,0,0,1};

    shadow = 0;

        };
    class PFM_SELECTEDGUNTEXT: MGVAR(RscText)
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
    class PFM_SELECTEDSHELLTEXT: MGVAR(RscText)
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
    class PFM_GRIDTEXT: MGVAR(RscText)
    {
        idc = -1;
        text = "Grid:"; //--- ToDo: Localize;
        x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 3) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};

    shadow = 0;
    };
    class PFM_DISPERSIONTEXT: MGVAR(RscText)
    {
        idc = -1;
        text = "Dispersion:"; //--- ToDo: Localize;
        x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 4) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};

    shadow = 0;
    };
    class PFM_BURSTNUMBERTEXT: MGVAR(RscText)
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
    class PFM_BURSTROUNDSTEXT: MGVAR(RscText)
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
    class PFM_DELAYTEXT: MGVAR(RscText)
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
    class PFM_SPOTDISTTEXT: MGVAR(RscText)
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
    class PFM_FIREBUTTON: MGVAR(RscButton)
    {
        idc = 1430;
        text = "Fire Artillery"; //--- ToDo: Localize;
        x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 9) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        shadow = 0;
        onMouseButtonDown = "[] call UO_FW_fnc_DIA_PointFiremissionFire;";
    };
    class PFM_SELECTEDGUNEDIT: MGVAR(RscListbox)
    {
        idc = PFM_DIA_IDC_GUNSELECT;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 1) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        //colorText[] = {0,1,1,1};
        //
        shadow = 0;
        onLBSelChanged = "(_this select 1) call UO_FW_fnc_DIA_PointFiremissionSetArtillery;";
    };
    class PFM_SELECTEDSHELLEDIT: MGVAR(RscListbox)
    {
        idc = PFM_DIA_IDC_SHELLSELECT;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 2) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
            shadow = 0;
    };
    class PFM_GRIDEDIT: MGVAR(RscEdit)
    {
        idc = PFM_DIA_IDC_GRID;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 3) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};

    shadow = 0;
    };
    class PFM_DISPERSIONEDIT: MGVAR(RscEdit)
    {
        idc = PFM_DIA_IDC_DISPERSION;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 4) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};

    shadow = 0;
    };
    class PFM_BURSTNUMBEREDIT: MGVAR(RscEdit)
    {
        idc = PFM_DIA_IDC_BURSTNUMBER;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 5) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};

    shadow = 0;
    };
    class PFM_BURSTROUNDSEDIT: MGVAR(RscEdit)
    {
        idc = PFM_DIA_IDC_BURSTROUNDS;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 6) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};

    shadow = 0;
    };
    class PFM_BURSTDELAYEDIT: MGVAR(RscEdit)
    {
        idc = PFM_DIA_IDC_BURSTDELAY;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 7) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};


    shadow = 0;
    };
    class PFM_SPOTTINGDISTANCEDIT: MGVAR(RscEdit)
    {
        idc = PFM_DIA_IDC_SPOTTING;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 8) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};

    shadow = 0;
    };
    class PFM_CANCELBUTTON: MGVAR(RscButton)
    {
        idc = 1600;
        text = "Cancel"; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 9) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
    shadow = 0;
            onMouseButtonDown = "[] call UO_FW_fnc_DIA_PointFiremissionCloseDialog;";
    };
};

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
