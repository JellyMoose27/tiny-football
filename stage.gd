extends Node2D

var p1_score: int = 0
var p2_score: int = 0

var BallScene := preload("res://Ball.tscn")
var ball: RigidBody2D

func _ready() -> void:
	$BGM.play()
	spawn_ball()
	await get_tree().create_timer(6).timeout
	$Label.hide()
	$Label2.hide()

func despawn_ball() -> void:
	if ball:
		ball.queue_free()
		ball = null

func spawn_ball() -> void:
	ball = BallScene.instantiate()
	add_child(ball)
	ball.global_position = Vector2(640,384)
	ball.add_to_group("ball")

#Player 1 scores a goal
func _on_goal_scored() -> void:
	p1_score += 1
	update_score(p1_score, "p1")
	despawn_ball()
	await get_tree().create_timer(1.0).timeout
	spawn_ball()

#Player 2 scores a goal
func _on_goal_1_scored() -> void:
	p2_score += 1
	update_score(p2_score, "p2")
	despawn_ball()
	await get_tree().create_timer(1.0).timeout
	spawn_ball()

func update_score(score, player) -> void:
	if player == "p1":
		$Player1Score.text = "Player 1: %d" % [score]
	elif player == "p2":
		$Player2Score.text = "Player 2: %d" % [score]
