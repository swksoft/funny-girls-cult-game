extends CanvasLayer

@onready var animation : AnimationPlayer = $AnimationPlayer
@onready var timer = $Timer

func change_scene(target: String) -> void:
	visible = true
	animation.play("fade_in")
	await animation.animation_finished
	timer.start()
	#TransitionLayer.change_scene(target)
	get_tree().change_scene_to_file(target)
	#TransitionLayer.get_tree().change_scene_to_file(target)
	
func _on_timer_timeout():
	animation.play("fade_out")
	await animation.animation_finished
	visible = false
	
