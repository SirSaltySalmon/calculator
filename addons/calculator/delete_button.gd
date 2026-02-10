extends Button
class_name DeleteButton

@onready var main: Main = $"../../.."

func _ready():
	connect("pressed", send_input)

func send_input():
	main.delete_input()
