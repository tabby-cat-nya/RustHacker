extends Node

@export var inventory_panel : Inventory
@export var button : Button
@export var money : int = 0
@export var money_label : Label
@export var botnet_servers : int = 0 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.text = "Show Inventory" if !inventory_panel.visible else "Hide Inventory" 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	money_label.text = "Money: $" + str(money)


func _on_button_pressed() -> void:
	inventory_panel.visible = !inventory_panel.visible
	button.text = "Show Inventory" if !inventory_panel.visible else "Hide Inventory" 
