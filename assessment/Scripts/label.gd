extends Label

signal sequence_finished

@export var reveal_speed: float = 0.08
@export var hold_time: float = 1.5
@export var fade_time: float = 0.5
@export var pause_between: float = 0.3
@export var next_scene_path: String = "res://scenes/main_menu.tscn"

var paragraphs: Array[String] = []
var paragraph_index: int = 0

var char_index: int = 0
var timer: float = 0.0

enum State { REVEALING, HOLDING, FADING, PAUSING, DONE }
var state: State = State.REVEALING

func _ready() -> void:
	paragraphs = [
		"The city was gone in three days.",
		"It started with a virus. Then came the fever, 
		the panic, and finally, the dead began to rise.",
		"Now the streets are silent, 
		except for the sounds of the infected wandering through the ruins.",
		"You were supposed to leave with everyone else. 
		But when the evacuation collapsed, 
		you were left behind.",
		"There is only one way out.",
		"A quarantine zone lies beyond the city, 
		but your truck won't make the journey—not without repairs.
		The parts you need are scattered throughout the abandoned streets, 
		hidden among the remains of a world that fell apart overnight.",
		"And time is running out.",
		"The infection is spreading. The hordes are growing.",
		"Find the parts. Repair the truck. Reach the quarantine zone.",
		"Survive long enough to escape."
	]

	modulate.a = 1.0
	text = ""
	char_index = 0
	paragraph_index = 0
	state = State.REVEALING

	sequence_finished.connect(_on_sequence_finished)

func _process(delta: float) -> void:
	match state:
		State.REVEALING:
			timer += delta
			if timer >= reveal_speed:
				timer = 0.0
				var current: String = paragraphs[paragraph_index]
				if char_index < current.length():
					char_index += 1
					text = current.substr(0, char_index)
				else:
					timer = 0.0
					state = State.HOLDING

		State.HOLDING:
			timer += delta
			if timer >= hold_time:
				timer = 0.0
				state = State.FADING

		State.FADING:
			timer += delta
			modulate.a = 1.0 - clamp(timer / fade_time, 0.0, 1.0)
			if timer >= fade_time:
				timer = 0.0
				modulate.a = 1.0
				text = ""
				state = State.PAUSING

		State.PAUSING:
			timer += delta
			if timer >= pause_between:
				timer = 0.0
				paragraph_index += 1
				if paragraph_index < paragraphs.size():
					char_index = 0
					state = State.REVEALING
				else:
					state = State.DONE
					sequence_finished.emit()

		State.DONE:
			pass

func _on_sequence_finished() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func skip_current() -> void:
	if state == State.REVEALING:
		text = paragraphs[paragraph_index]
		char_index = paragraphs[paragraph_index].length()
		timer = 0.0
		state = State.HOLDING
