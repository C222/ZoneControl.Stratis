/*
Author: code34 nicolas_boiteux@yahoo.fr
Copyright (C) 2013-2015 Nicolas BOITEUX

Real weather for MP GAMES v 1.4

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>. 
*/

wcweather = [0, 0, 0, [0, 0, true], date];

wcweatherstart = true;
"wcweather" addPublicVariableEventHandler {
	// first JIP synchronization
	if(wcweatherstart) then {
		wcweatherstart = false;
		skipTime -24;
		86400 setRain (wcweather select 0);
		86400 setfog (wcweather select 1);
		86400 setOvercast (wcweather select 2);
		skipTime 24;
		simulweatherSync;
		setwind (wcweather select 3);
		setdate (wcweather select 4);
	}else{
		wcweather = _this select 1;
		60 setRain (wcweather select 0);
		60 setfog (wcweather select 1);
		60 setOvercast (wcweather select 2);
		setwind (wcweather select 3);
		setdate (wcweather select 4);
	};
};