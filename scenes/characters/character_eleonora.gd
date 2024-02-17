extends Character

signal mariapia_cards

func reaction():
	if GLOBAL.cards_given:
		interaction("eleonora_dialog_cards")
		emit_signal("mariapia_cards")
	else:
		interaction("eleonora_dialog_main")
