---
layout: default
title: Gear Module
nav_order: 7
parent: Core Modules
permalink: /docs/toc/core/gear/
# grand_parent: Modules
---

---

1. TOC
{:toc}

---

# Users

## Features

Here are just a few of the features the gear module provides:
- ACE Arsenal Loadout System
- Olsen Framework Loadout Support
- Feature Three
- Feature Four

## Usage

### Using ACE Arsenal Loadouts

Text here.

### Using Olsen Loadouts

#### Settings

If you haven't already done so, select the UO Framework button at the top of the editor and select "Configure Gear".

![CONFIGURE GEAR AND CONFIGURE GEAR SETTINGS IMAGE]({{ site.baseurl }}/resources/images/olsen/gear_configure.png){:class="img-responsive"}

Within the previous menu, open "Configure Gear Settings" where you need to check the "Enable Olsen System" checkbox.

![ENABLE OLSEN FRAMEWORK IMAGE]({{ site.baseurl }}/resources/images/olsen/gear_enable.png){:class="img-responsive"}

#### Olsen Loadouts as UO Framework Loadouts

```
//AUTHOR: Gkenny
//Early 2000s MSV
//...
//[this, "AFGVDV_RPG"] call FNC_GearScript;
//[this, "AFGVDV_RPGASST"] call FNC_GearScript;
//[this, "AFGVDV_EFR"] call FNC_GearScript;
//[this, "AFGVDV_SL"] call FNC_GearScript;
```

To use your Olsen loadout through the UO Framework Role Loadouts take the loadout name and copy it to the loadout role it fits best in. ex: ``AFGVDV_SL``

![IMAGE OF VARNAMES FROM GEARSCRIPT IN ROLE SLOT]({{ site.baseurl }}/resources/images/olsen/gear_roles.png){:class="img-responsive"}

Next select the unit(s) you want to assign loadouts to. Open the unit(s) attributes and find the Gear Settings attribute.
Here you can specify what loadout the unit should be using or you can just directly call the var-name of the loadout you want the unit to use.

Next select the units you want to assign loadouts to through the UOFW system by going into the unit(s) attributes. Here you can specify what loadout the unit should be using or you can just directly call the var-name of the loadout you want the unit to use.

![Asssigning the Squad Leader Loadout]({{ site.baseurl }}/resources/images/olsen/gear_editor_demo.gif){:class="img-responsive"}

Your equipment will be pre-loaded through the editor.

Randomized items will be randomized when gear is applied as you load into the briefing screen.

### Using Manual Loadouts

#### Manual ACE Loadouts

#### Manual Olsen Loadouts

### Using Feature Four

---

# Developers

## WIP

This subsection will contain explanations of the functions created for the framework.
It should not contain explanations of CBA function calls etc.
Major event-handlers that developers can use themselves for certain tasks should also be documented and explained here.

## Functions

_**WIP**_

## Eventhandlers

_**WIP**_
