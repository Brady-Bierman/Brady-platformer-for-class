extends CharacterBody2D


const SPEED = 100.0

@onready var detect_wall_right = $detect_wall_right
@onready var detect_wall_left = $detect_wall_left
@onready var death = $death

var move_right := false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if detect_wall_right.is_colliding():
		move_right = false
	elif detect_wall_left.is_colliding():
		move_right = true
	
	
	
	if move_right:
		velocity.x = 1 * SPEED
	elif !move_right:
		velocity.x = -1 * SPEED
	
	
	move_and_slide()
	
	
	




func _on_kill_body_entered(body):
	if body.is_in_group("player"):
		body.mech_up()
		$".".queue_free()
	
	






