_result = _this params [
    ["_player", objNull, [objNull]]
];

if(!isServer) exitWith { hint "server"; };

_slotString = str _player;

_playerId = getPlayerUID _player;

if(_playerId == "_SP_PLAYER_") then {
    _playerId = "76561198022749433";
};

_whitelistId = 0;

{
  if((_x select 0) == _slotString) then {
      _whitelistId = (_x select 1);
  };
} foreach tf47_core_whitelistedSlots;

if(_whitelistId == 0) exitWith {};

_query = format["0:SQL:checkWhitelist:%1:%2", _playerId, _whitelistId];

_queryResult = "extDB3" callExtension _query;

_resultArray = ((call compileFinal _queryResult) select 1);
hint str count _resultArray;
if((count _resultArray) == 0) exitWith {
    _clientId = owner _player;
    ["tf47_core_whitelistSlotFail",false, true] remoteExecCall
      ["BIS_fnc_endMission", _clientId];
};
