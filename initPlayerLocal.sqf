titleText ["Please Wait...", "BLACK", 0];

titleFadeOut 1;

[] call client_fnc_addPurchaseLocations;

[] spawn client_fnc_hudAgent;
[] spawn client_fnc_weatherSync;