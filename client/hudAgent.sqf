diag_log "Starting hudAgent";

// disableSerialization;

while {true} do
{
	systemChat "----------";
	systemChat format ["OPFOR:%1", score_totals select 0];
	systemChat format ["BLUFOR:%1", score_totals select 1];
	systemChat format ["INDEPENDENT:%1", score_totals select 2];
	systemChat "----------";
	sleep 10;
}