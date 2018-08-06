private ["_info"];

player createDiarySubject ["UO_FW_Menu", "UO Framework"];

_info = "
<font size='18'>United Operations Framework!</font><br/>
The United Operations framework is an addon based utility and function library for making missions.<br/>
<br/>
Find out more about the framework on GitHub.<br/>
github.com/unitedoperations/UnitedOperationsFramework<br/>
<br/>
Current Version: 0.1.0
";

player createDiaryRecord ["UO_FW_Menu", ["Framework Info", _info]];
