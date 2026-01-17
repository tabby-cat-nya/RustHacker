extends PanelContainer

@export var grid : GridContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	RecipeManager.recipes_loaded.connect(scavs_ready)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func scavs_ready():
	for scav in RecipeManager.scavenge_recipes:
		# TODO: create an item slot with the scav recipie icon, bock dragging
		# show details about scavenge results in tooltip?
		var new_slot = load("res://inv_system/item_slot.tscn").instantiate() as ItemSlot
		new_slot.item = scav.input
		new_slot.block_taking = true
		var scav_preview : String = str(scav.rolls) + " Rolls"
		
		var total_chance : int = 0
		for loot in scav.loot_pool:
			total_chance += loot.chance
		var uncounted_chance = total_chance
		
		for loot in scav.loot_pool:
			if loot.item:
				scav_preview += "\n" + loot.item.item_name + ": " + str((int((loot.chance/float(total_chance))*10000))/100) + "%"
				uncounted_chance -= loot.chance
		if uncounted_chance > 0:
			scav_preview += "\nNothing: " + str((int((uncounted_chance/float(total_chance))*10000))/100) + "%"
		new_slot.extra_data = scav_preview
		grid.add_child(new_slot)
		pass
