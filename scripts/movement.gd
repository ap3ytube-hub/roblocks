extends CharacterBody3D

const SPEED = 13.0
const JUMP_VELOCITY = 22.5

var sens : float = 1.0
var health : int = 100

@onready var pivot = $pivot

func _process(delta: float) -> void:
	if health == 0:
		self.position.x = 0
		self.position.z = 0
		self.position.y = 4.109
		health = 100

func _input(event):
	if event is InputEventMouseMotion and (Input.is_action_pressed("rightclick") or Global.shift_lock):
		rotate_y(deg_to_rad(-event.relative.x * sens / 10))

		pivot.rotate_x(deg_to_rad(-event.relative.y * sens / 10))
		pivot.rotation.x = clamp(
			pivot.rotation.x,
			deg_to_rad(-90),
			deg_to_rad(45)
		)

func _physics_process(delta: float) -> void:
	
	if Input.is_action_pressed("rightclick") or Global.shift_lock == true:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	else:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	if not is_on_floor() and Global.climbing == false:
		velocity += get_gravity() * delta * 8.5

	if Input.is_action_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var input_dir := Input.get_vector(
		"ui_left",
		"ui_right",
		"ui_up",
		"ui_down"
	)

	var direction := (
		transform.basis *
		Vector3(input_dir.x, 0, input_dir.y)
	).normalized()

	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()



func _on_trussarea_body_entered(body: Node3D) -> void:
	if body.is_in_group("playertscn"):
		Global.climbing = true
		print("started climbing")


func _on_trussarea_body_exited(body: Node3D) -> void:
	if body.is_in_group("playertscn"):
		Global.climbing = false
		print("stopped climbing")
