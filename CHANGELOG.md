# Changelog
All notable changes to this project will be documented in this file.
Version Numbers mainly refer to the UO Modpack addition.

## [Unreleased]
### Added
- [HC] Enabled module
- [HC] New locality check macro for module (checks for HC, reexecutes function if on wrong locality)
- MarkerControl module input now accepts 3den layers - adds all markers from named layer
- Server broadcasts it's debug messages to clients if debug detailed enabled

### Changed
- Build batch made dynamic to dir path and game registry path
- Changed all Tracking/Untracking functions to include a server locality check and recall
- Changed `BIS_fnc_MP` calls to `remoteExec`
- Changed `UO_FW_fnc_inArea` calls to `inArea` command - fnc removed
- Hostage module rewritten to activate via unit attribute expression instead of an allUnits spawn
- Changed setDefaults to PreInit (finds mission values directly in preInit, sets config default values from cfg3DEN if not found)

### Fixed
- [HC] Collecting/Spawning function

### Removed
- [HC] Artillery & IED functions

## [1.0.2] - 2018-12-02
### Added

### Changed

### Fixed
- Endconditions script not running properly
- Parachute jip error
- Acre APi
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
