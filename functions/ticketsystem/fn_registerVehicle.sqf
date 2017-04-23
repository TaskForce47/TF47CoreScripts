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
    
}];
