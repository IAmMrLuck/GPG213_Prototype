extends CharacterBody2D


@export var asteroid_speed = 250

var asteroid_health = 2

func _process(_delta):
	var direction = Vector2.LEFT
	velocity = direction * asteroid_speed
	move_and_slide()
	
	print(asteroid_health)

#	if(asteroid_health <= 0):
#		$"../AsteroidCreator".die()

func _on_area_2d_area_entered(area):
#	print("ateroid hit")
	asteroid_health -= 1
	
