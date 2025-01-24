extends Node3D

@export var obstacle_scene: PackedScene
var spawn_timer: float = 2.0

func _process(delta):
	spawn_timer -= delta
	if spawn_timer <= 0:
		spawn_timer = 2.0
		spawn_obstacle()

func spawn_obstacle():
	if obstacle_scene: # Pastikan obstacle_scene tidak null
		var obstacle = obstacle_scene.instantiate()
		add_child(obstacle)
		obstacle.translation = Vector3(randf() * 10 - 5, 10, randf() * 10 - 5) # Posisi acak
	else:
		print("Obstacle scene is not set!")
