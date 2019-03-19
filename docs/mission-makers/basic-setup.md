---
layout: default
title: Basic Setup
nav_order: 1
parent: Users
permalink: /docs/mission-makers/basic-setup/
redirect_from: 
  - /docs/mission-makers/users/
---

---

1. TOC
{: toc }

---

# Installation

## United Operations Testpack

[Testing Modpack](https://steamcommunity.com/sharedfiles/filedetails/?id=849706204)
{: .btn .mb-4 }

Subscribe to the pack below for the latest public testing release of the framework.
Keep in mind this version requires you to have content exclusive to the United Operations server and mod-pack.
These dependencies are a temporary requirement and will be removed in a later public release.	

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

* [Automatic Asset Tracking]({{ site.baseurl }}/docs/toc/core/auto-track/)
* [Disconnect Control]({{ site.baseurl }}/docs/toc/core/disconnect/)
* [Anti-ND]({{ site.baseurl }}/docs/toc/core/anti-nd/)
* [Safe Start]({{ site.baseurl }}/docs/toc/core/safe-start/)
* [Self-Actions]({{ site.baseurl }}/docs/toc/other/self-actions/)
* [Shot Count]({{ site.baseurl }}/docs/toc/core/shot-count/)

To enable the ACRE module, refer to this [guide.]({{ site.baseurl }}/docs/toc/core/acre/#adding-radios)

To enable the Gear module, refer to this [guide.]({{ site.baseurl }}/docs/toc/core/gear/#ace-gear)

<!-- TODO -->
<!-- ## Briefings

* Basic text and image based guide for

* using the briefing module -->

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

* [ACRE]({{ site.baseurl }}/docs/toc/core/acre/)

* [Gear]({{ site.baseurl }}/docs/toc/core/gear/)

* [AO-Limits]({{ site.baseurl }}/docs/toc/core/ao-limits/)

* [Disconnect Control]({{ site.baseurl }}/docs/toc/core/disconnect/)

* [Anti-ND]({{ site.baseurl }}/docs/toc/core/anti-nd/)

* [Safe-Start]({{ site.baseurl }}/docs/toc/core/safe-start/)

* [Setup Timer]({{ site.baseurl }}/docs/toc/core/safe-start/)

---
