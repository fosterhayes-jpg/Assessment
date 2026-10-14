extends CharacterBody2D

var player_in_area = false


#remove collectable if player has picked it up
func _ready() -> void:
	if global.steering_wheel_collected:
		queue_free()

#show the 'press e to pick up' label when the player in pickup area and check if the pickup action is pressed tpo remove collectable
func _process(delta: float) -> void:
	if player_in_area:
		$Label.visible = true
	else:
		$Label.visible = false
		
	if player_in_area and Input.is_action_just_pressed("pickup"):
		global.steering_wheel_collected = true
		queue_free()


#checking if player is in pickup area
func _on_pickable_area_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = true

#checking if player is in pickup area
func _on_pickable_area_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = false
