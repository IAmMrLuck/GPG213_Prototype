extends Node2D

var laser_scenes: Array = []

var laser_scene: PackedScene = preload("res://scenes/weapons/laser_level_one.tscn")
var rocket_scene: PackedScene = preload("res://scenes/weapons/rocket_level_one.tscn")

var scroll_speed: int = 100
@onready var parallax_background = $ParallaxBackground

func _ready():
	laser_scenes.append(preload("res://scenes/weapons/laser_level_one.tscn"))

func _process(delta):
	if (Input.is_action_just_pressed("quit")):
		get_tree().quit()
	elif (Input.is_action_just_pressed("restart")):
		get_tree().reload_current_scene()
	
	parallax_background.scroll_offset.x += delta * -scroll_speed

func _on_space_station_player_entered_area(body):
	print("entered from the level")
	print(body)


func _on_player_character_shoot_laser(pos, direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(direction.angle())+90
	laser.direction = direction
	$Projectiles.add_child(laser)



func _on_player_character_shoot_rocket(pos, direction):
	var rocket = rocket_scene.instantiate() as RigidBody2D
	rocket.position = pos
	rocket.linear_velocity = direction * rocket.speed
	$Projectiles.add_child(rocket)

