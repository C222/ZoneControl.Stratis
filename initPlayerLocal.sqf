titleText ["Waiting for Server", "BLACK", 0];
waitUntil{!(isNil "score_totals")};

titleFadeOut 1;

[] spawn client_fnc_hudAgent;