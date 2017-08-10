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
        _lastDriver = "";
    } else {
        _lastDriver = getPlayerUID _lastDriver;

        // in single player we use Willard's playerid
        if(_lastDriver == "_SP_PLAYER_") then {
            _lastDriver = "76561198022749433";
        };
    };
    _vehicle setVariable ["tf47_core_ticketsystem_lastDriver", _lastDriver,
        true];
    
    _handle = _vehicle getVariable ["tf47_core_ticketsystem_timeoutHandle", -1];
	if(_handle != -1) then {
		[_handle] call CBA_fnc_removePerFrameHandler;
	};
}];
_vehicle addEventHandler["SeatSwitched", {
    _vehicle = _this select 0;
    _lastDriver = commander _vehicle;
    if(isNull (commander _vehicle)) then {
        _lastDriver = driver _vehicle;
    };
    if(isNull _lastDriver) then {
        _lastDriver = "";
    } else {
        _lastDriver = getPlayerUID _lastDriver;

        // in single player we use Willard's playerid
        if(_lastDriver == "_SP_PLAYER_") then {
            _lastDriver = "76561198022749433";
        };
    };
    _vehicle setVariable ["tf47_core_ticketsystem_lastDriver", _lastDriver,
        true];
}];

_vehicle addEventHandler["GetOut", {
    _vehicle = _this select 0;

    _handle = _vehicle getVariable ["tf47_core_ticketsystem_timeoutHandle", -1];
    if(_handle != -1) then {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    if(count (crew _vehicle) == 0) then {
        _handle = [tf47_core_ticketsystem_fnc_handleDesertion, 
            	tf47_core_ticketsystem_desertionTime, _vehicle] 
                call CBA_fnc_addPerFrameHandler;
        _vehicle setVariable ["tf47_core_ticketsystem_timeoutHandle", _handle, true];
        _vehicle setVariable ["tf47_core_ticketsystem_getoutTime", time, true];
    };
}];

// change tickets when vehicle ist killed
[_vehicle, {_this addEventHandler["Killed", {
    _vehicle = _this select 0;

    if(!isNull ((UAVControl _vehicle) select 0)) then {
        _lastDriver = getPlayerUID ((UAVControl _vehicle) select 0);

        // in single player we use Willard's playerid
        if(_lastDriver == "_SP_PLAYER_") then {
            _lastDriver = "76561198022749433";
        };

        _vehicle setVariable ["tf47_core_ticketsystem_lastDriver", _lastDriver, 
            true];
    };

    _handle = _vehicle getVariable ["tf47_core_ticketsystem_timeoutHandle", -1];
    if(_handle != -1) then {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    if(!(_vehicle getVariable ["tf47_core_ticketsystem_despawn", false])) then {
        [_vehicle, 1] remoteExecCall 
            ["tf47_core_ticketsystem_fnc_changeTickets", 2];
    };
}];}] remoteExecCall ["bis_fnc_call", _vehicle]; 

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
