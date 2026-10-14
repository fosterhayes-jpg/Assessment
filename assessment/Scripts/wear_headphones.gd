extends Control

#when next button pressed change to next scene (controls)
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/control.tscn")
