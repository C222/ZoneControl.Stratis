params ["_trigger", "_list"];

_trigger setVariable ["sidesIn", [_trigger, _list] call trigger_fnc_getSidesIn];
_trigger call trigger_fnc_spawnMarker;
_trigger call trigger_fnc_makeColor;