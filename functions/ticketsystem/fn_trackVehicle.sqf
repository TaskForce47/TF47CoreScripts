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
