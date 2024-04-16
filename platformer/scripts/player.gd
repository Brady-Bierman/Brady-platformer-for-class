extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -530.0

@onready var ap = $AnimationPlayer
@onready var player_base_sprite = $player_base_sprite
@onready var player_base_colision = $player_base_colision
@onready var lives_dis = $Camera2D/CanvasLayer/lives_dis
@onready var coins_dis = $Camera2D/CanvasLayer/coins_dis
@onready var barrel = $barrel



const BULLET = preload("res://scenes/bullet.tscn")
const player_base_hitbox = preload("res://hitboxes/player_base_hitbox.tres")
const suit_hitbox = preload("res://hitboxes/suit_hitbox.tres")


var suited := false
var lives := 3
var coins := 0
var right := true

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _ready():
	lives_dis.text = "Lives: " + str(lives)
	coins_dis.text = "Coins: " + str(coins)
	



func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("backward", "forward")
	if direction:
		velocity.x = direction * SPEED
		player_base_sprite.flip_h = (direction == -1)
		right = (direction != -1)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if Input.is_action_just_pressed("down"):
		mech_up()
	elif Input.is_action_just_released("down"):
		un_mech()
	
	
	if Input.is_action_just_pressed("attack"):
		shoot()
	
	if right:
		barrel.position.x = 27
	if !right:
		barrel.position.x = -27
		
		
	
	move_and_slide()
	
	#end _physics_process









func mech_up():
	suited = true
	ap.play("suit")
	player_base_colision.shape = suit_hitbox
	player_base_colision.position.x = -3
	
	



func un_mech():
	suited = false
	ap.play("base_player")
	player_base_colision.shape = player_base_hitbox
	player_base_colision.position.x = 0
	




func add_coin():
	coins += 1
	coins_dis.text = "Coins: " + str(coins)
	
	
	

func hit():
	if suited:
		suited = false
		un_mech()
	else:
		restart_level()
	



func _on_death_body_entered(body):
	if body.is_in_group("player"):
		restart_level()
		
	
	
	
	

func restart_level():
	get_tree().reload_current_scene()
	lives -= 1
	lives_dis.text = "Lives: " + str(lives)
	


func shoot():
	var bullet = BULLET.instantiate()
	owner.add_child(bullet)
	bullet.transform = barrel.global_transform




