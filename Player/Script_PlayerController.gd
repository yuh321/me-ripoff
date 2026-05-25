extends Node
class_name PlayerController

@export var target : Player

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		mouse_input(event.relative * 0.001)

func _physics_process(_delta: float) -> void:
	movement_input()

func movement_input() -> void:
	target.accelerate(Input.get_vector("MoveLeft", "MoveRight", "MoveUp", "MoveDown").rotated(-target.head.rotation.y))

func mouse_input(input : Vector2) -> void:
	target.head.rotation.x -= input.y
	target.head.rotation.y -= input.x
	
	target.head.rotation.x = clamp(target.head.rotation.x, -1.4, 1.6)
