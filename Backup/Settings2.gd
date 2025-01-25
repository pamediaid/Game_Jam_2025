extends Control

@onready var options = $"." 
@onready var margin_container = $"../MarginContainer" 
@onready var settings_2 = $"." 
@onready var settings = $"../Settings" 
@onready var control_settings = $"../ControlSettings" 
@onready var graphic = $Text/Graphic/Graphic 
@onready var volume = $Text/Volume/Volume 
@onready var brightness = $Text/Volume2/Brightness 
@onready var sensitivity = $Text/Sensitivity/sensitivity 

var default_value = 50 : 
	set(value):
		default_value = value
		graphic.value = default_value

func _ready():
	pass

func _on_back_pressed():
	settings_2.visible = false
	settings.visible = true

func _on_reset_pressed():
	graphic.value = default_value
	volume.value = default_value
	brightness.value = default_value
	sensitivity.value = default_value
	
func _on_control_pressed():
	control_settings.visible = true 
	settings_2.visible = false

func _on_graphic_value_changed(value):
	pass

func _on_volume_value_changed(value):
	AudioServer.set_bus_volume_db(0, value/5)  # Range -80 to 0 dB
	
func _on_brightness_value_changed(value):
	pass

func _on_sensitivity_value_changed(value):
	pass

func _on_mute_toggled(toggled_on):
	AudioServer.set_bus_volume_db(0, toggled_on)
