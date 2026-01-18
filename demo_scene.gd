extends Control

@export var bin_inventory : Inventory
@export var loot_button : Button
#@export var loot_pool : Array[ItemData]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bin_inventory._ready()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Locations.block_moving = bin_inventory.filled_slots() > 0
	loot_button.disabled = not Clock.has_time(10)


func _on_loot_button_pressed() -> void:
	if Clock.has_time(10):
		if bin_inventory.add_item(pick_random_item()):
			Clock.use_time(10)
			#bin_inventory.add_item(pick_random_item())
	
	#loot_button.hide()
	#bin_inventory.show()
	#bin_inventory.add_item(pick_random_item())
	#bin_inventory.add_item(pick_random_item())
	#bin_inventory.add_item(pick_random_item())
	#bin_inventory.add_item(pick_random_item())
	#bin_inventory.add_item(pick_random_item())
	#bin_inventory.add_item(pick_random_item())
	#bin_inventory.add_item(pick_random_item())
	#bin_inventory.add_item(pick_random_item())

func pick_random_item() -> ItemData:
	#var icount = loot_pool.size()
	#return loot_pool[randi() % icount]
	
	var selected : ItemData
	var total_chance : int = 0
	for loot in RecipeManager.items :
		total_chance += loot.bin_chance
	var sel_chance : int = randi() % total_chance
	for loot in RecipeManager.items:
		if sel_chance >= 0:
			selected = loot
			sel_chance -= loot.bin_chance
			
	return selected


func _on_return_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/workshop.tscn")


func _on_delete_pressed() -> void:
	bin_inventory.empty_grid()
