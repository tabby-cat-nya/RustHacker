extends Control

@export var days_left : int = 6
@export var time_left : int = 200
var starting_time : int = 200
@export var bar : TextureProgressBar
@export var timer_text : Label
@export var days_text : Label
@export var next_button : Button

signal new_day

@export var current_target_label : Label
@export var power_bar : TextureProgressBar
@export var next_target_label : Label
@export var levels : Array[HackLevel]
var ending_text : String

var power_vis : float = 0

@export var accumlate_labebl :Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	bar.value = (starting_time-time_left)/float(starting_time)
	timer_text.text = str(time_left)
	days_text.text = str(days_left)
	next_button.disabled = time_left > 10
	if days_left <= 0:
		next_button.text = "End Game"
	else: 
		next_button.text = "Proceed to next day ->"
	update_power()
	
	if PlayerInventory.botnet_servers < power_vis:
		power_vis = PlayerInventory.botnet_servers
	else:
		power_vis = clampf(power_vis + (delta * 5),0,PlayerInventory.botnet_servers)  

func has_time(time : float) -> bool:
	return time_left >= time

func use_time(time : float):
	time_left -= time


func _on_next_day_pressed() -> void:
	
	if days_left >= 1:
		accumulate_botnet()
		days_left -= 1
		time_left = 200
		new_day.emit()
	elif days_left == 0:
		accumulate_botnet()
		days_left = -1
	else:
		get_tree().change_scene_to_file("res://scenes/ending.tscn")
		PlayerInventory.hide()
		Clock.hide()
		Locations.hide()
		pass

func accumulate_botnet():
	for slot in PlayerInventory.inventory_panel.slots:
		if slot.item:
			PlayerInventory.botnet_servers += slot.item.botnet_power

func update_power():
	var active_power : int = 0
	for slot in PlayerInventory.inventory_panel.slots:
		if slot.item:
			active_power += slot.item.botnet_power
	accumlate_labebl.text = "+" + str(active_power) + " next day"
	
	var current_level : HackLevel
	var next_level : HackLevel
	for x in range(levels.size()):
		if levels[x].power <= power_vis:
			current_level = levels[x]
			if x < levels.size()-1:
				next_level = levels[x+1]
			else:
				next_level = current_level
	power_bar.min_value = current_level.power
	power_bar.max_value = next_level.power
	power_bar.value = power_vis
	power_bar.self_modulate = next_level.color
	next_target_label.text = str(round((next_level.power-power_vis)*10)/10) + " to next target"
	current_target_label.text = current_level.name
	if power_vis >= next_level.power:
		next_target_label.text = "Max Hacking Level"
	ending_text = current_level.ending_text
