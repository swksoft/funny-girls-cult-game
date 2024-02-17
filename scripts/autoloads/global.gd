extends Node

var items: Dictionary = {"Apple": false, "Cards": false, "Hammer": false, "Manual": false, "Nothing": false}
var key_item: String = "Nothing"
var character: Dictionary = {"eleonora": true, "maria_paula": true, "minerva": true}
var apple_given = false
var cards_given = false
var hammer_given = false
var manual_given = false
var lamp_secret = false

func reset():
	get_tree().reload_current_scene.call_deferred()

func end_game():
	get_tree().quit()
	
var on_dialog: bool

func dialog_ended(state = true):
	return state
	
