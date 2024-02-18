extends Node

var one_time_lamp = true
var one_time_apple = true 

@onready var grid_secret = $GridSecret
@onready var eleonora = $NPCs/CharacterEleonora
@onready var mariapia = $NPCs/CharacterMariapia
@onready var minerva = $NPCs/CharacterMinerva
@onready var mariapaula = $NPCs/CharacterMariapaula
@onready var borger = $Borger
@onready var apple = $Items/Apple

func _ready():
	GLOBAL.items = {"Apple": false, "Cards": false, "Hammer": false, "Manual": false, "Nothing": false}
	GLOBAL.key_item = "Nothing"
	GLOBAL.character = {"eleonora": true, "maria_paula": true, "minerva": true}
	GLOBAL.apple_given = false
	GLOBAL.cards_given = false
	GLOBAL.hammer_given = false
	GLOBAL.manual_given = false
	GLOBAL.lamp_secret = false
	GLOBAL.pilar_secret = false
	#print(GLOBAL.items)
	#print(GLOBAL.key_item)
	#print(GLOBAL.character)
	#print(GLOBAL.apple_given)
	#print(GLOBAL.cards_given)
	#print(GLOBAL.hammer_given)
	#print_debug(GLOBAL.manual_given)

func _on_torch_open_secret():
	if one_time_lamp:
		grid_secret.queue_free()
		one_time_lamp = false
	else:
		pass

func _on_character_eleonora_mariapia_cards():
	eleonora.queue_free()
	mariapia.queue_free()

func _on_character_minerva_minerva_out():
	minerva.queue_free()

func _on_character_mariapaula_mariapaula_go():
	mariapaula.global_position = Vector3(-19,1.25,-5)

func _on_character_mariapaula_burger_dissapear():
	borger.visible = false

func _on_character_mariapaula_apple_dissapear():
	if one_time_apple:
		apple.queue_free()
		one_time_apple = false
	else:
		pass
