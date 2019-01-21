#define COMPONENT 3DEN
#include "\x\UO_FW\addons\Main\script_macros.hpp"
UO_FW_EXEC_CHECK(ALL);

#define MISSION_FILE "mission.sqm"

INFO("Checking mission.sqm file ...");
private _fileExists = FILE_EXISTS(MISSION_FILE);

if (_fileExists) then {
    INFO("Mission.sqm file exists");
    _missionFileString = preprocessFile "mission.sqm";
    copyToClipboard _missionFileString;
    INFO("Mission.sqm text copied to clipboard");
} else {
    INFO("Mission.sqm file does not exist, save mission file as a unique name!");
};
