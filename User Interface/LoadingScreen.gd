extends Control

@onready var progress_bar = $VBoxContainer/ProgressBar
@onready var loading_text = $VBoxContainer/Label

func _ready():
	
	start_loading()

func start_loading():
	
	var timer = get_tree().create_timer(3.0)
	for i in range(101):
		progress_bar.value = i
		loading_text.text = "Loading... %d%" % i
		await get_tree().create_timer(0.03).timeout
	
	# Pindah ke scene selanjutnya
	get_tree().change_scene_to_file("res://game.tscn")
