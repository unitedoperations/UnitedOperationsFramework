/*	Description: Gets synced modules and return only allowed synced modules. All synced modules if allowed not passed.
 * 	Arguments:
 * 		ANY		- Module, Group, Object (name, _logic)
 *	Optional:
 * 		ARRAY	- Allowed Modules
 * 	Return Value:
 * 		ARRAY	- ALL or Allowed Synchronised Modules
 */
params ["_logic",["_allowedModules",[],[[]]],["_allowedSynced",[],[[]]],["_allowed",false,[false]],"_j"];
	private _synced = synchronizedObjects _logic;	
	for [{_j=0}, {(_j < count _synced)}, {_j = _j + 1}] do { 	
		private _syncModule	= _synced select _j;
		if (_syncModule isKindOf "Logic") then {
			if (count _allowedModules >= 1) then {
				_allowed = (typeof _syncModule) in _allowedModules;
			} else {
				_allowed = true;
			};
			if (_allowed) then {
				_allowedSynced pushBack _syncModule;
			};
		};
	};
	_allowedSynced