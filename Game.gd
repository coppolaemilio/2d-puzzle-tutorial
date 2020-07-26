extends Node2D

var game_end = false
var moves = 0

func _process(_delta): 
	$UI/MovesLabel.text = 'Moves: ' + str(moves)

func check_end():
	if game_end == false:
		var spots = $Spots.get_child_count()
		for i in $Spots.get_children():
			if i.occupied:
				spots -= 1
		
		if spots == 0:
			$UI/AcceptDialog.popup()
			game_end = true

func _on_AcceptDialog_confirmed():
	get_tree().reload_current_scene()
