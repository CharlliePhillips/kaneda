extends Node

# Called when the node enters the scene tree for the first time.
#func _ready():
	


func _physics_process(delta):
	if(global.gamecomplete == true):
		print("current session: ", global.playername, global.score)
		print("high score : ", global.player1, global.score1)
		print("high score 2 : ", global.player2, global.score2)
		print("high score3 : ", global.player3, global.score3)
