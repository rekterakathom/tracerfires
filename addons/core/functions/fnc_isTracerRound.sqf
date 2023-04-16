#include "script_component.hpp"
/*
 * Author: ThomasAngel
 * Checks if last fired shot was a tracer round
 *
 * Arguments:
 * _unit that fired
 * _muzzle that fired
 * _magazine that was used
 *
 * Return Value:
 * Boolean, was shot a tracer
 */

params ["_unit", "_muzzle", "_magazine"];

private _currentRoundCount = _unit ammo _muzzle;

private _magData = TRFR_magazineCache getOrDefaultCall [
	_magazine,
	{
		private _magConfig = configFile >> "CfgMagazines" >> _magazine;
		private _tracersEvery = getNumber (_magConfig >> "tracersEvery");
		private _lastRoundsTracer = getNumber (_magConfig >> "lastRoundsTracer");

		// Fix zero divisor
		if (_tracersEvery == 0) then {_tracersEvery = 9999};

		[_tracersEvery, _lastRoundsTracer]
	},
	true
];

_magData params ["_tracersEvery", "_lastRoundsTracer"];

if (_currentRoundCount < _lastRoundsTracer) exitWith {
	true
};

if (_currentRoundCount % _tracersEvery == 0) exitWith {
	true
};

false
