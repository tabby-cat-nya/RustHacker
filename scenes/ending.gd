extends Control

@export var server_box : HFlowContainer
@export var score_label : Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#sell remaining inventory
	var inv_sell_value : int = 0
	for slot in PlayerInventory.inventory_panel.slots:
		if slot.item:
			inv_sell_value += floori(slot.item.buy_value/float(2))
	
	#var server_item : ItemData = load("res://items/server.tres")
	for device in PlayerInventory.botnet:
		var new_slot : ItemSlot = load("res://inv_system/item_slot.tscn").instantiate()
		new_slot.item = device
		new_slot.extra_data = "Power: " + str(PlayerInventory.power_values.get(device))
		new_slot.update_ui()
		new_slot.block_taking = true
		server_box.add_child(new_slot)
	
	score_label.text = str(PlayerInventory.botnet_servers) + " GHz + $" + str(PlayerInventory.money + inv_sell_value)
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_reset_button_pressed() -> void:
	PlayerInventory.money = 0
	PlayerInventory.botnet_servers = 0
	PlayerInventory.inventory_panel.empty_grid()
	Clock.days_left = 7
	Clock.time_left = 200
	PlayerInventory.botnet.clear()
	PlayerInventory.show()
	Clock.show()
	get_tree().change_scene_to_file("res://scenes/workshop.tscn")
