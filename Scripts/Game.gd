extends Node

var p1 = null
var p2 = null
var speed = 500
var bullet_scene = preload("res://Bullet.tscn")

func _ready():
	p1 = $Player
	p2 = $Player2
	
func _process(delta):
	if Input.is_action_pressed("player1_fire"):
		var bullet_node = bullet_scene.instance()
		bullet_node.direction = 0
		bullet_node.position = p1.position
		add_child(bullet_node)
	if Input.is_action_pressed("player2_fire"):
		var bullet_node = bullet_scene.instance()
		bullet_node.direction = 1
		bullet_node.position = p2.position
		add_child(bullet_node)

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