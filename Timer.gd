extends Timer

# Declare member variables here. Examples:
var base_time = 90
var waiter
var vics
onready var timer = get_node("/root/Level1/Timer")
signal time
signal win

func _ready():
	timer.set_one_shot(true)
	timer.set_wait_time(base_time)
	timer.start()

func _process(delta):
	vics = get_parent().vicCount
	if (vics == 20):
		win()
	if timer.get_time_left() == 0 && vics != 20:
		print("timeout")
		emit_signal("time")
	pass

func win():
	waiter = timer.get_time_left()
	timer.stop()
	emit_signal("win", waiter)
	pass # Replace with function body.
