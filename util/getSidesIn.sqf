params ["_units", "_limit"];

_limit = "ReqUnits" call BIS_fnc_getParamValue;

_sides = [];
{
	if (_x countSide _units > _limit) then
	{
		_ = _sides pushBackUnique [_x countSide _units, _x];
	};
} forEach [west, east, resistance];

_sides