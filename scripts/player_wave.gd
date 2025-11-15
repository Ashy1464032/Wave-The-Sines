class_name player extends Line2D

var amplitude: int = 25
var frequency: float = 0.2
var varPoints = 1000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func decreaseAmp():
	amplitude = clamp(amplitude-1,1,50)
	queue_redraw()
func increaseAmp():
	amplitude = clamp(amplitude+1,1,50)
	queue_redraw()
func increaseFreq():
	frequency = clamp(frequency+0.01,0.1,0.5)
	queue_redraw()
func decreaseFreq():
	frequency = clamp(frequency-0.01,0.1,0.5)
	queue_redraw()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func _draw() -> void:
	var step = 2 * PI / varPoints
	var prev_point = Vector2(0, amplitude * sin(0))
	var hsf = get_viewport_rect().size.x / TAU
	
	for i in range(1, varPoints):
		var x = ((i * step) * (hsf + 50)) - 50
		var y = (amplitude * sin(x * frequency)) + 300
		var current_point = Vector2(x, y)
		draw_line(prev_point, current_point, default_color, width)
		prev_point = current_point  
