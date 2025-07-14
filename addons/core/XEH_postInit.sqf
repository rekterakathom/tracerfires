#include "script_component.hpp"
[{
    call FUNC(monitorFires);
}, 0] call CBA_fnc_addPerFrameHandler;

["TRFR_createFire", FUNC(createFire)] call CBA_fnc_addEventHandler;
