extends CharacterBody2D

@export var asteroid_speed = 200

#var target = $"../PlayerCharacter".AstroidTarget

var asteroid_health = 2

func _process(_delta):
	var direction = Vector2.LEFT
#	velocity = (target - position) * asteroid_speed
	velocity = direction * asteroid_speed
	move_and_slide()
	
#	print(asteroid_health)

	if(asteroid_health <= 0):
		queue_free()

func _on_area_2d_area_entered(_area):
#	print("ateroid hit")
	asteroid_health -= 1
	
