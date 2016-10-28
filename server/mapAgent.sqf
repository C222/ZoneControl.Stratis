diag_log "Starting mapAgent";

private ["_z", "_zones", "_marker", "_players", "_sides", "_winner", "_score", "_respawns"];

_z = allMapMarkers;
_zones = [];
_respawns = [];

{
	if (markerShape _x == "RECTANGLE")	then
	{
		_zones pushBack _x;
	};
} forEach _z;

while {true} do
{

	{
		_x call BIS_fnc_removeRespawnPosition;
	} forEach _respawns;
	
	_score = [0, 0, 0];
	_respawns = [];
	
	{
		_marker = _x;
		
		_players = [_marker] call util_fnc_playersWithin;
		_sides = [_players] call util_fnc_getSidesIn;
		_sides = _sides - [civilian, sideUnknown];
		
		_winner = [_marker, _sides] call util_fnc_makeColor;
		
		if (_winner != sideEmpty) then
		{
			_respawns pushBack ([_winner, markerPos _marker] call BIS_fnc_addRespawnPosition);
		};
		
		switch _winner do 
		{
			case east: {_score set [0, (_score select 0) + 1];};
			case west: {_score set [1, (_score select 1) + 1];};
			case resistance: {_score set [2, (_score select 2) + 1];};
		};
		
		sleep .02;
	} forEach _zones;
	
	east addScoreSide  ((_score select 0) / ((playersNumber east) + 1)) * (count allPlayers + 1);
	west addScoreSide  ((_score select 1) / ((playersNumber west) + 1)) * (count allPlayers + 1);
	resistance addScoreSide  ((_score select 2) / ((playersNumber resistance) + 1)) * (count allPlayers + 1);
	
	sleep 5;
};