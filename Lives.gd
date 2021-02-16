extends MarginContainer

func _ready():
	lifechange()

func lifechange():
	if (global.lives == 3):
		$CenterContainer/VBoxContainer/CenterContainer.visible = true
		$CenterContainer/VBoxContainer/HBoxContainer/heart1.text = "<3"
		$CenterContainer/VBoxContainer/HBoxContainer/heart2.text = "<3"
		$CenterContainer/VBoxContainer/HBoxContainer/heart3.text = "<3"
	if (global.lives == 2):
		$CenterContainer/VBoxContainer/CenterContainer.visible = true
		$CenterContainer/VBoxContainer/HBoxContainer/heart1.text = "<3"
		$CenterContainer/VBoxContainer/HBoxContainer/heart2.text = "<3"
		$CenterContainer/VBoxContainer/HBoxContainer/heart3.visible = false
	if (global.lives == 1):
		$CenterContainer/VBoxContainer/CenterContainer.visible = true
		$CenterContainer/VBoxContainer/HBoxContainer/heart1.text = "<3"
		$CenterContainer/VBoxContainer/HBoxContainer/heart2.visible = false
		$CenterContainer/VBoxContainer/HBoxContainer/heart3.visible = false
	if (global.lives == 0):
		$CenterContainer/VBoxContainer/HBoxContainer/heart1.text = "Game over :("
		$CenterContainer/VBoxContainer/CenterContainer.visible = false

func _on_Timer_time():
	global.lives = 1
	lifechange()
	global.lives = 0
	lifechange()
	pass # Replace with function body.
