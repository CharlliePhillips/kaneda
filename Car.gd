extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var top = 50
var speed = 0
var pos = Vector2(5,5)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(speed < top):
		speed += 5
	
	pass
