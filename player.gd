extends CharacterBody2D

@export var speed = 350
@export var gravity = 1700
@export var jump_force: float = -750

@export var damage = 50
@export var action_suffix = ""
@onready var animations = $AnimationPlayer
var attacking = false
var air_direction: float = 0.0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("jump" + action_suffix) and is_on_floor() and not attacking:
		velocity.y = jump_force
		air_direction = Input.get_axis("move_left" + action_suffix, "move_right" + action_suffix)
	
	var direction = Input.get_axis("move_left" + action_suffix, "move_right" + action_suffix)
	if not attacking:
		if is_on_floor():
			if direction != 0:
				#is the current animations the kick? And is it currently playing?
				#Player must not be attacking in order to move
				#Bascially disable movement when the player is attacking
				animations.play("walk_forward" + action_suffix)
				velocity.x = speed * direction
			else:
				animations.play("idle" + action_suffix)
				velocity.x = move_toward(velocity.x, 0, speed)
		else:
			air_direction = direction
	
	#Note: always have this for movement
	move_and_slide()
	if Input.is_action_just_pressed("kick" + action_suffix) and not attacking:
		attacking = true
		animations.play("5B" + action_suffix)
		if is_on_floor():
			velocity.x = 0
		#else:
			#velocity.x = speed * air_direction

#func _unhandled_input(event: InputEvent) -> void:

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "5B" + action_suffix:
		attacking = false

func frameFreeze(timeScale, duration):
	Engine.time_scale = timeScale
	await(get_tree().create_timer(duration, true, false, true).timeout)
	Engine.time_scale = 1.0


func _on_b_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("ball"):
		#disable hithox to prevent hitting the ball twice
		$"AnimatedSprite2D/5B/5B_Hitbox/HitBox".set_deferred("disabled", true)
		$"AnimatedSprite2D/5B/5B_Hitbox/HitBox2".set_deferred("disabled", true)
		#Note: frameFreeze can add extra speed to the ball (unintentional)
		#This is because even though the frame froze, the apply_impulse function
		#still applies force every frame
		frameFreeze(0, 0.08)
		if action_suffix == "_p1":
			body.kick(1)
		elif action_suffix == "_p2":
			body.kick(-1)
