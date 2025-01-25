extends Control

@onready var menu = $"."
@onready var settings = $Settings
@onready var margin_container = $MarginContainer
@onready var quit = $Quit
@onready var v_box_container = $MarginContainer/VBoxContainer
@onready var label = $Label
@onready var control_settings = $ControlSettings

func _ready():
	
	get_tree().paused = false
	
	
	settings.visible = false
	quit.visible = false
	v_box_container.visible = true
	
	
	process_mode = Node.PROCESS_MODE_ALWAYS

func _on_play_pressed():
	get_tree().change_scene_to_file("res://LoadingScreen.tscn")
	
func _on_quit_pressed():
	quit.visible = true
	
func _on_options_pressed():
	settings.visible = true
	v_box_container.visible = false
