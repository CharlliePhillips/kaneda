extends Node

#have to manualy count the cars in the level an set this variable to that number
var carsInLevel = 20
var score = 0
var vicCount = 0

func _process(delta):
	exitOnEsc()
	victory()

func exitOnEsc():
	if Input.is_action_just_pressed("ui_quit"):
		get_tree().quit()

func victory():
	#print(vicCount)
	if(vicCount == 20):
		#calculate score based on timer 
		#print("victory")
		$VictoryScreen1.enable = true
		$VictoryScreen1.visible = true


func _on_Timer_win(remain):
	score = 5 * remain #Change as wanted
	pass # Replace with function body.
