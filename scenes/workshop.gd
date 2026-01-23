extends Control

@export var ewaste_button : Button
@export var computer_button : Button
@export var crafting_inv : Inventory
@export var trash_inv : Inventory

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Locations.block_moving = crafting_inv.filled_slots() > 0 or trash_inv.filled_slots() > 0
	
	#if crafting_inv.filled_slots() > 0:
		#ewaste_button.disabled = true
		#computer_button.disabled = true
	#else:
		#ewaste_button.disabled = false
		#computer_button.disabled = false


func _on_goto_ewaste_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/ewaste.tscn")


func _on_goto_computer_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/room.tscn")
