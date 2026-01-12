extends Node

signal recipes_loaded
var craft_recipes : Array[CraftRecipe]
var crafts_dir : String = "res://crafting/crafts/"
var scavenge_recipes : Array[ScavengeRecipe]
var scavenges_dir : String = "res://crafting/scavenges/"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_recipes()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func load_recipes():
	## CRAFTS
	var dir = DirAccess.open(crafts_dir)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			
			# do something with the file
			if (file_name.get_extension() == "remap"):
				file_name = file_name.replace('.remap', '')
			print(crafts_dir + file_name)
			craft_recipes.append(load(crafts_dir + file_name) as CraftRecipe)
			file_name = dir.get_next()
			
	## SCAVENGES
	dir = DirAccess.open(scavenges_dir)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			
			# do something with the file
			if (file_name.get_extension() == "remap"):
				file_name = file_name.replace('.remap', '')
			print(crafts_dir + file_name)
			scavenge_recipes.append(load(scavenges_dir + file_name) as ScavengeRecipe)
			file_name = dir.get_next()
			
	recipes_loaded.emit()
