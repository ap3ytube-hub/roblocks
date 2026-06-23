extends Label3D

func _ready() -> void:
	visible = false

func show_message(message: String, duration: float = 5.0) -> void:
	text = message
	visible = true
	
	# Cancel any previous hide timer by using a fresh one
	var timer := get_tree().create_timer(duration)
	await timer.timeout
	visible = false
