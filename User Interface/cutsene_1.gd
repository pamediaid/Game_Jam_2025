extends Control
@onready var video_player = $VideoStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Fungsi untuk berpindah ke scene utama setelah video selesai
func _on_video_stream_player_finished():
	get_tree().change_scene_to_file("res://main2.tscn")
