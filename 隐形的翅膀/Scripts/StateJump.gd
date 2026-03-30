extends State

var can_jump:bool = true

#func can_jump(delta:float)->bool:
	#jump_time += delta
	#if jump_time >= jump_max_time:
		#jump_time = 0.0
		#return false
	#else:
		#return true

func enter()->void:
	print("state:jump")
	animated_sprite_2d.play("idle")
	jump_time = 0.0

func exit()->void:
	pass

func update(delta:float)->void:
	
	if Input.is_action_just_released("key_up"):
		state_machine.change_state("fall")
	else:
		pass

func physics_update(delta:float)->void:
	
	walk(delta)
	
	turn()
	
	if Input.is_action_pressed("key_up"):
		if can_jump:
			character.velocity.y = -150.0
			jump_time += delta
			if jump_time >= jump_max_time:
				state_machine.change_state("fall")
				jump_time = 0.0
	
	colliding = character.move_and_slide()

func handle_input(event:InputEvent)->void:
	pass
