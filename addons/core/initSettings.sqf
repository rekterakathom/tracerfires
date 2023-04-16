#include "script_component.hpp"

// BASIC SETTINGS

	// Tracer fires enabled
    [
        QCBA_SETTING(enabled),
        "CHECKBOX",
        ["Tracer Fires enabled", "Toggles the mod on and off"],
        [COMPONENT_NAME, "Basic Settings"],
        true
    ] call CBA_fnc_addSetting;

	// Chance that a fire occurs
    [
        QCBA_SETTING(chanceMultiplier),
        "SLIDER",
        ["Fire chance multiplier", "Multiplier for fire spawning probability. Higher value means fires spawn more often."],
        [COMPONENT_NAME, "Basic Settings"],
        [0.5, 2, 1, 2]
    ] call CBA_fnc_addSetting;

    // Chance that a fire grows bigger
    [
        QCBA_SETTING(fireGrowChance),
        "SLIDER",
        ["Chance for fires to grow", "Chance for a small fire to grow to a medium sized one. Medium fires are more taxing on performance!"],
        [COMPONENT_NAME, "Basic Settings"],
        [0, 1, 0.20, 2]
    ] call CBA_fnc_addSetting;

    // Maximum amount of fires
    [
        QCBA_SETTING(fireLimit),
        "SLIDER",
        ["Maximum amount of fires", "Fire object limit. Lowering this will improve performance."],
        [COMPONENT_NAME, "Basic Settings"],
        [100, 1000, 500, 0]
    ] call CBA_fnc_addSetting;