params ["_marker", "_player"];

private _location = nearestLocation [markerPos _marker, "Name"];

private _vehicle_name = _location getVariable "vehicle_name";
private _weapon_cargo = _location getVariable "weapon_cargo";
private _magazine_cargo = _location getVariable "magazine_cargo";
private _price = _location getVariable "price";

diag_log format ["%1 attempted to purchase [%2, %3] for %4 at score %5", name _player, _vehicle_name, _weapon_cargo, _price, scoreSide side _player];

if ((markerColor _marker == [side _player, true] call BIS_fnc_sideColor) and (scoreSide side _player >= _price)) then
{
	private _pos = position _player findEmptyPosition [0, 5, _vehicle_name];
	if (count _pos != 0) then
	{
		side _player addScoreSide (-1 * _price);
		private _weapon_holder = createVehicle [_vehicle_name, _pos, [], 0, "can_collide"]; 
		_weapon_holder addWeaponCargoGlobal _weapon_cargo; 
		_weapon_holder addMagazineCargoGlobal _magazine_cargo;
		"Item Purchased. Check the ground." remoteExec ["hint", _player];
	} else {
		"Ground obstructed. Move into the open." remoteExec ["hint", _player];
	};
} else {
	"Insufficient Points." remoteExec ["hint", _player];
};