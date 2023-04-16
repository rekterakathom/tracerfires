class Extended_PreStart_EventHandlers {
    class TRFR_sys {
        init = QUOTE(call COMPILE_FILE(XEH_preStart));
    };
};

class Extended_PreInit_EventHandlers {
	class TRFR_sys {
		init = QUOTE(call COMPILE_FILE(XEH_preInit));
	};
};

class Extended_PostInit_EventHandlers {
	class TRFR_sys {
		init = QUOTE(call COMPILE_FILE(XEH_PostInit));
	};
};

class Extended_FiredBIS_EventHandlers {
	class AllVehicles {
		class TRFR_sys {
			clientFiredBIS = QUOTE(_this call FUNC(fired));
		};
	};
};
