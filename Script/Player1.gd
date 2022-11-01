extends KinematicBody2D

var y_velo = 0
const MOVE_SPEED = 200
const GRAVIT = 50

const JUMP_FORCE = 1000
const MAX_FALL_SPEED = 500


func _physics_process(delta):
	var move_dir = 0
	
	# Ele está no chão?
	var grounded = is_on_floor()
	var var_base = $RayCast2D.is_colliding()
	
	# Direção (Direita ou esquerda)
	if Input.is_action_pressed("ui_right"):
		# move_dir = move_dir + 1
		move_dir += 1
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.animation = "walk"

	elif Input.is_action_pressed("ui_left"):
		move_dir -= 1
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.animation = "walk"
	else:
		$AnimatedSprite.animation = "idle"	
	
	# Verificar o JUMP e Gravidade
	
	print($AnimatedSprite.animation)
	
	# Verificar se está no chão e se o JUMP foi pressionado.
	if grounded and Input.is_action_pressed("jump"):
		y_velo = - JUMP_FORCE
	
	# Incrementar a força da gravidade (Eixo Y)
	y_velo += GRAVIT
	
	if grounded and y_velo >= 0:
		y_velo = 5
	
	if y_velo > MAX_FALL_SPEED:
		y_velo = MAX_FALL_SPEED

	move_and_slide(Vector2(move_dir * MOVE_SPEED, y_velo), Vector2(0,-1))
