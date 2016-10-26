params ["_trigger"];

private ["_pos", "_mname", "_size", "_angle", "_isrect", "_sides", "_side"];

_pos = position _trigger select [0,2];
_mname = triggerText _trigger;
_size = triggerArea _trigger select [0,2];
_angle = triggerArea _trigger select 2;
_isrect = triggerArea _trigger select 3;

_sides = _trigger getVariable ["sidesIn", []];

_markerstr = createMarker [_mname, _pos];
_markerstr setMarkerText _mname;
if (_isrect) then
{
	_markerstr setMarkerShape "RECTANGLE";
} else {};
_markerstr setMarkerSize _size;
_markerstr setMarkerDir _angle;
_markerstr setMarkerAlpha 0.5;