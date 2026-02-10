extends Button
class_name InputButton

@onready var main: Main = $"../../.."

func _ready():
	connect("pressed", send_input)

func send_input():
	main.send_input(text)
