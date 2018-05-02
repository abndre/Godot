extends KinematicBody2D


const UP = Vector2(0,-1)
var motion = Vector2()

#constants
const GRAVITY = 20
const SPEED = 200
const JUMP_HEIGHT = -500

func _physics_process(delta):
	
	#gravity
	motion.y+=GRAVITY
	
	#Move Player
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$Sprite.flip_h = false
		$Sprite.play("Run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$Sprite.flip_h = true
		$Sprite.play("Run")
	else:
		motion.x = 0
		$Sprite.play("Idle")
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
	else:
		$Sprite.play("Jump")
	#print(motion)
	motion = move_and_slide(motion,UP)