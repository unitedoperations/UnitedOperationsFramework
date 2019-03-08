---
layout: default
title: Using Olsen Gear Scripts
nav_order: 2
parent: Users
---

---

1. TOC
{:toc}

---

# Olsen Gear Scripts via the UO Framework
{: .text-blue-100 }

This page covers the basics of using Olsen gear-scripts through the UO Framework.

### Important Note
{: .fs-6 .text-blue-000 }
Mission-makers, you can always use the UO Framework ACE3 based loadouts system in conjunction with the Olsen Loadout system at the same time!

## Copying and Modifying Gear.sqf
{: .text-blue-100 }

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
{: .text-blue-100 }

**All Olsen framework function calls will automatically be converted to UO Framework calls so long as everything is properly included.**

### Settings
{: .text-blue-000 }

If you haven't already done so, select the UO Framework button at the top of the editor and select "Configure Gear".

Within the previous menu, open "Configure Gear Settings" where you need to check the "Enable Olsen System" checkbox.
<!-- ![CONFIGURE GEAR AND CONFIGURE GEAR SETTINGS IMAGE]({{ site.baseurl }}/resources/images/olsen/gear_configure.png){:class="img-responsive"} -->

<!-- ![ENABLE OLSEN FRAMEWORK IMAGE]({{ site.baseurl }}/resources/images/olsen/gear_enable.png){:class="img-responsive"} -->

### Olsen Loadouts as UO Framework Loadouts
{: .text-blue-000 }

You will need to specify the varnames for certain roles in the UOFW available rules. (These also include a few custom slots if needed.)
<!-- ![IMAGE OF VARNAMES FROM GEARSCRIPT IN FILE]({{ site.baseurl }}/resources/images/olsen/gear_varnames.png){:class="img-responsive"} -->

<!-- ![IMAGE OF VARNAMES FROM GEARSCRIPT IN ROLE SLOT]({{ site.baseurl }}/resources/images/olsen/gear_roles.png){:class="img-responsive"} -->

Next select the units you want to assign loadouts to through the UOFW system by going into the unit(s) attributes. Here you can specify what loadout the unit should be using or you can just directly call the var-name of the loadout you want the unit to use.
<!-- ![EXAMPLE IMAGES OF UNIT ATTRIBUTE SETTINGS]({{ site.baseurl }}/resources/images/olsen/gear_unit_attr.png){:class="img-responsive"} -->

Your equipment will be pre-loaded through the editor.

Randomized items will be randomized when gear is applied as you load into the briefing screen.
<!-- ![EXAMPLE IMAGES OF UNIT IN EDITOR]({{ site.baseurl }}/resources/images/olsen/gear_unit_ineditor.png){:class="img-responsive"} -->

<!-- ![EXAMPLE IMAGES OF UNIT IN GAME]({{ site.baseurl }}/resources/images/olsen/gear_unit_ingame.png){:class="img-responsive"} -->
 
---
