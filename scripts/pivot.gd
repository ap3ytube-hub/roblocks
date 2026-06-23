extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.shift_lock == true:
		self.position.x = 2.585
	else:
		self.position.x = 0
	
	if Input.is_action_just_pressed("shiftlock"):
		if Global.shift_lock == false:
			Global.shift_lock = true
		else:
			Global.shift_lock = false
