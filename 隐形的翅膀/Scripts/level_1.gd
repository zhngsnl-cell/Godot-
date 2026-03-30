extends Node
@onready var tile_map_layer: TileMapLayer = $TileMapLayer


func _ready()->void:
	await get_tree().process_frame   # 等待一帧，让资源稳定
	# 现在安全地访问 tilemap
	if tile_map_layer:
		print("tilemap 已就绪，格子数：", tile_map_layer.get_used_cells().size())
