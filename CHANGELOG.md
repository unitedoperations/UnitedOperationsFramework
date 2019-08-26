# Changelog
All notable changes to this project will be documented in this file.
The version number refer to VERSION define in script_mod.
The date refers to the date when changes have been merged into DEV branch.

## [1.0.8]
### Added
- PID Card System in the Briefing System
- Added Virtual Firemission System from Tinfoil
- Respawn Zones
### Changed
### Fixed
- Endscreen not displaying casualties
### Removed

## [1.0.7]
### Added
- ACRE Vehicle Rack Preset now selectable
- New context menu options to improve navigation and efficency for changing settings for UOF missions on the fly
- New icons for the UOF settings bar and context menus
### Changed

- Made game-mastering dependent on mission notes
- Reorganized the top-bar setting menus for the UOF to ensure parity between context menus and top-bar settings.
- EG Spectator uses ACE variable if it doesn't get correct value from Killed EH
### Fixed
- Missing function configuration for spectator mode resulted in players being unable to tell who killed them
- Briefing entries being duplicated
- itemRandomOrg script error
- Endscreen not showing Casualties
- Script error in jip teleport
- Export Briefings being incomplete
- Ai Drivers not being functional
- Rewrote ACRE Channel functions to account for multiple same type radios
### Removed


## [1.0.6]
### Added
- View Distance limit sliders now avaliable!
  - Note: Minimumn view-distance enforced by Arma is 200 meters.
- Added unit babel language

### Changed
- CaptureZone modules used hint, changed to hintSilent
- The extraction end-condition is now longer dependent upon another end-condition to fire.

### Fixed
- All run "module on respawn" settings are now configurable.
- Individual ticketed respawns now fully functional
- Team tickets and unlimited respawn options now functional
- Respawn as a different faction is now functional
- Spectator is now at the correct location
- ACRE Set Radio Channel now works correctly
- ACRE Set Ear now works correctly

### Removed

### Known Issues

## [1.0.5]
### Added
- Legacy mission support switches for functions: `EGVAR(Core,Version_UpdatedNumber)` and `EGVAR(Core,Version_CreatedNumber)` available in PreInit past `EGVAR(Core,Enabled)` check. Can be used for specific function changes and redirects based on version changes. Functions specific to an older version should be placed in an additional `\Legacy\` folder.
- Gear System CBA Events for loading 3den attribute unit and vehicle loadouts, as well as forcing specific loadouts to units and vehicles.
- stringtable.xml and corresponding macros.
- Gear System gear type config macro for later editing and addition of gear types.
- `EDEN_CHECK` macro to exit on !is3den state.
- `VERSION_CHECK(VERSIONNUM)` macro to exit on below `VERSIONNUM` input: eg. `VERSION_CHECK(103)` exits script if version is 102 or below.
- Added Gear Preset selection system.
- Added `USMC 1980s Woodland` gear preset.
- Added `US 1960s Woodland` gear preset.
- Added `UK 2015 MTP` gear preset.
- Added `UK 1980s Woodland` gear preset.
- Added `UK 2010s MTP` gear preset.
- Added `UK 1980s Desert` gear preset.
- Added `MSV 1980s Woodland` gear preset.
- Added `Iraq 1980s Desert` gear preset.
- Added `Insurgents 90s Woodland` gear preset.

### Changed
- Gear system now applies loadouts via EH inside 3den instead of on mission init.
- AI Drivers activation through InitPost.
- Hostage activation through InitPost.
- ACRE add radio event now removes all radios before adding defined radios.
- SafeStart defaults to lowered and on safe but no longer emptied magazine.
- Start in Parachute activation through InitPost.
- ACRE module adds radios to the ground if it cannot fit them in unit gear.
- Safe Start adds unloaded magazine to the ground if it cannot fit it in unit gear.
- Briefing Module displays tabs conditionally based on content (no longer shows empty tabs or entries).

### Fixed
- Macro for SelfActions Cfg CfgClasses.
- Cut Grass Animation EH
- View Map Self Action condition
- AO Limit Soft Notification
- CaptureZone var and teamcontrolling var
- End Conditions CaptureZone checking
- End Conditions attribute AttrLoad and AttrSave
- Debug display naming

### Removed
- N/A

## [1.0.2] - 2018-22-02
### Added
- [HC] Enabled module
- [HC] New locality check macro for module (checks for HC, reexecutes function if on wrong locality)
- MarkerControl module input now accepts 3den layers - adds all markers from named layer
- Server broadcasts it's debug messages to clients if debug detailed enabled
- Added debug option in setDefaults file for checking that new attributes/vars are defined correctly
- Added CoverMap module
- Added ACE Arsenal Gear System

### Changed
- Build batch made dynamic to dir path and game registry path
- Changed all Tracking/Untracking functions to include a server locality check and recall
- Changed `BIS_fnc_MP` calls to `remoteExec`
- Changed `UO_FW_fnc_inArea` calls to `inArea` command - fnc removed
- Hostage module rewritten to activate via unit attribute expression instead of an allUnits spawn
- Changed setDefaults to PreInit (finds mission values directly in preInit, sets config default values from cfg3DEN if not found)
- Changed End Conditions for CaptureZones
- Converted CaptureZone modules to work off modules using their areas set in the editor, functions run independently of each other and define dynamically named vars according to user friendly text input. Many new features of the new function - needs testing.
- Replaced `(count _x == 0)` evals with `isEqualto`
- [HC] Folder Restructure
- Converted AO Limit to editor module, option to spawn outside of AO and be restricted once you enter AO.
- Converted Setup Timer to editor module, singleplayer compatibility
- Removes fired eventhandler when AntiND time has passed
- Combined SoftAO and AO module, now as a setting inside the module
- Changed Map and Compass remover to work through expression inits

### Fixed
- Endconditions script not running properly
- Parachute JiP error
- Acre API
- Acre Channel Names
- Setuptimer client race condition error
- [HC] Collecting/Spawning function

### Removed
- [HC] Artillery & IED functions


## [1.0.1] - 2018-11-11
### Added
- Added Button to setup respawn and settings in 3den
- Added Map Compass Remover
- Added Hostage Module

### Changed
- Removed briefing limitations
- Made more Modules independent

### Fixed
- Ai Driver wasn't being added when ace menued
- Too much briefing being displayer
- Gear locality
- Gear works more reliable

### Removed
