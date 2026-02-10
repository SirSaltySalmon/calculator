extends Control
class_name Main

@onready var answer = $MarginContainer/Answer
@onready var input = $MarginContainer2/Input
@onready var error = $Error
@onready var audio = $AudioStreamPlayer
@onready var fire_ring = $VideoStreamPlayer
@onready var einstein = $TextureRect

var new_input = true
var six_inputted = false

func send_input(value: String):
	if new_input:
		if value in ["+", "-", "*", "/"]:
			input.text = "Ans" + value
		else:
			input.text = value
		new_input = false
	else:
		input.text += value
	
	six_seven_check(value)

func six_seven_check(value: String):
	if value == "6":
		six_inputted = true
	elif value == "7" and six_inputted:
		six_seven()
	else:
		six_inputted = false

func delete_input():
	var len = len(input.text)
	if len != 0:
		input.text = input.text.erase(len(input.text) - 1, 1)
	else:
		input.text = "" #Fail-safe

func evaluate():
	var string_expression: String = input.text.replace("Ans", answer.text)
	var expression = Expression.new()
	expression.parse(string_expression)
	var result = expression.execute()
	if result != null:
		answer.text = str(result)
		new_input = true
		if "67" in str(result):
			six_seven()
	else:
		send_error()

func send_error():
	var tween = create_tween()
	tween.tween_property(error, "modulate", Color(Color.WHITE, 0), 3.0).from(Color.WHITE)

func six_seven():
	fire_ring.stream_position = 0
	fire_ring.play()
	audio.play(0)
	var tween = create_tween()
	tween.tween_property(einstein, "modulate", Color(Color.WHITE, 0), 3.0).from(Color.WHITE)
