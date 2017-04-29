
_lastRoundResult = "extDB3" callExtension "0:SQL:getLastRound";


_result = (call compile _lastRoundResult) select 1;

_lastRound = 1;

if((typeName _result) == "ARRAY") then {
    if((count _result) != 0) then {
        _lastRound = (_result select 0) select 0;
    };
};

tf47_core_ticketsystem_round = _lastRound + 1;
publicVariable "tf47_core_ticketsystem_round";
