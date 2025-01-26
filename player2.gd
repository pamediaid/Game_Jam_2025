extends CharacterBody3D

const SPEED = 5.8
const JUMP_VELOCITY = 5.5
const MIN_JUMP_VELOCITY = 2.0  # Lompatan minimum saat stamina habis
const STAMINA_MAX = 3
const STAMINA_CONSUME_JUMP = 1
const STAMINA_REGEN_RATE = 1  # Per detik

@onready var animation_player = $"rig/terbang bubble/AnimationPlayer"

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var is_jumping = false
var stamina = STAMINA_MAX
var can_regen_stamina = true
var regen_timer = 0.0  # Timer untuk regenerasi stamina

# Fungsi untuk mengambil nilai stamina saat ini
func get_stamina() -> int:
	return stamina

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if Input.is_action_just_pressed("Left"):
		$Node3D.rotation.y = -5.9
	elif Input.is_action_just_pressed("Right"):
		$Node3D.rotation.y = 5.9
	elif Input.is_action_just_pressed("Up"):
		$Node3D.rotation.y = 0
	elif Input.is_action_just_pressed("Down"):
		$Node3D.rotation.y = -3.14

func _physics_process(delta):
	$rig.rotation.y = lerp_angle($rig.rotation.y, $Node3D.rotation.y, 0.2)
	
	# Handle gravity
	if not is_on_floor():
		velocity.y -= gravity * delta
	else:
		if is_jumping:
			is_jumping = false  # Reset jumping state when on the floor
	
	# Handle stamina regeneration
	if stamina < STAMINA_MAX and can_regen_stamina:
		regen_timer += delta  # Increment the regen timer
		if regen_timer >= 1.0:  # Regenerate every 1 second
			stamina = min(STAMINA_MAX, stamina + STAMINA_REGEN_RATE)
			regen_timer = 0.0  # Reset the regen timer after regeneration
	
	# Handle jump
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		if stamina >= STAMINA_CONSUME_JUMP:
			velocity.y = JUMP_VELOCITY
			stamina -= STAMINA_CONSUME_JUMP
			can_regen_stamina = false  # Prevent immediate regeneration after jumping
			is_jumping = true
			animation_player.play("JUMP")
		elif stamina > 0:  # Allow weaker jump if stamina is low
			velocity.y = MIN_JUMP_VELOCITY
			stamina = 0
			can_regen_stamina = false
			is_jumping = true
			animation_player.play("JUMP")

	# Handle movement
	var input_dir = Input.get_vector("Right", "Left", "Down", "Up")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		if not is_jumping:  # Play walk animation only if not jumping
			animation_player.play("terbang")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		if not is_jumping and is_on_floor():
			animation_player.play("terbang")  # Play idle animation when not moving

	move_and_slide()

	# Allow stamina regeneration after jump has ended and when player is not jumping
	if not Input.is_action_pressed("Jump") and not is_jumping:
		can_regen_stamina = true


func _on_area_3d_body_entered(body):
	get_tree().change_scene_to_file("res://main3.tscn")
