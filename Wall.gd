extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var frame = 0
var open = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.pressed && event.position.x > self.position.x - 16 && event.position.x < self.position.x + 16 && event.position.y >  self.position.y - 16 && event.position.y < self.position.y + 16:
			open *= -1
			if(frame == 1):
				frame = 0
			else: 
				frame += 1
	pass
func _process(delta):
	$AnimatedSprite.set_frame(frame)
	print(open)
	pass
