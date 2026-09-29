extends Node2D

var list_of_zombies = []
@onready var player: CharacterBody2D = $player

var min_x = 0.0
var max_x = 1152
var min_y = 0.0
var max_y = 648

# Called when the node enters the scene tree for the first time.
func _ready():
	player.position.x = global.player_exit_world_posx
	player.position.y = global.player_exit_world_posy
	# Generates a list of all immediate child nodes
	var list_of_zombies: Array[Node] = $zombies.get_children()
	# You can loop through the generated list
	for child in list_of_zombies:
		child.position = Vector2(randf_range(min_x, max_x), randf_range(min_y, max_y))



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_scene()


func _on_cliffside_transition_point_body_entered(body):
	if body.name == "player":
		global.player_exit_world_posx = body.position.x
		global.player_exit_world_posy = body.position.y + 20
		get_tree().change_scene_to_file.call_deferred("res://scenes/cliff_side.tscn")


func _on_cliffside_transition_point_body_exited(body):
	if body.has_method("player"):
		global.transition_scene = false

func change_scene():
	if global.transition_scene == true:
		if global.current_scene == "world":
			get_tree().change_scene_to_file.call_deferred("res://scenes/world.tscn")
			global.finish_changescenes()


func _on_town_transition_point_body_entered(body: Node2D) -> void:
	if body.name == "player":
		global.player_exit_world_posx = body.position.x
		global.player_exit_world_posy = body.position.y - 20
		get_tree().change_scene_to_file.call_deferred("res://scenes/town.tscn")
