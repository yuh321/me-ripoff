extends RigidBody3D
class_name Player

@export var head : Node3D

var movement_speed : float = 4.0

func _physics_process(_delta: float) -> void:
	update_grounded_state()


func accelerate(input : Vector2) -> void:
	input = (input * movement_speed)
	
	linear_velocity.x = input.x
	linear_velocity.z = input.y


func update_grounded_state() -> void:
	return(test_move(transform, Vector3.DOWN * 0.05))
