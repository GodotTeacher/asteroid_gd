class_name Player extends CharacterBody2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var marker_left: Marker2D = $MarkerLeft
@onready var marker_right: Marker2D = $MarkerRight


#const SPEED:float = 130
@export var Speed:float = 130;
@export var Laser_scene:PackedScene;

var direction:float = 0



@warning_ignore("unused_parameter")
func _input(event: InputEvent) -> void:
	direction = Input.get_axis("move_left","move_right")
	# animation du player
	if (direction < 0):
		animated_sprite.play("Fly_left")
	elif (direction > 0):
		animated_sprite.play("Fly_right")
	else :
		animated_sprite.play("Fly_forward")
		
	# pondre les lasers
	if(Input.is_action_just_pressed("shoot")):
		spawn_lasers()

@warning_ignore("unused_parameter")
func _physics_process(delta: float) -> void:
	velocity.x = Speed * direction
	move_and_slide()
	# Teleportation
	var screen_width:float = get_viewport_rect().size.x
	if(position.x < 0):
		# Translation du player a droite
		position.x = screen_width
	if(position.x > screen_width):
		# Translation du player a gauche
		position.x = 0
	
func spawn_lasers()->void:
	var laserL = Laser_scene.instantiate()
	var laserR = Laser_scene.instantiate()
	print("Laser LP "+str(marker_left.position))
	print("Laser GP "+str(marker_left.global_position))
	
	laserL.position = marker_left.global_position
	laserR.position = marker_right.global_position
	get_parent().add_child(laserL)
	get_parent().add_child(laserR)
