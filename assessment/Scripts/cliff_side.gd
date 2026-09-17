extends Node2D
@onready var player: CharacterBody2D = $player


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.position.x = global.player_exit_cliffside_posx
	player.position.y = global.player_exit_cliffside_posy

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


		
func change_scene():
	if global.transition_scene == true:
		if global.current_scene == "cliff_side":
			get_tree().change_scene_to_file.call_deferred("res://scenes/world.tscn")
			global.finish_changescenes()


func _on_cliffside_exitpoint_body_entered(body: Node2D) -> void:
	if body.name == "player":
		global.player_exit_cliffside_posx = body.position.x
		global.player_exit_cliffside_posy = body.position.y - 20
		get_tree().change_scene_to_file.call_deferred("res://scenes/world.tscn")
