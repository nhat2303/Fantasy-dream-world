extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		print("+1 coin")
		queue_free()
