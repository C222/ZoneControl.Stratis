params ["_units"];

_sides = [];
{
	_ = _sides pushBackUnique (side _x);
} forEach _units;

_sides