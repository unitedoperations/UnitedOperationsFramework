---
layout: default
use_title: true
title: Anti-ND Module
nav_order: 5
parent: Core Modules
# grand_parent: Modules
---

---
1. TOC
{:toc}

---

# Users

## Features

* Enable or disable prevention of negligent discharges of:
  1. Rifles
  2. Pistols 
  3. Launchers


While the player is:

* __*Within a specified radius from their spawn location*__

* __*And until a certain time limit has been reached*__

The module will prevent players from causing damage through negligent discharge (ND).

## Usage

### Enabling Anti-ND

* Open the UO Framework Menu and select Module Settings.
<!-- - ![Framework Tab]({{ site.baseurl }}/resources/images/generic/generic_framework_tab.png){:class="img-responsive"} -->
<!-- TODO: Replace image above with one containing the UO Framework tab and the Module Settings sub-menu button. -->

* Open the Anti-ND Settings tab and change settings appropriately.
<!-- - ![image-title-here]({{ site.baseurl }}/resources/images/core/anti_nd_configuration.png){:class="img-responsive"}  -->
<!-- TODO: Add image of the module settings button and the anti-nd module settings dropdown.  -->

You can configure the timing after player spawn (or JiP) and distance from the spawn location here. \\
**These settings apply to all factions and all players.**

---

# Advanced Mission-making

## Functions
This module may provide functions end-users can call themselves.

## Eventhandlers

* ``UO_FW_AntiND_Event``

This event is a PreInit event. Read more about CBA Extended Event Handlers (a.k.a [XEH) here](https://github.com/CBATeam/CBA_A3/wiki/Extended-Event-Handlers-(new)).

```
_antiEvent = ["UO_FW_AntiND_Event", {systemChat "Output"}] call CBA_fnc_addEventHandler;
```
The above code handler adds an event handler called _antiEvent which when triggered will print to system chat "Output", when the event "UO_FW_AntiND_Event" is activated.

More information about adding code to execute when events are triggered can be found [here](https://cbateam.github.io/CBA_A3/docs/files/events/fnc_addEventHandler-sqf.html).

---