params ["_units"];

_sides = [];
{
	if (_x countSide _units > 0) then
	{
		_ = _sides pushBackUnique _x;
	};
} forEach [west, east, resistance, civilian, sideUnknown];

_sides