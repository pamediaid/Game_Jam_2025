extends Control

@onready var resume_button = $ResumeButton
@onready var quit_button = $QuitButton


func _on_resume_pressed():
	get_tree().paused = false
	self.visible = false  # Sembunyikan menu pause

func _on_quit_pressed():
	get_tree().quit()  # Keluar dari game
