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
    str _vehicle],[_vehicle select 0, _vehicle select 1]];
_marker setMarkerShape "ICON";
_marker setMarkerType _markerType;

_trackingHandle = [_vehicle_, _marker] spawn {
    _keepTracking = true;
    while {_keepTracking} do {
        sleep tf47_core_ticketsystem_trackingMarkerUpdate;
        _marker setMarkerPos
            [(getPos _vehicle) select 0, (getPos _vehicle) select 1];
        // TODO: kill script when not needed anymore
        if((damage _vehicle) == 1 || (_vehicle getVariable
                ["tf47_core_ticketsystem_isDeserted", false])) then {
            _marker setMarkerAlpha 0.3;
        };
        _keepTracking = !((damage _vehicle) == 1);
    };
    deleteMarker _marker;
};
