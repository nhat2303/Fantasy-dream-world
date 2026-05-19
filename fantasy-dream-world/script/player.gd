extends CharacterBody2D

const SPEED = 128.0
const JUMP_VELOCITY = -300.0
const GRAVITY = 1000.0

@onready var sprite = $AnimatedSprite2D


func _physics_process(delta: float) -> void:

	# Gravity
	if not is_on_floor():
		velocity.y += GRAVITY * delta


	# Jump
	if Input.is_key_pressed(KEY_W) and is_on_floor():
		velocity.y = JUMP_VELOCITY


	# Move
	var direction := 0

	if Input.is_key_pressed(KEY_A):
		direction = -1

	if Input.is_key_pressed(KEY_D):
		direction = 1


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
