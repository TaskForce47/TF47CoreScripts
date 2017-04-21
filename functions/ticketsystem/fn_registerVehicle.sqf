_result = _this params [
    ["_vehicle", objNull, [objNull]],
    ["_cost", 0, [0]]
];

if(!isServer) exitWith { hint "server"; };

if(isNull _vehicle) exitWith {
    // TODO
    hint "params";
};

_vehicle setVariable ["tf47_core_ticketsystem_cost", _cost, true];


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

_vehicle addEventHandler["Killed", {
    _vehicle = _this select 0;
    _ticketCost = _vehicle getVariable ["tf47_core_ticketsystem_cost", 0];
    if(_ticketCost > 0) then {
      _vehicleDisplayName = getText (configFile >>  "CfgVehicles" >>
          (typeOf _vehicle) >> "displayName");
      _lastDriver = name
          (_vehicle getVariable ["tf47_core_ticketsystem_lastDriver", objNull]);
      _message = format[
          "%1 wurde zerstört! <br/> <t color='#ff4c33'>Ticket Verlust: </t> %2",
          _vehicleDisplayName, _ticketCost];
      ["tf47_core_ticketLoss",[_message]] remoteExecCall
        ["BIS_fnc_showNotification", 0];
    };
}];
