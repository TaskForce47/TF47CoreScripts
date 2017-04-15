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
    
    
    	class whitelist
	{
		title = "Whitelist failed"; // Tile displayed as text on black background. Filled by arguments.
		iconPicture = "\a3\ui_f\data\map\VehicleIcons\icontank_ca.paa"; // Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
		description = "You are not whitelisted"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
		color[] = {1,1,1,1}; // Icon and text color
		duration = 10; // How many seconds will the notification be displayed
		priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
		difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
	};
    class ticketadd
	{
		title = "Ticket gain"; // Tile displayed as text on black background. Filled by arguments.
		iconPicture = "plus_2.paa"; // Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
		description = "%1"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
		color[] = {0.7,1.0,0.3,1.0};
		duration = 5; // How many seconds will the notification be displayed
		priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
		difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
	};
    class ticketlost
	{
		title = "Ticket loose"; // Tile displayed as text on black background. Filled by arguments.
		iconPicture = "minus_2.paa"; // Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
		description = "%1"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
		color[] = {1.0,0.3,0.2,1.0};
		duration = 5; // How many seconds will the notification be displayed
		priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
		difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
	};
    class tickets
	{
		title = "Aktuelle Tickets"; // Tile displayed as text on black background. Filled by arguments.
		iconPicture = "ticket.paa"; // Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
		description = "%1"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
		color[] = {1,1,1,1}; // Icon and text color
		duration = 5; // How many seconds will the notification be displayed
		priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
		difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
	};