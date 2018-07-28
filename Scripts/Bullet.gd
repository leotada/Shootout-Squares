extends Area2D

var direction = 0
export var speed = 1000

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if direction == 0:
		move_local_x(speed * delta)
	else:
		move_local_x(-speed * delta)