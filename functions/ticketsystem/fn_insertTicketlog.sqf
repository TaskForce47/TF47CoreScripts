/**
 *  @author Willard
 *  @description
 *  Inserts a ticket change into the Database
 *  @params 
 *      param 0: Action id <number>
 *      param 1: Ticket amount <number>
 *      param 2: Player connected to the loss <object>
 *  @return nothing
 */
_result = _this params [
    ["_actionId", 0, [0]],
    ["_change", 0, [0]],
    ["_object", objNull, [objNull],
    ["_comment", "", [""]]
];

_playerId = 0;
_description = "";

// determine the playerid
if(!(isNull _player)) then {
    if(isPlayer _object) then {
        _playerArmaId = getPlayerUID _unit;

        // in single player we use Willard's playerid
        if(_playerArmaId == "_SP_PLAYER_") then {
            _playerArmaId = "76561198022749433";
        };

        // get the database player_id
        _playerIdResult = "extDB3" callExtension
            format["0:SQL:getPlayerIdByPlayerId:%1", _playerArmaId];

        _result = (call compile _playerIdResult) select 1;

        if((typeName _result) == "ARRAY") then {
            if((count _result) != 0) then {
                _playerId = (_result select 0) select 0;
            };
        };
        _description = name _player;
    } else {
        _description = getText(configfile >> "CfgVehicles" >> typeOf _vehicle 
            >> "displayName");
    };
};

// default id is "NULL" (no relationship)
if(_playerId <= 0) then {
    _playerId = "NULL";
};

// build the querey and commit it
_query = format["0:SQL:insertTicketlog:%1:%2:%3:%4:%5:%6:%7:%8",
    tf47_core_ticketsystem_missionId,
    _actionId,
    _change,
    tf47_core_ticketsystem_tickets,
    tf47_core_ticketsystem_round,
    _playerId,
    _description,
    _comment];

_queryResult = "extDB3" callExtension _query;
