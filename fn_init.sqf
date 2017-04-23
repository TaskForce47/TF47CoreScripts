
call compileFinal preprocessFileLineNumbers "TF47CoreScriptsConfig.sqf";

[] call tf47_core_fnc_initDatabase;
[] call tf47_core_fnc_initWhitelist;
[] call tf47_core_fnc_initTicketsystem;
