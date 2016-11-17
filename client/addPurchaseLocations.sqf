{
	private _marker_name = _x select 0;
	private _vehicle_name = _x select 1;
	private _weapon_cargo = _x select 2;
	private _price = _x select 4;
	
	private _location_text = "";
	
	if (_vehicle_name == "groundWeaponHolder") then
	{
		_location_text = getText (configfile >> "CfgWeapons" >> (_weapon_cargo select 0) >> "displayName");
	} else {
		_location_text = getText (configFile >> "cfgVehicles" >> _vehicle_name >> "displayName");
	};
	
	private _marker_pos = markerPos _marker_name;
	private _marker_size = markerSize _marker_name;
	
	private _location = createLocation [ "Name" , _marker_pos, (_marker_size select 0), (_marker_size select 1)];
	_location setName _marker_name;
	_location setText format ["%1 [%2]", _location_text, _price];
	_location setDirection (markerDir _marker_name);
	_location setRectangular true;
} forEach ([] call config_fnc_purchaseLocations);