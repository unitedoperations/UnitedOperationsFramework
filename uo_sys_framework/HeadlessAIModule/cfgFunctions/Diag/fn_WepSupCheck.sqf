//Created on 8/4/2016: Detecting if a unit has a suppressor or not.
private _ItemList = weaponsitems _this;
private _Return = true;

if (((_ItemList select 0) select 1) isEqualTo "") then {_Return = false;};
_Return
