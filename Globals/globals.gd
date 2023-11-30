extends Node

signal score_change

var left_player_score = 0:
	set(value):
		left_player_score = value
		score_change.emit()

var right_player_score = 0:
	set(value):
		right_player_score = value
		score_change.emit()
