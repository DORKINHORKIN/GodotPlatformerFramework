class_name CharacterStateStand
extends Node


@export var speed_min : float = 500.0
@export var speed_max : float = 1000.0
@export var acceleration : float = 100.0

@export var gravity : float = 100.0
@export var coyoteTime : float = 0.2
@export var jumpForce : float = 450


var agent : Character

func Start() -> void:
	
	pass

func Process(delta := 0.0) -> void:
	var body = agent.character_body
	var input = agent.input
	body.Move(agent.input.axis_move(), speed_min, speed_max, acceleration * delta)
	
	if body.onGround:
		body.airtime = 0.0
	else: 
		body.Gravity(Vector2.DOWN * gravity * delta)
		
	if body.CoyoteGround(coyoteTime):
		if input.jump(true): body.Jump(jumpForce, coyoteTime)
	pass

func End() -> void:
	
	pass
