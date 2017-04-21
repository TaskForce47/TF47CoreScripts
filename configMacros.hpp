


#define AIR 1
#define TANK 2
#define CCT 3

#define ON true
#define OFF false

#define WHITELIST(STATE)  tf47_core_whitelistActive = STATE;\
    publicVariable "tf47_core_whitelistActive";
#define WHITELIST_SYSTEM(STATE) tf47_core_whitelistSystem = STATE;\
    publicVariable "tf47_core_whitelistSystem";\
    [] call tf47_core_fnc_initWhitelist;

#define REGISTER_SLOT_BEGIN tf47_core_whitelistedSlots = [
#define REGISTER_SLOT(SLOTNAME, WHITELISTID) [SLOTNAME, WHITELISTID],
#define REGISTER_SLOT_END ["tf47_core_slotDefault", 0]];\
    publicVariable "tf47_core_whitelistedSlots";

#define TICKETSYSTEM(STATE) tf47_core_ticketSysttemActive = STATE;\
    publicVariable "tf47_core_ticketSysttemActive";
#define TICKETSYSTEM_MISSIONID(MISSIONID) tf47_core_ticketSystemMissionId =\
    MISSIONID; publicVariable "tf47_core_ticketSystemMissionId";
#define TICKETSYSTEM_MISSIONAME(MISSIONNAME) tf47_core_ticketSystemMissionName\
    = MISSIONNAME; publicVariable "tf47_core_ticketSystemMissionName";

#define TICKETSYSTEM_DETECTION_MODE(STATE) tf47_core_ticketSystemDetectionMode\
    = STATE; publicVariable "tf47_core_ticketSystemDetectionMode";

#define REGISTER_DEFAULT(TICKETS) tf47_coreticketSystemDefaultTickets\
    = TICKETS; publicVariable "tf47_coreticketSystemDefaultTickets";

#define REGISTER_TICKETCOST(SLOTNAME, COST) [SLOTNAME, COST],

#define REGISTER_SLOT_TICKETCOST_BEGIN tf47_core_ticketSystemSlotCost = [
#define REGISTER_SLOT_TICKETCOST_END [objNull, 0]];\
    publicVariable "tf47_core_ticketSystemSlotCost";

#define REGISTER_VEHICLE_TICKETCOST(VEHICLE, COST) [VEHICLE, COST] call\
    tf47_core_ticketsystem_fnc_registerVehicle;
