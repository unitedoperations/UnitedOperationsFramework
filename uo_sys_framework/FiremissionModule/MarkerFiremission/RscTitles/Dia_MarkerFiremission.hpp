////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Sacher, v1.063, #Dyroxu)
////////////////////////////////////////////////////////
#include "..\..\Global\defs.hpp"
class UO_FW_DIA_MARKERFIREMission
{
    idd = MFM_DIA_IDD_DISPLAY;
    movingEnable = false;
    enableSimulation = true;
     scriptName = "Dialog_MarkerFiremission";
    controlsBackground[] = {};
    objects[] = {};
    controls[] = {MFM_BACKGROUND,MFM_DESCRIPTIONTEXT,MFM_SELECTEDGUNTEXT,MFM_SELECTEDSHELLTEXT,MFM_MARKERTEXT,MFM_DISPERSIONTEXT,MFM_BURSTNUMBERTEXT,MFM_BURSTROUNDSTEXT,
        MFM_DELAYTEXT,MFM_SPOTDISTTEXT,MFM_SELECTEDGUNEDIT,MFM_SELECTEDSHELLEDIT,MFM_NAMEEDIT,MFM_DISPERSIONEDIT,MFM_BURSTNUMBEREDIT,MFM_BURSTROUNDSEDIT,
        MFM_BURSTDELAYEDIT,MFM_SPOTTINGDISTANCEDIT,MFM_FIREBUTTON,MFM_CANCELBUTTON};
        class MFM_BACKGROUND: MGVAR(RscText)
        {
            idc = -1;
            x = ARTIWIDTHMainSPACE * safezoneW + safezoneX - ARTIBORDERTHICKNESS;
            y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 0) * safezoneH + safezoneY - ARTIBORDERTHICKNESS;
            w =  ( ARTILAYOUTWIDTH +  ARTILAYOUTWIDTHSPACE) *  safezoneW  + ARTIBORDERTHICKNESS * 2 ;
            h = ARTILAYOUTHEIGHTSPACE * 10 * safezoneH + ARTIBORDERTHICKNESS * 2 ;
                shadow = 0;
            colorBackground[] = {0.65,0.65,0.65,0.7};
        };
        class MFM_DESCRIPTIONTEXT: MGVAR(RscText)
        {
            idc = -1;
            text = "Marker Firemission"; //--- ToDo: Localize;

            x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
            y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 0) * safezoneH + safezoneY;
            w = ARTILAYOUTWIDTH * safezoneW;
            h = ARTILAYOUTHEIGHT * safezoneH;
            colorText[] = {0,0,0,1};

    shadow = 0;

        };
    class MFM_SELECTEDGUNTEXT: MGVAR(RscText)
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
    class MFM_SELECTEDSHELLTEXT: MGVAR(RscText)
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
    class MFM_MARKERTEXT: MGVAR(RscText)
    {
        idc = -1;
        text = "Marker name:"; //--- ToDo: Localize;
        x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 3) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};

    shadow = 0;
    };
    class MFM_DISPERSIONTEXT: MGVAR(RscText)
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
    class MFM_BURSTNUMBERTEXT: MGVAR(RscText)
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
    class MFM_BURSTROUNDSTEXT: MGVAR(RscText)
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
    class MFM_DELAYTEXT: MGVAR(RscText)
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
    class MFM_SPOTDISTTEXT: MGVAR(RscText)
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
    class MFM_FIREBUTTON: MGVAR(RscButton)
    {
        idc = 1430;
        text = "Fire Artillery"; //--- ToDo: Localize;
        x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 9) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
    shadow = 0;
            onMouseButtonDown = "[] call UO_FW_fnc_DIA_MarkerFiremissionFire;";
    };
    class MFM_SELECTEDGUNEDIT: MGVAR(RscListbox)
    {
        idc = MFM_DIA_IDC_GUNSELECT;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 1) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        //colorText[] = {0,1,1,1};
        //
        shadow = 0;
        onLBSelChanged = "(_this select 1) call UO_FW_fnc_DIA_MarkerFiremissionSetArtillery;";
    };
    class MFM_SELECTEDSHELLEDIT: MGVAR(RscListbox)
    {
        idc = MFM_DIA_IDC_SHELLSELECT;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 2) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
            shadow = 0;
    };
    class MFM_NAMEEDIT: MGVAR(RscEdit)
    {
        idc = MFM_DIA_IDC_NAME;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 3) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};

    shadow = 0;
    };
    class MFM_DISPERSIONEDIT: MGVAR(RscEdit)
    {
        idc = MFM_DIA_IDC_DISPERSION;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 4) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};

    shadow = 0;
    };
    class MFM_BURSTNUMBEREDIT: MGVAR(RscEdit)
    {
        idc = MFM_DIA_IDC_BURSTNUMBER;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 5) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};

    shadow = 0;
    };
    class MFM_BURSTROUNDSEDIT: MGVAR(RscEdit)
    {
        idc = MFM_DIA_IDC_BURSTROUNDS;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 6) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};

    shadow = 0;
    };
    class MFM_BURSTDELAYEDIT: MGVAR(RscEdit)
    {
        idc = MFM_DIA_IDC_BURSTDELAY;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 7) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};


    shadow = 0;
    };
    class MFM_SPOTTINGDISTANCEDIT: MGVAR(RscEdit)
    {
        idc = MFM_DIA_IDC_SPOTTING;
        text = ""; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 8) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
        colorText[] = {0,0,0,1};

    shadow = 0;
    };
    class MFM_CANCELBUTTON: MGVAR(RscButton)
    {
        idc = 1600;
        text = "Cancel"; //--- ToDo: Localize;
        x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
        y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 9) * safezoneH + safezoneY;
        w = ARTILAYOUTWIDTH * safezoneW;
        h = ARTILAYOUTHEIGHT * safezoneH;
    shadow = 0;
            onMouseButtonDown = "[] call UO_FW_fnc_DIA_MarkerFiremissionCloseDialog;";
    };
};

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
