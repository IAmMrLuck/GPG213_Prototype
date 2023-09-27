extends CharacterBody2D

var can_laser: bool = true
var can_rocket: bool = true

signal shoot_laser(pos, dir)
signal shoot_rocket(pos, dir)

func _process(_delta):
	
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()

	look_at(get_global_mouse_position())
	var player_direction = (get_global_mouse_position() - position).normalized()
	if Input.is_action_pressed("primary action") and can_laser:
		can_laser = false
		$Timer.start(.2)
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		shoot_laser.emit(selected_laser.global_position, player_direction)



	if Input.is_action_pressed("secondary action") and can_rocket:
		can_rocket = false
		$Timer.start()
		var rocket_pos = $LaserStartPositions.get_children()[0].global_position
		shoot_rocket.emit(rocket_pos, player_direction)



func _on_timer_timeout():
	can_laser = true
	can_rocket = true
