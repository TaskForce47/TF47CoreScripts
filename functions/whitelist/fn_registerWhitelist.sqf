_result = _this params [
    ["_vehicle", objNull, [objNull]],
    ["_whitelist", 0, [0]],
    ["_slots", [], [[]]]
];

if(!isServer) exitWith { hint "server"; };

if((isNull _vehicle) or (_whitelist == 0) or ((count _slots) == 0)) exitWith {
    // TODO
    hint "params";
};

_vehicle setVariable ["tf47_core_whitelistId", _whitelist, true];
_vehicle setVariable ["tf47_core_whitelistSlots", _slots, true];

//_vehicle addEventHandler["GetIn", { [] call }];
_vehicle addEventHandler["SeatSwitched", {}];

hint str _vehicle;