extends RigidBody3D
class_name Player

@export var head : Node3D
#Config
var movement_speed : float = 4.0
var friction_multiplier : float = 0.1

const jump_multiplier : float = 4.0

#Internal
var grounded : bool = true

func _physics_process(_delta: float) -> void:
	update_grounded_state()

func accelerate(controller_input : Vector2) -> void:
	if !grounded: return
	
	var input : Vector3 = Vector3(controller_input.x, 0.0, controller_input.y)
	input *= movement_speed
	if !input:
		input = -linear_velocity * friction_multiplier
		input.y = 0.0
	
	linear_velocity += input
	if linear_velocity.length() > movement_speed:
		var overspeed : Vector3 = linear_velocity - (linear_velocity.normalized() * movement_speed)
		overspeed.y = 0.0
		linear_velocity -= overspeed

func update_grounded_state() -> void:
	grounded = test_move(transform, Vector3.DOWN * 0.05)

func jump() -> void:
	if !grounded: return
	linear_velocity += Vector3.UP * jump_multiplier
