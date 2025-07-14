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

// Just to make sure everybody is just handling their own stuff
if !(local _projectile) exitWith {};

// Check if a tracer was fired
if (_projectile getShotInfo 4) then {
	// Start fire logic
	[_projectile, _ammo, _unit] call FUNC(startFire);
};
