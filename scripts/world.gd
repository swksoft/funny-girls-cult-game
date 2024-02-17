extends Node

@onready var grid_secret = $GridSecret
@onready var eleonora = $NPCs/CharacterEleonora
@onready var mariapia = $NPCs/CharacterMariapia
@onready var minerva = $NPCs/CharacterMinerva
@onready var mariapaula = $NPCs/CharacterMariapaula
@onready var borger = $Borger

func _ready():
	GLOBAL.items = {"Apple": false, "Cards": false, "Hammer": false, "Manual": false, "Nothing": false}
	GLOBAL.key_item = "Nothing"
	GLOBAL.character = {"eleonora": true, "maria_paula": true, "minerva": true}
	GLOBAL.apple_given = false
	GLOBAL.cards_given = false
	GLOBAL.hammer_given = false
	GLOBAL.manual_given = false
	GLOBAL.lamp_secret = false
	#print_debug(GLOBAL.items)
	#print_debug(GLOBAL.key_item)
	#print_debug(GLOBAL.character)
	#print_debug(GLOBAL.apple_given)
	#print_debug(GLOBAL.cards_given)
	#print_debug(GLOBAL.hammer_given)
	#print_debug(GLOBAL.manual_given)

func _on_torch_open_secret():
	grid_secret.queue_free()

func _on_character_eleonora_mariapia_cards():
	eleonora.queue_free()
	mariapia.queue_free()

func _on_character_minerva_minerva_out():
	minerva.queue_free()

func _on_character_mariapaula_mariapaula_go():
	mariapaula.global_position = Vector3(-19,1.25,-5)

func _on_character_mariapaula_burger_dissapear():
	var delete_burger = borger.get_children()
	delete_burger.queue_free()