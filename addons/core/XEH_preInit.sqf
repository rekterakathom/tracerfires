#include "script_component.hpp"

ADDON = false;

// Compile Functions
#include "PREP.hpp"

// CBA Settings
#include "initSettings.inc.sqf"

// Cache for magazine data
TRFR_magazineCache = createHashMap;
TRFR_ammoCache = createHashMap;
TRFR_flammableCache = createHashMap;
TRFR_activeFires = [];

ADDON = true;
