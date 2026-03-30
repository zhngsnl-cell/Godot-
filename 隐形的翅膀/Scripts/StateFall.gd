extends State

func enter() -> void:
	pass

#退出状态，清理数据垃圾
func exit() -> void:
	pass

#相当于process
func update(_delta: float) -> void:
	
	if Input.is_action_just_pressed("key_up"):
		state_machine.change_state("fly")
	elif character.is_on_floor():
		state_machine.change_state("walk")


#相当于physics_process
func physics_update(delta: float) -> void:
	
	walk(delta)
	turn()
	
	character.velocity.y += 10.0
	
	if character.velocity.y >= 100.0:
		character.velocity.y = 100.0
	else:
		pass
	
	colliding = character.move_and_slide()
	

#相当于input
func handle_input(_event: InputEvent) -> void:
	pass
