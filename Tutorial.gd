extends MarginContainer

#preloads level 1
const level1 = preload("res://Level1.tscn")
const menu = preload("res://Main Menu.tscn")
var timer = 0
#sets the variables to the node paths of the option's text
onready var selector0 = $VBoxContainer/CenterContainer2/VboxOpt/Return/HBoxContainer/Selector
onready var selector1 = $VBoxContainer/CenterContainer2/VboxOpt/Back/HBoxContainer/Selector

var currentPos = 0

func _ready():
	setSelection(0)
	global.lives = 3

func _process(delta):
	#moves the selector around
	if Input.is_action_just_pressed("ui_down"):
		currentPos += 1
	if Input.is_action_just_pressed("ui_up"):
		currentPos -= 1
	if(currentPos > 1):
		currentPos = 0
	if(currentPos < 0):
		currentPos = 1
	
	#starts the handle selection function wheen acceptted
	if (Input.is_action_just_pressed("ui_accept")):
		handleSelection(currentPos)
	
	#sets the selector after the new current pause value is chosen
	setSelection(currentPos)
	exitOnEsc()

#handles what happens when an option is selected
func handleSelection(_currentPos):
	if (_currentPos == 0):
		get_tree().change_scene("res://Level1.tscn")
		queue_free()
	else:
		get_tree().change_scene("res://Main Menu.tscn")
		queue_free()

#moves the selector (>) and sets the current selector variable
func setSelection(_currentPos):
	selector0.text = ""
	selector1.text = ""
	if(currentPos ==  0):
		selector0.text = ">"
	else:
		selector1.text = ">"

#quits the game when esc is pressed
func exitOnEsc():
	if Input.is_action_just_pressed("ui_quit"):
		get_tree().quit()
