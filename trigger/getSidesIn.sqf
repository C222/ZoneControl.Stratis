params ["_trigger", "_units"];

_sides = [];
{
	_sides = _sides + [side _x];
} forEach _units;

_sides = _sides arrayIntersect _sides;

_sides