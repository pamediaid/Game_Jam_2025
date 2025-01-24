extends CharacterBody3D

@export var speed: Vector3 = Vector3(0, 2, 0) # Kecepatan ke atas

func _physics_process(delta):
	velocity = speed
	move_and_slide()
func _on_body_entered(body):
	if body.name == "Obstacle":
		print("Game Over!")
		queue_free() # Hapus balon
