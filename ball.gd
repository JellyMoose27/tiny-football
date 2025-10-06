extends RigidBody2D

# Apply force to the ball to simulate the player kicking it
func kick(direction):
	var impulse = Vector2(direction * 800, -800 * 0.4)
	# Apply force to the ball based on the player's facing direction (p1 is right, p2 is left)
	apply_impulse(impulse)
	
func _physics_process(_delta: float) -> void:
	# Safety boundary reset (if ball escapes the map)
	var screen_size := get_viewport_rect().size
	if global_position.x < -200 or global_position.x > screen_size.x + 200 \
	or global_position.y < -200 or global_position.y > screen_size.y + 200:
		reset_ball()

func reset_ball() -> void:
	# Reset the ball's position when it exits the screen
	# Note: will not work with the scoring mechanic, as it would instead stop all momentum of the ball
	# without resetting it's position, effectively "sleeping" it.
	global_position = Vector2(640, 360)  # Center of screen
	linear_velocity = Vector2.ZERO
	angular_velocity = 0
	sleeping = false
