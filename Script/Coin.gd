extends Area2D



func _on_Coin_body_entered(body):
	print(body.name)
	if( body.name == "Dino" ):
		queue_free()
		
