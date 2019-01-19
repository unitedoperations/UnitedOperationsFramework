////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Sacher, v1.063, #Dyroxu)
////////////////////////////////////////////////////////

#include "..\..\Global\defs.hpp"
class UO_FW_DIA_DONUTFIREMission
{
	idd = DFM_DIA_IDD_DISPLAY;
	movingEnable = false;
	enableSimulation = true;
	 scriptName = "Dialog_DonutFiremission";
	controlsBackground[] = {};
	objects[] = {};
	controls[] = {DFM_BACKGROUND,DFM_DESCRIPTIONTEXT,DFM_SELECTEDGUNTEXT,DFM_SELECTEDSHELLTEXT,DFM_GRIDTEXT,DFM_INNERRADIUSTEXT,DFM_OUTERRADIUSTEXT,DFM_BURSTNUMBERTEXT,DFM_BURSTROUNDSTEXT,
		DFM_DELAYTEXT,DFM_SPOTDISTTEXT,DFM_SELECTEDGUNEDIT,
		DFM_SELECTEDSHELLEDIT,DFM_GRIDEDIT,DFM_INNERRADIUSEDIT,DFM_OUTERRADIUSEDIT,DFM_BURSTNUMBEREDIT,DFM_BURSTROUNDSEDIT,DFM_BURSTDELAYEDIT,DFM_SPOTTINGDISTANCEDIT,DFM_FIREBUTTON,DFM_CANCELBUTTON};
		class DFM_BACKGROUND: UO_FW_RscText
		{
			idc = -1;
			x = ARTIWIDTHMainSPACE * safezoneW + safezoneX - ARTIBORDERTHICKNESS;
			y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 0) * safezoneH + safezoneY - ARTIBORDERTHICKNESS;
			w =  ( ARTILAYOUTWIDTH +  ARTILAYOUTWIDTHSPACE) *  safezoneW  + ARTIBORDERTHICKNESS * 2 ;
			h = ARTILAYOUTHEIGHTSPACE * 11 * safezoneH + ARTIBORDERTHICKNESS * 2 ;
			shadow = 0;
			colorBackground[] = {0.65,0.65,0.65,0.7};
		};
		class DFM_DESCRIPTIONTEXT: UO_FW_RscText
		{
			idc = -1;
			text = "Donut Firemission"; //--- ToDo: Localize;

			x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
			y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 0) * safezoneH + safezoneY;
			w = ARTILAYOUTWIDTH * safezoneW;
			h = ARTILAYOUTHEIGHT * safezoneH;
			colorText[] = {0,0,0,1};
			shadow = 0;
		};
	class DFM_SELECTEDGUNTEXT: UO_FW_RscText
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
	class DFM_SELECTEDSHELLTEXT: UO_FW_RscText
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
	class DFM_GRIDTEXT: UO_FW_RscText
	{
		idc = -1;
		text = "Targetgrid:"; //--- ToDo: Localize;
		x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
		y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 3) * safezoneH + safezoneY;
		w = ARTILAYOUTWIDTH * safezoneW;
		h = ARTILAYOUTHEIGHT * safezoneH;
		colorText[] = {0,0,0,1};
		shadow = 0;
	};
	class DFM_INNERRADIUSTEXT: UO_FW_RscText
	{
		idc = -1;
		text = "Inner radius:"; //--- ToDo: Localize;
		x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
		y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 4) * safezoneH + safezoneY;
		w = ARTILAYOUTWIDTH * safezoneW;
		h = ARTILAYOUTHEIGHT * safezoneH;
		colorText[] = {0,0,0,1};
		shadow = 0;
	};
	class DFM_OUTERRADIUSTEXT: UO_FW_RscText
	{
		idc = -1;
		text = "Outer radius:"; //--- ToDo: Localize;
		x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
		y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 5) * safezoneH + safezoneY;
		w = ARTILAYOUTWIDTH * safezoneW;
		h = ARTILAYOUTHEIGHT * safezoneH;
		colorText[] = {0,0,0,1};
		shadow = 0;
	};
	class DFM_BURSTNUMBERTEXT: UO_FW_RscText
	{
		idc = -1;
		text = "Number of salvos:"; //--- ToDo: Localize;
		x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
		y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 6) * safezoneH + safezoneY;
		w = ARTILAYOUTWIDTH * safezoneW;
		h = ARTILAYOUTHEIGHT * safezoneH;
		colorText[] = {0,0,0,1};
		shadow = 0;
	};
	class DFM_BURSTROUNDSTEXT: UO_FW_RscText
	{
		idc = -1;
		text = "Number of rounds per salvo:"; //--- ToDo: Localize;
		x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
		y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 7) * safezoneH + safezoneY;
		w = ARTILAYOUTWIDTH * safezoneW;
		h = ARTILAYOUTHEIGHT * safezoneH;
		colorText[] = {0,0,0,1};
		shadow = 0;
	};
	class DFM_DELAYTEXT: UO_FW_RscText
	{
		idc = -1;
		text = "Delay between salvos:"; //--- ToDo: Localize;
		x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
		y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 8) * safezoneH + safezoneY;
		w = ARTILAYOUTWIDTH * safezoneW;
		h = ARTILAYOUTHEIGHT * safezoneH;
		colorText[] = {0,0,0,1};
		shadow = 0;
	};
	class DFM_SPOTDISTTEXT: UO_FW_RscText
	{
		idc = -1;
		text = "Minimum spotting round distance:"; //--- ToDo: Localize;
		x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
		y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 9) * safezoneH + safezoneY;
		w = ARTILAYOUTWIDTH * safezoneW;
		h = ARTILAYOUTHEIGHT * safezoneH;
		colorText[] = {0,0,0,1};
		shadow = 0;
	};
	class DFM_FIREBUTTON: UO_FW_RscButton
	{
		idc = 1430;
		text = "Fire Artillery"; //--- ToDo: Localize;
		x = ARTIWIDTHMainSPACE * safezoneW + safezoneX;
		y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 10) * safezoneH + safezoneY;
		w = ARTILAYOUTWIDTH * safezoneW;
		h = ARTILAYOUTHEIGHT * safezoneH;
			onMouseButtonDown = "[] call UO_FW_fnc_DIA_DonutFiremissionFire;";
	};
	class DFM_SELECTEDGUNEDIT: UO_FW_RscListbox
	{
		idc = DFM_DIA_IDC_GUNSELECT;
		text = ""; //--- ToDo: Localize;
		x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
		y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 1) * safezoneH + safezoneY;
		w = ARTILAYOUTWIDTH * safezoneW;
		h = ARTILAYOUTHEIGHT * safezoneH;
		//colorText[] = {0,1,1,1};
		//colorBackground[] = {1,1,1,1};
		//colorActive[] = {0,1,0,1};
		onLBSelChanged = "(_this select 1) call UO_FW_fnc_DIA_DonutFiremissionSetArtillery;";
	};
	class DFM_SELECTEDSHELLEDIT: UO_FW_RscListbox
	{
		idc = DFM_DIA_IDC_SHELLSELECT;
		text = ""; //--- ToDo: Localize;
		x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
		y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 2) * safezoneH + safezoneY;
		w = ARTILAYOUTWIDTH * safezoneW;
		h = ARTILAYOUTHEIGHT * safezoneH;
	};
	class DFM_GRIDEDIT: UO_FW_RscEdit
	{
		idc = DFM_DIA_IDC_GRID;
		text = ""; //--- ToDo: Localize;
		x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
		y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 3) * safezoneH + safezoneY;
		w = ARTILAYOUTWIDTH * safezoneW;
		h = ARTILAYOUTHEIGHT * safezoneH;
		colorText[] = {0,0,0,1};
		shadow = 0;
	};
	class DFM_INNERRADIUSEDIT: UO_FW_RscEdit
	{
		idc = DFM_DIA_IDC_INNERRADIUS;
		text = ""; //--- ToDo: Localize;
		x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
		y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 4) * safezoneH + safezoneY;
		w = ARTILAYOUTWIDTH * safezoneW;
		h = ARTILAYOUTHEIGHT * safezoneH;
		colorText[] = {0,0,0,1};
		shadow = 0;
	};
	class DFM_OUTERRADIUSEDIT: UO_FW_RscEdit
	{
		idc = DFM_DIA_IDC_OUTERRADIUS;
		text = ""; //--- ToDo: Localize;
		x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
		y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 5) * safezoneH + safezoneY;
		w = ARTILAYOUTWIDTH * safezoneW;
		h = ARTILAYOUTHEIGHT * safezoneH;
		colorText[] = {0,0,0,1};
		shadow = 0;
	};
	class DFM_BURSTNUMBEREDIT: UO_FW_RscEdit
	{
		idc = DFM_DIA_IDC_BURSTNUMBER;
		text = ""; //--- ToDo: Localize;
		x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
		y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 6) * safezoneH + safezoneY;
		w = ARTILAYOUTWIDTH * safezoneW;
		h = ARTILAYOUTHEIGHT * safezoneH;
		colorText[] = {0,0,0,1};
		shadow = 0;
	};
	class DFM_BURSTROUNDSEDIT: UO_FW_RscEdit
	{
		idc = DFM_DIA_IDC_BURSTROUNDS;
		text = ""; //--- ToDo: Localize;
		x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
		y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 7) * safezoneH + safezoneY;
		w = ARTILAYOUTWIDTH * safezoneW;
		h = ARTILAYOUTHEIGHT * safezoneH;
		colorText[] = {0,0,0,1};
		shadow = 0;
	};
	class DFM_BURSTDELAYEDIT: UO_FW_RscEdit
	{
		idc = DFM_DIA_IDC_BURSTDELAY;
		text = ""; //--- ToDo: Localize;
		x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
		y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 8) * safezoneH + safezoneY;
		w = ARTILAYOUTWIDTH * safezoneW;
		h = ARTILAYOUTHEIGHT * safezoneH;
		colorText[] = {0,0,0,1};
		shadow = 0;
	};
	class DFM_SPOTTINGDISTANCEDIT: UO_FW_RscEdit
	{
		idc = DFM_DIA_IDC_SPOTTING;
		text = ""; //--- ToDo: Localize;
		x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
		y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 9) * safezoneH + safezoneY;
		w = ARTILAYOUTWIDTH * safezoneW;
		h = ARTILAYOUTHEIGHT * safezoneH;
		colorText[] = {0,0,0,1};
		shadow = 0;
	};
	class DFM_CANCELBUTTON: UO_FW_RscButton
	{
		idc = 1600;
		text = "Cancel"; //--- ToDo: Localize;
		x = (ARTIWIDTHMainSPACE + ARTILAYOUTWIDTHSPACE) * safezoneW + safezoneX;
		y = (ARTIHEIGHTMainSPACE + ARTILAYOUTHEIGHTSPACE * 10) * safezoneH + safezoneY;
		w = ARTILAYOUTWIDTH * safezoneW;
		h = ARTILAYOUTHEIGHT * safezoneH;

			onMouseButtonDown = "[] call UO_FW_fnc_DIA_DonutFiremissionCloseDialog;";
	};
};

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
