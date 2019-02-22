#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);

params ["_unit"];
private _NotDriver = false;
private _Vehicle = (vehicle _Unit);
private _ActualDriver = driver _Vehicle;
if (_Unit isEqualTo _ActualDriver) then  {
  _NotDriver = true;
};
_NotDriver
