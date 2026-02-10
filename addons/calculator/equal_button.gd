extends Button
class_name EqualButton

@onready var main: Main = $"../../.."

func _ready():
	connect("pressed", send_input)

func send_input():
	main.evaluate()
