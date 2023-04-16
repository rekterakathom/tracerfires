#include "script_component.hpp"
/*
 * Author: ThomasAngel
 * Creates the fire object
 *
 * Arguments:
 * _pos to create at (posASL)
 * _size of fire to create (0 for small, 1 for medium, 2 for big)
 * _shooter who caused the fire
 *
 * Return Value:
 * None
 */

params [
	"_pos",
	"_size",
	"_shooter"
];

private _fireType = switch (_size) do {
	case 0: {"SmallDestructionFire"};
	case 1: {"MediumDestructionFire"};
	case 2: {"BigDestructionFire"};
	default {"SmallDestructionFire"};
};

private _fireObject = "#particlesource" createVehicleLocal [0, 0, 0];
_fireObject setParticleClass _fireType;
_fireObject setPosASL _pos;

private _timeActive = random [10, 15, 20];

// Larger fires get a small light
// Dedis and HC's don't need it
if (_size > 0 && hasInterface) then {
	_fireObject setParticleFire [0.1, 0.5, 0.2]; // Reduce the damage so people don't die instantly
	_pos = [_pos # 0, _pos # 1, (_pos # 2) + 0.5];
	private _light = "#lightpoint" createVehicleLocal [0, 0, 0];
	_light setPosASL _pos;

	_light setLightColor [1, 0.65, 0.4];
	_light setLightAmbient [0.15, 0.05, 0];
	_light setLightIntensity 300;
	_light setLightAttenuation [0, 0, 0, 1];
	_light setLightDayLight false;
	TRFR_activeFires pushBack [_light, 10, time + _timeActive, _shooter];
};


TRFR_activeFires pushBack [_fireObject, _size, time + _timeActive, _shooter];
