extends CharacterBody2D
class_name  Ball

var speed = 0
var acceleration = 1.02

var direction = Vector2.ZERO
var isMoving = false

func resetBall():
	speed = 450
	direction.x = [1, -1][randi() % 2]
	direction.y = [0.8, -0.8][randi() % 2]
	isMoving = true

func _ready():
	randomize()
	resetBall()

	

func _physics_process(delta):
	#var angularSpeed = PI/4
	if isMoving:
		var collide = move_and_collide(direction * speed * delta)
		#rotation += angularSpeed * delta
		if collide:
			speed = speed * acceleration
			direction = direction.bounce(collide.get_normal())
			var collider = collide.get_collider()
			if collider is Player or collider is Rival:
				$Bounce.play()


func _on_restart_timer_timeout():
	resetBall()
