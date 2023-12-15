extends Control


func _on_zero_players_pressed():
	get_tree().change_scene_to_file("res://scenes/Game.tscn")


func _on_two_players_pressed():
	get_tree().change_scene_to_file("res://scenes/TwoPlayersLevel.tscn")


func _on_one_player_pressed():
	get_tree().change_scene_to_file("res://scenes/1PlayerLevel.tscn")
