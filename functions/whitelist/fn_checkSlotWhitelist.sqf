
_slotString = str player;


_playerId = getPlayerUID player;

if(_playerId == "_SP_PLAYER_") then {
    _playerId = "76561198022749433";
};

_query = format["0:SQL:checkWhitelist:%1:%2", _playerId, _whitelistId];

remoteExecCall 

_queryResult = "extDB3" callExtension 

_resultArray = ((call compileFinal _queryResult) select 1);

if((count _resultArray) == 0) exitWith {
    player action ["GetOut", _vehicle];
    ["tf47_core_tankFail", ["Du befindest dich nicht auf der Whitelist!"]] call BIS_fnc_showNotification;
    sleep 5;
	endmission "LOSER";
};