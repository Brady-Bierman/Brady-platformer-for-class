extends Area2D


const suit_box = preload("res://scenes/suit_box.tscn")

var spawned := false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.is_in_group("player") and !spawned:
		spawned = true
		add_child(suit_box.instantiate())
		
		
	
	




