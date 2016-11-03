private ["_west_inventories", "_east_inventories", "_guer_inventories"];

_west_inventories = ["WEST1", "WEST2", "WEST3", "WEST4", "WEST5", "WEST6"];
_east_inventories = ["EAST1", "EAST2", "EAST3", "EAST4", "EAST5", "EAST6"];
_guer_inventories = ["GUER1", "GUER2", "GUER3", "GUER4", "GUER5", "GUER6"];

{
	[west, _x] call BIS_fnc_addRespawnInventory;
} forEach _west_inventories;

{
	[east, _x] call BIS_fnc_addRespawnInventory;
} forEach _east_inventories;

{
	[independent, _x] call BIS_fnc_addRespawnInventory;
} forEach _guer_inventories;