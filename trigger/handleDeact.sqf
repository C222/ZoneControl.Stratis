params ["_trigger"];

_trigger setVariable ["sidesIn", []];
deleteMarker (triggerText _trigger);