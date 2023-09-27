extends Node2D

var asteroid_scene: PackedScene = preload("res://scenes/characters/asteroid.tscn")

var can_asteroid = true

var asteroids: Dictionary = {}

func create_asteroid():
	var asteroid_start_pos = $MarkerPoints.get_children()
	var selected_position = asteroid_start_pos[randi() % asteroid_start_pos.size()]
	var asteroid = asteroid_scene.instantiate() as CharacterBody2D
	asteroid.position = selected_position.global_position
	add_child(asteroid)

	asteroids[asteroid] = true

func _on_creation_timer_timeout():
	can_asteroid = true
	create_asteroid()

func destroy_asteroid(asteroid_instance: CharacterBody2D):
	# Check if the asteroid is in the dictionary
	if asteroids.has(asteroid_instance):
		# Call queue_free() to destroy the asteroid
		asteroid_instance.queue_free()
		# Remove the reference from the dictionary
		asteroids.erase(asteroid_instance)
