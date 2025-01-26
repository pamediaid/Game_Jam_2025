extends Control
@onready var video_player = $VideoStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	# Menghubungkan sinyal "finished" dari VideoStreamPlayer ke fungsi _on_video_stream_player_finished
	var video_player = $VideoStreamPlayer  # Gantilah ini dengan path ke node VideoStreamPlayer kamu

# Fungsi untuk berpindah ke scene utama setelah video selesai
func _on_video_stream_player_finished():
	get_tree().change_scene_to_file("res://main3.tscn")


func _on_body_entered(body):
	get_tree().change_scene_to_file("res://User Interface/cutsene_2.tscn")
