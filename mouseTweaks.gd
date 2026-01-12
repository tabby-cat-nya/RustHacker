extends Node

var hovered_slot : ItemSlot
var player_inventory : Inventory
var other_inventory : Inventory

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("quick_move") and hovered_slot:
		if hovered_slot.block_taking:
			return
		# figure out what the "other" inventory is and move it
		var current_inv : String = hovered_slot.type
		var target_inv : Inventory
		if current_inv != "Inventory":
			target_inv = player_inventory
		else:
			target_inv = other_inventory
		
		var temp_item : ItemData = hovered_slot.item
		
		
		if target_inv.add_item(temp_item):
			# only runs if it was able to put the item in the target inv
			hovered_slot.item = null
			hovered_slot.update_ui()
			player_inventory.notification(NOTIFICATION_DRAG_END)
			other_inventory.notification(NOTIFICATION_DRAG_END)
		
		pass
