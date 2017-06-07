class tf47_core_base
{
    title = "";
	iconPicture = "";
	iconText = "";
	description = "%1";
	color[] = {1,1,1,1};
	duration = 5;
	priority = 0;
	difficulty[] = {};
}

class tf47_core_tankFail : tf47_core_base
{
	title = "Whitelist Fehler";
	iconPicture = "TF47CoreScripts\data\tankFail.paa";
};

class tf47_core_tankSuccess : tf47_core_base
{
	title = "Whitelist korrekt";
	iconPicture = "TF47CoreScripts\data\tankSuccess.paa";
};

class tf47_core_ticketLoss : tf47_core_base
{
	title = "Ticket Verlust";
	iconPicture = "TF47CoreScripts\data\ticketLoss.paa";
	description = "%1";
};

class tf47_core_ticketStatus : tf47_core_base
{
	title = "Aktuelle Tickets";
	iconPicture = "TF47CoreScripts\data\ticketStatus.paa";
	description = "%1";
};