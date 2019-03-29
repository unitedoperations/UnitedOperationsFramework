---
layout: default
use_title: true
title: Using End Conditions
nav_order: 3
parent: Users
---

---

1. TOC
{:toc}

---

## End-Condition Categories

### Primary End-Conditions

These are standalone conditions which are fully "independent".

- Casualty Percentages
  * Greater than or equal to one or more casualty percentages.
  * Percentages for BLUFOR, REDFOR, INDFOR and CIVILIAN.
- Alive, dead and damaged status of entities
  * Objects, buildings, vehicles and units both playable and AI. 
- Hostages Rescued
  * Add the variable name of a hostage too this array.
  * A hostage will return as rescued when they reach their designated zone.
- Capture Zones
  * Variable name array of capture-zones.
  * Specify what capture-zones must be captured. (Ignores factions.)
  * Team variable designated in a capture-zone attributes must match the controlling team. 
- Custom Variables
  * Array of variables which are checked for true status (true vs false).

### Tertiary End-Conditions

These are dependent conditions which require a primary end-condition to operate.

- Require Extraction
  * A **percentage**/**ratio** of alive members for **a specific faction** to total alive players of that faction must move to a certain **marker**.
  * Require extraction for one team at a time.

## Using End-Conditions

End-conditions can be evaluated in one of two ways.

* Any conditions
  - If any one of these conditions are met, this condition's ending text will be displayed.
* All conditions
  - If all specified conditions are met, this condition's ending text will be displayed.
 
If the extraction condition is enabled then it must be completed before an ending is evaluated in either mode.

### Casualty Percentages

Enable which faction(s) you want to check, then simply select which casualty percentage for each faction to check for.  
This condition will not evaluate as true unless all enabled factions and their respective casualty percentages are met (or greater).

### Alive, Damaged, Dead

This end-condition is simple. Give an object a variable name, then add this variable name to the arrays.  

Example, in a COXX mission you want players to destroy a cache of explosives.
* Give an object or multiple objects in your cache variable names.
* Add the variable name(s) to the dead (aka destroyed) array box with each variable separated by a comma.

### Hostages Rescued

* Add a unit to your mission and within it's attributes designate it as a hostage, giving each hostage a variable name.
* Add a marker matching the rescue zone specified in your hostage's or hostages' attributes.
* Now add each hostage's variable name to the hostage rescued array.

This end-condition will only evaluate if all hostages specified within the array are rescued.

### Capture Zones

* Add one or more capture-zones to your mission and give them each a variable name.
* Specify in the capture zone(s) all relevant attributes.
  - Who can capture the zone(s), how notifications appear, etc.
* Select what factions must capture a zone in-order for the condition to evaluate as true.

### Custom Variables

Simply add a variable somewhere in your mission that is modified by your own scripts etc.  
Now add these custom variables to this array.
This condition will only evaluate if the all of these custom variables are true.


---
