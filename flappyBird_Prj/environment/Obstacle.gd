extends Node2D

signal score

onready var point = $Point
onready var coin = $ScoreArea/Coin

const SPEED = 216

func _physics_process(delta):
	position.x += -SPEED*delta
	if global_position.x <= -200:
		queue_free()


func _on_Pipe_body_entered(body:Node):
	if body is Player:
		if body.has_method("die"):
			body.die()


func _on_ScoreArea_body_exited(body:Node):
	if body is Player:
		coin.visible = false
		point.play()
		emit_signal("score")
