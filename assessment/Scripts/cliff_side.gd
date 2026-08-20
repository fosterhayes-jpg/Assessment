extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_cliffside_exitpoint_area_shape_entered(body):\
	if body.has_method("player"):
		global.transition_scene = true
	

func _on_cliffside_exitpoint_area_shape_exited(body):
	if body.has_method("player"):
		global.transition_scene = false
		
func change_scene():
	if global.transition_scene == true:
		if global.current_scene == "cliff_side"
