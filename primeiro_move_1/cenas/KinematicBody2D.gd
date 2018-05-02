extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

#func _ready():
#	# Called every time the node is added to the scene.
#	# Initialization here
#	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
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
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
	else:
		motion.x = 0
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
	print(motion)
	motion = move_and_slide(motion,UP)