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
  * A **percentage**/**ratio** of alive members for **a specific faction** to total alive players of that faction must move a certain **marker**.
  * Require extraction for one team at a time.

## Using End-Conditions

---
