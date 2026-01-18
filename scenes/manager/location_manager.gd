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

signal moved
@export var ewaste_bubble : Label
@export var workshop_bubble : Label
@export var room_bubble : Label

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
	#move_blocker_panel.visible = block_moving
	
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
	moved.emit()
	#get_tree().change_scene_to_file("res://scenes/ewaste.tscn")

func goto_workshop():
	selection_indicator.reparent(workshop_button)
	selection_indicator.position = Vector2(0,0)
	#if current_location == Location.workshop:
		#return
	current_location = Location.workshop
	moved.emit()
	#get_tree().change_scene_to_file("res://scenes/workshop.tscn")

func goto_room():
	selection_indicator.reparent(room_button)
	selection_indicator.position = Vector2(0,0)
	if current_location == Location.room:
		return
	current_location = Location.room
	moved.emit()
	#get_tree().change_scene_to_file("res://scenes/room.tscn")

var filled_loot : int = 0
var filled_crafting : int = 0
var filled_trash : int = 0
var filled_sell : int = 0
var filled_install : int = 0
func reset_bubbles():
	filled_loot = 0
	filled_crafting = 0
	filled_trash = 0
	filled_sell = 0
	filled_install = 0

func update_bubbles(inventory : String, slots_filled : int):
	match inventory:
		"Loot":
			filled_loot = slots_filled
		"Crafting":
			filled_crafting = slots_filled
		"Trash":
			filled_trash = slots_filled
		"Sell":
			filled_sell = slots_filled
		"Install":
			filled_install = slots_filled
	
	ewaste_bubble.text = str(filled_loot)
	workshop_bubble.text = str(filled_crafting + filled_trash)
	room_bubble.text = str(filled_sell + filled_install)
	
	ewaste_bubble.get_parent().visible = filled_loot > 0
	workshop_bubble.get_parent().visible = filled_crafting + filled_trash > 0
	room_bubble.get_parent().visible = filled_sell + filled_install > 0
	
	pass
