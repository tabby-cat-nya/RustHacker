extends Control

@export var sell_panel : Inventory
@export var botnet_panel : Inventory
@export var workshop_button : Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sell_panel._ready()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Locations.block_moving = sell_panel.filled_slots() > 0 or botnet_panel.filled_slots() > 0
	pass


func _on_goto_workshop_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/workshop.tscn")
