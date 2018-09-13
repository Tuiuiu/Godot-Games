extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
	
func get_input():
	var look_direction = Vector2()
	
	if Input.is_action_pressed("ui_up"):
		look_direction = Vector2(0,-1)
	if Input.is_action_pressed("ui_down"):
		look_direction = Vector2(0,1)
	if Input.is_action_pressed("ui_left"):
		look_direction = Vector2(-1,0)
	if Input.is_action_pressed("ui_right"):
		look_direction = Vector2(1,0)
	
	look_at(self.get_position()+look_direction)
	
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
