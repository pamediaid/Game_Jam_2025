extends Area3D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://User Interface/GameOver.tscn")


func _on_area_3d_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://User Interface/GameOver.tscn")



func _on_cl_paku_p_body_entered(body):
	pass # Replace with function body.


func _on_cl_paku_b_body_entered(body):
	pass # Replace with function body.


func _on_cl_paku_k_body_entered(body):
	pass # Replace with function body.


func _on_cutsene_1_body_entered(body):
	pass # Replace with function body.


func _on_cl_paku_a_body_entered(body):
	pass # Replace with function body.
