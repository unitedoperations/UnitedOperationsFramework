_mode = param [0,"",[""]];
_input = param [1,[],[[]]];

switch _mode do 
{
	// Default object init
	case "init": 
	{	
		if (!is3DEN) then 
		{
			_logic = _input param [0,objNull,[objNull]]; // Module logic
			_isActivated = _input param [1,true,[true]]; // True when the module was activated, false when it's deactivated
			_isCuratorPlaced = _input param [2,false,[true]]; // True if the module was placed by Zeus
			_input call UO_FW_LoadStartInParachute;
		}
		else
		{
			_logic = _input param [0,objNull,[objNull]];
			private _radiusX = _logic getVariable ["UO_FW_StartInParachute_SizeX",100];
			private _radiusY = _logic getVariable ["UO_FW_StartInParachute_SizeY",100];
			set3DENAttributes [[[_logic],"size2",[_radiusX,_radiusY]]];
		};
	};
	// When some attributes were changed (including position and rotation)
	case "attributesChanged3DEN": 
	{
	
		// ... code here...
	};
	// When added to the world (e.g., after undoing and redoing creation)
	case "registeredToWorld3DEN": 
	{
		_logic = _input param [0,objNull,[objNull]]; // Module logic
		
	};
	// When removed from the world (i.e., by deletion or undoing creation)
	case "unregisteredFromWorld3DEN": 
	{
		_logic = _input param [0,objNull,[objNull]]; // Module logic
		
	};
	// When connection to object changes (i.e., new one is added or existing one removed)
	case "connectionChanged3DEN": 
	{
		_logic = _input param [0,objNull,[objNull]]; // Module logic
		
	};
	// When object is being dragged
	case "dragged3DEN": 
	{
		_logic = _input param [0,objNull,[objNull]]; // Module logic
		
	};
};