extends CharacterBody3D

const RIGHT = deg_to_rad(-90)
const LEFT = deg_to_rad(90)
const MOVEMENT = 2.0
const TWEEN_VELOCITY = 0.25

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

var direction:= Vector3.ZERO

@onready var raycast_forward = $RaycastForward
@onready var raycast_backwards = $RaycastBackwards
@onready var hud = $HUD
@onready var collision = $CollisionShape3D
@onready var check = $Check

func movement_process(action, dir):
	''' verify if can_move '''
	''' remove UI '''
	remove_hud(true)
	''' move '''
	match action:
		"move":
			await _move(dir)
		"turn":
			await _turn(dir)
	''' restore UI '''
	remove_hud(false)
	#else:
		#remove_hud(true)
		#match action:
			#"interact":
				#await _move(direction)
			#"turn":
				#await _turn(direction)
		#remove_hud(false)

func wall_ahead(raycast):
	if raycast.is_colliding():
		var collider = raycast.get_collider()
		#print(collider)
		#print(collider.is_in_group("Wall"))
		return collider.is_in_group("Wall")
	return false
	#return raycast.get_collider() == GridMap

func interact(type_entity: String):
	match type_entity:
		"object":
			pass
		"character":
			pass
		"wall":
			DialogueManager.show_example_dialogue_balloon(load("res://scripts/dialogue/main_dialogue.dialogue"), "default_wall")
			_move("backwards")
			var tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
			direction = -global_transform.basis.z.normalized()
			await tween.tween_property(self, "position", position + direction * -MOVEMENT, TWEEN_VELOCITY).finished

func _turn(rot: String):
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	match rot:
		"left":
			await tween.tween_property(self, "global_rotation_degrees", global_rotation_degrees + Vector3(0,90,0), TWEEN_VELOCITY).finished
		"right":
			await tween.tween_property(self, "global_rotation_degrees", global_rotation_degrees + Vector3(0,-90,0), TWEEN_VELOCITY).finished
		
	hud.visible = true

func _move(dir: String):
	match dir:
		"forward":
			var tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
			direction = -global_transform.basis.z.normalized()
			await tween.tween_property(self, "position", position + direction * MOVEMENT, TWEEN_VELOCITY).finished
		"backwards":
			var tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
			direction = -global_transform.basis.z.normalized()
			await tween.tween_property(self, "position", position + direction * -MOVEMENT, TWEEN_VELOCITY).finished
	# PARA ADELANTE
	#if dir:
		#if !raycast_forward.is_colliding():
			#var tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
			#direction = -global_transform.basis.z.normalized()
			#await tween.tween_property(self, "position", position + direction * MOVEMENT, TWEEN_VELOCITY).finished
		#else:
			#var collider = raycast_forward.get_collider()
			#if collider.is_in_group("Wall"):
				#interact("wall")
			#elif collider.is_in_group("Object"):
				#print("Objeto delante")
			#elif collider.is_in_group("Character"):
				#print("Personaje delante")
			#var tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
			#direction = -global_transform.basis.z.normalized()
			#await tween.tween_property(self, "position", position + direction * MOVEMENT, TWEEN_VELOCITY).finished
	## PARA ATRAS
	#else:
		#if !raycast_backwards.is_colliding():
			#var tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
			#direction = -global_transform.basis.z.normalized()
			#await tween.tween_property(self, "position", position + direction * -MOVEMENT, TWEEN_VELOCITY).finished

func remove_hud(default = true):
	hud.set_deferred("visible", !default)
	raycast_forward.set_deferred("enabled", !default)
	raycast_backwards.set_deferred("enabled", !default)
	collision.set_deferred("disabled", default)

func _process(_delta):
	if wall_ahead(raycast_forward):
		hud.area_forward.set_deferred("input_pickable", false)
	elif wall_ahead(raycast_backwards):
		hud.area_backwards.set_deferred("input_pickable", false)
	else:
		hud.area_forward.set_deferred("input_pickable", true)
		hud.area_backwards.set_deferred("input_pickable", true)

func _on_hud_move_forward():
	movement_process("move", "forward")

func _on_hud_turn_left():
	movement_process("turn", "left")

func _on_hud_turn_right():
	movement_process("turn", "right")

func _on_hud_move_backwards():
	movement_process("move", "backwards")

func _on_check_body_entered(body):
	''' Checks if the player hits a wall, so it can reproduce the hit against the wall and then remove the move forward option. '''
	if body.is_in_group("Wall"):
		pass
