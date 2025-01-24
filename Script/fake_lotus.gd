extends StaticBody3D



@onready var fake_lotus = $"."


func disappear():
	fake_lotus.queue_free()


func _on_area_3d_body_entered(body):
	if body.name == "Pler":
		await get_tree().create_timer(0.3).timeout
		disappear()
