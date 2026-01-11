extends Control

@export var days_left : float = 7
@export var time_left : int = 200
var starting_time : int = 200
@export var bar : TextureProgressBar
@export var timer_text : Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	bar.value = (starting_time-time_left)/float(starting_time)
	timer_text.text = str(time_left)

func has_time(time : float) -> bool:
	return time_left >= time

func use_time(time : float):
	time_left -= time
