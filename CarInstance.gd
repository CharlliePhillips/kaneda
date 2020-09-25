extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = Vector2(0,0)
var maxSpeed = 75
var accel = 3
var laneOut = false
var lane = "straight"
var go = true
var initRot = get_rotation_degrees()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_rightLane_body_entered(body):
	if(body is KinematicBody2D):
		body.lane = "right"
	print(body, "entered")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(go == true):
		if(abs(speed.y) < maxSpeed):
			speed.y += accel * -cos(get_rotation_degrees())
		if(abs(speed.x) < maxSpeed):
			speed.x += accel * sin(get_rotation_degrees())
		if(lane == "right" && laneOut == true && get_rotation_degrees() < initRot + 90):
			set_rotation_degrees(get_rotation_degrees() + 10)
			print(get_rotation_degrees())
	move_and_slide(speed)
	pass


func _on_rightLane_body_exited(body):
	if(body is KinematicBody2D):
		body.laneOut = true
		print(lane)
		print(laneOut)
	pass # Replace with function body.
	
	
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if(body != self):
		queue_free()
	pass # Replace with function body.
