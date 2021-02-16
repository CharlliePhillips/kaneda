extends Node

var lives = 3
var level = 1
var carsInLevel = 9
var nextLevel = "res://Level1.tscn"
var time = 20
var score = 0
var gamecomplete = false
var player1 = "john"
var score1 = 500
var player2 = "john"
var score2 = 250
var player3 = "john"
var score3 = 100
var noscore = false
var playername = ""

func _physics_process(delta):
	#print("level: ", level)
	#print("time: ", time)
	#print("cars in: ", carsInLevel)
	#print(playername)
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
		nextLevel = "res://Leaderboard.tscn"
		time = 40
	if(level == 4):
		gamecomplete = true
	if(gamecomplete == true):
		if (score > score1):
			score1 = score
			player1 = playername
		elif(score > score2):
			score2 = score
			player2 = playername
		elif(score > score3):
			score3 = score
			player3 = playername
		else:
			noscore = true
	
