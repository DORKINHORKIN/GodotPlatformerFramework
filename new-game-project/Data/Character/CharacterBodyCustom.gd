class_name CharacterBodyCustom
extends CharacterBody2D

var airtime := 0.0
var onGround = false
var up = Vector2.UP

func Process(delta := 0.0) -> void:
	onGround = is_on_floor()
	airtime = airtime + delta
	
	move_and_slide()
	pass

func Gravity(vector := Vector2()) -> void:
	velocity += vector

func CoyoteGround(coyoteTime) -> bool:
	return airtime <= coyoteTime



func Jump(force, coyoteTime) -> void:
	velocity.y = -force
	airtime = coyoteTime
	pass

func Move(direction, speed_min, speed_max, acceleration) -> void:
	var hvel = velocity.x
	var target_speed = clamp(abs(hvel), speed_min, speed_max) * direction
	hvel = move_toward(hvel, target_speed, acceleration)
	velocity.x = hvel
	pass
