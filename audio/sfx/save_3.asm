;joenote - updated file to contain variations from jp versions
SFX_Save_3_Ch4:
	duty 2
IF DEF(_REDJP)
	squarenote 2, 15, 4, 1792
	squarenote 2, 14, 4, 1536
	squarenote 2, 14, 4, 1664
	squarenote 2, 14, 4, 1728
	squarenote 2, 14, 4, 1792
	squarenote 2, 14, 4, 1984
	squarenote 15, 15, 2, 2016
ELIF DEF(_RED)
	squarenote 4, 15, 4, 1792
	squarenote 3, 14, 4, 1664
	squarenote 3, 14, 4, 1728
	squarenote 3, 14, 4, 1792
	squarenote 2, 14, 4, 1952
ELIF DEF(_GREEN)
	squarenote 4, 15, 4, 1792
	squarenote 2, 14, 4, 1664
	squarenote 2, 14, 4, 1792
	squarenote 2, 14, 4, 1984
	squarenote 15, 15, 2, 2016
ELSE	;for blue & bluejp versions
	squarenote 3, 14, 4, 1536
	squarenote 3, 14, 4, 1664
	squarenote 3, 14, 4, 1728
	squarenote 3, 14, 4, 1792
	squarenote 15, 15, 2, 2016
ENDC
	endchannel


SFX_Save_3_Ch5:
	duty 2
IF DEF(_REDJP)
	squarenote 2, 0, 8, 0
	squarenote 2, 13, 4, 1793
	squarenote 2, 12, 4, 1537
	squarenote 2, 12, 4, 1665
	squarenote 2, 12, 4, 1729
	squarenote 2, 12, 4, 1793
	squarenote 2, 12, 4, 1985
	squarenote 15, 13, 2, 2017
ELIF DEF(_RED)
	squarenote 4, 0, 8, 0
	squarenote 3, 13, 4, 1793
	squarenote 3, 12, 4, 1665
	squarenote 3, 12, 4, 1729
	squarenote 3, 12, 4, 1793
	squarenote 2, 12, 4, 1953
ELIF DEF(_GREEN)
	squarenote 2, 0, 8, 0
	squarenote 4, 13, 4, 1793
	squarenote 2, 12, 4, 1665
	squarenote 2, 12, 4, 1793
	squarenote 2, 12, 4, 1985
	squarenote 15, 13, 2, 2017
ELSE	;for blue & bluejp versions
	squarenote 3, 0, 8, 0
	squarenote 3, 12, 4, 1537
	squarenote 3, 12, 4, 1665
	squarenote 3, 12, 4, 1729
	squarenote 3, 12, 4, 1793
	squarenote 15, 13, 2, 2017
ENDC
	endchannel
