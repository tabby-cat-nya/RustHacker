extends Recipe
class_name ScavengeRecipe

@export var input : ItemData
@export var rolls : int = 3
@export var loot_pool : Array[RollableLoot]

func roll() -> ItemData:
	var selected : ItemData
	var total_chance : int = 0
	for loot in loot_pool:
		total_chance += loot.chance
	var sel_chance : int = randi() % total_chance
	for loot in loot_pool:
		if sel_chance >= 0:
			selected = loot.item
			sel_chance -= loot.chance
			
	return selected
