SFX_Ball_Toss_Ch4:
	duty 2
	pitchenvelope 2, -7
	squarenote 15, 15, 2, 1920
;	BUG: Someone forgot to close this out with pitchenvelope 0, 0
;		so the CH1 Sweep Register [ff10] will have the wrong audio settings
;		until something else plays to modify the pitch envelope.
;joenote - let's fix that
	pitchenvelope 0, 0
	endchannel


SFX_Ball_Toss_Ch5:
	duty 2
	squarenote 15, 12, 2, 1922
	endchannel
