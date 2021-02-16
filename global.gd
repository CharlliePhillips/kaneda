extends Node

var lives = 3
var level = 1
var carsInLevel = 9
var nextLevel = "res://Level1.tscn"
var time = 20

func _physics_process(delta):
	print("level: ", level)
	#print("time: ", time)
	#print("cars in: ", carsInLevel)
	if(level == 1):
		carsInLevel = 9
		nextLevel = "res://Level2.tscn"
		time = 20
	if(level == 2):
		carsInLevel = 12
		nextLevel = "res://Level3.tscn"
		time = 30
	if(level == 3):
		carsInLevel = 24
		nextLevel = "res://TestScreen.tscn"
		time = 40
