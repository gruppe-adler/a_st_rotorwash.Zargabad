params ["_vehicle"];

(
	isEngineOn _vehicle && 
	{ getPosATL _vehicle select 2 < GRAD_ROTORWASH_MAX_HEIGHT }
)