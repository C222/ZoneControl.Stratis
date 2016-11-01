diag_log "Starting hudAgent";

disableSerialization;

private ["_ui", "_major_hud", "_bl_hud", "_br_hud", "_limit"];

_limit = "ScoreLimit" call BIS_fnc_getParamValue;

// switch (side player) do
// {
	// case west: {
		// _major_hud ctrlSetTextColor [0, 0, 1, 1];
		// _bl_hud ctrlSetTextColor [1, 0, 0, 1];
		// _br_hud ctrlSetTextColor [0, 1, 0, 1];
	// };
	// case east: {
		// _major_hud ctrlSetTextColor [1, 0, 0, 1];
		// _bl_hud ctrlSetTextColor [0, 0, 1, 1];
		// _br_hud ctrlSetTextColor [0, 1, 0, 1];
	// };
	// case resistance: {
		// _major_hud ctrlSetTextColor [0, 1, 0, 1];
		// _bl_hud ctrlSetTextColor [1, 0, 0, 1];
		// _br_hud ctrlSetTextColor [0, 0, 1, 1];
	// };
// };

while {true} do
{
	1000 cutRsc ["player_HUD","PLAIN"];
	
	_ui = uiNameSpace getVariable "player_HUD";

	_major_hud = _ui displayCtrl 1700;
	_bl_hud = _ui displayCtrl 1701;
	_br_hud = _ui displayCtrl 1702;
	
	if (alive player) then
	{
		_major_hud ctrlSetStructuredText parseText format ["%1/%2 %3", scoreSide (side player), _limit, (side player)];

		switch (side player) do
		{
			case west: {
				
				_bl_hud ctrlSetStructuredText parseText format ["%1 %2", scoreSide east, east];
				_br_hud ctrlSetStructuredText parseText format ["%1 %2", scoreSide resistance, resistance];
				
				_major_hud ctrlSetTextColor [0, 0, 1, 1];
				_bl_hud ctrlSetTextColor [1, 0, 0, 1];
				_br_hud ctrlSetTextColor [0, 1, 0, 1];
			};
			case east: {
				
				_bl_hud ctrlSetStructuredText parseText format ["%1 %2", scoreSide west, west];
				_br_hud ctrlSetStructuredText parseText format ["%1 %2", scoreSide resistance, resistance];
				
				_major_hud ctrlSetTextColor [1, 0, 0, 1];
				_bl_hud ctrlSetTextColor [0, 0, 1, 1];
				_br_hud ctrlSetTextColor [0, 1, 0, 1];
			};
			case resistance: {
				
				_bl_hud ctrlSetStructuredText parseText format ["%1 %2", scoreSide east, east];
				_br_hud ctrlSetStructuredText parseText format ["%1 %2", scoreSide west, west];
				
				_major_hud ctrlSetTextColor [0, 1, 0, 1];
				_bl_hud ctrlSetTextColor [1, 0, 0, 1];
				_br_hud ctrlSetTextColor [0, 0, 1, 1];
			};
		};
		
		_major_hud ctrlCommit 0;
		_bl_hud ctrlCommit 0;
		_br_hud ctrlCommit 0;
		
		
		sleep 10;
	};
}