/*
 * Author: TrainDoctor & PiZZADOX
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

_alivePlayers = [];

if (count _this > 0) then {
  _lowerThis = [];
  {
    _lowerThis pushback (tolower _x);
  } foreach _this;

  if (("blufor" in _this) || ("west" in _this)) then {
    _alivePlayersBlufor = allPlayers select {(side _x == west) && (isPlayer _x) && (alive _x) && !(_x isKindOf "HeadlessClient_F") && (_x getVariable ["UO_FW_Dead", false])};
    _alivePlayers append _alivePlayersBlufor;
  };

  if (("opfor" in _this) || ("east" in _this)) then {
    _alivePlayersOpfor = allPlayers select {(side _x == east) && (isPlayer _x) && (alive _x) && !(_x isKindOf "HeadlessClient_F") && (_x getVariable ["UO_FW_Dead", false])};
    _alivePlayers append _alivePlayersOpfor;
  };

  if (("independent" in _this) || ("resistance" in _this)) then {
    _alivePlayersIndependent = allPlayers select {(side _x == independent) && (isPlayer _x) && (alive _x) && !(_x isKindOf "HeadlessClient_F") && (_x getVariable ["UO_FW_Dead", false])};
    _alivePlayers append _alivePlayersIndependent;
  };

  if (("civilian" in _this)) then {
    _alivePlayersCivilian = allPlayers select {(side _x == civilian) && (isPlayer _x) && (alive _x) && !(_x isKindOf "HeadlessClient_F") && (_x getVariable ["UO_FW_Dead", false])};
    _alivePlayers append _alivePlayersCivilian;
  };

  _alivePlayers
} else {
  _alivePlayers = allPlayers select {(isPlayer _x) && (alive _x) && !(_x isKindOf "HeadlessClient_F") && (_x getVariable ["UO_FW_Dead", false])};
  _alivePlayers
};
