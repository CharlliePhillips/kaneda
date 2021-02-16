extends Node

#have to manualy count the cars in the level an set this variable to that number
var carsInLevel = global.carsInLevel
var level = global.level
var newScore = 0
var vicCount = 0
var scoreupdated = false

func _process(delta):
	carsInLevel = global.carsInLevel
	exitOnEsc()
	victory()

func exitOnEsc():
	if Input.is_action_just_pressed("ui_quit"):
		get_tree().quit()

func victory():
	#print(vicCount)
	if(vicCount == carsInLevel):
		#calculate score based on timer 
		#print("victory")
		$VictoryScreen1.enable = true
		$VictoryScreen1.visible = true


func _on_Timer_win(remain):
	if(scoreupdated == false):
		newScore = int(5 * remain * global.level) #Change as wanted
		global.score += newScore
		scoreupdated = true
	pass # Replace with function body.
