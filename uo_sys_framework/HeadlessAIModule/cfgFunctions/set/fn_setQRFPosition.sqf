/*    Description: Set QRF/respawn position to new position.
 *     Arguments:
 *        ANY    - New Position or something to get new position from
 *     Return Value:
 *         BOOL     - True
 *    Author
 *        suits & PiZZADOX
 */
params["_logic"];
    if ("spawnptQRF" in allMapMarkers) then {
        "spawnptQRF" setMarkerPos (getPos _logic);
    } else {
        private _marker = createMarkerLocal ["spawnptQRF", getPos _logic];
        _marker setMarkerTypeLocal "hd_warning";
        _marker setMarkerColorLocal "ColorGUER";
        _marker setMarkerSizeLocal [1, 1];
        _marker setMarkerText "QRF";
    };
    true
