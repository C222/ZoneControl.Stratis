class ReqUnits
{
	title = "Units Required to Capture";
	values[] = {0, 1, 4, 9, 14};
	texts[] = {"1", "2", "5", "10", "15"};
	default = 1;
};

class Daytime
{
	title = "Time";
	texts[] = {"Morning","Day","Evening","Night"};
	values[] = {6,12,18,0};
	default = 12;
	function = "BIS_fnc_paramDaytime";
	isGlobal = 1;
};

class ScoreLimit
{
	title = "Points to Win";
	values[] = {250, 500, 750, 1000, 1500, 2000, 2500, 3500};
	texts[] = {"250", "500", "750", "1000", "1500", "2000", "2500", "3000"};
	default = 1000;
};