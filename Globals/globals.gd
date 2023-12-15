extends Node

signal score_change
signal left_player_won
signal right_player_won

var game_state = "idle"

var left_player_score = 0:
	set(value):
		left_player_score = value
		score_change.emit()
		if value == 10:
			left_player_won.emit()

var right_player_score = 0:
	set(value):
		right_player_score = value
		score_change.emit()
		if value == 10:
			right_player_won.emit()
