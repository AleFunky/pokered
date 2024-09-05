#define variables
sFile=
sVersion=
dBankSize=16384
xBank=
dBank=
xAddress=
dAddress=
dOffset=
xAddressEnd=
dAddressEnd=
dOffsetEnd=
bByte=0
xByte=00
dByte=0
dSize=0
dCell=0
Element=0

#define arrays

#Arrays for C-tier wild land pokemon
	#Temporary array and initial list define
xWildMonC=(37 40 18 30 1B 60 21 3A 17 0C 66 25 46 0D 19 06 6A BC A9 AD 11 5C 54 39 04 B9 2F 94 99 B1 41 4D B0 52 6D 4C 0F 6C 03 05 3B 64 A5 24 6B 7C 71 7B 70)
	#Backup of original list
xWildMonCOrg+=("${xWildMonC[@]}")
	#New randomized list specifying a replacement in a per-element basis
xWildMonCRand+=("${xWildMonC[@]}")
#Arrays for any C-Tier pokemon
	#Temporary array and initial list define
xMonC=(37 40 18 30 1B 60 21 3A 17 0C 66 25 46 0D 19 06 6A BC A9 AD 11 5C 54 39 04 B9 2F 94 99 B1 41 4D B0 52 6D 4C 0F 6C 03 05 3B 64 A5 24 6B 7C 71 7B 70 9D 47 85 58)
	#Backup of original list
xMonCOrg+=("${xMonC[@]}")
	#New randomized list specifying a replacement in a per-element basis
xMonCRand+=("${xMonC[@]}")


#Arrays for B-tier wild land pokemon
	#Temporary array and initial list define
xWildMonB=(55 36 1E 5D 35 33 82 08 9E 23 77 2D 76 93 2E 29 BD 27 A3 91 2B 2C A6 22 2A 48 26 BA 12 A8 A7 0B 4E 96 AA)
	#Backup of original list
xWildMonBOrg+=("${xWildMonB[@]}")
	#New randomized list specifying a replacement in a per-element basis
xWildMonBRand+=("${xWildMonB[@]}")
#Arrays for any B-Tier pokemon
	#Temporary array and initial list define
xMonB=(55 36 1E 5D 35 33 82 08 9E 23 77 2D 76 93 2E 29 BD 27 A3 91 2B 2C A6 22 2A 48 26 BA 12 A8 A7 0B 4E 96 BB 75 8E 90 65 98 6E 09 B2 B3 AA 7D 72 62 5A)
	#Backup of original list
xMonBOrg+=("${xMonB[@]}")
	#New randomized list specifying a replacement in a per-element basis
xMonBRand+=("${xMonB[@]}")


#Arrays for A-tier wild land pokemon
	#Temporary array and initial list define
xWildMonA=(3C 9B 1D 84 8A 8F 1A 28 81 02 61 80 78 74 88 8D)
	#Backup of original list
xWildMonAOrg+=("${xWildMonA[@]}")
	#New randomized list specifying a replacement in a per-element basis
xWildMonARand+=("${xWildMonA[@]}")
#Arrays for any A-Tier pokemon
	#Temporary array and initial list define
xMonA=(3C 9B 1D 84 8A 8F 1A 28 81 02 61 80 78 74 88 8D 42 8B 16 14 0A 01 AB 59 69 68 67 5B 9A B4 1C 0E 13 A4 10 07 6F 95 97 53 7E BE 31 63)
	#Backup of original list
xMonAOrg+=("${xMonA[@]}")
	#New randomized list specifying a replacement in a per-element basis
xMonARand+=("${xMonA[@]}")


#Arrays for any super rod pokemon
	#Temporary array and initial list define
xMonFish=(58 9D 5C 8A 4E 13 85 47 6E 2F 5D 9E 17 08 25 1B 18)
	#Backup of original list
xMonFishOrg+=("${xMonFish[@]}")
	#New randomized list specifying a replacement in a per-element basis
xMonFishRand+=("${xMonFish[@]}")


