extends CharacterBody2D

@export
var speed : float = 10
var jump_speed : float = 800
var gravity : float = 30

#the jump count
var jump_count = 0
var max_jumps = 2

#hit
signal dinoterkenahit
var isBeingHit : bool = false
var timer : float = 1
var t : float = 0
var keeper : Color
var nyawa : int = 3

func _ready():
	keeper =modulate

func _physics_process(delta):
	velocity.y += gravity

	if (Input.is_action_pressed("MajuKanan")):
		velocity.x += speed
		$RaptorSprite.flip_h = 0

	elif (Input.is_action_pressed("MajuKiri")):
		velocity.x -= speed
		$RaptorSprite.flip_h = 1
	else:
		velocity.x = 0
	
	if is_on_floor():
		jump_count = 0

	if Input.is_action_just_pressed("Lompat") and jump_count < max_jumps:
		velocity.y -= jump_speed
		jump_count += 1

	if (velocity.y < 0):
		$RaptorSprite.play('Eat')
	elif (velocity.x == 0):
		$RaptorSprite.play('Ready')
	elif (velocity.x > 0):
		$RaptorSprite.play('Walk')
	elif (velocity.x < 0):
		$RaptorSprite.play('Walk')
		
	t += delta
	if (isBeingHit) :
		if (t > timer) :
			isBeingHit = false
			t = 0
			$RaptorSprite.modulate = keeper

	move_and_slide()
	pass


func _on_hit_area_body_entered(body):
	if(body.is_in_group("EnemyGroup")):
		isBeingHit = true
		t=0
		emit_signal("dinoterkenahit")
		nyawa = nyawa - 1
		var pantul = 1 if (body.global_position.x > global_position.x) else -1
		velocity.x = pantul * -300
		velocity.y = -500
		$RaptorSprite.modulate = Color(255,0,0)
		if (nyawa == 0):
			get_tree().reload_current_scene()
	pass
