---
layout: default
title: Using Olsen Gear Scripts
nav_order: 2
parent: Users
---

---

EXAMPLE/TUTORIAL VIDEO FOR THIS PAGE

<!-- Should video be at the top or the bottom of the page(s) ? -->

# Olsen Gear Scripts via the UO Framework

Copy your ``gear.sqf`` and the accompanying ``loadouts`` folder accompanying it into your mission folder. As long as you include the loadouts you want through the gear script you should be fine.

This is what a default ``gear.sqf`` looks like.

```
//A default gear.sqf file

#include "core\gearCore.sqf" //REMOVE THIS LINE!!!

//...

//when set to false, facewear types that are whitelisted will not be removed
FW_force_remove_facewear = false;

//forces adding an item to inventory. Works only if container is specified!
FW_enableOverfill = false;

_unit call FNC_RemoveAllGear;

switch (_type) do {

	#include "loadouts\RURiflePlatoon.sqf"
	#include "loadouts\UKRMechInf.sqf"

};
```

Your gear.sqf should look like the below code.

```
_unit call FNC_RemoveAllGear;

switch (_type) do {

	#include "loadouts\RURiflePlatoon.sqf"
	#include "loadouts\UKRMechInf.sqf"

};
```

Ensure that your main gear file is called ``gear.sqf``, that it is located in your misson root and lastly, that it includes all the relevant loadouts you want to use.

All Olsen framework function calls will automatically be converted to UO Framework calls so long as everything is properly included.

Now, select the UO Framework button at the top of the editor and select "Configure Gear", followed by "Configure Gear Settings" where you need to check the "Enable Olsen System" checkbox.

EXAMPLE IMAGE(S) OF ENABLING THE OLSEN GEAR SYSTEM

You will need to specify the varnames for certain roles in the UOFW available rules. (These also include a few custom slots if needed.)

EXAMPLE IMAGE(S) OF UNIT ROLES USING OLSEN VARNAMES

Next select the units you want to assign loadouts to through the UOFW system by going into the unit(s) attributes. Here you can specify what loadout the unit should be using or you can just directly call the var-name of the loadout you want the unit to use.

EXAMPLE IMAGES OF UNIT ATTRIBUTE SETTINGS

Load your mission into multiplayer and your gear will be added to all AI and playable units you specified.

EXAMPLE IMAGES OF UNIT(S) LOADED IN WITH UOFW BASED GEAR

# Important Note
Mission-makers, you can always use the UOFW ACE3 based loadouts system in conjunction with the Olsen Loadout system at the same time!
