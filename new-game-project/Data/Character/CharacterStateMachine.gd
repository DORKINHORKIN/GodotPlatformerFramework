class_name CharacterStateMachine
extends Node

@export_node_path var initial_state_path : NodePath


var agent : Character
var state_current : CharacterStateStand
var state_previous : Node
var state_time := 0.0

func Start() -> void:
	SetState($Stand)
	pass

func Process(delta := 0.0) -> void:
	state_time += delta
	if state_current: state_current.Process(delta)
	pass

func SetState(_state) -> void:
	if _state is NodePath or _state is String: 
		_state = get_node(NodePath(_state))
	if _state is CharacterStateStand:
		state_previous = state_current
		if state_current: 
			state_current.End()
		
		state_time = 0.0
		state_current = _state
		state_current.agent = agent
		state_current.Start()
		pass
	pass
