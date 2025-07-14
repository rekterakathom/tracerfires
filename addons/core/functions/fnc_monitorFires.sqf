#include "script_component.hpp"
/*
 * Author: ThomasAngel
 * Check up on all active fires. Runs on every frame!
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 */

// We don't need to do anything
if (TRFR_activeFires isEqualTo []) exitWith {};

private _currentTime = time;
{
	_x params ["_fireObject", "_size", "_expireTime", "_shooter"];
	if (_currentTime > _expireTime) then {
		// Only the local shooters fires can grow -> prevent multiple big fires from a single shot
		if (_size isEqualTo 0 && {local _shooter && {random 1 < CBA_SETTING(fireGrowChance)}}) then {
			["TRFR_createFire", [getPosASL _fireObject, 1, _shooter, random [10, 15, 20]]] call CBA_fnc_globalEvent;
		};
		["TRFR_fireDeleted", [_fireObject, _size, _expireTime, _shooter]] call CBA_fnc_localEvent;
		deleteVehicle _fireObject;
		TRFR_activeFires deleteAt _forEachIndex;
	};
} forEachReversed TRFR_activeFires;
