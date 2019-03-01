---
layout: default
title: Using Olsen Gear Scripts
nav_order: 2
parent: Modules
---

# Olsen Gear Scripts via the UO Framework

GearScript.sqf

```sqf
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
```

If you're porting gear scripts from the olsen framework you need to include this at the top of your GearScript.sqf file.

Next, if your gear scripts are not going solely within GearScript.sqf, add you must add a file called **``GearDef.hpp``** and add this code to it;

```sqf
#define random(MIN, MAX) \
([MIN, MAX] call FNC_RandomRange)

_temp = "";

#define SET_GROUP(groupName) _temp = #groupName + package;\
call compile format ['%1 = {
#define END_GROUP };', _temp]

#define ADD_GROUP(groupName) call call compile format ["%1", #groupName + package]

#define BEGIN_GEAR switch(_type) do {
#define END_GEAR };
_unit = _this select 0;
_type = _this select 1;

if (!local _unit) exitWith {};

FNC_AddItem = {([_unit, _type] + _this) call UO_FW_FNC_AddItemOrg;};
FNC_AddItemRandom = {([[_unit, _type]] + [_this]) call UO_FW_FNC_AddItemRandomOrg;};
FNC_GearScript = {_this call UO_FW_GearScript;};
```

Place this in a folder with your gear scripts such as ``loadouts``.

The path to your file would then be ``loadouts/GearDef.hpp``

