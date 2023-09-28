extends CharacterBody2D

var health: int = 4

func _process(_delta):
	
	move_and_slide()

func handle_hit():
	health -= 1
	print("enemy hit")

	if (health <= 0):
		queue_free()
