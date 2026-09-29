extends Node2D
@onready var player: CharacterBody2D = $player

var min_x = 320
var max_x = 900
var min_y = 232
var max_y = 496
var list_of_zombies = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.position.x = global.player_exit_cliffside_posx
	player.position.y = global.player_exit_cliffside_posy
	# Generates a list of all immediate child nodes
	var list_of_zombies2: Array[Node] = $zombies.get_children()
	# You can loop through the generated list
	for child in list_of_zombies2:
		child.position = Vector2(randf_range(min_x, max_x), randf_range(min_y, max_y))


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
