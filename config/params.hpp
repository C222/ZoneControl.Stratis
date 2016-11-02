class ReqUnits
{
	title = "Units Required to Capture";
	values[] = {0, 1, 4, 9, 14};
	texts[] = {"1", "2", "5", "10", "15"};
	default = 0;
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
	values[] = {10, 200, 300, 400, 500, 600, 700, 800, 900, 1000};
	texts[] = {"10", "200", "300", "400", "500", "600", "700", "800", "900", "1000"};
	default = 600;
};