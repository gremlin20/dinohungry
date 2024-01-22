extends Node2D

@export var gbrNyawa : Texture2D
var player : Node2D
@export var score:int

# Called when the node enters the scene tree for the first time.
func _ready():
	player = $Dino
	for i in range (0,player.nyawa):
		var temp : TextureRect = TextureRect.new()
		temp.texture = gbrNyawa
		temp.expand_mode = TextureRect.EXPAND_FIT_WIDTH
		$CanvasLayer/HBoxContainer.add_child(temp)
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


func _on_jatuh_body_entered(body):
	if body.name == 'Dino':
		get_tree().change_scene_to_file("res://game1.tscn")
	pass # Replace with function body.

func _on_dino_dinoterkenahit():
	var textureNyawa = $CanvasLayer/HBoxContainer.get_child(0)
	$CanvasLayer/HBoxContainer.remove_child(textureNyawa)
