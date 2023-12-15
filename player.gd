extends CharacterBody2D
class_name Player

const SPEED = 300.0


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction1 = Input.get_axis("ui_left", "ui_right")
	var direction2 = Input.get_axis("ui_up", "ui_down")
	var direction = direction1 + direction2

	if direction < 0:
		direction = -1
	elif direction > 0:
		direction = 1
	else:
		direction = 0

	velocity.y = direction * SPEED

	#If velocity x =! 0, then put it to 0
	if velocity.x != 0 or position.x != 40:
		velocity.x = 0
		position.x = 40

	# Move the character.
	move_and_slide()
