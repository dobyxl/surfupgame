extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var RISING = Vector2(0,-1)
var counter = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if counter == 0:
		translate(RISING)
	counter += 1
	counter = counter % 20
	pass
