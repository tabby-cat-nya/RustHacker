extends Control

var block_moving = false
@export var normal_color : Color
@export var selected_color : Color
@export var ewaste_button : Button
@export var workshop_button: Button
@export var room_button : Button
var current_location : Location
@export var move_blocker_panel : PanelContainer
@export var selection_indicator : Panel

enum Location{
	ewaste,
	workshop,
	room
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	current_location = Location.workshop
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_blocker_panel.visible = block_moving
	
	if current_location == Location.ewaste:
		ewaste_button.self_modulate = selected_color
	else:
		ewaste_button.self_modulate = normal_color
	
	if current_location == Location.workshop:
		workshop_button.self_modulate = selected_color
	else:
		workshop_button.self_modulate = normal_color
	
	if current_location == Location.room:
		room_button.self_modulate = selected_color
	else:
		room_button.self_modulate = normal_color

func goto_ewaste():
	selection_indicator.reparent(ewaste_button)
	selection_indicator.position = Vector2(0,0)
	if current_location == Location.ewaste:
		return
	current_location = Location.ewaste
	get_tree().change_scene_to_file("res://scenes/ewaste.tscn")

func goto_workshop():
	selection_indicator.reparent(workshop_button)
	selection_indicator.position = Vector2(0,0)
	#if current_location == Location.workshop:
		#return
	current_location = Location.workshop
	get_tree().change_scene_to_file("res://scenes/workshop.tscn")

func goto_room():
	selection_indicator.reparent(room_button)
	selection_indicator.position = Vector2(0,0)
	if current_location == Location.room:
		return
	current_location = Location.room
	get_tree().change_scene_to_file("res://scenes/room.tscn")
