extends CharacterBody2D

var player_in_area = false


#picking up fuel
func _ready() -> void:
	if global.fuel_collected:
		queue_free()

func _process(delta: float) -> void:
	if player_in_area:
		$Label.visible = true
	else:
		$Label.visible = false
		
	if player_in_area and Input.is_action_just_pressed("pickup"):
		global.fuel_collected = true
		queue_free()
		
		
		#player in pickup area
func _on_pickable_area_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = true

func _on_pickable_area_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = false
