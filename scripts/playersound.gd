extends Node3D

@onready var roblox_jump: AudioStreamPlayer = $RobloxJump
@onready var roblox_walking: AudioStreamPlayer = $RobloxWalking
@onready var roblox_death: AudioStreamPlayer = $RobloxDeath

@onready var player: CharacterBody3D = $".."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		if not roblox_walking.playing:
			roblox_walking.play()
		else:
			roblox_walking.stop()
	
	if Input.is_action_pressed("ui_accept") :
		roblox_jump.playing = true
	
	if player.health == 0:
		roblox_death.playing = true
