#include "\x\UO_FW\addons\Main\script_macros.hpp"

#define NEWTAB(NAME) _briefing set [count _briefing, ["Diary",[NAME

#define ENDTAB ]]]

#define DISPLAYBRIEFING() \
private _size = count _briefing - 1;\
for '_i' from 0 to _size do {\
    player createDiaryRecord (_briefing select _size - _i);\
}
