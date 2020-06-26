extends Node2D

signal stackChange(s)
# Declare member variables here. Examples:
var animalStack = []
var stackSize = 0
var animalTotal = 0

func _add_to_stack(x):
	stackSize = stackSize + 1
	animalStack.append(x)
	print(stackSize)
	emit_signal("stackChange", stackSize)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for item in animalStack:
		item.position = $Noah.position - Vector2(0, 22 * (animalStack.find(item) + 1))
	$HUD.update_animal_total(animalTotal)
	$HUD.update_stack(stackSize)

func _on_Noah_free_stack():
	animalTotal = animalTotal + stackSize
	for item in animalStack:
		item.queue_free()
	animalStack.clear()
	stackSize = 0
	emit_signal("stackChange", stackSize)

func _on_Panda1_animal_captured(n):
	_add_to_stack(n)

func _on_Camel1_animal_captured(n):
	_add_to_stack(n)

func _on_Crocodile1_animal_captured(n):
	_add_to_stack(n)

func _on_Cobra1_animal_captured(n):
	_add_to_stack(n)

func _on_Salamander1_animal_captured(n):
	_add_to_stack(n)

func _on_Llama1_animal_captured(n):
	_add_to_stack(n)

func _on_Horse1_animal_captured(n):
	_add_to_stack(n)

func _on_BlackBear1_animal_captured(n):
	_add_to_stack(n)

func _on_Camel2_animal_captured(n):
	_add_to_stack(n)

func _on_Panda2_animal_captured(n):
	_add_to_stack(n)

func _on_Salamander2_animal_captured(n):
	_add_to_stack(n)

func _on_Cobra2_animal_captured(n):
	_add_to_stack(n)

func _on_Llama2_animal_captured(n):
	_add_to_stack(n)

func _on_Horse2_animal_captured(n):
	_add_to_stack(n)

func _on_BlackBear2_animal_captured(n):
	_add_to_stack(n)

func _on_Crocodile2_animal_captured(n):
	_add_to_stack(n)
	


func _on_HUD_game_over():
	pass # Replace with function body.
