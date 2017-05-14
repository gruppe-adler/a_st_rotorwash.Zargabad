_grad_dust = "#particlesource" createVehicleLocal (getpos player); 

/* _grad_dust setParticleCircle [10, [0, 0, 0]]; */

_grad_dust setParticleParams [
		["\A3\data_f\cl_basic", 1, 0, 1],
		 "", "Billboard", 1, grad_lifetime, 
		 [0, 0, 0], 
		 [grad_intensity, grad_intensity, grad_uplift], 0.3, 
		 grad_weight,
		 grad_volume,
		 grad_rubbing,
		 [7, 7, 8, 9, 11], 
		 [
		 	[0, 0, 0, 1],
		 	[grad_colorR, grad_colorG, grad_colorB, grad_transparency],
		 	[grad_colorR, grad_colorG, grad_colorB, grad_transparency],
		 	[grad_colorR, grad_colorG, grad_colorB, grad_transparency],
		 	[grad_colorR, grad_colorG, grad_colorB, 0]
		 ], 
		 [0.08], 0, 0, "", "", _grad_dust, 0, true, grad_bounce];


_grad_dust setDropInterval grad_interval;

/* _grad_dust setParticleRandom [10, [0.25, 0.25, 0], [1, 1, 0], 1, 1, [0, 0, 0, 0.1], 0, 0];*/	
_grad_dust