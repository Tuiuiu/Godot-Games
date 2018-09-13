extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var SPEED = 750
var velocity = Vector2()

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	
	velocity = velocity.normalized() * SPEED

func _physics_process(delta):
	get_input()
	move_and_slide(velocity)