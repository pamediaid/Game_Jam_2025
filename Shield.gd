extends CharacterBody3D

func _process(delta):
	var mouse_position = get_viewport().get_mouse_position()
	var ray_origin = get_viewport().get_camera_3d().project_ray_origin(mouse_position)
	var ray_direction = get_viewport().get_camera_3d().project_ray_normal(mouse_position)
	var target_position = ray_origin + ray_direction * 10 # Proyeksikan posisi 3D
	global_transform.origin = target_position
