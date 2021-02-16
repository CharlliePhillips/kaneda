extends Timer

# Declare member variables here. Examples:
var base_time = global.time
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
	if (vics == global.carsInLevel):
		win()
	if timer.get_time_left() == 0 && vics != global.carsInLevel:
		print("timeout")
		emit_signal("time")
	pass

func win():
	waiter = timer.get_time_left()
	timer.stop()
	print("timer stopped")
	emit_signal("win", waiter)
	pass # Replace with function body.
