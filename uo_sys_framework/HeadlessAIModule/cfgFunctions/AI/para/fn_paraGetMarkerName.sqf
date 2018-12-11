params [["_u", player, [objNull]], ["_global", false, [false]], ["_dirMarker", false, [false]]];
if(_dirMarker) then {
	if(!_global) then { format["aeParaDir_%1", groupId group _u] } else { "aeParaDir" }
} else {
	if(!_global) then { format["aeParaDZ_%1", groupId group _u] } else { "aeParaDZ" }
}