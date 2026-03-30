extends State

func enter() -> void:
	animated_sprite_2d.play("idle")
	print("state:idle")

func physics_update(_delta: float) -> void:
	# 检查水平输入
	var direction: float = Input.get_axis("key_left", "key_right")
	if direction != 0:
		state_machine.change_state("walk")
	
	# 检查跳跃
	if Input.is_action_just_pressed("key_up") and character.is_on_floor():
		state_machine.change_state("jump")
	elif not character.is_on_floor():
		state_machine.change_state("fall")
	
