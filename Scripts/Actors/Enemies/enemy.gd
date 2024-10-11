class_name Enemy extends CharacterBody2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

@export var Speed:float = 80

func _physics_process(delta: float) -> void:
	velocity.y = Speed;
	move_and_slide()

func detroy_enemy()-> void:
	animated_sprite.play("Explode")

func _on_animation_finished() -> void:
	queue_free()


func _on_hit_box_body_entered(body: Node2D) -> void:
	(body as Player).hurt()
	detroy_enemy()
