extends Node3D

func _on_area_3d_body_entered(body):
	if body.is_in_group("Player"):
		TransitionLayer.change_scene("res://scenes/world.tscn")
	else:
		pass
