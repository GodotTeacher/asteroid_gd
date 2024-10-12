extends Node2D
@export var Enemy_scenes:Array[PackedScene]
@export var Player:Player
@export var Spawn_timer:Timer

@onready var enemies_container: Node2D = $EnemiesContainer



var score : int = 0

func _ready() -> void:
	Player.On_player_died.connect(_on_player_died)

func _on_spawn_timer_timeout() -> void:	
	var screen_width:float = get_viewport_rect().size.x
	var pos_x:float = randf_range(0,screen_width)
	var index:int = randi_range(0,Enemy_scenes.size()-1)
	var  new_enemy:Enemy = Enemy_scenes[index].instantiate()
	new_enemy.on_enemy_destroyed.connect(_on_enemy_destroyed)
	new_enemy.position = Vector2(pos_x,-30)
	enemies_container.add_child(new_enemy)

func _on_enemy_destroyed(enemy : Enemy)-> void:
	score += 1
	print("New score "+str(score))	
	
func _on_player_died(player: Player):
	Spawn_timer.stop()
	for e in enemies_container.get_children():
		e.set_physics_process(false)
	  
	print("Player died")
