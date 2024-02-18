extends Character

func reaction():
	if GLOBAL.items["Cards"]:
		interaction("mariapia_dialog_cards")
		GLOBAL.cards_given = true
		GLOBAL.items["Cards"] = false
	else:
		interaction("mariapia_dialog_main")
