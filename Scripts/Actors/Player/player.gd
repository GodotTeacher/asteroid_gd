class_name Player extends CharacterBody2D

#const SPEED:float = 130
@export var Speed:float = 130;

var direction:float = 0

func _input(event: InputEvent) -> void:
	direction = Input.get_axis("move_left","move_right")
	print(direction)

func _physics_process(delta: float) -> void:
	velocity.x = Speed * direction
	move_and_slide()
