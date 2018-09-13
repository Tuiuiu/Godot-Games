extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var destination = "World2"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	pass	

func change_scene():
	get_tree().change_scene("res://Stages/World2.tscn")

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		change_scene()
		
