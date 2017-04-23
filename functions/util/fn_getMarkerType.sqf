_result = _this params [
    ["_vehicle", objNull, [objNull]],
    ["_side", west, [west]]
];

if(isNull _vehicle) exitWith {
    // TODO
    hint "params";
};

_markerSide = switch (_side) do {
    case (west): {
        "b_"
    };
    case (east): {
        "o_"
    };
    case (resistance): {
        "n_"
    };
};

_configPath = (configFile >> "CfgVehicles" >> (typeOf _vehicle));

if(getNumber(_configPath >> "attendant") == 1) exitWith {
    format["%1med", _markerSide];
};

if (
    getNumber (_configPath >> "transportRepair") > 0 ||
    getNumber (_configPath >>  "transportFuel") > 0 ||
    getNumber (_configPath >>  "transportAmmo") > 0 ||
    getNumber (_configPath >>  "ACE_canRepair") > 0 ||
    getNumber (_configPath >>  "ACE_fuelCapacityCargo") > 0
) exitWith {
    format["%1maint", _markerSide];
};

if (_vehicle isKindOf "Plane") exitWith {
    format["%1plane", _markerSide];
};

if (_vehicle isKindOf "Air") exitWith {
    format["%1air", _markerSide];
};

if (_vehicle isKindOf "StaticMortar") exitWith {
    format["%1mortar", _markerSide];
};

if (getNumber (_configPath >> "artilleryScanner") == 1) exitWith {
    format["%1art", _markerSide];
};

if (_vehicle isKindOf "Car") exitWith {
    format["%1motor_inf", _markerSide];
};

if (_vehicle isKindOf "Tank") exitWith {
    if (getNumber (_configPath >> "transportSoldier") > 0) then {
        format["%1mech_inf", _markerSide];
    } else {
        format["%1armor", _markerSide];
    };
};

if (_vehicle isKindOf "Ship") exitWith {
    format["%1naval", _markerSide];
};

format["%1unknown", _markerSide];
