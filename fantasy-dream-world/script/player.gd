extends CharacterBody2D

const SPEED = 128.0
const JUMP_VELOCITY = -300.0
const GRAVITY = 1000.0

@onready var sprite = $AnimatedSprite2D

var is_attacking = false


func _physics_process(delta: float) -> void:

	# Gravity
	if not is_on_floor():
		velocity.y += GRAVITY * delta


	# Attack
	if Input.is_action_just_pressed("attack") and !is_attacking:
		is_attacking = true
		sprite.play("Attack")


	# Jump
	if Input.is_physical_key_pressed(KEY_W) and is_on_floor() and !is_attacking:
		velocity.y = JUMP_VELOCITY


	# Move
	var direction := 0

	if Input.is_physical_key_pressed(KEY_A):
		direction = -1

	if Input.is_physical_key_pressed(KEY_D):
		direction = 1


	# Không cho di chuyển khi attack
	if is_attacking:
		velocity.x = 0
	else:
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)


	# Flip sprite
	if direction > 0:
		sprite.flip_h = false

	elif direction < 0:
		sprite.flip_h = true


	# Animation
	if !is_attacking:

		if not is_on_floor():

			if velocity.y < 0:
				sprite.play("Jump")
			else:
				sprite.play("Fall")

		elif direction != 0:
			sprite.play("Run")

		else:
			sprite.play("Idle")


	move_and_slide()


func _on_animated_sprite_2d_animation_finished():
		
	if sprite.animation == "Attack":
		is_attacking = false
		sprite.play("Idle")
