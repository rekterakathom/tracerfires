#include "script_component.hpp"
/*
 * Author: ThomasAngel
 * Handles every gunshot and checks if a tracer was fired
 *
 * Arguments:
 * FiredEH Args
 *
 * Return Value:
 * None
 */

if !(CBA_SETTING(enabled)) exitWith {};
if (count TRFR_activeFires >= CBA_SETTING(fireLimit)) exitWith {};

params [
	"_unit",
	"_weapon",
	"_muzzle",
	"_mode",
	"_ammo",
	"_magazine",
	"_projectile",
	"_gunner"
];

// Check if a tracer was fired
if !([_unit, _muzzle, _magazine] call FUNC(isTracerRound)) exitWith {};

// Start fire logic
[_projectile, _ammo, _unit] call FUNC(startFire);
