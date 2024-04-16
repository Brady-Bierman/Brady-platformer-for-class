extends CharacterBody2D

@onready var ap = $AnimationPlayer
@onready var area_2d = $Area2D
@onready var timer = $Timer




func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		coin_collect()
		
		
	


func NOTIFICATION_SCENE_INSTANTIATED():
	coin_collect()
	
	

func coin_collect():
	ap.play("coin_get")
	timer.start()
	


func _on_timer_timeout():
	$".".queue_free()
