extends Control
@onready var settings = $CanvasLayer/Settings
@onready var credit = $CanvasLayer2/Credit


# Called when the node enters the scene tree for the first time.
func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_restart_pressed():
	get_tree().change_scene_to_file("res://main.tscn")


func _on_settings_pressed():
	settings.visible = true


func _on_credit_pressed():
	credit.visible = true


func _on_menu_pressed():
	get_tree().change_scene_to_file("res://User Interface/Menu.tscn")
