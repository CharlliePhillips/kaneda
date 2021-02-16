extends Timer

# Declare member variables here. Examples:
var base_time = global.time
var waiter
var vics
onready var timer = get_node("/root/Level1/Timer")
signal time
signal win

func _ready():
	if (global.level == 1):
		base_time = 20
	elif (global.level == 2):
		base_time = 30
	elif (global.level == 3):
		base_time = 40
	timer.set_one_shot(true)
	timer.set_wait_time(base_time)
	timer.start()

func _process(delta):
	get_parent().get_node("Time/CenterContainer/VBoxContainer/CenterContainer/time").text = str(int(timer.get_time_left()))
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
	#print("timer stopped")
	emit_signal("win", waiter)
	pass # Replace with function body.
	
