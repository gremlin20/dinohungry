extends Area2D

#var ini untuk scene yang mau kita load
#jadi isi variable ini dengan scene yang kita mau

@export var next_scene_label : String

#selanjutnya kita akan pasang signal untuk body enter

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	if(body.is_in_group("DinoGroup")):
		print("masuk sini")
		get_tree().paused = true
		$AnimationPlayer.play("OpenPortal")
	pass # Replace with function body.

func _pindah_level():
	print("pindah level")
	get_tree().paused = false
	get_tree().change_scene_to_file("res://" + next_scene_label + ".tscn")

