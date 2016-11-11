params ["_marker", "_side"];

if (_side == sideUnknown) exitWith
{
	_marker setMarkerAlpha 1;
	_marker setMarkerColor "ColorOrange";
};

if (_side == resistance or _side == east or _side == west) exitWith
{
	_marker setMarkerAlpha 1;
	_marker setMarkerColor ([_side, true] call BIS_fnc_sideColor);
};

_marker setMarkerAlpha 0.25;
_marker setMarkerColor "ColorWhite";