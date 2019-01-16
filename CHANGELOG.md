# Changelog
All notable changes to this project will be documented in this file.
Version Numbers mainly refer to the UO Modpack addition.

## [Unreleased]
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
- [HC] Collecting/Spawning function

### Removed
- [HC] Artillery & IED functions

## [1.0.2] - 2018-12-02
### Added

### Changed

### Fixed
- Endconditions script not running properly
- Parachute JiP error
- Acre API
- Acre Channel Names
- Setuptimer client race condition error
### Removed



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
