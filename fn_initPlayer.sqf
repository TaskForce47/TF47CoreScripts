_result = _this params [
    ["_player", objNull, [objNull]]
];

if(!isServer) exitWith { hint "server"; };

_slotString = str _player;

_playerId = getPlayerUID _player;

if(_playerId == "_SP_PLAYER_") then {
    _playerId = "76561198022749433";
};

_slotCost = 0;

{
  if((_x select 0) == _slotString) then {
      _slotCost = (_x select 1);
  };
} foreach tf47_core_ticketsystem_slotCost;

if(_slotCost == 0) then {
    _slotCost = tf47_core_ticketsystem_defaultTickets;
}

_player setVariable ["tf47_core_ticketsystem_slotCost", _slotCost, true];

_player addEventHandler["Killed", {
    _player = _this select 0;

}];
