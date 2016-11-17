params ["_marker", "_player"];

private _location = nearestLocation [markerPos _marker, "Name"];

private _vehicle_name = _location getVariable "vehicle_name";
private _weapon_cargo = _location getVariable "weapon_cargo";
private _magazine_cargo = _location getVariable "magazine_cargo";
private _price = _location getVariable "price";

_pos = position _player findEmptyPosition [0, 5, _vehicle_name];
_weapon_holder = createVehicle [_vehicle_name, _pos, [], 0, "can_collide"]; 
_weapon_holder addWeaponCargoGlobal _weapon_cargo; 
_weapon_holder addMagazineCargoGlobal _magazine_cargo;