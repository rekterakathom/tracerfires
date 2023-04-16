#include "script_component.hpp"
/*
 * Author: ThomasAngel
 * Runs the fire starting logic
 *
 * Arguments:
 * _projectile that was fired
 * _ammo that was used
 * _unit who fired the shot
 *
 * Return Value:
 * None
 */

params [
	"_projectile",
	"_ammo",
	"_unit"
];

private _caliber = [_ammo] call FUNC(getCaliber);
if (_caliber == 0) exitWith {}; // Can't start a fire
if (humidity == 1) exitWith {}; // It's so humid that fires can't start

_projectile setVariable ["TRFR_caliber", _caliber, false];
_projectile setVariable ["TRFR_shooter", _unit, false];
_projectile addEventHandler ["HitPart", {
	params ["_projectile", "_hitEntity", "_projectileOwner", "_pos", "_velocity", "_normal", "_component", "_radius" ,"_surfaceType"];
	if !([_surfaceType] call FUNC(isFlammable)) exitWith {};
	
	if ((1 - humidity) < (random 1)) exitWith {}; // Fires become rarer with higher humidity

	if ((random 10) > ((_projectile getVariable ["TRFR_caliber", 1]) * CBA_SETTING(chanceMultiplier))) exitWith {}; // Lower caliber projectiles have smaller chance of igniting a fire

	private _shooter = _projectile getVariable ["TRFR_shooter", objNull];
	[_pos, 0, _shooter] call FUNC(createFire);
}];
