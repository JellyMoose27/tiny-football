extends StaticBody2D

signal scored

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("ball"):
		scored.emit()
		print("Ball is in goald")
