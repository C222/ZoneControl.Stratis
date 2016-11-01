params ["_marker", "_side"];

switch _side do 
{
	case sideUnknown: {
		_marker setMarkerAlpha 1;
		_marker setMarkerColor "ColorOrange";
	};
	case resistance: {
		_marker setMarkerAlpha 1;
		_marker setMarkerColor "ColorGUER";
	};
	case east: {
		_marker setMarkerAlpha 1;
		_marker setMarkerColor "ColorEAST";
	};
	case west: {
		_marker setMarkerAlpha 1;
		_marker setMarkerColor "ColorWEST";
	};
	default {
		_marker setMarkerAlpha 0.25;
		_marker setMarkerColor "ColorWhite";
	};
};