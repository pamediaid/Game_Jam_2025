extends Button

# Variabel untuk ikon
var music_on_icon = preload("res://Asset/Icon/Prinbles_YetAnotherIcons (beta) (9_7_2023)/png@0.5x/White-Icon/Music-On@0.5x.png") # Path ikon musik aktif
var music_off_icon = preload("res://Asset/Icon/Prinbles_YetAnotherIcons (beta) (9_7_2023)/png@0.5x/White-Icon/Music-Off@0.5x.png") # Path ikon musik dicoret

# Status musik (true = aktif, false = mati)
var is_music_on = true

func _ready():
	# Atur ikon awal
	self.icon = music_on_icon

	


func _on_pressed():
	# Toggle status musik
	is_music_on = !is_music_on
	# Ubah ikon berdasarkan status
	if is_music_on:
		self.icon = music_on_icon
	else:
		self.icon = music_off_icon

	# Mute atau unmute audio
	AudioServer.set_bus_mute(0, !is_music_on)
