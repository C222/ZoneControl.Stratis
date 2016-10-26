params ["_trigger"];

_sides = _trigger getVariable ["sidesIn", []];

player sideChat format ["%1, %2", _trigger, _sides];

if ((count _sides) > 1) then
{
	_markerstr setMarkerColor "ColorOrange";
} else
{
	if ((count _sides) == 1) then
	{
		_side = _sides select 0;
		if (_side == resistance) then
		{
			_markerstr setMarkerColor "ColorGUER";
		};
		if (_side == east) then
		{
			_markerstr setMarkerColor "ColorEAST";
		};
		if (_side == west) then
		{
			_markerstr setMarkerColor "ColorWEST";
		};
	};
};

player sideChat format ["%1, %2", triggerText _trigger, markerColor _markerstr];