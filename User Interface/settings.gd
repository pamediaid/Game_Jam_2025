extends Control
@onready var options = $"." 
@onready var margin_container = $"../MarginContainer" 
@onready var settings_2 = $"." 
@onready var control_settings = $"../ControlSettings" 
@onready var graphic = $Text/Graphic/Graphic 
@onready var brightness = $Text/Volume2/Brightness 
@onready var volume = $MarginContainer/VBoxContainer/Volume
@onready var brighness = $MarginContainer/VBoxContainer/Brighness
@onready var option_button = $MarginContainer/VBoxContainer/OptionButton
@onready var sensitivity = $MarginContainer/VBoxContainer/sensitivity
@onready var settings = $"."


func _ready():
	pass

func _on_graphic_value_changed(value):
	pass

func _on_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, value/6)  
	

func _on_sensitivity_value_changed(value):
	pass

func _on_mute_toggled(toggled_on):
	AudioServer.set_bus_mute(0, toggled_on)



func _on_back_pressed():
	settings.visible =  false


func _on_control_pressed():
	control_settings.visible = true
	settings_2.visible = false


func _on_reset_pressed():
	settings_2.visible = true
	volume.value = -47
	sensitivity.value = 50
	brighness.value = 1


func _on_option_button_item_selected(index):
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(1920, 1080))
		1:
			DisplayServer.window_set_size(Vector2i(1600, 900))
		2:
			DisplayServer.window_set_size(Vector2i(1280, 720))
