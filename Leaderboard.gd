extends Node

# Called when the node enters the scene tree for the first time.

onready var selector0 = $MarginContainer/CenterContainer/VBoxContainer/mainmenu/HBoxContainer/selector
onready var selector1 = $MarginContainer/CenterContainer/VBoxContainer/quit/HBoxContainer/selector
var currentPos = 0

func _ready():
	setSelection(currentPos)
	

func _physics_process(delta):
	if(global.gamecomplete == true):
		
		if (global.newscore == true):
			$MarginContainer/CenterContainer/VBoxContainer/CenterContainer/Label.text = "New Score!"
			if(global.newplace == 1):
				$MarginContainer/CenterContainer/VBoxContainer/player1/HBoxContainer/new.visible = true
			if(global.newplace == 2):
				$MarginContainer/CenterContainer/VBoxContainer/player2/HBoxContainer/new.visible = true
			if(global.newplace == 3):
				$MarginContainer/CenterContainer/VBoxContainer/player3/HBoxContainer/new.visible = true
		else:
			$MarginContainer/CenterContainer/VBoxContainer/CenterContainer/Label.text = "Leaderboard"
		
		$MarginContainer/CenterContainer/VBoxContainer/player1/HBoxContainer/name.text = global.player1
		$MarginContainer/CenterContainer/VBoxContainer/player1/HBoxContainer/score.text = str(global.score1)
		$MarginContainer/CenterContainer/VBoxContainer/player2/HBoxContainer/name.text = global.player2
		$MarginContainer/CenterContainer/VBoxContainer/player2/HBoxContainer/score.text = str(global.score2)
		$MarginContainer/CenterContainer/VBoxContainer/player3/HBoxContainer/name.text = global.player3
		$MarginContainer/CenterContainer/VBoxContainer/player3/HBoxContainer/score.text = str(global.score3)
	
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
	
	#sets the selector after the new current pause value is chosen
	setSelection(currentPos)
	exitOnEsc()

#handles what happens when an option is selected
func handleSelection(_currentPos):
	if (_currentPos == 0):
		clearVars()
		get_tree().change_scene("res://Main Menu.tscn")
		queue_free()
	elif(_currentPos == 1):
		get_tree().quit()

func setSelection(_currentPos):
	selector0.text = ""
	selector1.text = ""
	if(currentPos ==  0):
		selector0.text = ">"
	if(currentPos ==  1):
		selector1.text = ">"
func clearVars():
	global.lives = 3
	global.level = 1
	global.carsInLevel = 9
	global.nextLevel = "res://Level1.tscn"
	global.time = 20
	global.score = 0
	global.gamecomplete = false
	global.noscore = false
	global.playername = ""
	global.newscore = false
	global.newplace = 0
	
	

func exitOnEsc():
	if Input.is_action_just_pressed("ui_quit"):
		get_tree().quit()
