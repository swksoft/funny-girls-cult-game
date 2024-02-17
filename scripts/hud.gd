extends CanvasLayer

@onready var area_forward = $AreaForward
@onready var area_left = $AreaLeft
@onready var area_right = $AreaRight
@onready var area_backwards = $AreaBackwards

signal move_forward
signal turn_left
signal turn_right
signal move_backwards

func _on_area_forward_input_event(_viewport, event, _shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		emit_signal("move_forward")

func _on_area_left_input_event(_viewport, event, _shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		emit_signal("turn_left")

func _on_area_right_input_event(_viewport, event, _shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		emit_signal("turn_right")

func _on_area_backwards_input_event(_viewport, event, _shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		emit_signal("move_backwards")
