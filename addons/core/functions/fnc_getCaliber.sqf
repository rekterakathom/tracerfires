#include "script_component.hpp"
/*
 * Author: ThomasAngel
 * Tries to match ammo to a caliber
 *
 * Arguments:
 * _ammo that was fired
 *
 * Return Value:
 * None
 */

params [
	"_ammo"
];

private _caliber = 1;

private _caliber = TRFR_ammoCache getOrDefaultCall [
	_ammo,
	{
		getNumber (configFile >> "CfgAmmo" >> _ammo >> "caliber");
	},
	true
];

_caliber
