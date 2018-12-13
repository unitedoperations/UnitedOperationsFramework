/*	Description: Set a marker position to an objects position.
 * 	Arguments:
 *		MARKER	- Marker or Marker Name
 *		OBJECT	- unit/object
 * 	Return Value:
 * 		BOOL 	- True
 *	Author
 *		suits & PiZZADOX
 */
params["_marker","_obj"];
	private _pos = getposATL _obj;
	_marker setMarkerPos _pos;
	true