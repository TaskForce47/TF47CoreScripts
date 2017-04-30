_result = _this params [
    ["_player", objNull, [objNull]]
];

if(!isServer) exitWith { hint "server"; };

_slotString = str _player;

_playerId = getPlayerUID _player;

if(_playerId == "_SP_PLAYER_") then {
    _playerId = "76561198022749433";
};

_queryResult = "extDB3" callExtension
    format["0:SQL:getPlayerNameByPlayerId:%1", _playerId];

_result = (call compile _queryResult) select 1;
if((typeName _result) == "ARRAY") then {
    if((count _result) == 0) then {
        // insert
        _queryResult = "extDB3" callExtension
            format["0:SQL:insertPlayerName:%1:%2", _playerId, name _player];
    } else {
        _name = (_result select 0) select 0;
        if(_name != name _player) then {
            _queryResult = "extDB3" callExtension
                format["0:SQL:updatePlayerName:%1:%2", name _player, _playerId];
        };
    };
} else {
    // TODO ERROR
    hint "erro";
};
_slotCost = 0;

diag_log str tf47_core_ticketsystem_slotCost;
{
  if((_x select 0) == _slotString) then {
      _slotCost = (_x select 1);
  };
} foreach tf47_core_ticketsystem_slotCost;

if(_slotCost == 0) then {
    _slotCost = tf47_core_ticketsystem_defaultTickets;
};

_player setVariable ["tf47_core_ticketsystem_slotCost", _slotCost, true];

_player addEventHandler["Killed", {
    _player = _this select 0;
    // TODO: ticket system
}];
