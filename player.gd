extends CharacterBody2D

@export var speed = 300
@export var gravity = 800
@export var jump_force: float = -350
@onready var animations = $AnimationPlayer
var attacking = false
var air_direction: float = 0.0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor() and not attacking:
		velocity.y = jump_force
		air_direction = Input.get_axis("move_left", "move_right")
	
	var direction = Input.get_axis("move_left", "move_right")
	if not attacking:
		if is_on_floor():
			if direction != 0:
				#is the current animations the kick? And is it currently playing?
				#Player must not be attacking in order to move
				#Bascially disable movement when the player is attacking
				animations.play("walk_forward")
				velocity.x = speed * direction
			else:
				animations.play("idle")
				velocity.x = move_toward(velocity.x, 0, speed)
		else:
			air_direction = direction
	
	#Note: always have this for movement
	move_and_slide()
	if Input.is_action_just_pressed("kick") and not attacking:
		attacking = true
		animations.play("5B")
		if is_on_floor():
			velocity.x = 0
		#else:
			#velocity.x = speed * air_direction

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "5B":
		attacking = false
