extends Control

@export var days_left : int = 6
@export var time_left : int = 200
var starting_time : int = 200
@export var bar : TextureProgressBar
@export var timer_text : Label
@export var days_text : Label
@export var next_button : Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	bar.value = (starting_time-time_left)/float(starting_time)
	timer_text.text = str(time_left)
	days_text.text = str(days_left)
	next_button.disabled = time_left > 10
	if days_left == 0:
		next_button.text = "End Game"
	else: 
		next_button.text = "Proceed to next day ->"

func has_time(time : float) -> bool:
	return time_left >= time

func use_time(time : float):
	time_left -= time


func _on_next_day_pressed() -> void:
	if days_left >= 1:
		days_left -= 1
		time_left = 200
	else:
		get_tree().change_scene_to_file("res://scenes/ending.tscn")
		PlayerInventory.hide()
		Clock.hide()
		Locations.hide()
		pass
