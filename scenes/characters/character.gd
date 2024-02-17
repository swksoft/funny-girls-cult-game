extends Area3D

class_name Character

func interaction(dialogue: String):
	DialogueManager.show_dialogue_balloon(load("res://scripts/dialogue/character.dialogue"), dialogue)

func reaction():
	interaction("random")

func _on_body_entered(body):
	reaction()
	body._move("backwards")
