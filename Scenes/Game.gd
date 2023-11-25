extends Node2D


func _process(delta):
	var ball_position: Vector2 = $Ball.position
	var paddle_bot_position: Vector2 = $PaddleBot.position

	if ball_position.y < paddle_bot_position.y:
		$PaddleBot.move_up(delta)
	elif ball_position.y > paddle_bot_position.y:
		$PaddleBot.move_down(delta)
