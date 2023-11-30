extends CanvasLayer

@onready var left_player_score_label: Label = $LeftPlayerScore
@onready var right_player_score_label: Label = $RightPlayerScore


func _ready():
	Globals.connect("score_change", update_score_text)


func update_score_text():
	left_player_score_label.text = str(Globals.left_player_score)
	right_player_score_label.text = str(Globals.right_player_score)
