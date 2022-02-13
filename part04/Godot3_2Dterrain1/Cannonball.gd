extends Area2D

signal exploded

var velocity = Vector2.ZERO #(350, 0)
onready var screensize = get_viewport().get_visible_rect().size

var g = 150

func _process(delta):
	velocity.y += g * delta
	rotation = velocity.angle()
	position += velocity * delta
	
	if position.y > screensize.y+1000:
		queue_free()

#	position += transform.x * velocity * delta

	
func _on_BallisticBullet_body_entered(_body):
	pass # Replace with function body.


func _on_Cannonball_body_entered(_body):
	emit_signal("exploded", position + transform.x * 37)
	queue_free()


