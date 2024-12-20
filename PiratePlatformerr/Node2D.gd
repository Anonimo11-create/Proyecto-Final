extends CharacterBody2D

var direction = 1

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	
	velocity.y += gravity * delta

	# Handle jump.


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	
	velocity.x = direction * SPEED * delta 
	
	if is_on_wall() and direction == -1:
		direction = 1
	elif  is_on_wall() and direction == 1:
		direction = -1
	
	
	move_and_slide()
