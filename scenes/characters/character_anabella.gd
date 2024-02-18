extends Character

signal mariapaula_go
signal burger_dissapear

var mariapaula_move = false
var itsover = false

func reaction():
	if !itsover:
		if !mariapaula_move:
			if !GLOBAL.character["eleonora"]:
				interaction("mariapaula_dialog_dinnertime")
				mariapaula_move = true
				emit_signal("burger_dissapear")
				emit_signal("mariapaula_go")
			elif GLOBAL.items["Apple"]:
				interaction("mariapaula_dialog_apple")
			else:
				interaction("mariapaula_dialog_main")
		else:
			if GLOBAL.items["Apple"]:
				interaction("mariapaula_dialog_while_dinner")
				queue_free()
			else:
				## DESAPARECER MANZANA
				interaction("mariapaula_dialog_while_dinner")
				global_position = Vector3(1,1.25,25)
	else:
		interaction("mariapaula_dialog_itsover")
