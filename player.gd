extends CharacterBody3D

@export var move_speed: float = 5.0
@export var vertical_speed: float = 10.0
@export var block_positions: Array[float] = [-4.0, -2.0, 0.0, 2.0]  # Posisi blok vertikal

var current_block: int = 1  # Mulai di blok tengah
var jump_timer: float = 0.0

func _physics_process(delta: float) -> void:
	# Gerakan horizontal otomatis
	var velocity = Vector3(move_speed, 0.0, 0.0)

	# Kontrol vertikal
	if Input.is_action_pressed("Atas"):
		jump_timer += delta
	elif Input.is_action_just_released("Atas"):
		current_block = max(0, current_block - int(jump_timer / 0.2))
		jump_timer = 0.0

	if Input.is_action_pressed("Bawah"):
		jump_timer += delta
	elif Input.is_action_just_released("Bawah"):
		current_block = min(len(block_positions) - 1, current_block + int(jump_timer / 0.2))
		jump_timer = 0.0

	# Pindahkan karakter ke posisi blok
	var target_y = block_positions[current_block]
	velocity.y = (target_y - global_transform.origin.y) * vertical_speed

