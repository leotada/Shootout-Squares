extends Area2D

var direction = 0
export var speed = 1000

func _ready():
	$Timer.start()

func _process(delta):
	if direction == 0:
		move_local_x(speed * delta)
	else:
		move_local_x(-speed * delta)
	if $Timer.time_left <= 0 and not is_queued_for_deletion():
		queue_free()  # self destroy

func _on_Bullet_body_entered(body):
	if "player_name" in body:
		if body.player_name == "Player1":
			get_tree().get_root().get_node("Game").player1_has_been_hit()
		if body.player_name == "Player2":
			get_tree().get_root().get_node("Game").player2_has_been_hit()
