---
layout: default
use_title: true
title: Basic Setup
nav_order: 1
parent: Users
permalink: /docs/missions/basic-setup/
redirect_from: 
  - /docs/missions/users/
  - /docs/mission-makers/basic-setup/
---

---

1. TOC
{: toc }

---

# Installation

### Important Note

The ACE Gear Presets within the UOF require content available only on UO Servers.
The UOF is not dependent upon this content, as **the UOF is only dependent upon CBA and ACE3.**

The dependencies on UO exclusive content are temporary and will be made a non-issue in a later public release.

## United Operations Testpack

[Testing Modpack](https://steamcommunity.com/sharedfiles/filedetails/?id=849706204)
{: .btn .mb-4 }

Subscribe to the pack below for the latest public testing release of the framework.  

## Github

[Latest Release](https://github.com/unitedoperations/UnitedOperationsFramework/releases/latest/)
{: .btn .mb-4 }

[UO Framework Rolling Release](https://steamcommunity.com/sharedfiles/filedetails/?id=1681312425)
{: .btn .mb-4 }


If you want to build the framework from the latest commit to master:

2. Run build.bat and hit y on both prompts. This will place a folder in your Arma 3 folder called @uof
3. Open the Arma 3 Launcher with your normal United Operations Modpack.
4. Select the mods tab and select Local mod in the mods menu.
5. Specify the @UOF folder in your Arma 3 installation and load it after all of your other mods. (At the bottom of the list.)
6. Load into Arma 3 and you will be running the latest dev release of the UO Framework!

---

# Setup
<!-- TODO: Replace place-holder comments with actual images. -->
## Enabling the Framework

* Open a new scenario in the Eden Editor.

<!-- ![image-title-here]({{ site.baseurl }}/resources/images/setup/framework_scenario.gif){:class="img-responsive"} -->

* Save your scenario to the folder of your choosing.

<!-- ![image-title-here]({{ site.baseurl }}/resources/images/setup/framework_save.png){:class="img-responsive"} -->

* Select the "UO Framework" dropdown at the top of the editor.

<!-- ![image-title-here]({{ site.baseurl }}/resources/images/setup/framework_dropdown.png){:class="img-responsive"} -->

* Click "Framework Settings" sub-menu and check the "Enable Framework" box.

<!-- ![image-title-here]({{ site.baseurl }}/resources/images/setup/framework_enable.png){:class="img-responsive"} -->

## Enabling and Disabling Modules

Almost all modules with the exceptions of the ACRE and Gear modules are enabled through the Module Settings sub-menu.

<!-- ![image-title-here]({{ site.baseurl }}/resources/images/setup/module_settings.png){:class="img-responsive"} -->

These modules are enabled by default:

* [Automatic Asset Tracking](../../other/auto-track/)
* [Disconnect Control](../../core/disconnect/)
* [Anti-ND](../../core/anti-nd/)
* [Safe Start](../../core/safe-start/)
* [Self-Actions](../../other/self-actions/)
* [Shot Count](../../core/shot-count/)

To enable the ACRE module, refer to this [guide.](../../core/acre/#adding-radios)

To enable the Gear module, refer to this [guide.](../../core/gear/#using-ace-arsenal-loadouts)

## Briefings

The below guidelines for briefings are required for United Operations missions.

1. Briefing is clear and concise.
2. Briefing contains the time, weather, and if applicable visibility.
3. Briefing defines friendly forces well.
4. Briefing defines known enemy forces.
5. Briefing defines starting locations for friendly troops.
6. Briefing defines known locations of enemy troops.
7. Briefing defines necessary mission notes.

And an extra recommendation from the UO Framework team.

* Briefing details all mission end-conditions.

Simply follow the briefing templates within the editor to fulfill all of these requirements.

## End-Conditions

End-Condition categories provided in the End Conditions menu.
{: .fw-600 }

  - "All Conditions" means once all conditions within you select within the that condition, that ending will occur.
  <!-- ![image-title-here]({{ site.baseurl }}/resources/images/setup/endcond_all.png){:class="img-responsive"} -->
  - "Any Condition" means once any one of the conditions you specify occur, that ending will occur.
  <!-- ![image-title-here]({{ site.baseurl }}/resources/images/setup/endcond_any.png){:class="img-responsive"} -->
  - Custom end-conditions done through an SQF script
	{: .fw-600 }

Keep in mind, end-conditions from the Olsen framework are not supported by the UO Framework!
  <!-- * [Here's]({{ site.baseurl }}/docs/mission-makers/end_cond/#porting-from-olsen) how to convert your Olsen end-conditions to the UO Framework -->

---

# Using the Core Modules

* [ACRE](../../core/acre/)

* [Gear](../../core/gear/)

* [AO-Limits](../../core/ao-limit/)

* [Disconnect Control](../../core/disconnect/)

* [Anti-ND](../../core/anti-nd/)

* [Safe-Start](../../core/safe-start/)

* [Setup Timer](../../core/setup-timer/)

---
