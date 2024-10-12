class_name Enemy extends CharacterBody2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var explode_sound: AudioStreamPlayer2D = $ExplodeSound

@export var Speed:float = 80

signal on_enemy_destroyed(enemy : Enemy)

func _physics_process(delta: float) -> void:
	velocity.y = Speed;
	move_and_slide()

func detroy_enemy()-> void:
	explode_sound.play()
	animated_sprite.play("Explode")
	# signal que je suis detruit
	on_enemy_destroyed.emit(self)

func _on_animation_finished() -> void:
	queue_free()


func _on_hit_box_body_entered(body: Node2D) -> void:
	(body as Player).hurt()
	detroy_enemy()


func _on_visible_on_screen_exited() -> void:
	queue_free()
