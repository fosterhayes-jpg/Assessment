extends AudioStreamPlayer

@onready var audio1 = $"."


func _on_finished() -> void:
	audio1.play()
