params ["_marker", "_sides"];

private ["_side", "_winner"];

_winner = sideEmpty;

if ((count _sides) > 1) then
{
	_marker setMarkerColor "ColorOrange";
} else
{
	if ((count _sides) == 1) then
	{
		_side = _sides select 0;
		_winner = _side;
		_marker setMarkerAlpha 1;
		switch _side do 
		{
			case resistance: {_marker setMarkerColor "ColorGUER";};
			case east: {_marker setMarkerColor "ColorEAST";};
			case west: {_marker setMarkerColor "ColorWEST";};
		};
	} else
	{
		_marker setMarkerColor "ColorWhite";
		_marker setMarkerAlpha 0.25;
	};
};

_winner