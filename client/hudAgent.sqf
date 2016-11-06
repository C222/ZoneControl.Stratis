diag_log "Starting hudAgent";

get_corners = {
	params ["_marker"];
	
	private ["_ul", "_ur", "_bl", "_br", "_cos", "_sin", "_c", "_w", "_h", "_tx", "_ty"];
	
	_c = markerPos _marker;
	_sin = sin (markerDir _marker);
	_cos = cos (markerDir _marker);
	_w = (markerSize _marker) select 0;
	_h = (markerSize _marker) select 1;
	
	_ul = [(_c select 0) + (_w), (_c select 1) + (_h), 5];
	_tx = _ul select 0;
	_ty = _ul select 1;
	_ul set [0, _tx * _cos - _ty * _sin];
	_ul set [1, _tx * _sin + _ty * _cos];
	
	_ur = [(_c select 0) - (_w), (_c select 1) + (_h), 5];
	// _tx = _ur select 0;
	// _ty = _ur select 1;
	// _ur set [0, _tx * _cos - _ty * _sin];
	// _ur set [1, _tx * _sin + _ty * _cos];
	
	_bl = [(_c select 0) + (_w), (_c select 1) - (_h), 5];
	// _tx = _bl select 0;
	// _ty = _bl select 1;
	// _bl set [0, _tx * _cos - _ty * _sin];
	// _bl set [1, _tx * _sin + _ty * _cos];
	
	_br = [(_c select 0) - (_w), (_c select 1) - (_h), 5];
	// _tx = _br select 0;
	// _ty = _br select 1;
	// _br set [0, _tx * _cos - _ty * _sin];
	// _br set [1, _tx * _sin + _ty * _cos];
	
	[_ul, _ur, _bl, _br]
};

disableSerialization;

private ["_ui", "_major_hud", "_bl_hud", "_br_hud", "_limit", "_marker_color", "_icon_color", "_z"];

_limit = "ScoreLimit" call BIS_fnc_getParamValue;

// _marker_color = "ColorOrange";
// _icon_color = [0.85,0.4,0,1];

// onEachFrame {
	// switch (side player) do
	// {
		// case east: {
			// _marker_color = "ColorEAST";
			// _icon_color = [0.5,0,0,1];
		// };
		// case west: {
			// _marker_color = "ColorWEST";
			// _icon_color = [0,0.3,0.6,1];
		// };
		// case independent: {
			// _marker_color = "ColorGUER";
			// _icon_color = [0,0.5,0,1];
		// };
	// };
	// _z = allMapMarkers select {markerShape _x == "RECTANGLE"};
	// {
		// drawIcon3D ["\a3\ui_f\data\gui\cfg\GameTypes\defend_ca.paa", _icon_color, markerPos _x, 1, 1, 0, "", 0, 0, "TahomaB"];
	// } forEach _z;
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