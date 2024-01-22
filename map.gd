extends Area2D

signal character_fall

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_character_fall(body):
	if body.name =='dino' :
		emit_signal('character_fall')
	pass # Replace with function body.
