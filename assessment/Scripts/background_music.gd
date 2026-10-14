extends AudioStreamPlayer


@onready var audio1 = $"."

#when audio finishes play it again
func _on_finished() -> void:
	audio1.play()
