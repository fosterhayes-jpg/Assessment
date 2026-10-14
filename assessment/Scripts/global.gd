extends Node

var player_current_attack = false
 
#is item picked up has item been used
var wheel_collected = false
var wheel_used = false

var fuel_collected = false
var fuel_used = false

var steering_wheel_collected = false
var steering_wheel_used = false

var brake_collected = false
var brake_used = false

var battery_collected = false
var battery_used = false

var oil_collected = false
var oil_used = false

var engine_collected = false
var engine_used = false


var current_scene = "world" 
var transition_scene = false

var player_exit_cliffside_posx = 400
var player_exit_cliffside_posy = 272
var player_start_posx = 0
var player_start_posy = 0
var player_exit_world_posx = 640
var player_exit_world_posy = 48

func finish_changescenes():
	if transition_scene == true:
		transition_scene = false
		if current_scene =="world":
			current_scene = "cliff_side"
		else:
			current_scene = "world"
			
