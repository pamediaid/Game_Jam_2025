extends RigidBody3D

@export var obstacle_scene: PackedScene
@export var spawn_rate: float = 2.0
@export var spawn_distance: float = 10.0

var spawn_timer: float = 0.0

func _process(delta: float) -> void:
	spawn_timer += delta
	if spawn_timer >= spawn_rate:
		spawn_timer = 0.0
		spawn_obstacle()

func spawn_obstacle() -> void:
	var obstacle = obstacle_scene.instantiate()
	obstacle.global_transform.origin = Vector3(spawn_distance, randf_range(-4, 2), 0.0)
	add_child(obstacle)
