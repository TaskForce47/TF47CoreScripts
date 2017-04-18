
if(!isServer) exitWith {};

_addDbResult = "extDB3" callExtension "9:ADD_DATABASE:Database"; 
_addProtocolResult = "extDB3" callExtension "9:ADD_DATABASE_PROTOCOL:Database:SQL_CUSTOM:SQL:corescripts.ini";

if(((call compileFinal _addDbResult) select 0) != 1 or ((call compileFinal _addProtocolResult) select 0) != 1) then {
    //error
};