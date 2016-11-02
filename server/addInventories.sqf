private ["_west_inventories", "_east_inventories", "_guer_inventories"];

_west_inventories = ["WEST1", "WEST2", "WEST3", "WEST4"];
_east_inventories = ["EAST1"];
_guer_inventories = ["GUER1"];

{
	[west, _x] call BIS_fnc_addRespawnInventory;
} forEach _west_inventories;

{
	[east, _x] call BIS_fnc_addRespawnInventory;
} forEach _east_inventories;

{
	[independent, _x] call BIS_fnc_addRespawnInventory;
} forEach _guer_inventories;