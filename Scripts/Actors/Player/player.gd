class_name Player extends CharacterBody2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


#const SPEED:float = 130
@export var Speed:float = 130;

var direction:float = 0

func _input(event: InputEvent) -> void:
	direction = Input.get_axis("move_left","move_right")
	# animation du player
	if (direction < 0):
		animated_sprite.play("Fly_left")
	elif (direction > 0):
		animated_sprite.play("Fly_right")
	else :
		animated_sprite.play("Fly_forward")

func _physics_process(delta: float) -> void:
	velocity.x = Speed * direction
	move_and_slide()
