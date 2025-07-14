#include "script_component.hpp"
/*
 * Author: ThomasAngel
 * Check if a surface is flammable
 *
 * Arguments:
 * _surfaceType that is checked
 *
 * Return Value:
 * Boolean - flammable or not
 */

params [
	"_surfaceType"
];

TRFR_flammableCache getOrDefaultCall [
	_surfaceType,
	{
		private _flammableStrs = ["wood", "foliage", "pine", "grass"];
		private _surfaceTypeStr = toLowerANSI (str _surfaceType);

		private _flammable = false;
		{
			if (_x in _surfaceTypeStr) exitWith {_flammable = true};
		} forEach _flammableStrs;
		_flammable
	},
	true
]
