diag_log "Starting mapAgent";

private ["_z", "_zones", "_marker", "_players", "_sides", "_winner", "_score"];

_z = allMapMarkers;
_zones = [];
score_totals = [0, 0, 0];
publicVariable "score_totals";


{
	if (markerShape _x == "RECTANGLE")	then
	{
		_zones pushBack _x;
	};
} forEach _z;

while {true} do
{
	_score = [0, 0, 0];
	{
		_marker = _x;
		
		_players = [_marker] call util_fnc_playersWithin;
		_sides = [_players] call util_fnc_getSidesIn;
		_sides = _sides - [civilian, sideUnknown];
		
		_winner = [_marker, _sides] call util_fnc_makeColor;
		
		switch _winner do 
		{
			case east: {_score set [0, (_score select 0) + 1];};
			case west: {_score set [1, (_score select 1) + 1];};
			case resistance: {_score set [2, (_score select 2) + 1];};
		};
		
		sleep .02;
	} forEach _zones;
	
	score_totals set [0, (score_totals select 0) + (_score select 0)];
	score_totals set [1, (score_totals select 1) + (_score select 1)];
	score_totals set [2, (score_totals select 2) + (_score select 2)];
	publicVariable "score_totals";
	
	sleep 5;
};