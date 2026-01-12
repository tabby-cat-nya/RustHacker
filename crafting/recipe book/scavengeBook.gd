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
		pass
