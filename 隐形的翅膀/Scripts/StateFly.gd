extends State

func enter()->void:
	print("state:fly")
	animated_sprite_2d.play("fly")
	
	if character.velocity.y < 0.0:
		character.set_physics_process(false)
		character.set_process(false)
		character.velocity.y = 0.0
		character.set_physics_process(true)
		character.set_process(true)

func exit()->void:
	pass

func update(delta:float)->void:
	if Input.is_action_just_released("key_up"):
		state_machine.change_state("fall")
	elif character.is_on_floor():
		state_machine.change_state("walk")
	else:
		pass

func physics_update(delta:float)->void:
	
	walk(delta)
	turn()
	
	character.velocity.y += 0.5
	
	if character.velocity.y >= fallen_speed:
		character.velocity.y = fallen_speed
	
	colliding = character.move_and_slide()

func handle_input(event:InputEvent)->void:
	pass
