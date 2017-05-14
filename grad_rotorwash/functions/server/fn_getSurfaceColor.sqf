params ["_point"];

private ["_colorR", "_colorG", "_colorB"];

// default colors, greyish
_colorR = 0.2; 
_colorG = 0.15; 
_colorB = 0.1;
_alpha = 0.8;


switch (surfaceType _point) do {
	case "#GdtDesert": { _colorR = 0.3; _colorR = 0.25; _colorR = 0.2; _alpha = 1; };

	case "#GdtStratisConcrete": { _colorR = 0.7; _colorR = 0.65; _colorR = 0.6; _alpha = 0.1; };

	default {};
};

[_colorR, _colorG, _colorB, _alpha]