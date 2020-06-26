extends RichTextLabel

signal game_over()

var s = 0
var m = 1
var count = 0

var startingMinutes = m

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	


func _process(delta):
	
	if s < 1:
		m = m - 1
		s = 59
	
	set_text(str(m) + ":" + str(s))
	
	if ((count/60) == startingMinutes):
		emit_signal("game_over")

func _on_Timer_timeout():
	s = s - 1
	count = count + 1
