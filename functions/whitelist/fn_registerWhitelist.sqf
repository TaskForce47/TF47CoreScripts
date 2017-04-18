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

_vehicle addEventHandler["GetIn", { _this call tf47_core_whitelist_fnc_checkWhitelist; }];
_vehicle addEventHandler["SeatSwitched", { 

    _vehicleRole = ((assignedVehicleRole (_this select 1)) select 0);
    if(_vehicleRole == "Turret") then {
        _vehicleRole = "gunner";
    };
    [_this select 0, _vehicleRole, _this select 1, [], false] call tf47_core_whitelist_fnc_checkWhitelist; 
}];

hint str _vehicle;