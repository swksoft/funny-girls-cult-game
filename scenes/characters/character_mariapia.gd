extends Character

func reaction():
	if GLOBAL.items["Cards"]:
		interaction("mariapia_dialog_cards")
		GLOBAL.cards_given = true
	else:
		interaction("mariapia_dialog_main")
