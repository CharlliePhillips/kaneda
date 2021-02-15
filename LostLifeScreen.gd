extends MarginContainer

#preloads level 1
#const reload = preload("res://reload.tscn")

#sets the variables to the node paths of the option's text
onready var selector0 = $CenterContainer/VBoxContainer/retryMain/retryMain/selector
onready var selector1 = $CenterContainer/VBoxContainer/quit/quit/selector

#this variable controls wether or not the victory menu doesn't work while its not visible
#if it wasn't here then you could still navigate and use the menu even when it was not visible
var enable = false

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
		currentPos = 1
	if (currentPos > 1):
		currentPos = 0
	
	#starts the handle selection function wheen acceptted
	if Input.is_action_just_pressed("ui_accept"):
		handleSelection(currentPos)
	
	#figures out what text to display based on game state
	if (global.lives == 0):
		$CenterContainer/VBoxContainer/maintitle/maintitle.text = "game over!"
		$CenterContainer/VBoxContainer/subtitle/subtitile.text = "you lost all your lives :("
		$CenterContainer/VBoxContainer/retryMain/retryMain/retrymain.text = "main menu"
	
	#sets the selector after the new current pause value is chosen
	setSelection(currentPos)
	exitOnEsc()

#handles what happens when an option is selected
func handleSelection(_currentPos):
	if(_currentPos == 0 && enable == true && global.lives == 0):
		get_tree().change_scene("res://Main Menu.tscn")
	elif (_currentPos == 0 && enable == true && global.lives > 0):
		get_tree().reload_current_scene()
	elif(_currentPos == 1 && enable == true):
		get_tree().quit()

#moves the selector (>) and sets the current selector variable
func setSelection(_currentPos):
	selector0.text = ""
	selector1.text = ""
	if(currentPos ==  0):
		selector0.text = ">"
	if(currentPos ==  1):
		selector1.text = ">"
		

#quits the game when esc is pressed
func exitOnEsc():
	if Input.is_action_just_pressed("ui_quit"):
		get_tree().quit()
