/*	Description: Remove tasks from tasks array that are linked to a zone.
 *	Arguments:
 * 		ARRAY	- Module (name, _logic)
 *	Return Value:
 * 		ARRAY 	- Entities linked to object
 *	Author
 *		suits & PiZZADOX
 */	 
	private _tasks = _this;
	private _zoneTasks = [];
	{
		if (_x getVariable["UO_FW_taskZoneActivated",false]) then {
			_zoneTasks pushBack _x;
		};
	} forEach _tasks;
	_tasks = _tasks - _zoneTasks;
	_tasks