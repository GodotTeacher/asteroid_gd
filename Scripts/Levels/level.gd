extends Node2D
@export var Enemy_scenes:Array[PackedScene]



func _on_spawn_timer_timeout() -> void:	
	var screen_width:float = get_viewport_rect().size.x
	var pos_x:float = randf_range(0,screen_width)
	var index:int = randi_range(0,Enemy_scenes.size()-1)
	var  new_enemy:Enemy = Enemy_scenes[index].instantiate()
	new_enemy.position = Vector2(pos_x,-30)
	add_child(new_enemy)
	
