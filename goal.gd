extends StaticBody2D

signal scored

# The ball enters the goal
# The goal will emit a signal, which the main scene will receive
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("ball"):
		scored.emit()
