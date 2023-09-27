extends StaticBody2D

var asteroid: PackedScene = preload("res://scenes/characters/asteroid.tscn")
var game_over: PackedScene = preload("res://scenes/levels/game_over.tscn")

var station_health: int = 3

func _process(_delta):
#	print(station_health)
	if station_health <= 0:
#		print("game over")
		get_tree().change_scene_to_packed(game_over)

func _on_area_2d_body_entered(_body):
	station_health -= 1
