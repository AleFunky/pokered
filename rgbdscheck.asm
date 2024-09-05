;Make this project require rgbds 0.6.0.
MAJOR EQU 0
MINOR EQU 6
PATCH EQU 0

IF !DEF(__RGBDS_MAJOR__) || !DEF(__RGBDS_MINOR__) || !DEF(__RGBDS_PATCH__)
	FAIL "This project requires rgbds {MAJOR}.{MINOR}.{PATCH} to be installed."
ELIF (__RGBDS_MAJOR__ < MAJOR) || \
	(__RGBDS_MAJOR__ == MAJOR && __RGBDS_MINOR__ < MINOR) || \
	(__RGBDS_MAJOR__ == MAJOR && __RGBDS_MINOR__ == MINOR && __RGBDS_PATCH__ < PATCH)
	FAIL "This project requires that rgbds be upgraded to the {MAJOR}.{MINOR}.{PATCH} release."
ELIF (__RGBDS_MAJOR__ > MAJOR) || \
	(__RGBDS_MAJOR__ == MAJOR && __RGBDS_MINOR__ > MINOR)
	FAIL "This project requires that rgbds be downgraded to {MAJOR}.{MINOR}.{PATCH} at most."
ELIF (__RGBDS_MAJOR__ == MAJOR && __RGBDS_MINOR__ == MINOR && __RGBDS_PATCH__ > PATCH)
	WARN "This project may have issues with rgbds versions above {MAJOR}.{MINOR}.{PATCH}."
ENDC
