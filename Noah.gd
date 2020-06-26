extends KinematicBody2D
#testing github commit here, Hello peder!

const UP = Vector2(0, -1)
const GRAVITY = 10
var SPEED = 200
var JUMP_SPEED = 420
var motion = Vector2()

signal free_stack()
signal camel1_captured()
signal panda1_captured()
signal crocodile1_captured()
signal cobra1_captured()
signal salamander1_captured()
signal llama1_captured()
signal horse1_captured()
signal blackbear1_captured()
signal camel2_captured()
signal panda2_captured()
signal crocodile2_captured()
signal cobra2_captured()
signal salamander2_captured()
signal llama2_captured()
signal horse2_captured()
signal blackbear2_captured()


func _physics_process(delta):
	
	if is_on_floor():
		$AnimatedSprite.play("idle")
	
	if Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		motion.x = -SPEED
	else:
		motion.x = 0
	
	motion.y += GRAVITY
		
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		motion.y = -JUMP_SPEED
		$AnimatedSprite.play("jump")
		if Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
			motion.x += JUMP_SPEED
		elif Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
			motion.x += -JUMP_SPEED

	motion = move_and_slide(motion, UP)
	if motion.x < 0:
		($AnimatedSprite as AnimatedSprite).scale.x = -1
	elif motion.x > 0:
		($AnimatedSprite as AnimatedSprite).scale.x = 1
	pass
	

func _on_DepositBox_area_entered(area):
	emit_signal("free_stack")

func _on_Camel1Box_area_entered(area):
	emit_signal("camel1_captured")

func _on_Panda1Box_area_entered(area):
	emit_signal("panda1_captured")

func _on_Crocodile1Box_area_entered(area):
	emit_signal("crocodile1_captured")
	
func _on_Cobra1Box_area_entered(area):
	emit_signal("cobra1_captured")

func _on_Salamander1Box_area_entered(area):
	emit_signal("salamander1_captured")

func _on_Llama1Box_area_entered(area):
	emit_signal("llama1_captured")

func _on_Horse1Box_area_entered(area):
	emit_signal("horse1_captured")
	
func _on_BlackBear1Box_area_entered(area):
	emit_signal("blackbear1_captured")

func _on_Camel2Box_area_entered(area):
	emit_signal("camel2_captured")

func _on_Panda2Box_area_entered(area):
	emit_signal("panda2_captured")

func _on_Salamander2Box_area_entered(area):
	emit_signal("salamander2_captured")

func _on_Cobra2Box_area_entered(area):
	emit_signal("cobra2_captured")

func _on_Llama2Box_area_entered(area):
	emit_signal("llama2_captured")

func _on_Horse2Box_area_entered(area):
	emit_signal("horse2_captured")

func _on_BlackBear2Box_area_entered(area):
	emit_signal("blackbear2_captured")

func _on_Crocodile2Box_area_entered(area):
	emit_signal("crocodile2_captured")

func _on_World_stackChange(s):
	if s == 0:
		SPEED = 200
		JUMP_SPEED = 420
	SPEED = max(20, SPEED - 15 * s)
	JUMP_SPEED = max(42, JUMP_SPEED - 20 * s)
