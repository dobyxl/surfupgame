extends KinematicBody2D
signal animal_captured(n)

var dead = false
const GRAVITY = 10
var motion = Vector2()
const UP = Vector2(0, -1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dead:
		motion = Vector2(0,24)
		$AnimatedSprite.stop()
		$AnimatedSprite.rotate(0.05)
		motion = move_and_slide(motion, UP)
		pass
	elif is_on_floor():
		dead = true
		get_node("CollisionShape2D").disabled= true
	else:
		motion = move_and_slide(motion, UP)
	pass

func _on_Noah_llama2_captured():
	get_node("Llama2Box/CollisionShape2D").queue_free()
	get_node("CollisionShape2D").queue_free()
	emit_signal("animal_captured", self)
