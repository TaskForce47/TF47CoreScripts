/**
 *  @author Willard
 *  @description
 *  Registers the vehicle's ticket cost
 *  @params 
 *      param 0: The vehicle <object> (required)
 *      param 1: Ticket amount <number>
 *  @return nothing
 */
_result = _this params [
    ["_vehicle", objNull, [objNull]],
    ["_cost", 0, [0]]
];

if(!isServer) exitWith {
     ["registerVehicle not called on Server!", "Error", true] spawn
        BIS_fnc_guiMessage;
    diag_log "registerVehicle not called on Server!";
};

if(isNull _vehicle) exitWith {
    ["registerVehicle called with null vehicle!", "Error", true] spawn
        BIS_fnc_guiMessage;
    diag_log "registerVehicle called with null vehicle!";
};

// set the ticket cost
_vehicle setVariable ["tf47_core_ticketsystem_cost", _cost, true];

// track last "effective" commander
_vehicle addEventHandler["GetIn", {
    _vehicle = _this select 0;
    _lastDriver = commander _vehicle;
    if(isNull (commander _vehicle)) then {
        _lastDriver = driver _vehicle;
    };
    if(isNull _lastDriver) then {
        _lastDriver = objNull;
    };
    _vehicle setVariable ["tf47_core_ticketsystem_lastDriver", _lastDriver,
        true];
}];
_vehicle addEventHandler["SeatSwitched", {
  _vehicle = _this select 0;
  _lastDriver = commander _vehicle;
  if(isNull (commander _vehicle)) then {
      _lastDriver = driver _vehicle;
  };
  _vehicle setVariable ["tf47_core_ticketsystem_lastDriver", _lastDriver,
      true];
}];

// change tickets when vehicle ist killed
_vehicle addEventHandler["Killed", {
    _vehicle = _this select 0;
    [_vehicle, 2] call tf47_core_ticketsystem_fnc_changeTickets;
}];

// detect side via config
_sideNumber = getNumber(configFile >> "CfgVehicles" >> typeOf _vehicle >> 
    "side");
_side = switch (_sideNumber) do {
    case 1: { west };
    case 2: { east };
    case 3: { resistance };
    default { civilian };
};

// start the vehicle tracking
[_vehicle, _side] call tf47_core_ticketsystem_fnc_trackVehicle;
