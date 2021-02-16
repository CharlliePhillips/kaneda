extends MarginContainer

#preloads level 1
const level1 = preload("res://TestScreen.tscn")

#sets the variables to the node paths of the option's text
onready var selector0 = $CenterContainer/VBoxContainer/CenterContainer2/VboxOpt/Play/HBoxContainer/Selector
onready var selector1 = $CenterContainer/VBoxContainer/CenterContainer2/VboxOpt/Tutorial/HBoxContainer/Selector
onready var selector2 = $CenterContainer/VBoxContainer/CenterContainer2/VboxOpt/Quit/HBoxContainer/Selector

var currentPos = 0

func _ready():
	setSelection(0)

func _process(delta):
	#moves the selector around
	if Input.is_action_just_pressed("ui_down"):
		currentPos += 1
	if Input.is_action_just_pressed("ui_up"):
		currentPos -= 1
	if (currentPos < 0):
		currentPos = 2
	if (currentPos > 2):
		currentPos = 0
	
	#starts the handle selection function wheen acceptted
	if Input.is_action_just_pressed("ui_accept"):
		handleSelection(currentPos)
	
	#sets the selector after the new current pause value is chosen
	setSelection(currentPos)
	exitOnEsc()

#handles what happens when an option is selected
func handleSelection(_currentPos):
	if (_currentPos == 0):
		get_tree().change_scene("res://Level1.tscn")
		queue_free()
	elif(_currentPos == 1):
		print("make the fuckin tutorial dumbass")
	elif(_currentPos == 2):
		get_tree().quit()

#moves the selector (>) and sets the current selector variable
func setSelection(_currentPos):
	selector0.text = ""
	selector1.text = ""
	if(currentPos ==  0):
		selector0.text = ">"
	if(currentPos ==  1):
		selector1.text = ">"
	if(currentPos ==  2):
		selector2.text = ">"
		

#quits the game when esc is pressed
func exitOnEsc():
	if Input.is_action_just_pressed("ui_quit"):
		get_tree().quit()
