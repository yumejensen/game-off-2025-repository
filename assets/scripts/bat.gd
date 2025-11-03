extends CharacterBody2D

# movement speed
@export var speed = 800

# function to receive input - 8 way movement
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

# set a variable for the animated sprite (got by holding control and drag)	
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
	
func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
	
	# set a variable to get right or left 
	var direction = Input.get_axis("left", "right")
	# flip the sprite left or right based on direction
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
