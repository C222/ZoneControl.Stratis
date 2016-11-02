diag_log "Starting mapAgent";

private ["_z", "_zones", "_marker", "_winner", "_score", "_respawns", "_scalar", "_limit"];

_limit = "ScoreLimit" call BIS_fnc_getParamValue;

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
		
		_winner = [_marker] call util_fnc_pickWinner;
		
		[_marker, _winner] call util_fnc_makeColor;
		
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
	
	_scalar = (count allPlayers + 1) * 2.5;
	east addScoreSide  ceil (((_score select 0) / ((playersNumber east) + 1)) * _scalar);
	west addScoreSide  ceil (((_score select 1) / ((playersNumber west) + 1)) * _scalar);
	resistance addScoreSide  ceil (((_score select 2) / ((playersNumber resistance) + 1)) * _scalar);
	
	if (scoreSide east > _limit or scoreSide west > _limit or scoreSide resistance > _limit) exitWith
	{
		"SideScore" call BIS_fnc_endMissionServer;
	};
	
	sleep 5;
};