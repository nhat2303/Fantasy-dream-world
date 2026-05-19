extends CharacterBody2D

const SPEED = 50
const GRAVITY = 1000

var huong = 1

@onready var sprite = $AnimatedSprite2D

func _physics_process(delta):

	velocity.y += GRAVITY * delta
	
	if is_on_wall():
		huong *= -1
		sprite.flip_h = !sprite.flip_h

	velocity.x = SPEED * huong

	move_and_slide()


func _on_enemy_killzone_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
