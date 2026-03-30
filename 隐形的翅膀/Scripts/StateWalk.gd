extends State

func enter() -> void:
	animated_sprite_2d.play("idle")
	print("state:walk")

func physics_update(delta: float) -> void:
	# 检查水平输入
	walk(delta)
	
	turn()
	
	colliding = character.move_and_slide()
	
	if character.velocity.x == 0:
		state_machine.change_state("idle")
	
	if Input.is_action_just_pressed("key_up") and character.is_on_floor():
		state_machine.change_state("jump")
	elif not character.is_on_floor():
		state_machine.change_state("fall")
	else:
		pass
