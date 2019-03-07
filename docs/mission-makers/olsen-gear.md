---
layout: default
title: Using Olsen Gear Scripts
nav_order: 2
parent: Users
---

---

<!-- EXAMPLE/TUTORIAL VIDEO FOR THIS PAGE -->

<!-- Should video be at the top or the bottom of the page(s) ? -->

<!-- # Olsen Gear Scripts via the UO Framework -->

## Copying and Modifying Gear.sqf

Copy your ``gear.sqf`` and the accompanying ``loadouts`` folder accompanying it into your mission folder. As long as you include the loadouts you want through the gear script you should be fine.

Your gear.sqf should look like the below code.

```
#define random(MIN, MAX) \
([MIN, MAX] call UO_FW_FNC_RandomRange)
_temp = "";
#define SET_GROUP(groupName) _temp = #groupName + package;\
call compile format ['%1 = {
#define END_GROUP };', _temp]
#define ADD_GROUP(groupName) call call compile format ["%1", #groupName + package]
private ["_unit", "_type", "_groupId"];

_unit = _this select 0;
_type = _this select 1;

if (!local _unit) exitWith {};

_unit setVariable ["BIS_enableRandomization", false];
_unit setVariable ["UO_FW_Loadout", _type, true];

FNC_AddItem = {([_unit, _type] + _this) call UO_FW_FNC_AddItemOrg;};
FNC_AddItemRandom = {([[_unit, _type]] + [_this]) call UO_FW_FNC_AddItemRandomOrg;};

_unit call UO_FW_FNC_RemoveAllGear;
//If you don't wish to remove the unit gear by default you can comment out the above line

switch (_type) do {

	#include "loadouts\CustomLoadoutsOne.sqf"
	#include "loadouts\CustomLoadoutsTwo.sqf"

};
```

Ensure that your main gear file:
1. Is titled ``gear.sqf``
 - or matches the root gear filename/path specified in ``UOFW -> Configure Gear -> NAME OF TEXTBOX HERE``
2. Is located in your mission root folder with ``mission.sqm``

Ex: ``MissionNameExample.IslandName/gear.sqf``

It also must include all the relevant loadouts you want to use within your ``loadouts`` folder.

```
//...
switch (_type) do {

	#include "loadouts\CustomLoadoutsOne.sqf"
	#include "loadouts\CustomLoadoutsTwo.sqf"

};
```

## Specifying Olsen Loadouts as UOFW Loadouts

**All Olsen framework function calls will automatically be converted to UO Framework calls so long as everything is properly included.**

Now, select the UO Framework button at the top of the editor and select "Configure Gear", followed by "Configure Gear Settings" where you need to check the "Enable Olsen System" checkbox.

EXAMPLE IMAGE(S) OF ENABLING THE OLSEN GEAR SYSTEM

You will need to specify the varnames for certain roles in the UOFW available rules. (These also include a few custom slots if needed.)

EXAMPLE IMAGE(S) OF UNIT ROLES USING OLSEN VARNAMES

Next select the units you want to assign loadouts to through the UOFW system by going into the unit(s) attributes. Here you can specify what loadout the unit should be using or you can just directly call the var-name of the loadout you want the unit to use.

EXAMPLE IMAGES OF UNIT ATTRIBUTE SETTINGS

Load your mission into multiplayer and your gear will be added to all AI and playable units you specified.

EXAMPLE IMAGES OF UNIT(S) LOADED IN WITH UOFW BASED GEAR

---

# Important Note
Mission-makers, you can always use the UO Framework ACE3 based loadouts system in conjunction with the Olsen Loadout system at the same time!
