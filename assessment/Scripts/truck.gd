extends CharacterBody2D

var player_in_area = false

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if player_in_area:
		$Label.visible = true
	else:
		$Label.visible = false
		
	if player_in_area and Input.is_action_just_pressed("pickup"):
		if global.wheel_collected and not global.wheel_used:
			global.wheel_used = true
			print("Wheel put on truck")
		elif not global.wheel_collected:
			print("You need a wheel")
			
	if player_in_area and Input.is_action_just_pressed("pickup"):
		if global.fuel_collected and not global.fuel_used:
			global.fuel_used = true
			print("fuel put on truck")
		elif not global.fuel_collected:
			print("You need fuel")

func _on_give_item_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = true


func _on_give_item_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = false
