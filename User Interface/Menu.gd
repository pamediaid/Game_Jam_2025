extends Control

@onready var menu = $"."
@onready var margin_container = $MarginContainer
@onready var quit = $Quit
@onready var v_box_container = $MarginContainer/VBoxContainer
@onready var label = $Label
@onready var control_settings = $ControlSettings
@onready var settings = $CanvasLayer/Settings
@onready var credit = $CanvasLayer2/Credit

func _ready():
	
	get_tree().paused = false
	settings.visible = false
	credit.visible = false
	
	process_mode = Node.PROCESS_MODE_ALWAYS

func _on_play_pressed():
	get_tree().change_scene_to_file("res://User Interface/LoadingScreen.tscn")
	
func _on_quit_pressed():
	quit.visible = true
	
func _on_options_pressed():
	settings.visible = true
	v_box_container.visible = false


func _on_settings_pressed():
	settings.visible = true


func _on_credit_pressed():
	credit.visible = true
