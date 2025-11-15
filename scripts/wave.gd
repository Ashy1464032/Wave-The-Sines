class_name Wave extends Line2D


var amplitude: int = randi_range(1,50)
var frequency: float = snapped(randf_range(0.1, 0.5), 0.01)
var varPoints = 1000

func _draw():
	var step = 2 * PI / varPoints
	var prev_point = Vector2(0, amplitude * sin(0))
	var hsf = get_viewport_rect().size.x / TAU
	
	for i in range(1, varPoints):
		var x = ((i * step) * (hsf + 50)) - 50
		var y = (amplitude * sin(x * frequency)) + 400
		var current_point = Vector2(x, y)
		draw_line(prev_point, current_point, default_color, width)
		prev_point = current_point
