extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_second_world_transition_point_body_entered(body: Node2D) -> void:
	if body.name == "player":
		global.player_exit_cliffside_posx = body.position.x
		global.player_exit_cliffside_posy = body.position.y - 20
		get_tree().change_scene_to_file.call_deferred("res://scenes/world.tscn")
