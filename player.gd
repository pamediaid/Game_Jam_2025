extends CharacterBody3D


const SPEED = 5.8
const JUMP_VELOCITY = 5.5

@onready var animation = $AnimationPlayer


var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	
func _input(event):
	if Input.is_action_just_pressed("Left"):
		$Node3D.rotation.y = -5.9
		
	if Input.is_action_just_pressed("Right"):
		$Node3D.rotation.y = 5.9

	if Input.is_action_just_pressed("Up"):
		$Node3D.rotation.y = 0 
		
	if Input.is_action_just_pressed("Down"):
		$Node3D.rotation.y = -3.14

func _physics_process(delta):
	$rig.rotation.y = lerp_angle($rig.rotation.y , $Node3D.rotation.y , 0.2)
	if not is_on_floor():
		velocity.y -= gravity * delta
	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("Right", "Left", "Down", "Up")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		$"rig/bubble 1/AnimationPlayer".play("WALK")

	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		
	if (direction.length() == 0):
		stand()

	move_and_slide()

#func _input(event):
#	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
#		rotate_y(deg_to_rad(event.relative.x * -1) * sensitivity)
#		head.rotate_x(deg_to_rad(-event.relative.y * sensitivity))
#		head.rotation.x = clamp(head.rotation.x, deg_to_rad(-70), deg_to_rad(70))

func stand():
	$"rig/bubble 1/AnimationPlayer".play("IDLE")


func _on_object_body_entered(body):
	$MC/AnimationPlayer.play("Dapet Jangkrik")
