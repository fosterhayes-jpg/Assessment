extends CharacterBody2D

const speed = 100
var current_direction = "none"

func _physics_process(delta):
	playermovement(delta)

func playermovement(delta):
	
	if Input.is_action_pressed("ui_right"):
		current_direction = "right"
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_direction = "left"
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_direction = "down"
		velocity.y = speed
		velocity.x = 0
	elif Input.is_action_pressed("ui_up"):
		current_direction = "up"
		velocity.y = -speed
		velocity.x = 0
	else:
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()
	
	
