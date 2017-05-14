GRAD_ROTORWASH_MAX_HEIGHT = 30; // max distance to ground for effect


if (isServer) then {
	GRAD_ROTORWASH_VEHICLES_SUPPORTED = []; // add vehicles here or via fnc_addVehicle
	GRAD_ROTORWASH_VEHICLES_ACTIVE = []; // vehiclearray for activated vehicles

	// add all rotors to array initially
	{
		if (_x isKindOf 'Air') then {
			GRAD_ROTORWASH_VEHICLES_SUPPORTED = GRAD_ROTORWASH_VEHICLES_SUPPORTED + [_x];
		};
	} forEach vehicles;

	call grad_rotorwash_fnc_serverLoop;
};


// do not edit below

if (hasInterface) then {

	grad_lifetime = 5;
	grad_weight = 10; 
	grad_volume = 8; 
	grad_rubbing = 0.001; 
	grad_intensity = 5; 
	grad_transparency = 1; 
	grad_colorR = 0.15; 
	grad_colorG = 0.10; 
	grad_colorB = 0.05; 
	grad_bounce = 1; 
	grad_uplift = 1.1; 
	grad_interval = 0.01;

	grad_rotorwash_linger_lifetime = 20; 
 	grad_rotorwash_linger_weight = 6.5; 
 	grad_rotorwash_linger_volume = 7; 
 	grad_rotorwash_linger_rubbing = 100; 
 	grad_rotorwash_linger_uplift = 0; 
 	grad_rotorwash_linger_interval = 0.05;
};