extends CharacterBody2D

var speed = 80
var player_chase = false
var player = null

var health = 100
var player_inattack_zone = false

func _physics_process(_delta):
	if player_chase:
		position += (player.position - position)/speed

		$AnimatedSprite2D.play("walk")
		
		if(player.position.x - position.x) < 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.play("idle")

func _on_detection_area_body_entered(body: Node2D):
	player = body
	player_chase = true


func _on_detection_area_body_exited(_body: Node2D):
	player = null
	player_chase = false

func zombie():
	pass


func _on_zombie_hitbox_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_zombie_hitbox_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
