extends Character

signal minerva_out

func _process(delta):
	if GLOBAL.character["minerva"]:
		pass
	else:
		queue_free()

func reaction():
	if GLOBAL.items["Hammer"]:
		interaction("minerva_dialog_hammer")
		GLOBAL.items["Hammer"] = false
		
	elif GLOBAL.items["Manual"]:
		interaction("minerva_dialog_manual")
		GLOBAL.items["Manual"] = false
		emit_signal("minerva_out")
		
	else:
		interaction("minerva_dialog_main")
		
		
		
