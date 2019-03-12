---
layout: default
title: ACRE Module
nav_order: 1
parent: Core Modules
permalink: /docs/toc/core/acre/
# grand_parent: Modules
---

---

1. TOC
{:toc}

---

# Users

## Features

Provides an efficient in-editor system for:
- Adding [ACRE2](https://github.com/IDI-Systems/acre2) radios to players
- Enable and disable automatic radio scrambling on a per-side basis
- Change channel names on a per-side basis
- Enable/disable ACRE2 babel settings 

### Special Note
{: .text-blue-000 }

Adding radios through the ACRE module can only be done on playable units!

---

## Adding Radios

1. Open the UO Framework menu.
* ![image-title-here]({{ site.baseurl }}/resources/images/acre/acre_radios_1.png){:class="img-responsive"}

2. Select Configure ACRE.
* ![image-title-here]({{ site.baseurl }}/resources/images/acre/acre_radios_2.png){:class="img-responsive"}

3. Select "Configure ACRE Settings" and check the "Enable ACRE Framework" checkbox.
* [Back to Basic Setup-Guide]({{ site.baseurl}}/docs/mission-makers/basic-setup/#enabling-the-framework)

4. Select the side you want to specify radios for.
* ![image-title-here]({{ site.baseurl }}/resources/images/acre/acre_radios_sides.png){:class="img-responsive"}

5. Choose the short-range radio, long-range radio and pack radios for a specific side.
* ![image-title-here]({{ site.baseurl }}/resources/images/acre/acre_radios_blufor_radios.png){:class="img-responsive"}

6. Select units and open their ACRE attribute and choose what radio(s) to give them.
* ![image-title-here]({{ site.baseurl }}/resources/images/acre/acre_radios_6.png){:class="img-responsive"}

7. Load the mission into multiplayer.

The playable units you assigned radios will now have radios when starting your mission!

---

## Adding Vehicle Racks

_**WIP**_

---

## Radio Scrambling, Babel and Channel Names

1. Open the UO Framework menu.
* ![image-title-here]({{ site.baseurl }}/resources/images/acre/acre_radios_1.png){:class="img-responsive"}

2. Select "Configure ACRE" and "Configure ACRE Settings".
* ![image-title-here]({{ site.baseurl }}/resources/images/acre/acre_radios_2.png){:class="img-responsive"}

3. Check the "Enable Scramble" and "Enable Babel" checkboxes as desired.
* ![image-title-here]({{ site.baseurl }}/resources/images/acre/acre_scramble_babel.png){:class="img-responsive"}

4. Customize what languages each side uses. Each side must be customized individually.
* ![image-title-here]({{ site.baseurl }}/resources/images/acre/acre_radios_sides.png){:class="img-responsive"}

You will now have per-side scrambling and babel.

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
