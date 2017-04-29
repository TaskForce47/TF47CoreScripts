_result = _this params [
    ["_actionId", 0, [0]],
    ["_change"], 0, [0]],
    ["_player", objNull, [objNull]]
];


_playerId = 0;

if(!(isNull _player)) then {
    _playerArmaId = getPlayerUID _unit;

    if(_playerArmaId == "_SP_PLAYER_") then {
        _playerArmaId = "76561198022749433";
    };

    _playerIdResult = "extDB3" callExtension
        format["0:SQL:getPlayerIdByPlayerId:%1", _playerArmaId];


    _result = (call compile _playerIdResult) select 1;

    if((typeName _result) == "ARRAY") then {
        if((count _result) != 0) then {
            _playerId = (_result select 0) select 0;
        };
    };
};

if(_playerId <= 0) then {
    _playerId = "NULL";
};

_query = format["0:SQL:insertTicketlog:%1:%2:%3:%4:%5:%6",
    tf47_core_ticketsystem_missionId,
    _actionId,
    _change,
    tf47_core_ticketsystem_tickets,
    tf47_core_ticketsystem_round,
    _playerId];

_queryResult = "extDB3" callExtension _query;
