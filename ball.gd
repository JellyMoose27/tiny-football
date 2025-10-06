extends RigidBody2D

func kick(direction):
	var impulse = Vector2(direction * 800, -800 * 0.4)
	apply_impulse(impulse)
	
func _physics_process(_delta: float) -> void:
	# Safety boundary reset (if ball escapes the map)
	var screen_size := get_viewport_rect().size
	if global_position.x < -200 or global_position.x > screen_size.x + 200 \
	or global_position.y < -200 or global_position.y > screen_size.y + 200:
		reset_ball()

func reset_ball() -> void:
	# Reset the ball's position when it exits the screen
	# Note: will not work with the scoring mechanic, as it would "sleep" the ball instead
	global_position = Vector2(640, 360)  # Center of screen
	linear_velocity = Vector2.ZERO
	angular_velocity = 0
	sleeping = false
