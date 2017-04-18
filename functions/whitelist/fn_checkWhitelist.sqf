_result = _this params [
    ["_vehicle", objNull, [objNull]],
    ["_postion", "", [""]],
    ["_unit", objNull, [objNull]],
    ["_turretPath", [], [[]]],
    ["_successMessage", true, [true]]
];

if(!isServer) exitWith { hint "server"; };

if((isNull _vehicle) or (_postion == "") or (isNull _unit)) exitWith {
    // TODO
    hint "params";
};

if(!isPlayer _unit) exitWith {
    hint "player";
};

if(!(_postion in ["driver", "gunner", "commander"])) exitWith {};

_whitelistId = _vehicle getVariable ["tf47_core_whitelistId", 0];
_whitelistSlots = _vehicle getVariable ["tf47_core_whitelistSlots", []];

_playerId = getPlayerUID _unit;

if(_playerId == "_SP_PLAYER_") then {
    _playerId = "76561198022749433";
};

_queryResult = "extDB3" callExtension format["0:SQL:checkWhitelist:%1:%2", _playerId, _whitelistId];

_resultArray = ((call compileFinal _queryResult) select 1);

hint str _turretPath;

if((count _resultArray) == 0) exitWith {
    _unit action ["GetOut", _vehicle];
    ["tf47_core_tankFail", ["Du befindest dich nicht auf der Whitelist!"]] call BIS_fnc_showNotification;
};

if(!((str _unit) in _whitelistSlots)) exitWith {
    _unit action ["GetOut", _vehicle];
    ["tf47_core_tankFail", ["Du bist im falschen Slot für dieses Fahrzeug!"]] call BIS_fnc_showNotification;
};

if(_successMessage) then {
    ["tf47_core_tankSuccess", ["Überprüfung erfolgreich!"]] call BIS_fnc_showNotification;
};
