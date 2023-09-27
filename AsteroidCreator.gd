extends Node2D

var asteroid_scene: PackedScene = preload("res://scenes/characters/asteroid.tscn")

var can_asteroid = true

func create_asteroid():
	var asteroid_start_pos = $MarkerPoints.get_children()
	var selected_position = asteroid_start_pos[randi() % asteroid_start_pos.size()]
	var asteroid = asteroid_scene.instantiate() as CharacterBody2D
	asteroid.position = selected_position.global_position
	add_child(asteroid)


func _on_creation_timer_timeout():
	can_asteroid = true
	create_asteroid()

#func die():
#	print("die called")
#	queue_free()
