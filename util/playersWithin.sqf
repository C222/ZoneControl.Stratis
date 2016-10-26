params ["_marker"];

private ["_radius", "_x", "_y", "_players", "_crew", "_vehicles"];

_radius = getMarkerSize _marker;
_x = (_radius select 0);
_y = (_radius select 1);
if (markerShape _marker == "RECTANGLE") then
{
	_radius = sqrt ((_x ^ 2) + (_y ^ 2));
}
else
{
	_radius = _x max _y;
};
_players = [];

_vehicles = (nearestObjects [getMarkerPos _marker, ["AllVehicles"], _radius]);

{
	if (_x inArea _marker) then
	{
		_crew = crew _x;
		{
			if (!(isNull _x)) then
			{
				_players pushBack _x;
			};
		} forEach _crew;
	}
} forEach _vehicles;

_players