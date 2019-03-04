---
layout: default
title: Using Olsen Gear Scripts
nav_order: 2
parent: Users
---

---

EXAMPLE/TUTORIAL VIDEO FOR THIS PAGE


<!-- Should video be at the top or the bottom of the page(s) ? -->
	
1. TOC
{:toc}

# Olsen Gear Scripts via the UO Framework

## Step 1
```
//GearScript.sqf
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

## Step 2

Next, if your gear scripts are not going solely within GearScript.sqf, add you must add a file called **``GearDef.hpp``** and add this code to it;

```
//GearDef.hpp
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

## Step 3

Select the UO Framework button at the top of the editor and select "Configure Gear", followed by "Configure Gear Settings" where you need to check the "Enable Olsen System" checkbox.

EXAMPLE IMAGE(S) OF ENABLING THE OLSEN GEAR SYSTEM

After selecting the Olsen gear system, add whatever gearscripts (.sqf files) you want in the folder alongside ``GearDef.hpp``.

You will need to specify the varnames for certain roles in the UOFW available rules. (These also include a few custom slots if needed.)

EXAMPLE IMAGE(S) OF UNIT ROLES USING OLSEN VARNAMES

Next select the units you want to assign loadouts to through the UOFW system by going into the unit(s) attributes. Here you can specify what loadout the unit should be using or you can just directly call the var-name of the loadout you want the unit to use.

EXAMPLE IMAGES OF UNIT ATTRIBUTE SETTINGS

Load your mission into multiplayer and your gear will be added to all AI and playable units you specified.

EXAMPLE IMAGES OF UNIT(S) LOADED IN WITH UOFW BASED GEAR

# Important Note
Mission-makers, you can always use the UOFW ACE3 based loadouts system in conjunction with the Olsen Loadout system at the same time!
