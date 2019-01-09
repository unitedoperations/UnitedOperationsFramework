class UO_FW_GearInit
{
	file = "\x\UO_FW\addons\main\GearModule\cfgFunctions\common";
	class GearInit {postInit = 1;};
};
class UO_FW_ACE_GearFunctionsAttributes
{
	file = "\x\UO_FW\addons\main\GearModule\cfgFunctions\ACE_Arsenal";
	class GearTypeLoadfromAttribute {};
};
class UO_FW_OlsenGearFunctions
{
	file = "\x\UO_FW\addons\main\GearModule\cfgFunctions\Olsen";
	class OlsenGearScript {};
	class addItemOrg {};
	class addItemRandomOrg {};
	class addItemVehicleOrg {};
	class addItemVehicleRandomOrg {};
	class canAttachItem {};
	class canLinkItem {};
	class checkClassname {};
	class removeAllGear {};
	class removeAllVehicleGear {};
};
