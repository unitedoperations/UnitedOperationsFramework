//3DEN Attribute Config Defines
#define SCENARIO_EXPRESSION "missionNamespace setVariable ['%s', _value];"

#define ENTITY_EXPRESSION "_propertyName = '%s'; _this setVariable [_propertyName, _value];"

#define OBJECT_FNC_EXPRESSION(var1,var2) QUOTE(\
private _propertyname = '%s';\
_this setVariable [ARR_2(_propertyName,_value)];\
[ARR_2(_this,_value)] call EFUNC(var1,var2);\
)

#define MODULE_EXPRESSION "_this setVariable ['%s', _value, true];"

#define CFGFUNCFOLDERCORE(FolderName)\
__EXEC(_TEMPMODULE = "Core")\
__EXEC(_MODULESTR = "")\
__EXEC(_TEMPFOLDER = #FolderName)\
class DOUBLES(Core,FolderName) {\
    file = QUOTE(\x\PREFIX\addons\Main\Core\cfgFunctions\FolderName)

#define CFGFUNCFOLDER(ModuleName,FolderName)\
__EXEC(_TEMPMODULE = #ModuleName)\
__EXEC(_MODULESTR = "Module")\
__EXEC(_TEMPFOLDER = #FolderName)\
class DOUBLES(ModuleName,FolderName) {\
    file = QUOTE(\x\UO_FW\addons\Main\ModuleName##Module\cfgFunctions\FolderName)

#define CFGFUNC(ModuleName,FunctionName)\
    __EXEC(_TEMPFNC = #FunctionName)\
    class DOUBLES(ModuleName,FunctionName) {\
    	scope = 1;\
    	file = __EVAL("\x\PREFIX\addons\Main\" + _TEMPMODULE + _MODULESTR + "\cfgFunctions\" + _TEMPFOLDER + "\fn_" + #FunctionName + ".sqf");\
    }

#define CFGFUNCFOLDEREND\
}
