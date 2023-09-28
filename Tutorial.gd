extends Node2D

var main_scene: PackedScene = preload("res://scenes/levels/level.tscn")

func _on_button_button_down():
	get_tree().change_scene_to_packed(main_scene)
