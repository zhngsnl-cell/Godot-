extends Node
class_name State

# 类型声明：状态机引用，将在状态机中赋值
var state_machine: StateMachine = null
# 角色节点的引用，可根据实际类型调整（例如 CharacterBody2D）

var colliding:bool = false
var jump_time:float = 0.0
var jump_max_time:float = 0.25
var max_speed:float = 75.0
var fallen_speed:float = 10.0

@export var character: CharacterBody2D = null
@export var animated_sprite_2d: AnimatedSprite2D = null

func walk(delta:float)->void:
	var direction: float = Input.get_axis("key_left", "key_right")
	if direction != 0:
		character.velocity.x += direction * 20.0
		if character.velocity.x >= max_speed:
			character.velocity.x = max_speed
		elif character.velocity.x <= -max_speed:
			character.velocity.x = -max_speed
		else:
			pass
	else:
		character.velocity.x = move_toward(character.velocity.x,0,delta * 1000.0)

func turn()->void:
	if character.velocity.x > 0:
		animated_sprite_2d.scale.x = 1.0
	elif character.velocity.x < 0:
		animated_sprite_2d.scale.x = -1.0
	else:
		pass

func _ready() -> void:
	# 获取拥有状态机的角色节点（假设状态机是角色的子节点）
	# 这里使用 get_parent().get_parent() 可根据实际场景调整
	# 如果未手动指定，则尝试自动获取
	if not character:
		character = get_parent().get_parent() as CharacterBody2D
	if not animated_sprite_2d:
		animated_sprite_2d = character.get_node("AnimatedSprite2D") as AnimatedSprite2D

#进入状态，相当于ready
func enter() -> void:
	pass

#退出状态，清理数据垃圾
func exit() -> void:
	pass

#相当于process
func update(_delta: float) -> void:
	pass

#相当于physics_process
func physics_update(_delta: float) -> void:
	pass

#相当于input
func handle_input(_event: InputEvent) -> void:
	pass
