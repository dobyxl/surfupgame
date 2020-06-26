extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const GRAVITY = 10
var motion = Vector2()
const UP = Vector2(0, -1)

# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	motion.x == 0
	if !is_on_floor():
		motion.y += GRAVITY
	else:
		motion.y == 0 
	motion = move_and_slide(motion, UP)
	
	pass
