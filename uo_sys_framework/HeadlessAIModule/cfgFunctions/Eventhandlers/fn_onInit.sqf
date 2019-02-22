#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(HC);

if !(local _this) exitwith {};
if (isNil "UO_FW_AI_ActiveList") then {
    UO_FW_AI_ActiveList = [_this];
} else {
    UO_FW_AI_ActiveList append _this;
};
