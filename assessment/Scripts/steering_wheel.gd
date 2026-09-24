extends CharacterBody2D

var player_in_area = false


#picking up steering wheel
func _ready() -> void:
	if global.steering_wheel_collected:
		queue_free()

func _process(delta: float) -> void:
	if player_in_area:
		$Label.visible = true
	else:
		$Label.visible = false
		
	if player_in_area and Input.is_action_just_pressed("pickup"):
		global.steering_wheel_collected = true
		queue_free()

func _on_pickable_area_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = true


func _on_pickable_area_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = false
