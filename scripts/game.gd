extends Node3D

@onready var char: CharacterBody3D = $player


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func area3dtest(body: Node3D) -> void:
	if body.is_in_group("playertscn"):
		print("void")
		char.health = 0
