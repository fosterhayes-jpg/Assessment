extends Control
@onready var audio_player = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#close game if player presses exit
func _on_exit_pressed() -> void:
	get_tree().quit()

#take player to cliffside if 'start' button pressed
func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/cliff_side.tscn")
