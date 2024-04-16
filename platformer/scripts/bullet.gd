extends RigidBody2D


var speed := 200



# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_area_2d_body_entered(body):
	if body.is_in_group("mob"):
		body.queue_free()
		queue_free()
		
	
	
	


func _on_timer_timeout():
	queue_free()
	




