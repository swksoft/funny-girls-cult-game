extends Area3D

class_name InteractiveObject

signal open_secret
signal now_obtainable

@export var item_name : String = "Nothing"
@export var obtainable: bool = true
@export var sprite_texture: Resource = preload("res://icon.svg")

var one_time = true

@onready var sprite = $Sprite3D

func dialog_end():
	pass
	
func interaction():
	GLOBAL.key_item = item_name
	
	if !obtainable:
		if item_name == "Torch":
			if GLOBAL.lamp_secret and one_time:
				DialogueManager.show_dialogue_balloon(load("res://scripts/dialogue/object.dialogue"), "torch")
				emit_signal("open_secret")
			else:
				DialogueManager.show_dialogue_balloon(load("res://scripts/dialogue/object.dialogue"), "torch")
		else:
			DialogueManager.show_dialogue_balloon(load("res://scripts/dialogue/object.dialogue"), "interactive")
	else:
		if item_name == "Manual":
			if GLOBAL.pilar_secret:
				DialogueManager.show_dialogue_balloon(load("res://scripts/dialogue/object.dialogue"), "get_item")
				queue_free()
			else:
				DialogueManager.show_dialogue_balloon(load("res://scripts/dialogue/object.dialogue"), "get_item")
		else:
			DialogueManager.show_dialogue_balloon(load("res://scripts/dialogue/object.dialogue"), "get_item")
			queue_free()

func _ready():
	sprite.texture = sprite_texture
	sprite.texture_filter = 0
	sprite.scale = Vector3(2,2,2)

func _on_body_entered(body):
	if body.is_in_group("Player"):
		interaction()
		body._move("backwards")
