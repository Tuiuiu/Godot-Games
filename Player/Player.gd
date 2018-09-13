extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var SPEED = 500
var velocity = Vector2()
var direction = 0
var facing_enemy = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func get_input():
	var look_direction = Vector2()
	velocity = Vector2()
	
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		look_direction += Vector2(0,-1)
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		look_direction += Vector2(0,1)
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		look_direction += Vector2(-1,0)
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		look_direction += Vector2(1,0)
		
	if Input.is_action_just_pressed("interact"):
		if facing_enemy == true:
			NPCinteract()
	
	get_node("Area2D").look_at(self.get_position()+look_direction)
	velocity = velocity.normalized() * SPEED

func NPCinteract():
	for body in $Area2D.get_overlapping_bodies():
		if body.is_in_group("Enemy"):
			body.interact()

func _physics_process(delta):
	get_input()
	move_and_slide(velocity)

func _on_Area2D_body_entered(body):
	if body.is_in_group("Enemy"):
		facing_enemy = true
		
func _on_Area2D_body_exited(body):
	if body.is_in_group("Enemy"):
		facing_enemy = false
