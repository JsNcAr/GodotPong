extends CharacterBody2D
class_name Rival

@onready var ball = get_parent().get_node("Ball")
var speed = 250


func _getDirection():
	if ball.position.y - position.y > 20 + 80:
		return 1
	elif ball.position.y - position.y < (-20 + 80):
		return -1
	else:
		return 0


func _physics_process(delta):
	var direction = Vector2(0, _getDirection())
	velocity.y = direction.y * speed
	if velocity.x != 0 or position.x != 1240:
		velocity.x = 0
		position.x = 1240
	move_and_slide()
