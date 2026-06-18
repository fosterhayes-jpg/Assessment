extends CharacterBody2D

var zombie_inattack_range = false
var zombie_attack_cooldown = true
var health = 100
var player_alive = true

const speed = 80
var current_direction = "none"

func _ready():
	$AnimatedSprite2D.play("front idle")

func _physics_process(delta):
	playermovement(delta)
	zombie_attack()

func playermovement(delta):
	
	if Input.is_action_pressed("ui_right"):
		current_direction = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_direction = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_direction = "down"
		play_anim(1)
		velocity.y = speed
		velocity.x = 0
	elif Input.is_action_pressed("ui_up"):
		current_direction = "up"
		play_anim(1)
		velocity.y = -speed
		velocity.x = 0
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()
	
func play_anim(movement):
	var dir = current_direction
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("side walk")
		elif movement == 0:
			anim.play("side idle")
	if dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("side walk")
		elif movement == 0:
			anim.play("side idle")
			
	if dir == "down":
		anim.flip_h = false
		if movement == 1:
			anim.play("front walk")
		elif movement == 0:
			anim.play("front idle")
	if dir == "up":
		anim.flip_h = false
		if movement == 1:
			anim.play("back walk")
		elif movement == 0:
			anim.play("back idle")
	
	
func player():
	pass
	
func _on_player_hitbox_body_entered(body):
	if body.has_method("zombie"):
		zombie_inattack_range = true


func _on_player_hitbox_body_exited(body):
	if body.has_method("zombie"):
		zombie_inattack_range = false
		
func zombie_attack():
	if zombie_inattack_range:
		print("player - 10 health")
	
