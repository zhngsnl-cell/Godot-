extends CharacterBody2D
class_name Player

func spawn_position(spawnpoint:Vector2)->void:
	set_physics_process(false)
	set_process(false)
	velocity = Vector2.ZERO
	global_position = spawnpoint
	set_physics_process(true)
	set_process(true)

func _ready() -> void:
	set_physics_interpolation_mode(Node.PHYSICS_INTERPOLATION_MODE_OFF)
