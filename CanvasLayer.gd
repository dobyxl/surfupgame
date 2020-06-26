extends CanvasLayer

signal start_game
signal game_over

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$GameOverLabel.hide()

func update_stack(stackSize):
	$StackLabel.text = str(stackSize)

func update_animal_total(animalTotal):
	$ScoreLabel.text = str(animalTotal)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_RichTextLabel_game_over():
	emit_signal("game_over")
	$GameOverLabel.show()
	$RichTextLabel.hide()
