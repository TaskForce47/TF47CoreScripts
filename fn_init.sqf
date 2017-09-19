
// build config
call compileFinal preprocessFileLineNumbers "TF47CoreScriptsConfig.sqf";

// init
[] call tf47_core_fnc_initDatabase;
[] call tf47_core_fnc_initTicketsystem;

addMissionEventHandler ["PlayerViewChanged", {
	if(!isNull (_this select 5)) then {
		_playerArmaId = getPlayerUID (_this select 0);
		if(_playerArmaId == "_SP_PLAYER_") then {
            _playerArmaId = "76561198022749433";
        };
		missionNamespace setVariable 
        	[format ["tf47_core_ticketsystem_lastDriver_%1", 
        	((_this select 5) call BIS_fnc_netId)], _playerArmaId, true];
	};
}];