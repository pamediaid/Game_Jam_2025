extends Area3D
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://User Interface/cutsene_2.tscn"
		)
