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
switch (_type) do {

	#include "loadouts\CustomLoadoutsOne.sqf"
	#include "loadouts\CustomLoadoutsTwo.sqf"
	#include "loadouts\CustomLoadoutsN.sqf"

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
