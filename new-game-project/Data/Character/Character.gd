class_name Character
extends Node2D


@onready var input : CharacterInput = $Input
@onready var state_machine : CharacterStateMachine = $StateMachine
@onready var animation_player = $AnimationPlayer
@onready var character_body : CharacterBodyCustom = $CharacterBody2D


func _ready() -> void:
	state_machine.agent = self
	state_machine.Start()
	pass


func _physics_process(delta: float) -> void:
	state_machine.Process(delta)
	character_body.Process(delta)
	pass
