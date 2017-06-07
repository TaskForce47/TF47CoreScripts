/**
 *  @author Willard
 *  @description
 *  Loads the prepared statements
 *  @params none
 *  @return nothing
 */
if(!isServer) exitWith {
    ["initDatabase not called on the server!", "Error", true] spawn
        BIS_fnc_guiMessage;
};

// add the prepared statements
_addDbResult = "extDB3" callExtension "9:ADD_DATABASE:Database";
_addProtocolResult = "extDB3" callExtension
    "9:ADD_DATABASE_PROTOCOL:Database:SQL_CUSTOM:SQL:corescripts.ini";

// check if it worked
if(((call compileFinal _addDbResult) select 0) != 1 or
    ((call compileFinal _addProtocolResult) select 0) != 1) then {
        ["initDatabase could not add the required protocls!", "Error", 
            true] spawn
            BIS_fnc_guiMessage;
};
