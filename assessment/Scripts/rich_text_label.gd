extends RichTextLabel

@export var characters_per_second: float = 13.0

signal text_finished 

var active_tween: Tween

func _ready() -> void:
	start_text_animation()

#slowly reveal the text one letter at a time
func start_text_animation() -> void:

	visible_characters = 0
	
	var total_chars: int = text.length()
	if total_chars == 0:
		text_finished.emit()
		return
		
	var duration: float = total_chars / characters_per_second
	
	if active_tween:
		active_tween.kill()

	active_tween = create_tween()
	active_tween.tween_property(self, "visible_characters", total_chars, duration)
	
	active_tween.finished.connect(_on_animation_finished)

func _on_animation_finished() -> void:
	text_finished.emit()
	print("text done")
