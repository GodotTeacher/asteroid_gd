class_name Laser extends Area2D
@export var Speed:float = 150
func _physics_process(delta: float) -> void:
	position.y -= Speed * delta

func _on_laser_screen_exited() -> void:
	queue_free()
