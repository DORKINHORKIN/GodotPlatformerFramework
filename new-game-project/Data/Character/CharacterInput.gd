class_name CharacterInput
extends Node

func axis_move() -> float:
	return Input.get_axis("move_left", "move_right")
	
func jump(check_just_pressed = false) -> bool:
	if check_just_pressed: 
		return Input.is_action_just_pressed("jump")
	return Input.is_action_pressed("jump")

func attack(check_just_pressed = false) -> bool:
	if check_just_pressed: 
		return Input.is_action_just_pressed("attack")
	return Input.is_action_pressed("attack")
