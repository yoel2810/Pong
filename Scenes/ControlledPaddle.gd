extends Paddle


func move_paddle(delta):
	# If I want to support resizing the window, I need to update the screen_height
	# screen_height = get_viewport_rect().size.y
	var up: bool = Input.is_action_pressed("up")
	var down: bool = Input.is_action_pressed("down")

	if up:
		move_up(delta)
	if down:
		move_down(delta)
