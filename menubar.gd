extends ColorRect

@onready var textbox : TextEdit = $chatbar/textbox
@onready var chathistory : Label = $chatbar/chatlistory
@onready var chat_bubble : Label3D = $"../../ther6rig/chat/chattext"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	chathistory.text = ""


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_chat_pressed() -> void:
	if Global.chat_open == true:
		Global.chat_open = false
	else:
		Global.chat_open = true


func _on_send_pressed() -> void:
	chathistory.text += Global.playername + " : " + textbox.text + "\n"
	chat_bubble.show_message(textbox.text)
	textbox.text = ""  # clear the input box after sending
