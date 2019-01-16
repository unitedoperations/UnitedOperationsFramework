/*
 * Author: TrainDoctor & PiZZADOX & TheMagnetar
 *
 * Returns an array of all alive players. Can return alive players of given sides
 *
 * Arguments:
 * 0: side <side> (optional)
 *
 * Return Value:
 * array
 *
 * Public: Yes
 */

private _alivePlayers = [];
_alivePlayers = allPlayers select {(alive _x) && !(_x getVariable ["UO_FW_Dead", false]) && !(_x isKindOf "HeadlessClient_F")};

if (count _this > 0) then {
  private _lowerThis = [];
  {
    _lowerThis pushback (tolower _x);
  } foreach _this;

	private _return = [];

  if (("blufor" in _this) || ("west" in _this)) then {
    _return append (_alivePlayers select {side _x == west});
  };

  if (("opfor" in _this) || ("east" in _this)) then {
    _return append (_alivePlayers select {side _x == east});
  };

  if (("independent" in _this) || ("resistance" in _this) || ("guer" in _this)) then {
    _return append (_alivePlayers select {side _x == independent});
  };

  if (("civilian" in _this)) then {
    _return append (_alivePlayers select {side _x == civilian});
  };

  _return
} else {
  _alivePlayers
};
