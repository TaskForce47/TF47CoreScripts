_result = _this params [
    ["_object", objNull, [objNull]],
    ["_amount", 0, [0]],
    ["_action", 0, [0]],
    ["_positiveChange", false, [false]],
    ["_customText", "", [""]]
];

if(!isServer) exitWith { hint "server"; };

if(isNull _object) exitWith { hint "null object"; };

if(_amount == 0) then {
    _amount = _object getVariable ["tf47_core_ticketsystem_cost", 0];
};

_message = "";
_ticketMessage = "";
_notificationClass = "";
_lastDriver = objNull;

if(isPlayer _object) then {
    _message = format["%1 ist gestorben!", name _object]
} else {
    _message = format["%1 wurde zerstört!", getText (configFile >>
        "CfgVehicles" >> (typeOf _object) >> "displayName")];
    _lastDriver = (_vehicle getVariable ["tf47_core_ticketsystem_lastDriver",
        objNull]);
};

if(_positiveChange) then {
    _ticketMessage = "<t color='#b2ff4c'>Ticket Gewinn: </t>";
} else {
    _ticketMessage = "<t color='#ff4c33'>Ticket Verlust: </t>";
    _amount = (-1) * _amount;
};

if(_customText == "") then {
    _message = format["%1 <br/> %2 %3", _message, _ticketMessage, _amount];
} else {
    _message = _customText;
};

tf47_core_ticketsystem_tickets = tf47_core_ticketsystem_tickets + _amount;
publicVariable "tf47_core_ticketsystem_tickets";

[_notificationClass,[_message]] remoteExecCall
    ["BIS_fnc_showNotification", 0];
