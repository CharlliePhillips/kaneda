extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = Vector2(0,0)
var speedXY = 0
var maxSpeed = 75
var accel = 3
var fric = 0
var laneOut = false
var lane = "straight"
var go = true
var rotSpeed = 5
var see = false
var initRot = get_rotation_degrees()
# Called when the node enters the scene tree for the first time.
func _ready():
	initRot = get_rotation_degrees()
	pass # Replace with function body.

func _on_rightLane_body_entered(body):
	if(body is KinematicBody2D):
		body.lane = "right"
	#print(body, "entered")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(go == true):
		if(abs(speedXY) < maxSpeed && see != true && see == false):
			speedXY += accel
		if(see == true && speedXY > 0):
			speedXY -= accel
		if(lane == "right" && laneOut == true && get_rotation_degrees() < initRot + 90):
			print(initRot)
			set_rotation_degrees(get_rotation_degrees() + rotSpeed)
			print(get_rotation_degrees())
		speed.y = speedXY * -cos(get_rotation())
		speed.x = speedXY * sin(get_rotation())
	move_and_slide(speed)
	pass


func _on_rightLane_body_exited(body):
	print('exit')
	if body is KinematicBody2D:
		body.laneOut = true
		print(lane)
		print(body, laneOut)
	pass # Replace with function body.
	
	
	pass # Replace with function body.

#if another car hits the sides of the car then destroy
func _on_Area2D_body_entered(body):
	if(body != self):
		queue_free()
	pass # Replace with function body.

#detect if another car is close in front
func _on_Eyeline_body_entered(body):
	if body is KinematicBody2D && body != self:
		see = true
		#print("see ", body)
	pass # Replace with function body.
func _on_Eyeline_body_exited(body):
	if body is KinematicBody2D && body != self:
		see = false
		#print("no see ", body)
	pass # Replace with function body.
