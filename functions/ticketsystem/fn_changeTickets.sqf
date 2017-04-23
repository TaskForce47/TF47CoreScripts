_result = _this params [
    ["_object", objNull, [objNull]],
    ["_cost", 0, [0]]
];

if(!isServer) exitWith { hint "server"; };



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
