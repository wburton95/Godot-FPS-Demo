extends KinematicBody

var FOWARD = 200
var MOVEMENT = 200
var JUMP = Vector3(0,100,0)
var RUN_SPEED = 300

var mouse_threshold = 10
var mouse_sens_dampened = 0.001
var mouse_sens = 0.01
var mouse_acceleration = 0.1

func _ready():

	pass

func _physics_process(delta):
	
	
	#Close window/ end test.

	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()

	#Gravity and slope.

	move_and_slide(Vector3(0,-6,0),Vector3(0,1,0))

	#Jump.

	if is_on_floor() and Input.is_key_pressed(KEY_SPACE):
		move_and_slide(JUMP)


	#Get viewport.

	var viewcoords = get_viewport().size
	var center_x = viewcoords.x / 2
	var center_y = viewcoords.y / 2
	var mouse_pos = get_viewport().get_mouse_position()

	#Warp mouse to center.

	get_viewport().warp_mouse(Vector2(center_x,center_y))

	#Mouselook on X axis.

	if mouse_pos.x <= center_x:
		rotate_y(mouse_sens_dampened + delta)
	if mouse_pos.x <= center_x + mouse_threshold:
		rotate_y(mouse_sens + delta)
	if mouse_pos.x <= center_x + mouse_threshold * 2:
		rotate_y(mouse_acceleration + delta)

	if mouse_pos.x >= center_x:
		rotate_y(-mouse_sens_dampened - delta)
	if mouse_pos.x >= center_x - mouse_threshold:
		rotate_y(-mouse_sens - delta)
	if mouse_pos.x >= center_x - mouse_threshold * 2:
		rotate_y(-mouse_acceleration - delta)

	#Local move and run.

	if Input.is_key_pressed(KEY_SHIFT) and Input.is_key_pressed(KEY_W):
		move_and_slide(transform.basis.z * delta * RUN_SPEED)

	if Input.is_key_pressed(KEY_W):
		move_and_slide(transform.basis.z * delta * FOWARD)
	if Input.is_key_pressed(KEY_A):
		move_and_slide(transform.basis.x * delta * MOVEMENT)
	if Input.is_key_pressed(KEY_S):
		move_and_slide(transform.basis.z * delta * -MOVEMENT)
	if Input.is_key_pressed(KEY_D):
		move_and_slide(transform.basis.x * delta * -MOVEMENT)

	pass