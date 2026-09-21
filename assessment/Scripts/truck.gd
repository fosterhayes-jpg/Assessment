extends CharacterBody2D

var player_in_area = false

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if player_in_area and Input.is_action_just_pressed("pickup"):
		if global.wheel_collected and not global.wheel_used:
			global.wheel_used = true
			print("Wheel put on truck")
		elif not global.wheel_collected:
			print("You need a wheel")

func _on_give_item_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		print("enter")
		player_in_area = true


func _on_give_item_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		print("exit")
		player_in_area = false
