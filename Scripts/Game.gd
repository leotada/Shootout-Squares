extends Node

var p1 = null
var p2 = null
var speed = 500
var p1_points = 0
var p2_points = 0
var bullet_scene = preload("res://Bullet.tscn")

func _ready():
	p1 = $Player
	p2 = $Player2

func _process(delta):
	if Input.is_action_pressed("player1_fire") and $TimerP1.time_left == 0:
		_spawn_bullet(0, p1.position + Vector2(45, 0))  # offset
		$TimerP1.start()
	if Input.is_action_pressed("player2_fire") and $TimerP2.time_left == 0:
		_spawn_bullet(1, p2.position - Vector2(45, 0))  # offset
		$TimerP2.start()

func _physics_process(delta):
	# Player 1
	if Input.is_action_pressed("player1_down"):
		p1.move_and_slide(Vector2(0, speed))
	elif Input.is_action_pressed("player1_up"):
		p1.move_and_slide(Vector2(0, -speed))
	# Player 2
	if Input.is_action_pressed("player2_down"):
		p2.move_and_slide(Vector2(0, speed))
	elif Input.is_action_pressed("player2_up"):
		p2.move_and_slide(Vector2(0, -speed))
		
func _spawn_bullet(direction, position):
	var bullet_node = bullet_scene.instance()
	bullet_node.direction = direction
	bullet_node.position = position
	add_child(bullet_node)

func player1_has_been_hit():
	p2_points += 1
	get_node("HUD/Label2").text = str(p2_points)

func player2_has_been_hit():
	p1_points += 1
	get_node("HUD/Label").text = str(p1_points)