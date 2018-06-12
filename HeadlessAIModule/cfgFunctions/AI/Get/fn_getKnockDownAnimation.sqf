/*
 * Author: commy2
 * 
 * Modified From:
 * ACE_hitreactions_fnc_getRandomAnimation
 *
 */
	private _weapon = currentWeapon player;

	if (_weapon == "") exitWith {
		"AmovPercMsprSnonWnonDf_AmovPpneMstpSnonWnonDnon"
	};

	if (_weapon == primaryWeapon player) exitWith {
		if (player call ace_common_fnc_isPlayer) then {
			private _isRunning = (vectorMagnitude velocity player) > 4;

			[
				["AmovPercMsprSlowWrfldf_AmovPpneMstpSrasWrflDnon_2", "AmovPercMsprSlowWrfldf_AmovPpneMstpSrasWrflDnon"] select _isRunning,
				["AmovPercMsprSlowWrfldf_AmovPpneMstpSrasWrflDnon_2", "AmovPercMsprSlowWrfldf_AmovPpneMstpSrasWrflDnon"] select _isRunning,
				"AmovPercMstpSrasWrflDnon_AadjPpneMstpSrasWrflDleft",
				"AmovPercMstpSrasWrflDnon_AadjPpneMstpSrasWrflDright"
			] select floor random 4
		} else {
			"AmovPercMsprSlowWrfldf_AmovPpneMstpSrasWrflDnon"
		};
	};

	if (_weapon == handgunWeapon player) exitWith {
		if (player call ace_common_fnc_isPlayer) then {
			[
				"AmovPercMsprSlowWpstDf_AmovPpneMstpSrasWpstDnon",
				"AmovPercMsprSlowWpstDf_AmovPpneMstpSrasWpstDnon",
				"AmovPercMstpSrasWpstDnon_AadjPpneMstpSrasWpstDleft",
				"AmovPercMstpSrasWpstDnon_AadjPpneMstpSrasWpstDright"
			] select floor random 4
		} else {
			"AmovPercMsprSlowWpstDf_AmovPpneMstpSrasWpstDnon"
		};
	};

	""