#define functions
funcWildRandomC()
{
	dSize=${#xWildMonC[@]}
	dCell=0
	Element=0
	local i
	for (( i=0; i<$dSize; i++ ))
	do
		dCell=$(($RANDOM % $dSize))
		Element=${xWildMonC[$dCell]}
		if [ $((0x$Element)) -eq 0 ]
		then
			((i--))
		else
			xWildMonCRand[$i]=${xWildMonC[$dCell]}
			xWildMonC[$dCell]=00
		fi
	done
	echo ${xWildMonCRand[*]}
	echo ${xWildMonC[*]}
	echo ${xWildMonCOrg[*]}
}
funcRandomC()
{
	dSize=${#xMonC[@]}
	dCell=0
	Element=0
	local i
	for (( i=0; i<$dSize; i++ ))
	do
		dCell=$(($RANDOM % $dSize))
		Element=${xMonC[$dCell]}
		if [ $((0x$Element)) -eq 0 ]
		then
			((i--))
		else
			xMonCRand[$i]=${xMonC[$dCell]}
			xMonC[$dCell]=00
		fi
	done
	echo ${xMonCRand[*]}
	echo ${xMonC[*]}
	echo ${xMonCOrg[*]}
}
funcRandCvert()
{
	dSize=${#xMonCOrg[@]}
	Element=0
	local i
	for (( i=0; i<$dSize; i++ ))
	do
		Element=${xMonCOrg[$i]}
		if [ $((0x$Element)) -eq $((0x$xByte)) ]
		then
			xByte=${xMonCRand[$i]}
			break
		fi
	done
}
funcRandWildCvert()
{
	dSize=${#xWildMonCOrg[@]}
	Element=0
	local i
	for (( i=0; i<$dSize; i++ ))
	do
		Element=${xWildMonCOrg[$i]}
		if [ $((0x$Element)) -eq $((0x$xByte)) ]
		then
			xByte=${xWildMonCRand[$i]}
			break
		fi
	done
}

funcWildRandomB()
{
	dSize=${#xWildMonB[@]}
	dCell=0
	Element=0
	local i
	for (( i=0; i<$dSize; i++ ))
	do
		dCell=$(($RANDOM % $dSize))
		Element=${xWildMonB[$dCell]}
		if [ $((0x$Element)) -eq 0 ]
		then
			((i--))
		else
			xWildMonBRand[$i]=${xWildMonB[$dCell]}
			xWildMonB[$dCell]=00
		fi
	done
	echo ${xWildMonBRand[*]}
	echo ${xWildMonB[*]}
	echo ${xWildMonBOrg[*]}
}
funcRandomB()
{
	dSize=${#xMonB[@]}
	dCell=0
	Element=0
	local i
	for (( i=0; i<$dSize; i++ ))
	do
		dCell=$(($RANDOM % $dSize))
		Element=${xMonB[$dCell]}
		if [ $((0x$Element)) -eq 0 ]
		then
			((i--))
		else
			xMonBRand[$i]=${xMonB[$dCell]}
			xMonB[$dCell]=00
		fi
	done
	echo ${xMonBRand[*]}
	echo ${xMonB[*]}
	echo ${xMonBOrg[*]}
}
funcRandBvert()
{
	dSize=${#xMonBOrg[@]}
	Element=0
	local i
	for (( i=0; i<$dSize; i++ ))
	do
		Element=${xMonBOrg[$i]}
		if [ $((0x$Element)) -eq $((0x$xByte)) ]
		then
			xByte=${xMonBRand[$i]}
			break
		fi
	done
}
funcRandWildBvert()
{
	dSize=${#xWildMonBOrg[@]}
	Element=0
	local i
	for (( i=0; i<$dSize; i++ ))
	do
		Element=${xWildMonBOrg[$i]}
		if [ $((0x$Element)) -eq $((0x$xByte)) ]
		then
			xByte=${xWildMonBRand[$i]}
			break
		fi
	done
}

funcWildRandomA()
{
	dSize=${#xWildMonA[@]}
	dCell=0
	Element=0
	local i
	for (( i=0; i<$dSize; i++ ))
	do
		dCell=$(($RANDOM % $dSize))
		Element=${xWildMonA[$dCell]}
		if [ $((0x$Element)) -eq 0 ]
		then
			((i--))
		else
			xWildMonARand[$i]=${xWildMonA[$dCell]}
			xWildMonA[$dCell]=00
		fi
	done
	echo ${xWildMonARand[*]}
	echo ${xWildMonA[*]}
	echo ${xWildMonAOrg[*]}
}
funcRandomA()
{
	dSize=${#xMonA[@]}
	dCell=0
	Element=0
	local i
	for (( i=0; i<$dSize; i++ ))
	do
		dCell=$(($RANDOM % $dSize))
		Element=${xMonA[$dCell]}
		if [ $((0x$Element)) -eq 0 ]
		then
			((i--))
		else
			xMonARand[$i]=${xMonA[$dCell]}
			xMonA[$dCell]=00
		fi
	done
	echo ${xMonARand[*]}
	echo ${xMonA[*]}
	echo ${xMonAOrg[*]}
}
funcRandAvert()
{
	dSize=${#xMonAOrg[@]}
	Element=0
	local i
	for (( i=0; i<$dSize; i++ ))
	do
		Element=${xMonAOrg[$i]}
		if [ $((0x$Element)) -eq $((0x$xByte)) ]
		then
			xByte=${xMonARand[$i]}
			break
		fi
	done
}
funcRandWildAvert()
{
	dSize=${#xWildMonAOrg[@]}
	Element=0
	local i
	for (( i=0; i<$dSize; i++ ))
	do
		Element=${xWildMonAOrg[$i]}
		if [ $((0x$Element)) -eq $((0x$xByte)) ]
		then
			xByte=${xWildMonARand[$i]}
			break
		fi
	done
}


funcRandomFish()
{
	dSize=${#xMonFish[@]}
	dCell=0
	Element=0
	local i
	for (( i=0; i<$dSize; i++ ))
	do
		dCell=$(($RANDOM % $dSize))
		Element=${xMonFish[$dCell]}
		if [ $((0x$Element)) -eq 0 ]
		then
			((i--))
		else
			xMonFishRand[$i]=${xMonFish[$dCell]}
			xMonFish[$dCell]=00
		fi
	done
	echo ${xMonFishRand[*]}
	echo ${xMonFish[*]}
	echo ${xMonFishOrg[*]}
}
funcRandFishvert()
{
	dSize=${#xMonFishOrg[@]}
	Element=0
	local i
	for (( i=0; i<$dSize; i++ ))
	do
		Element=${xMonFishOrg[$i]}
		if [ $((0x$Element)) -eq $((0x$xByte)) ]
		then
			xByte=${xMonFishRand[$i]}
			break
		fi
	done
}


funcSetStarters()
{
	echo Do you want to randomize starter pokemon? [y/n]
	read ans
	case $ans in
		y)
			#do nothing
			;;
		n)
			return
			;;
		*)
			echo Unrecognized input. Exiting script.
			exit 
			;;
	esac

	echo Search for PlayerStarter1Label and note the rom bank hex value to the left of the :
	echo And also note the hex address of PlayerStarter1Label to the right of the :
	echo Enter the rom bank hex value now.
	read xBank
	echo
	echo Enter the hex address now.
	read xAddress
	echo
	dBank=$((0x$xBank))
	
	#now increase address +1 bytes to point to the player starter_1 'mon id
	dAddress=$((0x$xAddress + 1))
	dOffset=$(($dBank*$dBankSize + $dAddress - $dBankSize))
	xByte=$(xxd -p -l 1 -s $dOffset $sFile)
	funcRandCvert
	printf "$(printf '\\x%02X' $((0x$xByte)))" | dd of=$sFile bs=1 seek=$dOffset count=1 conv=notrunc
	#now increase address +17 bytes to point to the player starter_2 'mon id
	dAddress=$(($dAddress + 17))
	dOffset=$(($dBank*$dBankSize + $dAddress - $dBankSize))
	xByte=$(xxd -p -l 1 -s $dOffset $sFile)
	funcRandCvert
	printf "$(printf '\\x%02X' $((0x$xByte)))" | dd of=$sFile bs=1 seek=$dOffset count=1 conv=notrunc
	#now increase address +17 bytes to point to the player starter_3 'mon id
	dAddress=$(($dAddress + 17))
	dOffset=$(($dBank*$dBankSize + $dAddress - $dBankSize))
	xByte=$(xxd -p -l 1 -s $dOffset $sFile)
	funcRandCvert
	printf "$(printf '\\x%02X' $((0x$xByte)))" | dd of=$sFile bs=1 seek=$dOffset count=1 conv=notrunc
	
	echo Starter pokemon have now been randomized.
}


funcSetRosters()
{
	echo Do you want to randomize trainer rosters? [y/n]
	read ans
	case $ans in
		y)
			#do nothing
			;;
		n)
			return
			;;
		*)
			echo Unrecognized input. Exiting script.
			exit 
			;;
	esac

	echo Search for RosterLabelStart and note the rom bank hex value to the left of the :
	echo And also note the hex address of RosterLabelStart to the right of the :
	echo Enter the rom bank hex value now.
	read xBank
	echo Enter the hex address now.
	read xAddress
	echo
	echo Search for RosterLabelEnd label and note the hex address to the right of the :
	echo Enter the hex address now.
	read xAddressEnd
	echo
	
	dBank=$((0x$xBank))
	dAddress=$((0x$xAddress))
	dOffset=$(($dBank*$dBankSize + $dAddress - $dBankSize))
	dAddressEnd=$((0x$xAddressEnd))
	dOffsetEnd=$(($dBank*$dBankSize + $dAddressEnd - $dBankSize))
	
	local i
	for (( i=$dOffset; i<$dOffsetEnd; i++ ))	#scan through all the roster data
	do
		xByte=$(xxd -p -l 1 -s $i $sFile)	#get initial byte
		if [ $((0x$xByte)) -eq $((0xFF)) ]
		then
			#Byte is FF, so mons have individual specific levels
			((i++))	#increment to next byte (get the first roster mon level)
			xByte=$(xxd -p -l 1 -s $i $sFile) #read the byte
			while [ $((0x$xByte)) -ne 0 ]
			do
				((i++))	#increment to next byte (get a roster mon)
				xByte=$(xxd -p -l 1 -s $i $sFile) #read the byte
				#randomize mon byte
				funcRandAvert
				funcRandBvert
				funcRandCvert
				#write the new random mon byte
				printf "$(printf '\\x%02X' $((0x$xByte)))" | dd of=$sFile bs=1 seek=$i count=1 conv=notrunc status=none
				((i++))	#increment to next byte (get the next roster mon level or zero terminator)
				xByte=$(xxd -p -l 1 -s $i $sFile) #read the byte
			done
		else
			#Byte is not FF, so mons all use the current byte for all their levels
			((i++))	#increment to next byte (get the first roster mon)
			xByte=$(xxd -p -l 1 -s $i $sFile) #read the byte
			while [ $((0x$xByte)) -ne 0 ]
			do
				#randomize mon byte
				funcRandAvert
				funcRandBvert
				funcRandCvert
				#write the new random mon byte
				printf "$(printf '\\x%02X' $((0x$xByte)))" | dd of=$sFile bs=1 seek=$i count=1 conv=notrunc status=none
				((i++))	#increment to next byte (will be mon or zero terminator)
				xByte=$(xxd -p -l 1 -s $i $sFile) #read the byte
			done
			#while loop exit - xByte and 'i' point to zero terminator byte of the roster
		fi
		echo Completion is $(($i - $dOffset)) of $(($dOffsetEnd - $dOffset - 1)) bytes.
		#for loop increments 'i' to initial byte of next trainer roster
	done

	echo Trainer rosters have now been randomized.
}


funcSetWildmon()
{
	echo Do you want to randomize wild pokemon? [y/n]
	read ans
	case $ans in
		y)
			#do nothing
			;;
		n)
			return
			;;
		*)
			echo Unrecognized input. Exiting script.
			exit 
			;;
	esac

	echo Search for WildDataLabelStart and note the rom bank hex value to the left of the :
	echo And also note the hex address of WildDataLabelStart to the right of the :
	echo Enter the rom bank hex value now.
	read xBank
	echo Enter the hex address now.
	read xAddress
	echo
	echo Search for WildDataLabelEnd label and note the hex address to the right of the :
	echo Enter the hex address now.
	read xAddressEnd
	echo
	
	dBank=$((0x$xBank))
	dAddress=$((0x$xAddress))
	dOffset=$(($dBank*$dBankSize + $dAddress - $dBankSize))
	dAddressEnd=$((0x$xAddressEnd))
	dOffsetEnd=$(($dBank*$dBankSize + $dAddressEnd - $dBankSize))
	
	local i
	local j
	for (( i=$dOffset; i<$dOffsetEnd; i++ ))	#scan through all the wildmon data
	do
		
		xByte=$(xxd -p -l 1 -s $i $sFile)	#get encounter rate byte
		if [ $((0x$xByte)) -ne $((0x00)) ]
		then #encounter data confirmed
		
			for (( j=0; j<10; j++ ))	#randomize the next 10 pokemon slots
			do
			
				((i++))	#increment to mon level
				((i++))	#increment to mon species
				xByte=$(xxd -p -l 1 -s $i $sFile)	#get mon byte
				#randomize mon byte
				funcRandWildAvert
				funcRandWildBvert
				funcRandWildCvert
				#write the new random mon byte
				printf "$(printf '\\x%02X' $((0x$xByte)))" | dd of=$sFile bs=1 seek=$i count=1 conv=notrunc status=none
				
				#j increments here
			done
		
		fi
		echo Completion is $(($i - $dOffset)) of $(($dOffsetEnd - $dOffset - 1)) bytes.
		
		#i increments here
	done

	echo Wild pokemon have now been randomized.
}


funcSetSuperRod()
{
	echo Do you want to randomize super rod pokemon? [y/n]
	read ans
	case $ans in
		y)
			#do nothing
			;;
		n)
			return
			;;
		*)
			echo Unrecognized input. Exiting script.
			exit 
			;;
	esac

	echo Search for SuperRodLabelStart and note the rom bank hex value to the left of the :
	echo And also note the hex address of SuperRodLabelStart to the right of the :
	echo Enter the rom bank hex value now.
	read xBank
	echo Enter the hex address now.
	read xAddress
	echo
	echo Search for SuperRodLabelEnd label and note the hex address to the right of the :
	echo Enter the hex address now.
	read xAddressEnd
	echo
	
	dBank=$((0x$xBank))
	dAddress=$((0x$xAddress))
	dOffset=$(($dBank*$dBankSize + $dAddress - $dBankSize))
	dAddressEnd=$((0x$xAddressEnd))
	dOffsetEnd=$(($dBank*$dBankSize + $dAddressEnd - $dBankSize))
	
	local i
	local j
	local c
	for (( i=$dOffset; i<$dOffsetEnd; i++ ))	#scan through all the wildmon data
	do
		
		xByte=$(xxd -p -l 1 -s $i $sFile)	#get byte for number of mons in the fishing group
		c=$((0x$xByte))
		if [ $((0x$xByte)) -ne $((0x00)) ]
		then #fishing data confirmed
		
			for (( j=0; j<$c; j++ ))	#randomize the pokemon in the group
			do
				
				((i++))	#increment to mon level
				((i++))	#increment to mon species
				xByte=$(xxd -p -l 1 -s $i $sFile)	#get mon byte
				#randomize mon byte
				funcRandFishvert
				#write the new random mon byte
				printf "$(printf '\\x%02X' $((0x$xByte)))" | dd of=$sFile bs=1 seek=$i count=1 conv=notrunc status=none
				
				#j increments here
			done
		
		fi
		echo Completion is $(($i - $dOffset)) of $(($dOffsetEnd - $dOffset - 1)) bytes.
		
		#i increments here
	done

	echo Super rod pokemon have now been randomized.
}


funcSetPrizemon()
{
	echo Do you want to randomize game corner prize pokemon? [y/n]
	read ans
	case $ans in
		y)
			#do nothing
			;;
		n)
			return
			;;
		*)
			echo Unrecognized input. Exiting script.
			exit 
			;;
	esac

	echo Search for PrizeMenuMon1Entries and note the rom bank hex value to the left of the :
	echo And also note the hex address of PrizeMenuMon1Entries to the right of the :
	echo Enter the rom bank hex value now.
	read xBank
	echo Enter the hex address now.
	read xAddress
	echo
	
	dBank=$((0x$xBank))
	dAddress=$((0x$xAddress))
	dOffset=$(($dBank*$dBankSize + $dAddress - $dBankSize))
	dOffsetEnd=$(($dOffset + 14))
	
	local i
	local j
	for (( i=$dOffset; i<$dOffsetEnd; i+=8 ))	#scan through all the prizemon data
	do
		#randomize the next 3 pokemon slots
		for (( j=0; j<3; j++ ))
		do
			xByte=$(xxd -p -l 1 -s $i $sFile)	#get mon byte
			#randomize mon byte
			funcRandWildAvert
			funcRandWildBvert
			funcRandWildCvert
			funcRandFishvert
			#write the new random mon byte
			printf "$(printf '\\x%02X' $((0x$xByte)))" | dd of=$sFile bs=1 seek=$i count=1 conv=notrunc status=none
			echo offset $(($i)) written.
			((i++))	#increment to next mon
			#j increments here
		done
		
		echo Completion is $(($i - $dOffset)) of $(($dOffsetEnd - $dOffset - 1)) bytes.
		
		#i increments here
	done

	echo Prize pokemon have now been randomized.
}


funcMainInputs()
{
    echo Randomizing pokemon lists for $sVersion version.
	
	funcWildRandomC
	echo
	funcRandomC
	echo
	funcWildRandomB
	echo
	funcRandomB
	echo
	funcWildRandomA
	echo
	funcRandomA
	echo
	funcRandomFish
	echo
		
	echo Please consult the poke$sVersion.sym file from the Shin Pokemon github branch you are using.
	echo Now let us begin.
	
	funcSetStarters
	echo
	funcSetRosters
	echo
	funcSetWildmon
	echo
	funcSetSuperRod
	echo
	funcSetPrizemon
	echo
}

#Main Script Starts Here
echo Enter the filepath and/or name of your rom file, including the file extension.
read sFile
echo

echo What version is being randomized? [red/blue/green]
read sVersion
echo

case $sVersion in
	red)
		funcMainInputs
		;;
	blue)
		funcMainInputs
		;;
	green)
		funcMainInputs
		;;
	*)
		echo Unrecognized input.
		echo 
		;;
esac

echo Exiting script.
