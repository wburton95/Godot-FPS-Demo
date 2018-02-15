extends Camera

var mouse_threshold = 10
var mouse_sens_dampened = 0.001
var mouse_sens = 0.01
var mouse_acceleration = 0.1

func _ready():
	
	
	pass

func _process(delta):
	
	#Get y viewport.

	var viewcoords = get_viewport().size
	var mouse_pos = get_viewport().get_mouse_position()
	var center_y = viewcoords.y / 2

	#Mouse look Y axis.
	
	if mouse_pos.y <= center_y:
		rotate_x(-mouse_sens_dampened - delta)
	if mouse_pos.y <= center_y + mouse_threshold:
		rotate_x(-mouse_sens - delta)
	if mouse_pos.y <= center_y + mouse_threshold * 2:
		rotate_x(-mouse_acceleration - delta)
		
	if mouse_pos.y >= center_y:
		rotate_x(mouse_sens_dampened + delta)
	if mouse_pos.y >= center_y - mouse_threshold:
		rotate_x(mouse_sens + delta)
	if mouse_pos.y >= center_y - mouse_threshold * 2:
		rotate_x(mouse_acceleration + delta)
		
	pass
