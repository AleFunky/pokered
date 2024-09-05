_CeladonDinerText1::
	text "Hi!"

	para "We're taking a"
	line "break now."
	done

_CeladonDinerText2::
	text "My #MON are"
	line "weak, so I often"
	cont "have to go to the"
	cont "DRUG STORE."
	done

_CeladonDinerText3::
	text "Psst! There's a"
	line "basement under"
	cont "the GAME CORNER."
	done

_CeladonDinerText4::
	text "Munch..."

	para "The man at that"
	line "table lost it all"
	cont "at the slots."
	done

_CeladonDinerText_491a7::
	text "Go ahead! Laugh!"

	para "I'm flat out"
	line "busted!"

	para "No more slots for"
	line "me! I'm going"
	cont "straight!"

	para "Here! I won't be"
	line "needing this any-"
	cont "more!"
	prompt

_ReceivedCoinCaseText::
	text "<PLAYER> received"
	line "a @"
	TX_RAM wcf4b
	text "!@@"

_CoinCaseNoRoomText::
	text "Make room for"
	line "this!"
	done

_CeladonDinerText_491b7::
	text "I always thought"
	line "I was going to"
	cont "win it back..."
	done

;joenote - add text for catch-up exp boost
_CeladonDiner_EXPCatchUpON::
	text "This spicy KETCHUP"
	line "helps me CATCH-UP"
	cont "with my studies."
	
	para "It can also make"
	line "weaker #MON"
	cont "gain more EXP."
	cont "Want to try it?"
	done
	
_CeladonDiner_EXPCatchUpOFF::
	text "Too spicy for you?"
	line "Or all caught-up?"
	
	para "I can undo the"
	line "effect with some"
	cont "MILK. Sound good?"
	done
	
_CeladonDiner_AideQ_done::
	text "Okay, it's done."
	done
	
_CeladonDiner_AideQ_reject::
	text "See me again if"
	line "you change your"
	cont "mind later."
	done
