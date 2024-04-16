extends Area2D


const COIN = preload("res://scenes/coin.tscn")

var coins := 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.is_in_group("player") and coins > 0:
		coins -= 1
		body.add_coin()
		add_child(COIN.instantiate())
		
		






func _on_timer_timeout():
	COIN.queue_free()
