extends LineEdit

@onready var main: Main = $"../.."

func _ready() -> void:
	connect("text_submitted", submit)
	connect("text_changed", update)

func update(new_text: String):
	if new_text == "":
		return
	var char = new_text[new_text.length() - 1]
	main.six_seven_check(char)
	if not main.new_input:
		return
	main.new_input = false
	if char in ["+", "-", "*", "/"]:
		text = "Ans" + char
		caret_column = text.length()

func submit(new_text: String):
	main.evaluate()
