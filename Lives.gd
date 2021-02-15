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
		$CenterContainer/VBoxContainer/HBoxContainer/heart3.text = ""
	if (global.lives == 1):
		$CenterContainer/VBoxContainer/CenterContainer.visible = true
		$CenterContainer/VBoxContainer/HBoxContainer/heart1.text = "<3"
		$CenterContainer/VBoxContainer/HBoxContainer/heart2.text = ""
		$CenterContainer/VBoxContainer/HBoxContainer/heart3.text = ""
	if (global.lives == 0):
		$CenterContainer/VBoxContainer/HBoxContainer/heart1.text = "Game over :("
		$CenterContainer/VBoxContainer/CenterContainer.visible = false
