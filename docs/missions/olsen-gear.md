---
layout: default
use_title: true
title: Using Olsen Gear Scripts
nav_order: 2
parent: Users
---

---

### Important Note
{: .fs-6 .text-blue-000 }
Mission-makers, you can always use the UO Framework ACE3 based loadouts system in conjunction with the Olsen Loadout system at the same time!

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
2. Has only a simple switch statement with ``_type`` as it's variable. 
  - (See above example.)
3. Is located in your mission root folder with ``mission.sqm``

Ex: ``MissionNameExample.IslandName/gear.sqf``

It also must include all the relevant loadouts you want to use within your ``loadouts`` folder.

```
switch (_type) do {

	#include "loadouts\CustomLoadoutsOne.sqf"
	#include "loadouts\CustomLoadoutsTwo.sqf"

};
```

Now, to use your Olsen loadouts, refer to the [Gear Module](../../core/gear/) page!

---
