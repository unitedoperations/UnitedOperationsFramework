/*	Recreates Waypoints for units that had Waypoints.
 * 	Arguments:
 * 		GROUP	- Group to Create Waypoints For
 * 		ARRAY	- Waypoint Details and Settings
 * 	Return Value:
 * 		BOOL	- True
 *
 */
#include "\x\UO_FW\addons\Main\HeadlessAIModule\module_macros.hpp"
UO_FW_AI_EXEC_CHECK(SERVERHC);

params [
	"_grp",
	["_waypoints",[],[[]]]
];
	for [{_w=0}, {(_w < count _waypoints)}, {_w = _w + 1}] do {
	private	_currentWaypoint = _waypoints select _w;
	private	_wp = _grp addWaypoint [(_currentWaypoint select 2),5,(_currentWaypoint select 0 select 1),(_currentWaypoint select 1)];
		_wp setWaypointType (_currentWaypoint select 3);
		_wp setWaypointBehaviour (_currentWaypoint select 4);
		_wp setWaypointCombatMode (_currentWaypoint select 5);
		_wp setWaypointSpeed (_currentWaypoint select 6);
		_wp setWaypointFormation (_currentWaypoint select 7);
		_wp setWaypointTimeout (_currentWaypoint select 8);
		_wp setWaypointCompletionRadius (_currentWaypoint select 9);
		_wp waypointAttachObject (_currentWaypoint select 10);
		_wp waypointAttachVehicle (_currentWaypoint select 11);
		_wp setWaypointHousePosition (_currentWaypoint select 12);
		_wp setWaypointLoiterRadius (_currentWaypoint select 13);
		_wp setWaypointScript (_currentWaypoint select 14);
		_wp setWaypointStatements (_currentWaypoint select 15);
	};
	deleteWaypoint ((waypoints _grp) select 0);
	true
