params ["_player"];

_player addAction ["Purchase Item",
	{
		[(name (nearestLocation [player, "Name"])), player] remoteExec ["server_fnc_purchaseRequest", 2];
	},
	"",
	1,
	false,
	true,
	"",
	"((position player) inArea (nearestLocation [player, ""Name""]))
	and (markerColor (name (nearestLocation [player, ""Name""])) == [side player, true] call BIS_fnc_sideColor)"
];

_player setVariable ["hasActions", 1];