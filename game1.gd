extends Node2D

@export var score:int

# Called when the node enters the scene tree for the first time.
func _ready():
	score = 0
	
	for child in $Drumstick.get_children():
		child.connect("drumstick_keambil",_diambil_drum)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _diambil_drum():
	score += 10
	print(score)
	$CanvasLayer/ScoreLabel.text = "Score : " + str(score)
	pass
