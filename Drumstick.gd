extends Area2D

signal drumstick_keambil


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _makan_drumstick(body):
	emit_signal("drumstick_keambil")
	queue_free()
	pass
