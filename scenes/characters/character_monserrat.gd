extends Character

func reaction():
	if !GLOBAL.character["maria_paula"]:
		interaction("monserrat_dialog_mariapaula")
	else:
		interaction("monserrat_dialog_main")
	

