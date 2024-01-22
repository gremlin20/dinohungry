extends CharacterBody2D


var gravity : int = 98
var moveright : bool = true
var speed : int = 80

func _physics_process(delta):
	velocity.y += gravity
	
	if(is_on_floor()):
		velocity.y = 0
		$EnemySprite.play('walk')
	if(moveright==true):
		velocity.x = speed
		if ($RayCast2D.is_colliding() == false):
			$RayCast2D.position = Vector2(-26, 64)
			moveright=false
			$EnemySprite.flip_h = true
	else:
		velocity.x = -speed
		if ($RayCast2D.is_colliding() == false):
			$RayCast2D.position = Vector2(26, 64)
			moveright=true
			$EnemySprite.flip_h = false
	
	move_and_slide()
