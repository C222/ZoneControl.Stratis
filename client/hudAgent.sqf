diag_log "Starting hudAgent";

//Thanks to Sa-Matra 2016/11/10
get_corners = {
	private _pos = markerPos _this;
	private _size = markerSize _this;
	private _dir = markerDir _this;
	private _wsin = (_size select 0) * sin (_dir + 90);
	private _wcos = (_size select 0) * cos (_dir + 90);
	private _hsin = (_size select 1) * sin (_dir);
	private _hcos = (_size select 1) * cos (_dir);

	[
		[(_pos select 0) - _wsin + _hsin, (_pos select 1) - _wcos + _hcos],
		[(_pos select 0) + _wsin + _hsin, (_pos select 1) + _wcos + _hcos],
		[(_pos select 0) + _wsin - _hsin, (_pos select 1) + _wcos - _hcos],
		[(_pos select 0) - _wsin - _hsin, (_pos select 1) - _wcos - _hcos]
	]
};

disableSerialization;

private ["_ui", "_major_hud", "_bl_hud", "_br_hud", "_limit", "_marker_color", "_icon_color", "_z"];

_limit = "ScoreLimit" call BIS_fnc_getParamValue;

onEachFrame {
	private _playercolor = [side player, true] call BIS_fnc_sideColor;
	_z = allMapMarkers select {markerShape _x == "RECTANGLE"};
	{
		private _corners = _x call get_corners;
		private _col = (markerColor _x);
		if (_col != "ColorWhite" and (_col == _playercolor or _col == "ColorOrange")) then
		{
			_col = getArray (configfile >> "CfgMarkerColors" >> (markerColor _x) >> "color");
			_col = _col call BIS_fnc_colorConfigToRGBA;
			drawLine3D [(_corners select 0) + [4.8], (_corners select 1) + [4.8], _col];
			drawLine3D [(_corners select 1) + [4.8], (_corners select 2) + [4.8], _col];
			drawLine3D [(_corners select 2) + [4.8], (_corners select 3) + [4.8], _col];
			drawLine3D [(_corners select 3) + [4.8], (_corners select 0) + [4.8], _col];
			
			drawLine3D [(_corners select 0) + [4.9], (_corners select 1) + [4.9], _col];
			drawLine3D [(_corners select 1) + [4.9], (_corners select 2) + [4.9], _col];
			drawLine3D [(_corners select 2) + [4.9], (_corners select 3) + [4.9], _col];
			drawLine3D [(_corners select 3) + [4.9], (_corners select 0) + [4.9], _col];
			
			drawLine3D [(_corners select 0) + [5], (_corners select 1) + [5], _col];
			drawLine3D [(_corners select 1) + [5], (_corners select 2) + [5], _col];
			drawLine3D [(_corners select 2) + [5], (_corners select 3) + [5], _col];
			drawLine3D [(_corners select 3) + [5], (_corners select 0) + [5], _col];
		};
	} forEach _z;
};

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