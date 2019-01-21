/*
 * Author: Glowbal
 *
 * Modified From:
 * ACE_medical_fnc_playInjuredSound
 *
 */
    // Lock if the unit is already playing a sound.
    if ((player getVariable ["ace_medical_playingInjuredSound",false])) exitWith {};
    player setVariable ["ace_medical_playingInjuredSound",true];

    // Play the sound if there is any damage present.
    if ([player] call ace_common_fnc_isAwake) exitWith {
        // Classnames of the available sounds.
        private _availableSounds = [
            "WoundedGuyA_01",
            "WoundedGuyA_02",
            "WoundedGuyA_03",
            "WoundedGuyA_04",
            "WoundedGuyA_05",
            "WoundedGuyA_06",
            "WoundedGuyA_07",
            "WoundedGuyA_08",
            "WoundedGuyB_01",
            "WoundedGuyB_02",
            "WoundedGuyB_03",
            "WoundedGuyB_04",
            "WoundedGuyB_05",
            "WoundedGuyB_06",
            "WoundedGuyB_07",
            "WoundedGuyB_08",
            "WoundedGuyC_01",
            "WoundedGuyC_02",
            "WoundedGuyC_03",
            "WoundedGuyC_04",
            "WoundedGuyC_05"
        ];
        _sound = selectRandom _availableSounds;

        // Play the sound
        playSound3D [(getArray(configFile >> "CfgSounds" >> _sound >> "sound") select 0) + ".wss", objNull, false, getPos player, 15, 1, 25]; // +2db, 15 meters.

        // Figure out what the delay will be before it is possible to play a sound again.
        private _delay = (30 - (random(25) * random(1))) max (3.5 + random(2));

        // Clean up the lock
        [{
            (_this select 0) setVariable ["ace_medical_playingInjuredSound", nil];
        }, [player], _delay, _delay] call CBA_fnc_waitAndExecute;
    };

    // Clean up in case there has not been played any sounds.
    player setVariable ["ace_medical_playingInjuredSound", nil];
    true