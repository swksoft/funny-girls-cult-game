extends Area3D

class_name InteractiveObject

signal open_secret

@export var item_name : String = "Nothing"
@export var obtainable: bool = true
@export var sprite_texture: Resource = preload("res://icon.svg")

@onready var sprite = $Sprite3D

func dialog_end():
	pass
	
func interaction():
	if !obtainable:
		DialogueManager.show_dialogue_balloon(load("res://scripts/dialogue/object.dialogue"), "lamp")
		emit_signal("open_secret")
	else:
		DialogueManager.show_dialogue_balloon(load("res://scripts/dialogue/object.dialogue"), "get_item")
		if GLOBAL.items["Manual"] == true:
			queue_free()
		else:
			queue_free()

func _ready():
	sprite.texture = sprite_texture
	sprite.texture_filter = 0
	sprite.scale = Vector3(2,2,2)

func _on_body_entered(body):
	if obtainable:
		GLOBAL.key_item = item_name
		interaction()
		body._move("backwards")
	elif body.is_in_group("Player"):
		interaction()
		body._move("backwards")
