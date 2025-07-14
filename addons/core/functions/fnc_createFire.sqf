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
	"_shooter",
	"_timeActive"
];

private _fireType = switch (_size) do {
	case 0: {"SmallDestructionFire"};
	case 1: {"MediumDestructionFire"};
	case 2: {"BigDestructionFire"};
	default {"SmallDestructionFire"};
};

private _fireObject = "#particlesource" createVehicleLocal (ASLToAGL _pos);
_fireObject setParticleClass _fireType;

// Larger fires get a small light
if (_size > 0) then {
	_fireObject setParticleFire [0.1, 0.5, 0.2]; // Reduce the damage so people don't die instantly
	_pos = [_pos # 0, _pos # 1, (_pos # 2) + 0.5];
	private _light = "#lightpoint" createVehicleLocal (ASLToAGL _pos);

	_light setLightColor [1, 0.65, 0.4];
	_light setLightAmbient [0.15, 0.05, 0];
	_light setLightIntensity 300;
	_light setLightAttenuation [0, 0, 0, 1];
	_light setLightDayLight false;
	TRFR_activeFires pushBack [_light, 10, time + _timeActive, _shooter];
};

["TRFR_fireCreated", [_fireObject, _size, time + _timeActive, _shooter]] call CBA_fnc_localEvent;
TRFR_activeFires pushBack [_fireObject, _size, time + _timeActive, _shooter];
