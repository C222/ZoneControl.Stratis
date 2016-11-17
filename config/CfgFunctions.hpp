class config
{
	class common
	{
		class purchaseLocations
		{
			file = "config\purchaseLocations.sqf";
		};
	};
};

class util
{
	class common
	{
		class playersWithin
		{
			file = "util\playersWithin.sqf";
		};
		class getSidesIn
		{
			file = "util\getSidesIn.sqf";
		};
		class makeColor
		{
			file = "util\makeColor.sqf";
		};
		class pickWinner
		{
			file = "util\pickWinner.sqf";
		};
	};
};

class player
{
	class common
	{
	};
};

class vehicle
{
	class common
	{
	};
};

class server
{
	class common
	{
		class mapAgent
		{
			file = "server\mapAgent.sqf";
		};
		class addInventories
		{
			file = "server\addInventories.sqf";
		};
		class addPurchaseLocations
		{
			file = "server\addPurchaseLocations.sqf";
		};
		class weatherAgent
		{
			file = "server\weatherAgent.sqf";
		};
		class purchaseRequest
		{
			file = "server\purchaseRequest.sqf";
		};
	};
};

class client
{
	class common
	{
		class hudAgent
		{
			file = "client\hudAgent.sqf";
		};
		class weatherSync
		{
			file = "client\weatherSync.sqf";
		};
		class addActions
		{
			file = "client\addActions.sqf";
		};
		class addPurchaseLocations
		{
			file = "client\addPurchaseLocations.sqf";
		};
	};
};