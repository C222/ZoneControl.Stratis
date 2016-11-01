params ["_marker"];

private ["_winner", "_players", "_sides", "_high_count"];

_winner = sideEmpty;
_high_count = 0;

_players = [_marker] call util_fnc_playersWithin;
_sides = [_players] call util_fnc_getSidesIn;

_sides sort false;

if (count _sides != 0) then
{
	if (count _sides == 1) then
	{
		_winner = (_sides select 0) select 1;
	} else {
		_fst = _sides select 0;
		_snd = _sides select 1;
		if ((_fst select 0) == (_snd select 0)) then
		{
			_winner = sideUnknown;
		} else {
			_winner = _fst select 1;
		};
	};
	
};

_winner