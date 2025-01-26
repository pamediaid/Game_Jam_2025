extends Node

@onready var pause_menu = $CanvasLayer/Pause
@onready var hud = $HUD/HUD


func _ready() -> void:
	get_tree().paused = false
	hud.visible = true 

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"): 
		toggle_pause()
		get_tree().root.set_input_as_handled()
	elif event.is_action_pressed("toggle_fullscreen"):
		toggle_fullscreen()
		get_tree().root.set_input_as_handled()

func toggle_pause() -> void:
	var tree := get_tree()
	tree.paused = not tree.paused
	if tree.paused:
		pause_menu.open()
	else:
		pause_menu.close()

func toggle_fullscreen() -> void:
	var mode := DisplayServer.window_get_mode()
	if mode == DisplayServer.WINDOW_MODE_FULLSCREEN or \
			mode == DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)


func _on_cutsene_1_body_entered(body):
	get_tree().change_scene_to_file("res://User Interface/cutsene_1.tscn")


func _on_cutsene_3_body_entered(body):
	pass # Replace with function body.

