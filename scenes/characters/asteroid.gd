extends CharacterBody2D

func _process(_delta):
	
	var direction = Vector2.LEFT
	
	velocity = direction * 100

	move_and_slide()