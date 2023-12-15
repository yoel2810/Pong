extends CanvasLayer

@onready var left_player_score_label: Label = $LeftPlayerScore
@onready var right_player_score_label: Label = $RightPlayerScore
@onready var space_label: Label = $SpaceLabel
@onready var game_over_label: Label = $GameOverLabel


func _ready():
	Globals.connect("score_change", update_score_text)
	Globals.connect("left_player_won", left_player_won)
	Globals.connect("right_player_won", right_player_won)
	game_over_label.hide()


func _process(_delta):
	if Globals.game_state == "idle":
		space_label.show()
	if Input.is_action_just_pressed("start_game"):
		game_over_label.hide()
		space_label.hide()


func space_pressed_round_start():
	space_label.hide()


func left_player_won():
	game_over_label.show()
	game_over_label.text = "Left Player Won!"


func right_player_won():
	game_over_label.show()
	game_over_label.text = "Right Player Won!"


func update_score_text():
	left_player_score_label.text = str(Globals.left_player_score)
	right_player_score_label.text = str(Globals.right_player_score)
