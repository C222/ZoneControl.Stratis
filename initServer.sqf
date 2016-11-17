diag_log format ["############################# %1 #############################", missionName];
diag_log format ["T%1,DT%2,F%3", time, diag_tickTime, diag_frameno];
diag_log format ["ZoneControl Server - Initilizing Server"];;

diag_log format ["Loading inventories."];
[] call server_fnc_addInventories;
diag_log format ["Loading Purchase Locations."];
[] call server_fnc_addPurchaseLocations;

diag_log format ["Spawning server agents."];
[] spawn server_fnc_mapAgent;
[] spawn server_fnc_weatherAgent;

sleep 5;
readyForSpawn = true;
publicVariable "readyForSpawn";
diag_log "Done Initilizing Server";