_result = _this params [
    ["_vehicle", objNull, [objNull]],
    ["_side", west, [west]]
];

if(isNull _vehicle) exitWith {
    // TODO
    hint "params";
};

_markerType = [_vehicle, _side] call tf47_core_util_fnc_getMarkerType;

_vehiclePos = getPos _vehicle;

_marker = createMarker [format["tf47_core_ticketsystem_trackingMarker_%1",
    str _vehicle],[_vehiclePos select 0, _vehiclePos select 1]];
_marker setMarkerShape "ICON";
_marker setMarkerType _markerType;

_trackingHandle = [_vehicle, _marker] spawn {
    _vehicle = _this select 0;
    _marker = _this select 1;
    _keepTracking = true;
    while {_keepTracking} do {
        sleep tf47_core_ticketsystem_trackingMarkerUpdate;
        _marker setMarkerPos
            [(getPos _vehicle) select 0, (getPos _vehicle) select 1];
        if((damage _vehicle) == 1 || (_vehicle getVariable
                ["tf47_core_ticketsystem_isDeserted", false])) then {
            _marker setMarkerAlpha 0.3;
        };
        _keepTracking = ((damage _vehicle) != 1);
    };
    // TODO: add to config
    sleep 300;
    deleteMarker _marker;
};
