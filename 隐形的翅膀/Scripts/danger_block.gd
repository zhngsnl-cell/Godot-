extends Area2D

func get_spawn_position()->Vector2:
	var spawnpoint:Marker2D = get_parent().get_parent().find_child("spawnpoint",
	true,false)
	if spawnpoint:
		print(spawnpoint.global_position)
		return spawnpoint.global_position
	else:
		print("can't find spawnpoint!")
		return Vector2.ZERO


func _on_body_entered(body: CharacterBody2D) -> void:
	
	body.spawn_position(get_spawn_position())
	print(body.global_position)
