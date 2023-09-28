extends Area2D


@export var speed: int = 1200
var direction: Vector2 = Vector2.UP

func _process(delta):
	position += direction * speed * delta

func upgrade_scale():
	scale.x += 1
	scale.y += 1

# remove laser instance once off screen
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_body_entered(body):
	if body.has_method("handle_hit"):
		body.handle_hit()
