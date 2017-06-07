
// build config
call compileFinal preprocessFileLineNumbers "TF47CoreScriptsConfig.sqf";

// init
[] call tf47_core_fnc_initDatabase;
[] call tf47_core_fnc_initTicketsystem;
