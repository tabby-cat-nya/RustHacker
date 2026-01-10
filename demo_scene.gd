extends Control

@export var bin_inventory : Inventory
@export var loot_button : Button
@export var loot_pool : Array[ItemData]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_loot_button_pressed() -> void:
	loot_button.hide()
	bin_inventory.show()
	bin_inventory.add_item(pick_random_item())
	bin_inventory.add_item(pick_random_item())
	bin_inventory.add_item(pick_random_item())
	bin_inventory.add_item(pick_random_item())
	bin_inventory.add_item(pick_random_item())
	bin_inventory.add_item(pick_random_item())
	bin_inventory.add_item(pick_random_item())
	bin_inventory.add_item(pick_random_item())

func pick_random_item() -> ItemData:
	var icount = loot_pool.size()
	return loot_pool[randi() % icount]
