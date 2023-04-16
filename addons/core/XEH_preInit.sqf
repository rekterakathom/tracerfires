#include "script_component.hpp"

ADDON = false;

// Compile Functions
#include "PREP.hpp"

// CBA Settings
#include "initSettings.sqf"

// Cache for magazine data
TRFR_magazineCache = createHashmap;
TRFR_ammoCache = createHashmap;
TRFR_flammableCache = createHashmap;
TRFR_activeFires = [];

ADDON = true;
