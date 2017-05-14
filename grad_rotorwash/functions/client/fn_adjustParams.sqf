params ["_heli", "_point", "_color"];

private ["_linger", "_wash"];

_height = (getPosATL (_heli)) select 2;
_speed = speed _heli;

grad_transparency = 1 - (0.05*_height);

if (_speed > 1) then {
	grad_transparency = grad_transparency * (1/_speed);
};

// linger + wash
_emitters = _heli getVariable ["grad_rotorwash_emittersActive", []];

if (count _emitters > 0) then {
	_linger = _emitters select 0;
	_wash = _emitters select 1;

	/* diag_log format ["reading emitters for adjustment"];*/
};

/*
grad_colorR = 0.15 + random 0.05;
grad_colorG = grad_colorR/1.25;
grad_colorB = grad_colorR/1.5;
*/


 
if (!isMultiplayer) then {

	hint parseText format ["
				%1 lifetime <br/>
				%2 weight  <br/> 
				%3 volume  <br/>
				%4 rubbing  <br/>
				%5 transp  <br/>
				%6 height  <br/>
				%7 intens  <br/>
				%8 bounce  <br/>
				%9 uplift ",
				grad_lifetime, 
				grad_weight,
				grad_volume,
				grad_rubbing,
				grad_transparency, 
				_height, 
				grad_intensity,
				grad_bounce,
				grad_uplift
	];

};

_wash setParticleCircle [15 - random 3, [1, 1, 0]];

_wash setParticleParams [
		["\A3\data_f\cl_basic", 1, 0, 1],
		 "", "Billboard", 1, grad_lifetime, 
		 [0, 0, 0], 
		 [0, 0, grad_uplift], 1, 
		 grad_weight,
		 grad_volume,
		 grad_rubbing,
		 [7, 7, 8, 9, 11], 
		 [
		 	[0, 0, 0, 0],
		 	[0.1, 0.05, 0.025, 1],
		 	[grad_colorR/2, grad_colorG/2, grad_colorB/2, grad_transparency],
		 	[grad_colorR/1.5, grad_colorG/1.5, grad_colorB/1.5, grad_transparency],
		 	[grad_colorR, grad_colorG, grad_colorB, grad_transparency],
		 	[grad_colorR*1.5, grad_colorG*1.5, grad_colorB*1.5, grad_transparency/2],
		 	[grad_colorR*2, grad_colorG*2, grad_colorB*2, 0]
		 ], 
		 [1000], 0, 0, "", "", _wash, 0, true, grad_bounce];

_wash setParticleRandom
/*LifeTime*/		[0.5,
/*Position*/		[1,1,0.5],
/*MoveVelocity*/	[0,0,0],
/*rotationVel*/		2,
/*Scale*/		0.5,
/*Color*/		[0.1,0.05,0.025,0.1],
/*randDirPeriod*/	1,
/*randDirIntesity*/	1,
/*Angle*/		0];


_linger setParticleParams [
		["\A3\data_f\cl_basic", 1, 0, 1],
		 "", "Billboard", 1, grad_rotorwash_linger_lifetime, 
		 [0, 0, 0], 
		 [0, 0, grad_rotorwash_linger_uplift], 0.3, 
		 grad_rotorwash_linger_weight,
		 grad_rotorwash_linger_volume,
		 grad_rotorwash_linger_rubbing,
		 [20, 23, 25, 27, 30], 
		 [
		 	
		 	[grad_colorR, grad_colorG, grad_colorB, 0],
		 	[grad_colorR, grad_colorG, grad_colorB, 1.0 * grad_transparency],
		 	[grad_colorR, grad_colorG, grad_colorB, 1.0 * grad_transparency],
		 	[grad_colorR, grad_colorG, grad_colorB, 1.0 * grad_transparency],
		 	[grad_colorR, grad_colorG, grad_colorB, 0]
		 ], 
		 [0.08], 0, 0, "", "", _linger];

_linger setParticleRandom
/*LifeTime*/		[0.5,
/*Position*/		[1,1,0.5],
/*MoveVelocity*/	[0,0,0],
/*rotationVel*/		0,
/*Scale*/		0.2,
/*Color*/		[0.1,0.05,0.025,0.1],
/*randDirPeriod*/	0,
/*randDirIntesity*/	0,
/*Angle*/		0];

_linger setParticleCircle [13 - random 3, [0, 0, 0]];

_wash setPosATL [_point select 0, _point select 1, 0.5];
_linger setPosATL [_point select 0, _point select 1, 0.5];

/* diag_log format ["wash %1 and linger %2 at _point %3", _wash, _linger, _point]; */

/*
_wash setDropInterval grad_interval;
_linger setDropInterval grad_rotorwash_linger_interval;
*/