extends Area2D

var has_scene:bool = false
var level_scene1:PackedScene = load("res://levels/level_1.tscn")
var level_scene2:PackedScene = load("res://levels/level_2.tscn")
var level_scene3:PackedScene = load("res://levels/level_3.tscn")
var level_scene4:PackedScene = load("res://levels/level_4.tscn")

enum Level{
	level1 = 1,
	level2,
	level3,
	level4,
	level5,
}

var level_dictionary:Dictionary = {
	Level.level1:level_scene1,
	Level.level2:level_scene2,
	Level.level3:level_scene3,
	Level.level4:level_scene4,
}

func change_scene()->bool:
	var the_scene:PackedScene = level_dictionary.get(GlobalScript.level_value)
	print(the_scene)
	print(GlobalScript.level_value)
	has_scene = get_tree().change_scene_to_packed(the_scene)
	return has_scene

func _on_body_entered(body: CharacterBody2D) -> void:
	print(body.get_class())
	if body.is_in_group("player"):
		
		print("player entered!")
		call_deferred("change_scene")
		GlobalScript.level_value += 1
