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

private _deleted = false;
private _currentTime = time;
private _remoteTargets = [0, -2] select isDedicated;
{
	_x params ["_fireObject", "_size", "_expireTime", "_shooter"];
	if (_currentTime > _expireTime) then {
		// Only the local shooters fires can grow -> prevent multiple big fires from a single shot
		if (_size isEqualTo 0 && {local _shooter && {random 1 < CBA_SETTING(fireGrowChance)}}) then {
			[getPosASL _fireObject, 1, _shooter] remoteExecCall [QFUNC(createFire), _remoteTargets, false];
		};
		deleteVehicle _fireObject;
		TRFR_activeFires set [_forEachIndex, 0];
		_deleted = true;
	};
} forEach TRFR_activeFires;

if (_deleted) then {
	TRFR_activeFires = TRFR_activeFires - [0];
};
