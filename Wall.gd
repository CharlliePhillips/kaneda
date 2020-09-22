extends StaticBody2D


var frame = 0
var open = -1
var carNode = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.pressed && event.position.x > self.position.x - 16 && event.position.x < self.position.x + 16 && event.position.y >  self.position.y - 16 && event.position.y < self.position.y + 16:
			open *= -1
			if(frame == 1):
				frame = 0
			else: 
				frame += 1
	if(open == -1):
		$CollisionShape2D.disabled = false
	if(open == 1):
		$CollisionShape2D.disabled = true
	pass

func _process(delta):
	$AnimatedSprite.set_frame(frame)
	pass
